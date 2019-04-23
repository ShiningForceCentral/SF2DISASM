
; ASM FILE code\gameflow\battle\battleactionsengine_1.asm :
; 0x9B92..0xACCA : Battle actions engine

; =============== S U B R O U T I N E =======================================

; In: D0 = attacker idx

WriteSkirmishScript:
                
                movem.l d0-a6,-(sp)
                link    a2,#-$98
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a3
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a4
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a5
                lea     (FF0000_RAM_START).l,a6 ; beginning of battle scene command list
                move.b  #0,-BCSTACK_OFFSET_DEBUGDODGE(a2)
                move.b  #0,-BCSTACK_OFFSET_DEBUGCRIT(a2)
                move.b  #0,-BCSTACK_OFFSET_DEBUGDOUBLE(a2)
                move.b  #0,-BCSTACK_OFFSET_DEBUGCOUNTER(a2)
                tst.b   (DEBUG_MODE_ACTIVATED).l
                beq.s   loc_9BE4
                btst    #INPUT_A_START,((P1_INPUT-$1000000)).w
                beq.s   loc_9BD8
                bsr.w   DebugModeActionSelect
loc_9BD8:
                
                btst    #INPUT_A_START,((P2_INPUT-$1000000)).w
                beq.s   loc_9BE4
                bsr.w   DebugModeSelectHits
loc_9BE4:
                
                move.b  d0,((BATTLESCENE_ATTACKER-$1000000)).w
                move.b  d0,((word_FFB64F-$1000000)).w
                moveq   #0,d1
                move.w  d1,((BATTLESCENE_EXP-$1000000)).w
                move.w  d1,((BATTLESCENE_GOLD-$1000000)).w
                move.w  d1,((RAM_BattleScene_AttackNumber-$1000000)).w
                move.b  d1,-BCSTACK_OFFSET_DOUBLE(a2)
                move.b  d1,-BCSTACK_OFFSET_COUNTER(a2)
                move.b  d1,-BCSTACK_OFFSET_SILENCED(a2)
                move.b  d1,-BCSTACK_OFFSET_INACTION_STUN(a2)
                move.b  d1,-BCSTACK_OFFSET_INACTION_CURSE(a2)
                move.b  d1,-BCSTACK_OFFSET_MUDDLED(a2)
                move.b  d1,-BCSTACK_OFFSET_SAMESIDE(a2)
                move.b  d1,-BCSTACK_OFFSET_RANGED(a2)
                move.b  d1,-$F(a2)
                move.b  d1,-BCSTACK_OFFSET_EXPLODE(a2)
                move.b  d1,-BCSTACK_OFFSET_INEFFECTIVEATTACK(a2)
                bsr.w   DetermineTargetsByAction
                bsr.w   InitSkirmishProperties
                bsr.w   CheckForTaros
                bsr.w   InitSkirmishDisplayedChars
                tst.b   -BCSTACK_OFFSET_INACTION_CURSE(a2)
                beq.s   loc_9C5A
                move.w  #$10,(a6)+
                move.w  #TEXTIDX_BATTLE_CURSEDSTUNNED,(a6)+
                move.b  #0,(a6)+
                move.b  (a4),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                bra.w   loc_9DC4
loc_9C5A:
                
                tst.b   -BCSTACK_OFFSET_INACTION_STUN(a2)
                beq.s   loc_9C7E
                move.w  #$10,(a6)+
                move.w  #TEXTIDX_BATTLE_STUNNED,(a6)+
                move.b  #0,(a6)+
                move.b  (a4),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                bra.w   loc_9DC4
loc_9C7E:
                
                bsr.w   CreateBattleSceneText
                bsr.w   CreateBattleSceneAnimation
                tst.b   -BCSTACK_OFFSET_SILENCED(a2)
                beq.s   loc_9CAA
                move.w  #$10,(a6)+
                move.w  #TEXTIDX_BATTLE_SILENCED,(a6)+
                move.b  #0,(a6)+
                move.b  (a4),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                bra.w   loc_9DC4
loc_9CAA:
                
                moveq   #1,d6
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   loc_9DC4
loc_9CB6:
                
                moveq   #0,d1
                move.b  d1,-BCSTACK_OFFSET_DODGE(a2)
                move.b  d1,-BCSTACK_OFFSET_CRIT(a2)
                move.b  d1,-2(a2)
                move.b  d1,-BCSTACK_OFFSET_CUTOFF(a2)
                move.b  d1,-BCSTACK_OFFSET_TARGETDIES(a2)
                bsr.w   WriteSkirmishScript_SwitchTargets
                bsr.w   WriteSkirmishScript_DoAction
                bsr.w   WriteSkirmishScript_EnemyDropItem
                addq.w  #1,a5
                moveq   #2,d6
                dbf     d7,loc_9CB6
loc_9CE0:
                
                bsr.w   WriteSkirmishScript_IdleSprite
                bsr.w   WriteSkirmishScript_BreakUsedItem
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a4
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a5
                bsr.w   FinalDoubleAttackCheck
                tst.b   -BCSTACK_OFFSET_DOUBLE(a2)
                beq.s   loc_9D3E
                move.w  #1,((RAM_BattleScene_AttackNumber-$1000000)).w
                moveq   #0,d1
                move.b  d1,-5(a2)
                move.b  d1,-3(a2)
                move.b  d1,-2(a2)
                move.b  d1,-1(a2)
                move.b  d1,-4(a2)
                move.b  d1,-$F(a2)
                move.w  #$C,(a6)+
                exg     a4,a5
                bsr.w   WriteSkirmishScript_SwitchTargets
                exg     a4,a5
                bsr.w   CreateBattleSceneText
                bsr.w   CreateBattleSceneAnimation
                bsr.w   WriteSkirmishScript_SwitchTargets
                bsr.w   WriteSkirmishScript_DoAction
                bsr.w   WriteSkirmishScript_EnemyDropItem
                bsr.w   WriteSkirmishScript_IdleSprite
loc_9D3E:
                
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a4
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a5
                bsr.w   FinalCounterAttackCheck
                tst.b   -$C(a2)
                beq.s   loc_9D9C
                move.w  #2,((RAM_BattleScene_AttackNumber-$1000000)).w
                moveq   #0,d1
                move.b  d1,-5(a2)
                move.b  d1,-3(a2)
                move.b  d1,-2(a2)
                move.b  d1,-1(a2)
                move.b  d1,-4(a2)
                move.b  d1,-$F(a2)
                move.b  d1,-$E(a2)
                move.w  #$C,(a6)+
                exg     a4,a5
                bsr.w   WriteSkirmishScript_SwitchTargets
                exg     a4,a5
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a5
                bsr.w   CreateBattleSceneText
                bsr.w   CreateBattleSceneAnimation
                bsr.w   WriteSkirmishScript_SwitchTargets
                bsr.w   WriteSkirmishScript_DoAction
                bsr.w   WriteSkirmishScript_EnemyDropItem
                bsr.w   WriteSkirmishScript_IdleSprite
loc_9D9C:
                
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a4
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a5
                tst.b   -BCSTACK_OFFSET_EXPLODE(a2)
                beq.s   loc_9DC4
                move.b  #0,-BCSTACK_OFFSET_EXPLODE(a2)
                move.w  #ACTION_BURSTROCK,(a3)
                move.b  -BCSTACK_OFFSET_EXPLODECHAR(a2),(a4)
                move.w  #$C,(a6)+
                bsr.w   DetermineTargetsByAction
                bra.w   loc_9C7E
loc_9DC4:
                
                move.b  ((word_FFB64F-$1000000)).w,((BATTLESCENE_ATTACKER-$1000000)).w
                bsr.w   sub_A34E
                unlk    a2
                movem.l (sp)+,d0-a6
                rts

	; End of function WriteSkirmishScript


; =============== S U B R O U T I N E =======================================

; In: A3 = action data

DetermineTargetsByAction:
                
                cmpi.w  #0,(a3)
                bne.s   loc_9DEA
                move.w  #1,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
                move.b  3(a3),((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w
                bra.s   loc_9E5A
loc_9DEA:
                
                cmpi.w  #1,(a3)
                bne.s   loc_9E00
                move.w  2(a3),d1
                move.w  4(a3),d0
                jsr     CreateTargetGridFromSpell
                bra.s   loc_9E5A
loc_9E00:
                
                cmpi.w  #2,(a3)
                bne.w   loc_9E18
                move.w  2(a3),d1
                move.w  4(a3),d0
                jsr     j_sub_C5D6_0
                bra.s   loc_9E5A
loc_9E18:
                
                cmpi.w  #4,(a3)
                bne.w   loc_9E2E
                move.b  (a4),d0
                move.w  #$19,d1
                jsr     CreateTargetGridFromSpell
                bra.s   loc_9E5A
loc_9E2E:
                
                cmpi.w  #5,(a3)
                bne.w   loc_9E3E
                move.w  #0,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
                bra.s   loc_9E5A
loc_9E3E:
                
                cmpi.w  #6,(a3)
                bne.w   loc_9E5A
                jsr     MakeTargetListEverybody
                move.b  #$FF,((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w
                move.b  (a4),d0
                jsr     sub_1AC05C      
loc_9E5A:
                
                bsr.w   SortTargets
                rts

	; End of function DetermineTargetsByAction


; =============== S U B R O U T I N E =======================================

InitSkirmishDisplayedChars:
                
                move.b  #$FF,d3
                move.b  #$FF,d4
                move.b  (a4),d0
                move.b  (a5),d1
                btst    #CHAR_BIT_ENEMY,d0
                bne.s   loc_9E8E
                move.b  d0,d3
                btst    #CHAR_BIT_ENEMY,d1
                beq.s   loc_9E82
                tst.b   -6(a2)
                bne.s   loc_9E82
                move.b  d1,d4
loc_9E82:
                
                cmpi.w  #ACTION_BURSTROCK,(a3)
                bne.s   loc_9E8C
                move.b  #$FF,d4
loc_9E8C:
                
                bra.s   loc_9EB2
loc_9E8E:
                
                move.b  d0,d4
                btst    #CHAR_BIT_ENEMY,d1
                bne.s   loc_9E9E
                tst.b   -BCSTACK_OFFSET_RANGED(a2)
                bne.s   loc_9E9E
                move.b  d1,d3
loc_9E9E:
                
                cmpi.w  #ACTION_BURSTROCK,(a3)
                bne.s   loc_9EA8
                move.b  #$FF,d3
loc_9EA8:
                
                cmpi.w  #ACTION_PRISMLASER,(a3)
                bne.s   loc_9EB2
                move.b  #$FF,d3
loc_9EB2:
                
                move.b  d3,((SKIRMISH_FIRST_ALLY-$1000000)).w
                move.b  d3,((SKIRMISH_LAST_ALLY-$1000000)).w
                move.b  d4,((SKIRMISH_FIRST_ENEMY-$1000000)).w
                move.b  d4,((SKIRMISH_LAST_ENEMY-$1000000)).w
                rts

	; End of function InitSkirmishDisplayedChars


; =============== S U B R O U T I N E =======================================

CheckForTaros:
                
                movem.l d0-d1,-(sp)
                cmpi.b  #BATTLE_VERSUS_TAROS,((CURRENT_BATTLE-$1000000)).w
                bne.w   loc_9F22
                clrFlg  $70             ; Currently attacking Taros with Achille Sword
                tst.b   (a4)
                bne.w   loc_9F08
                cmpi.w  #ACTION_ATTACK,(a3)
                bne.w   loc_9F08
                move.b  (a5),d0
                jsr     GetEnemyID
                cmpi.w  #$58,d1 
                bne.w   loc_9F08
                move.b  (a4),d0
                jsr     GetEquippedWeapon
                cmpi.w  #ITEM_ACHILLES_SWORD,d1
                bne.w   loc_9F08
                setFlg  $70             ; Currently attacking Taros with Achille Sword
loc_9F08:
                
                move.b  (a5),d0
                jsr     GetEnemyID
                cmpi.w  #$58,d1 
                bne.s   loc_9F22
                chkFlg  $70             ; Currently attacking Taros with Achille Sword
                bne.s   loc_9F22
                move.b  #$FF,-BCSTACK_OFFSET_INEFFECTIVEATTACK(a2)
loc_9F22:
                
                movem.l (sp)+,d0-d1
                rts

	; End of function CheckForTaros


; =============== S U B R O U T I N E =======================================

; In: A2 = battle scene stack
;     A3 = address in RAM of scene action type
;     A4 = address in RAM of attacker idx
;     A5 = address in RAM of target idx

InitSkirmishProperties:
                
                movem.l d0-d3/a0,-(sp)
                lea     -$18(a2),a0
                move.w  #0,d0
                bra.s   loc_9F38
loc_9F36:
                
                addq.w  #1,d0
loc_9F38:
                
                cmpi.w  #COM_ALLY_END,d0
                bgt.s   loc_9F48
                jsr     GetCurrentHP
                move.w  d1,-(a0)
                bra.s   loc_9F36
loc_9F48:
                
                move.w  #COM_ENEMY_START,d0
                bra.s   loc_9F50
loc_9F4E:
                
                addq.w  #1,d0
loc_9F50:
                
                cmpi.w  #COM_ENEMY_END,d0
                bgt.s   loc_9F60
                jsr     GetCurrentHP
                move.w  d1,-(a0)
                bra.s   loc_9F4E
loc_9F60:
                
                cmpi.w  #ACTION_BURSTROCK,(a3)
                beq.w   loc_9F8E
                cmpi.w  #ACTION_PRISMLASER,(a3)
                beq.w   loc_9F8E
                move.b  (a4),d0
                jsr     GetStatus
                andi.w  #COM_STATUS_MASK_MUDDLE2,d1
                beq.s   loc_9F86
                move.b  #$FF,-BCSTACK_OFFSET_MUDDLED(a2)
                bra.s   loc_9F8E
loc_9F86:
                
                move.b  (a5),d1
                eor.b   d1,d0
                spl     -BCSTACK_OFFSET_SAMESIDE(a2)
loc_9F8E:
                
                cmpi.w  #ACTION_ATTACK,(a3)
                bne.s   loc_9FE6
                move.b  (a4),d0
                move.b  (a5),d1
                jsr     GetDistanceBetweenEntities
                cmpi.w  #2,d2           ; check if block distance between attacker and target is >= 2
                bcs.s   loc_9FB0
                tst.b   -BCSTACK_OFFSET_MUDDLED(a2)
                bne.s   loc_9FB0
                move.b  #$FF,-BCSTACK_OFFSET_RANGED(a2)
loc_9FB0:
                
                move.b  (a4),d0
                jsr     GetStatus
                andi.w  #CHAR_STATUS_MASK_CURSE,d1
                beq.s   loc_9FCA
                moveq   #BATTLE_INACTIONCHANCEDIVISOR_CURSE,d0
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                seq     -BCSTACK_OFFSET_INACTION_CURSE(a2)
loc_9FCA:
                
                move.b  (a4),d0
                jsr     GetStatus
                andi.w  #CHAR_STATUS_MASK_STUN,d1
                beq.s   loc_9FE4
                moveq   #BATTLE_INACTIONCHANCEDIVISOR_STUN,d0
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                seq     -BCSTACK_OFFSET_INACTION_STUN(a2)
loc_9FE4:
                
                bra.s   loc_A056
loc_9FE6:
                
                cmpi.w  #ACTION_SPELL,(a3)
                bne.s   loc_A02A
                move.w  BTLSCENE_ACTION_OFFSET_ITEMORSPELL(a3),d0
                andi.w  #SPELL_MASK_IDX,d0
                move.w  d0,((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w
                move.w  BTLSCENE_ACTION_OFFSET_ITEMORSPELL(a3),d0
                lsr.b   #SPELL_OFFSET_LV,d0
                andi.w  #SPELL_UPPERMASK_LV,d0
                move.w  d0,((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d1
                jsr     j_GetSpellDefAddress
                btst    #SPELLPROPS_BIT_AFFECTEDBYSILENCE,SPELLDEF_OFFSET_PROPS(a0)
                beq.s   loc_A028
                move.b  (a4),d0
                jsr     GetStatus
                andi.w  #CHAR_STATUS_MASK_SILENCE,d1
                sne     -BCSTACK_OFFSET_SILENCED(a2)
loc_A028:
                
                bra.s   loc_A056
loc_A02A:
                
                cmpi.w  #ACTION_ITEM,(a3)
                bne.s   loc_A03A
                move.w  BTLSCENE_ACTION_OFFSET_ITEMORSPELL(a3),((CURRENT_BATTLE_ITEM-$1000000)).w
                bra.w   loc_A056
loc_A03A:
                
                cmpi.w  #ACTION_BURSTROCK,(a3)
                bne.s   loc_A044
                bra.w   loc_A056
loc_A044:
                
                cmpi.w  #ACTION_NOTHING,(a3)
                bne.s   loc_A04E
                bra.w   loc_A056
loc_A04E:
                
                cmpi.w  #ACTION_PRISMLASER,(a3)
                bne.w   *+4
loc_A056:
                
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function InitSkirmishProperties


; =============== S U B R O U T I N E =======================================

; Loads proper battle scene text script depending on attack action.
; In: A3 = RAM index containing action type
;     A4 = RAM index containing attacker index
; HARDCODED enemy and text indexes

CreateBattleSceneText:
                
                movem.l d0-d3/a0,-(sp)
                move.b  (a4),d0
                cmpi.w  #0,(a3)
                bne.s   loc_A09E        ; HARDCODED attack lines
                move.w  ((RAM_BattleScene_AttackNumber-$1000000)).w,d2
                move.w  #$111,d1        ; {NAME}'s attack!
                tst.w   d2
                beq.w   loc_A086
                move.w  #$125,d1        ; {NAME}'s second{N}attack!
                cmpi.w  #1,d2
                beq.w   loc_A086
                move.w  #$124,d1        ; {NAME}'s counter{N}attack!
loc_A086:
                
                move.w  #$10,(a6)+
                move.w  d1,(a6)+
                move.w  d0,(a6)+
loc_A08E:
                
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                bra.w   loc_A1FA
loc_A09E:
                
                cmpi.w  #1,(a3)
                bne.w   loc_A150        ; HARDCODED spell text indexes !
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d2
                move.w  #$136,d1        ; {NAME} put on{N}a demon's smile.
                cmpi.w  #SPELL_SPOIT,d2
                beq.w   loc_A132
                move.w  #$116,d1        ; {NAME} belched{N}out flames!
                cmpi.w  #SPELL_FLAME,d2
                beq.w   loc_A132
                cmpi.w  #SPELL_KIWI,d2
                beq.w   loc_A132
                move.w  #$117,d1        ; {NAME} blew out{N}a snowstorm!
                cmpi.w  #SPELL_SNOW,d2
                beq.w   loc_A132
                move.w  #$114,d1        ; {NAME} cast{N}demon breath!
                cmpi.w  #SPELL_DEMON,d2
                beq.w   loc_A132
                move.w  #$140,d1        ; Odd-eye beam!
                cmpi.w  #SPELL_ODDEYE,d2
                beq.w   loc_A132
                move.w  #$11B,d1        ; {NAME} summoned{N}{SPELL}!{D1}
                cmpi.w  #SPELL_DAO,d2
                beq.w   loc_A132
                cmpi.w  #SPELL_APOLLO,d2
                beq.w   loc_A132
                cmpi.w  #SPELL_NEPTUN,d2
                beq.w   loc_A132
                cmpi.w  #SPELL_ATLAS,d2
                beq.w   loc_A132
                move.w  2(a3),d2
                move.w  #$119,d1        ; {NAME} blew out{N}aqua-breath!
                cmpi.w  #SPELL_AQUA,d2
                beq.w   loc_A132
                move.w  #$11A,d1        ; {NAME} blew out{N}bubble-breath!
                cmpi.w  #SPELL_AQUA|SPELL_LV2,d2
                beq.w   loc_A132
                move.w  #$112,d1        ; {NAME} cast{N}{SPELL} level {#}!
loc_A132:
                
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d2
                move.w  ((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w,d3
                addq.w  #1,d3
                move.w  #$10,(a6)+
                move.w  d1,(a6)+
                move.w  d0,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  d3,(a6)+
                bra.w   loc_A1FA
loc_A150:
                
                cmpi.w  #2,(a3)
                bne.w   loc_A174
                move.w  ((CURRENT_BATTLE_ITEM-$1000000)).w,d2
                move.w  #$10,(a6)+
                move.w  #$113,(a6)+
                move.w  d0,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                bra.w   loc_A1FA
loc_A174:
                
                cmpi.w  #4,(a3)
                bne.w   loc_A194
                move.w  #$10,(a6)+
                move.w  #$13E,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                bra.s   loc_A1FA
loc_A194:
                
                cmpi.w  #5,(a3)
                bne.w   loc_A1CA
                move.w  d0,d2           ; random MUDDLE lines
                move.w  #$142,d1        ; HARDCODED Muddle line start index
                moveq   #$10,d0
                jsr     (GetRandomOrDebugValue).w
                cmpi.w  #9,d0           ; HARDCODED number of available Muddle lines
                bls.s   loc_A1B0
                clr.w   d0
loc_A1B0:
                
                add.w   d0,d1
                move.w  d2,d0
                move.w  #$10,(a6)+
                move.w  d1,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                bra.s   loc_A1FA
loc_A1CA:
                
                cmpi.w  #6,(a3)
                bne.s   loc_A1FA
                jsr     GetEnemyID
                cmpi.w  #$26,d1 
                bne.s   loc_A1E2        
                move.w  #$141,d1        ; 0141=Demon laser!
                bra.s   loc_A1E6
loc_A1E2:
                
                move.w  #$13F,d1        ; 013F=Prism laser!
loc_A1E6:
                
                move.w  #$10,(a6)+
                move.w  d1,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
loc_A1FA:
                
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function CreateBattleSceneText


; =============== S U B R O U T I N E =======================================

;     Loads proper battle scene sprite/magic animation properties.
;     In: A3 = 

CreateBattleSceneAnimation:
                
                movem.l d0-d3/a0,-(sp)
                move.b  (a4),d0
                cmpi.w  #1,(a3)
                bne.s   loc_A248
                move.w  2(a3),d1
                jsr     GetSpellCost    
                move.w  d1,d2
                neg.w   d2
loc_A21A:
                
                jsr     GetStatus
loc_A220:
                
                btst    #7,d0
                bne.s   loc_A238
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  d2,(a6)+
                move.w  d1,(a6)+
                move.w  #0,(a6)+
                bra.s   loc_A248
loc_A238:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  d2,(a6)+
                move.w  d1,(a6)+
                move.w  #0,(a6)+
loc_A248:
                
                cmpi.w  #5,(a3)
                beq.w   loc_A348
                move.w  #$12,(a6)+
                bsr.w   GetEffectGraphicsIdx
                moveq   #0,d5
                tst.w   (a3)
                bne.s   loc_A2B6
                move.b  (a4),d0
                jsr     GetClass
                moveq   #$53,d5 
                cmpi.w  #CLASS_MMNK,d1  ; MMNK
                beq.w   loc_A29C        
                moveq   #$55,d5 
                cmpi.w  #CLASS_RBT,d1   ; RBT
                beq.w   loc_A29C        
                moveq   #$56,d5 
                cmpi.w  #CLASS_BRGN,d1  ; BRGN
                bne.s   loc_A296
                jsr     GetEquippedWeapon
                cmpi.w  #$FFFF,d1
                bne.s   loc_A296
                moveq   #$56,d5 
                moveq   #0,d4
                beq.w   loc_A304
loc_A296:
                
                moveq   #0,d5
                bra.w   loc_A304
loc_A29C:
                
                moveq   #$10,d0         ; random value applied for MMNK and RBT ?
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   loc_A2B0
                move.b  #$FF,-$F(a2)
                bra.w   loc_A304
loc_A2B0:
                
                moveq   #0,d5
                bra.w   loc_A304
loc_A2B6:
                
                cmpi.w  #1,(a3)
                bne.s   loc_A2FC
                move.b  (a4),d0
                jsr     GetClass
                moveq   #$54,d5 
                cmpi.w  #CLASS_MNST,d1  ; MNST
                beq.w   loc_A304
                jsr     GetEnemyID
                moveq   #$76,d5 
                cmpi.w  #$1D,d1
                beq.w   loc_A304
                cmpi.w  #$18,d1
                beq.w   loc_A304
                moveq   #$77,d5 
                cmpi.w  #$36,d1 
                beq.w   loc_A304
                moveq   #$78,d5 
                cmpi.w  #$60,d1 
                beq.w   loc_A304
                moveq   #0,d5
loc_A2FC:
                
                cmpi.w  #2,(a3)
                bne.s   loc_A304
                moveq   #2,d5
loc_A304:
                
                bsr.w   WriteSkirmishScript_AnimateSprite
                cmpi.w  #4,(a3)
                bne.s   loc_A348
                move.w  #$8000,d2
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_A330
                move.w  #$B,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_A340
loc_A330:
                
                move.w  #$A,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_A340:
                
                moveq   #0,d1
                jsr     SetCurrentHP
loc_A348:
                
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function CreateBattleSceneAnimation


; =============== S U B R O U T I N E =======================================

sub_A34E:
                
                movem.l d0-d3/a0,-(sp)
                move.w  #$D,(a6)+
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a5
                moveq   #3,d6
                bsr.w   WriteSkirmishScript_SwitchTargets
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a4
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a5
                tst.b   -BCSTACK_OFFSET_INACTION_CURSE(a2)
                bne.w   loc_A3B2
                tst.b   -BCSTACK_OFFSET_SILENCED(a2)
                bne.w   loc_A3B2
                tst.b   -BCSTACK_OFFSET_INACTION_STUN(a2)
                bne.w   loc_A3B2
                move.b  (a4),d0
                btst    #7,d0
                bne.s   loc_A396
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_A3B2
                bra.s   loc_A3AE
loc_A396:
                
                cmpi.w  #2,((RAM_BattleScene_AttackNumber-$1000000)).w
                bne.w   loc_A3B2
                move.b  (a5),d0
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_A3B2
loc_A3AE:
                
                bsr.w   WriteSkirmishScript_EXPandGold
loc_A3B2:
                
                lea     -$18(a2),a0
                move.w  #COM_ALLY_START,d0
                bra.s   loc_A3BE
loc_A3BC:
                
                addq.w  #1,d0
loc_A3BE:
                
                cmpi.w  #COM_ALLY_END,d0
                bgt.s   loc_A3CE
                move.w  -(a0),d1
                jsr     SetCurrentHP
                bra.s   loc_A3BC
loc_A3CE:
                
                move.w  #COM_ENEMY_START,d0
                bra.s   loc_A3D6
loc_A3D4:
                
                addq.w  #1,d0
loc_A3D6:
                
                cmpi.w  #COM_ENEMY_END,d0
                bgt.s   loc_A3E6
                move.w  -(a0),d1
                jsr     SetCurrentHP
                bra.s   loc_A3D4
loc_A3E6:
                
                move.w  #$12,(a6)+
                move.w  #$FFFF,(a6)+
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function sub_A34E


; =============== S U B R O U T I N E =======================================

; In: A2 = battle scene stack
;     A3 = address in RAM of scene action type
;     A4 = address in RAM of attacker idx
;     A5 = address in RAM of target idx

WriteSkirmishScript_DoAction:
                
                movem.l d0-d3/a0,-(sp)
                cmpi.w  #ACTION_ATTACK,(a3)
                bne.s   loc_A404
                bsr.w   WriteSkirmishScript_Attack
                bra.s   loc_A458
loc_A404:
                
                cmpi.w  #ACTION_SPELL,(a3)
                bne.s   loc_A410
                bsr.w   WriteSkirmishScript_UseSpell
                bra.s   loc_A458
loc_A410:
                
                cmpi.w  #ACTION_ITEM,(a3)
                bne.s   loc_A41C
                bsr.w   WriteSkirmishScript_UseItem
                bra.s   loc_A458
loc_A41C:
                
                cmpi.w  #ACTION_BURSTROCK,(a3)
                bne.s   loc_A436
                move.w  #$12,d6
                bsr.w   WriteSkirmishScript_InflictDamage
                tst.b   -BCSTACK_OFFSET_TARGETDIES(a2)
                beq.s   loc_A434
                bsr.w   WriteSkirmishScript_DeathMessage
loc_A434:
                
                bra.s   loc_A458
loc_A436:
                
                cmpi.w  #ACTION_NOTHING,(a3)
                bne.w   loc_A440
                bra.s   loc_A458
loc_A440:
                
                cmpi.w  #ACTION_PRISMLASER,(a3)
                bne.s   loc_A458
                move.w  #$10,d6
                bsr.w   WriteSkirmishScript_InflictDamage
                tst.b   -BCSTACK_OFFSET_TARGETDIES(a2)
                beq.s   loc_A458
                bsr.w   WriteSkirmishScript_DeathMessage
loc_A458:
                
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function WriteSkirmishScript_DoAction


; =============== S U B R O U T I N E =======================================

FinalDoubleAttackCheck:
                
                movem.l d0-d3/a0,-(sp)
                tst.b   -$D(a2)
                beq.w   loc_A486
                tst.b   -4(a2)
                bne.w   loc_A486
                tst.b   -8(a2)
loc_A476:
                
                bne.w   loc_A486
                tst.b   -7(a2)
                bne.w   loc_A486
                bra.w   loc_A48A
loc_A486:
                
                clr.b   -$D(a2)
loc_A48A:
                
                tst.b   -$15(a2)
                beq.s   loc_A496
                move.b  #$FF,-$D(a2)
loc_A496:
                
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function FinalDoubleAttackCheck


; =============== S U B R O U T I N E =======================================

FinalCounterAttackCheck:
                
                movem.l d0-d3/a0,-(sp)
                tst.b   -$C(a2)
                beq.w   loc_A538
                tst.b   -4(a2)
                bne.w   loc_A538
                tst.b   -8(a2)
                bne.w   loc_A538
                tst.b   -7(a2)
                bne.w   loc_A538
                move.b  (a4),d0
                jsr     j_GetStatus
                andi.w  #$C0,d1 
                bne.w   loc_A538
                jsr     j_GetStatus
                andi.w  #1,d1
                bne.w   loc_A538
                move.b  (a5),d0
                jsr     GetEnemyID
                cmpi.w  #$58,d1 
                beq.w   loc_A538
                move.b  (a4),d0
                jsr     GetEnemyID
                cmpi.w  #$20,d1 
                beq.w   loc_A538
                cmpi.w  #$57,d1 
                beq.w   loc_A538
                cmpi.w  #$5D,d1 
                beq.w   loc_A538
                cmpi.w  #$26,d1 
                beq.w   loc_A538
                move.b  (a4),d0
                move.b  (a5),d1
                jsr     GetDistanceBetweenEntities
                move.b  (a4),d0
                jsr     GetWeaponRange  
                cmp.b   d3,d2
                bhi.w   loc_A538
                cmp.b   d4,d2
                bcs.w   loc_A538
                bra.w   loc_A53C
loc_A538:
                
                clr.b   -$C(a2)
loc_A53C:
                
                tst.b   -$14(a2)
                beq.s   loc_A548
                move.b  #$FF,-$C(a2)
loc_A548:
                
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function FinalCounterAttackCheck


; =============== S U B R O U T I N E =======================================

; In: A2 = cutscene stack
;     A3 = battle action in RAM
; Out: D4 = effect idx
; HARDCODED class, enemy and weapon indexes

GetEffectGraphicsIdx:
                
                movem.l d0-d3/a0,-(sp)
                moveq   #0,d4
                move.b  (a4),d0
                cmpi.w  #0,(a3)
                bne.w   loc_A662
                tst.b   -6(a2)
                beq.w   loc_A660
                moveq   #$10,d4
                btst    #7,d0
                bne.s   loc_A57E
                jsr     GetClass
                cmpi.b  #$16,d1
                beq.w   loc_A660
                bra.s   loc_A58C
loc_A57E:
                
                jsr     GetEnemyID
                cmpi.w  #$41,d1 
                beq.w   loc_A660
loc_A58C:
                
                jsr     GetEquippedWeapon
                moveq   #$D,d4
                cmpi.w  #$2D,d1 
                beq.w   loc_A660
                cmpi.w  #$2E,d1 
                beq.w   loc_A660
                cmpi.w  #$2F,d1 
                beq.w   loc_A660
                moveq   #$2D,d4 
                cmpi.w  #$30,d1 
                beq.w   loc_A660
                cmpi.w  #$31,d1 
                beq.w   loc_A660
                moveq   #$E,d4
                cmpi.w  #$33,d1 
                beq.w   loc_A660
                cmpi.w  #$35,d1 
                beq.w   loc_A660
                cmpi.w  #$36,d1 
                beq.w   loc_A660
                moveq   #$F,d4
                cmpi.w  #$32,d1 
                beq.w   loc_A660
                cmpi.w  #$34,d1 
                beq.w   loc_A660
                cmpi.w  #$37,d1 
                beq.w   loc_A660
                move.w  #$4D,d4 
                cmpi.w  #$48,d1 
                beq.w   loc_A660
                cmpi.w  #$49,d1 
                beq.w   loc_A660
                cmpi.w  #$4A,d1 
                beq.w   loc_A660
                cmpi.w  #$4B,d1 
                beq.w   loc_A660
                cmpi.w  #$4C,d1 
                beq.w   loc_A660
                cmpi.w  #$4D,d1 
                beq.w   loc_A660
                cmpi.w  #$4E,d1 
                beq.w   loc_A660
                cmpi.w  #$4F,d1 
                beq.w   loc_A660
                cmpi.w  #$50,d1 
                beq.w   loc_A660
                cmpi.w  #$51,d1 
                beq.w   loc_A660
                cmpi.w  #$52,d1 
                beq.w   loc_A660
                cmpi.w  #$53,d1 
loc_A652:
                
                beq.w   loc_A660
                cmpi.w  #$54,d1 
                beq.w   loc_A660
                moveq   #0,d4
loc_A660:
                
                bra.s   loc_A6D8
loc_A662:
                
                cmpi.w  #1,(a3)
                bne.s   loc_A680
                tst.b   -$B(a2)
                bne.s   loc_A67E
                move.w  2(a3),d1
                jsr     GetSpellDefAddress
                clr.w   d4
                move.b  2(a0),d4
loc_A67E:
                
                bra.s   loc_A6D8
loc_A680:
                
                cmpi.w  #2,(a3)
                bne.w   loc_A6B6
                move.w  2(a3),d1
                jsr     GetItemType     
                tst.b   d2
                beq.w   loc_A6B4
                jsr     GetItemDefAddress
                move.b  9(a0),d1
                cmpi.b  #$FF,d1
                beq.w   loc_A6B4
                jsr     GetSpellDefAddress
                move.b  2(a0),d4
loc_A6B4:
                
                bra.s   loc_A6D8
loc_A6B6:
                
                cmpi.w  #4,(a3)
                bne.w   loc_A6C2
                moveq   #$1E,d4
                bra.s   loc_A6D8
loc_A6C2:
                
                cmpi.w  #5,(a3)
                bne.w   loc_A6CE
                moveq   #0,d4
                bra.s   loc_A6D8
loc_A6CE:
                
                cmpi.w  #6,(a3)
                bne.w   loc_A6D8
                moveq   #$15,d4
loc_A6D8:
                
                btst    #7,(a4)
                beq.s   loc_A6E2
                bset    #7,d4
loc_A6E2:
                
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function GetEffectGraphicsIdx


; =============== S U B R O U T I N E =======================================

;     Loads proper battle scene sprite animation properties.
;     In: D4 = projectile
;         D5 = special script idx

WriteSkirmishScript_AnimateSprite:
                
                btst    #7,(a4)
                bne.s   loc_A6F8
                move.w  #1,(a6)+
                move.w  d5,(a6)+
                move.w  d4,(a6)+
                bra.s   return_A700
loc_A6F8:
                
                move.w  #0,(a6)+
                move.w  d5,(a6)+
                move.w  d4,(a6)+
return_A700:
                
                rts

	; End of function WriteSkirmishScript_AnimateSprite


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_SwitchTargets:
                
                movem.l d0-d1,-(sp)
                move.b  (a5),d0
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_A7CA
                move.w  #$12,(a6)+
                move.w  d6,d1
                tst.b   -BCSTACK_OFFSET_SAMESIDE(a2)
                bne.w   loc_A72C
                tst.b   -BCSTACK_OFFSET_MUDDLED(a2)
                bne.w   loc_A72C
                moveq   #0,d1
loc_A72C:
                
                move.b  (a5),d0
                btst    #7,d0
                bne.s   loc_A780
                cmp.b   ((SKIRMISH_LAST_ALLY-$1000000)).w,d0
                beq.s   loc_A77E
                move.b  d0,((SKIRMISH_LAST_ALLY-$1000000)).w
                tst.b   -BCSTACK_OFFSET_RANGED(a2)
                bne.w   loc_A772
                cmpi.b  #$FF,((SKIRMISH_LAST_ENEMY-$1000000)).w
                beq.s   loc_A75E
                cmpi.w  #ACTION_BURSTROCK,(a3)
                beq.w   loc_A772
                cmpi.w  #ACTION_PRISMLASER,(a3)
                beq.w   loc_A772
loc_A75E:
                
                move.w  #$E,(a6)+
                move.w  #$1E,(a6)+
                move.w  #7,(a6)+
                move.w  d0,(a6)+
                move.w  d1,(a6)+
                bra.w   loc_A7CA
loc_A772:
                
                move.w  #9,(a6)+
                move.w  d0,(a6)+
                move.b  #$FF,((SKIRMISH_LAST_ENEMY-$1000000)).w
loc_A77E:
                
                bra.s   loc_A7CA
loc_A780:
                
                cmp.b   ((SKIRMISH_LAST_ENEMY-$1000000)).w,d0
                beq.s   loc_A7CA
                move.b  d0,((SKIRMISH_LAST_ENEMY-$1000000)).w
                tst.b   -BCSTACK_OFFSET_RANGED(a2)
                bne.w   loc_A7BE
                cmpi.b  #$FF,((SKIRMISH_LAST_ALLY-$1000000)).w
                beq.s   loc_A7AA
                cmpi.w  #ACTION_BURSTROCK,(a3)
                beq.w   loc_A7BE
                cmpi.w  #ACTION_PRISMLASER,(a3)
                beq.w   loc_A7BE
loc_A7AA:
                
                move.w  #$E,(a6)+
                move.w  #$1E,(a6)+
                move.w  #6,(a6)+
                move.w  d0,(a6)+
                move.w  d1,(a6)+
                bra.w   loc_A7CA
loc_A7BE:
                
                move.w  #8,(a6)+
                move.w  d0,(a6)+
                move.b  #$FF,((SKIRMISH_LAST_ALLY-$1000000)).w
loc_A7CA:
                
                movem.l (sp)+,d0-d1
                rts

	; End of function WriteSkirmishScript_SwitchTargets


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_IdleSprite:
                
                movem.l d1,-(sp)
                move.b  (a4),d0
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_A7F2
                btst    #CHAR_BIT_ENEMY,(a4)
                bne.s   loc_A7EE
                move.w  #5,(a6)+
                bra.s   loc_A7F2
loc_A7EE:
                
                move.w  #4,(a6)+
loc_A7F2:
                
                movem.l (sp)+,d1
                rts

	; End of function WriteSkirmishScript_IdleSprite


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_EXPandGold:
                
                movem.l d0-d1/a0,-(sp)
                move.w  ((BATTLESCENE_EXP-$1000000)).w,d1
                tst.b   -7(a2)
                bne.w   loc_A81E
                move.b  ((CURRENT_BATTLE-$1000000)).w,d0
                lea     HalvedEXPEarnedBattles(pc), a0
loc_A810:
                
                cmpi.b  #CODE_TERMINATOR_BYTE,(a0)
                beq.w   loc_A81E
                cmp.b   (a0)+,d0
                bne.s   loc_A810
                lsr.w   #1,d1           ; divide earned EXP by 2
loc_A81E:
                
                move.w  #$10,d0
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   loc_A82C
                addq.w  #1,d1
loc_A82C:
                
                move.w  #$10,d0
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   loc_A83A
                subq.w  #1,d1
loc_A83A:
                
                tst.w   d1
                bgt.s   loc_A840
                moveq   #1,d1
loc_A840:
                
                move.w  #$F,(a6)+
                move.w  d1,(a6)+
loc_A846:
                
                move.w  ((BATTLESCENE_GOLD-$1000000)).w,d1
                tst.w   d1
                beq.s   loc_A86A
                move.w  #$10,(a6)+
                move.w  #$189,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                jsr     IncreaseGold
loc_A86A:
                
                movem.l (sp)+,d0-d1/a0
                rts

	; End of function WriteSkirmishScript_EXPandGold

HalvedEXPEarnedBattles:
                dc.b BATTLE_INSIDE_ANCIENT_TOWER
                dc.b CODE_TERMINATOR_BYTE

; =============== S U B R O U T I N E =======================================

sub_A872:
                
                movem.l d0-d3/a0,-(sp)
                move.b  (a4),d0
                btst    #CHAR_BIT_ENEMY,d0
                bne.w   loc_A8C4
                jsr     GetClass
                cmpi.b  #4,d1
                beq.w   loc_A8A2
                cmpi.b  #$13,d1
                beq.w   loc_A8A2
                cmpi.b  #$14,d1
                beq.w   loc_A8A2
                bra.w   loc_A8C4
loc_A8A2:
                
                move.b  (a5),d0
                jsr     GetMaxHP
                tst.w   d1
                beq.w   loc_A8C4
                move.w  #$19,d5
                mulu.w  d6,d5
                divu.w  d1,d5
                cmpi.w  #$A,d5
                bcc.s   loc_A8C0
                moveq   #$A,d5
loc_A8C0:
                
                bsr.w   GiveEXPandHealingCap
loc_A8C4:
                
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function sub_A872


; =============== S U B R O U T I N E =======================================

CalculateDamageEXP:
                
                movem.l d0-d3/a0,-(sp)
                btst    #7,(a4)
                bne.w   loc_A8F0
                move.b  (a5),d0
                jsr     GetMaxHP
                tst.w   d1
                beq.w   loc_A8F0
                bsr.w   GetAmountOfEXPForEncounter
                mulu.w  d6,d5
                divu.w  d1,d5
                bsr.w   GiveEXPandCap
loc_A8F0:
                
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function CalculateDamageEXP


; =============== S U B R O U T I N E =======================================

GiveMagicDrainEXP:
                
                movem.l d0-d3/a0,-(sp)
                btst    #CHAR_BIT_ENEMY,(a4)
                bne.w   loc_A908
                moveq   #5,d5
                bsr.w   GiveEXPandCap
loc_A908:
                
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function GiveMagicDrainEXP


; =============== S U B R O U T I N E =======================================

GiveEXPandGoldForKill:
                
                movem.l d0-d3/a0,-(sp)
                btst    #CHAR_BIT_ENEMY,(a4)
                bne.w   loc_A93A
                bsr.w   GetAmountOfEXPForEncounter
                bsr.w   GiveEXPandCap
                move.b  (a5),d0
                bpl.s   loc_A93A
loc_A926:
                
                jsr     GetEnemyID
                add.w   d1,d1
                lea     EnemyGold(pc), a0
                adda.w  d1,a0
                move.w  (a0),d0
                add.w   d0,((BATTLESCENE_GOLD-$1000000)).w
loc_A93A:
                
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function GiveEXPandGoldForKill


; =============== S U B R O U T I N E =======================================

GiveEXPandCap:
                
                add.w   d5,((BATTLESCENE_EXP-$1000000)).w
                cmpi.w  #$31,((BATTLESCENE_EXP-$1000000)).w 
                ble.s   return_A952
                move.w  #$31,((BATTLESCENE_EXP-$1000000)).w 
return_A952:
                
                rts

	; End of function GiveEXPandCap


; =============== S U B R O U T I N E =======================================

GiveEXPandHealingCap:
                
                add.w   d5,((BATTLESCENE_EXP-$1000000)).w
                cmpi.w  #$19,((BATTLESCENE_EXP-$1000000)).w
                ble.s   return_A966
                move.w  #$19,((BATTLESCENE_EXP-$1000000)).w
return_A966:
                
                rts

	; End of function GiveEXPandHealingCap


; =============== S U B R O U T I N E =======================================

; Gets amount of EXP gained from encounter based on attacker level and target level.
; In: A4 = address of attacker byte in RAM
;     A5 = address of target byte in RAM
; Out: D5 = amount of EXP

GetAmountOfEXPForEncounter:
                
                movem.l d0-d3/a0,-(sp)
                move.b  (a5),d0
                jsr     GetCurrentLevel
                move.w  d1,d2
                move.b  (a4),d0
                jsr     GetClass
                move.w  d1,d3
                jsr     GetCurrentLevel
                cmpi.b  #CHAR_CLASS_FIRSTPROMOTED,d3
                bcs.s   loc_A990
                addi.w  #CHAR_CLASS_EXTRALEVEL,d1
loc_A990:
                
                sub.w   d2,d1
                moveq   #$32,d5 ; HARDCODED EXP amounts
                cmpi.b  #3,d1
                bmi.w   loc_A9C6
                moveq   #$28,d5 
                cmpi.b  #3,d1
                beq.w   loc_A9C6
                moveq   #$1E,d5
                cmpi.b  #4,d1
                beq.w   loc_A9C6
                moveq   #$14,d5
                cmpi.b  #5,d1
                beq.w   loc_A9C6
                moveq   #$A,d5
                cmpi.b  #6,d1
                beq.w   loc_A9C6
                moveq   #0,d5
loc_A9C6:
                
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function GetAmountOfEXPForEncounter


; =============== S U B R O U T I N E =======================================

SortTargets:
                
                movem.l d0-d2/d6-a0,-(sp)
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
                subq.w  #1,d7
                bls.w   loc_AA92
loc_A9DE:
                
                move.b  (a0,d7.w),d0
                bpl.s   loc_A9F8
                jsr     GetEnemyID
                cmpi.w  #ENEMYIDX_BURST_ROCK,d1
                bne.s   loc_A9F8
                ori.b   #$40,d0 
                move.b  d0,(a0,d7.w)
loc_A9F8:
                
                dbf     d7,loc_A9DE
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                moveq   #0,d0
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
                subq.w  #1,d7
                subq.w  #1,d7
loc_AA0A:
                
                move.w  d0,d1
                addq.w  #1,d1
loc_AA0E:
                
                move.b  (a0,d0.w),d2
                cmp.b   (a0,d1.w),d2
                bcs.s   loc_AA22
                move.b  (a0,d1.w),(a0,d0.w)
                move.b  d2,(a0,d1.w)
loc_AA22:
                
                addq.w  #1,d1
                cmp.w   ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d1
                bcs.w   loc_AA0E
                addq.w  #1,d0
                dbf     d7,loc_AA0A
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
                subq.w  #1,d7
                subq.w  #1,d7
                moveq   #0,d6
loc_AA40:
                
                btst    #COM_BIT_SORT,(a0,d6.w)
                beq.s   loc_AA78
                move.b  (a0,d6.w),d0
                andi.b  #$BF,d0
                jsr     GetCurrentHP
                move.w  d1,d2
                move.b  1(a0,d6.w),d0
                andi.b  #$BF,d0
                jsr     GetCurrentHP
                cmp.w   d1,d2
                bcc.s   loc_AA78
                move.b  (a0,d6.w),d0
                move.b  1(a0,d6.w),(a0,d6.w)
                move.b  d0,1(a0,d6.w)
loc_AA78:
                
                addq.w  #1,d6
                dbf     d7,loc_AA40
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
                subq.w  #1,d7
loc_AA88:
                
                andi.b  #$BF,(a0,d7.w)
loc_AA8E:
                
                dbf     d7,loc_AA88
loc_AA92:
                
                movem.l (sp)+,d0-d2/d6-a0
                rts

	; End of function SortTargets


; =============== S U B R O U T I N E =======================================

OneSecondSleep:
                
                move.l  d0,-(sp)
                moveq   #60,d0
                jsr     (Sleep).w       
                move.l  (sp)+,d0
                rts

	; End of function OneSecondSleep


; =============== S U B R O U T I N E =======================================

NopOnce:
                
                nop
                rts

	; End of function NopOnce


; =============== S U B R O U T I N E =======================================

NopTwice:
                
                nop
                nop
                rts

	; End of function NopTwice


; =============== S U B R O U T I N E =======================================

NopThrice:
                
                nop
                nop
                nop
                rts

	; End of function NopThrice


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_Attack:
                
                bsr.w   WriteSkirmishScript_DodgeAttack
                tst.b   -BCSTACK_OFFSET_DODGE(a2)
                bne.w   loc_AAF6
                bsr.w   CalculateDamage 
                bsr.w   CalculateCriticalHit
                bsr.w   WriteSkirmishScript_InflictDamage
                tst.b   -BCSTACK_OFFSET_TARGETDIES(a2)
                beq.s   loc_AADC
                bsr.w   WriteSkirmishScript_DeathMessage
                bra.w   return_AAFA
loc_AADC:
                
                bsr.w   WriteSkirmishScript_InflictAilment
                bsr.w   WriteSkirmishScript_InflictCurseDamage
                tst.b   -BCSTACK_OFFSET_TARGETDIES(a2)
                beq.s   loc_AAF6
                exg     a4,a5
                bsr.w   WriteSkirmishScript_DeathMessage
                exg     a4,a5
                bra.w   return_AAFA
loc_AAF6:
                
                bsr.w   DetermineDoubleAndCounter
return_AAFA:
                
                rts

	; End of function WriteSkirmishScript_Attack


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_DodgeAttack:
                
                move.b  (a5),d0
                jsr     j_GetStatus
                andi.w  #COM_STATUS_MASK_SLEEP,d1
                bne.w   return_ABBC
                jsr     j_GetStatus
                andi.w  #1,d1
                bne.w   return_ABBC
                moveq   #2,d2           ; 50% chance to miss when muddled ?
                move.b  (a4),d0
                jsr     GetStatus
                andi.w  #COM_STATUS_MASK_MUDDLE,d1
                bne.w   loc_AB74
                moveq   #$20,d2 ; 1/32 chance to miss otherwise ?
                move.b  (a5),d0
                jsr     GetUpperMoveType
                cmpi.w  #5,d1
                beq.w   loc_AB4A
                cmpi.w  #6,d1
                beq.w   loc_AB4A
                bra.w   loc_AB74
loc_AB4A:
                
                move.b  (a4),d0
                jsr     GetUpperMoveType
                cmpi.w  #4,d1
                beq.w   loc_AB74
                cmpi.w  #8,d1
                beq.w   loc_AB74
                cmpi.w  #9,d1
                beq.w   loc_AB74
                cmpi.w  #$A,d1
                beq.w   loc_AB74
                moveq   #8,d2
loc_AB74:
                
                tst.b   -$17(a2)
                beq.s   loc_AB7C
                moveq   #0,d2
loc_AB7C:
                
                move.w  d2,d0
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.w   return_ABBC
                move.w  #$FFFF,d4
                move.w  #1,d5
                exg     a4,a5
                bsr.w   WriteSkirmishScript_AnimateSprite
                move.w  #$10,(a6)+
                move.w  #TEXTIDX_BATTLE_DODGE,(a6)+
                move.b  #0,(a6)+
                move.b  (a4),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                bsr.w   WriteSkirmishScript_IdleSprite
                exg     a4,a5
                move.b  #$FF,-BCSTACK_OFFSET_DODGE(a2)
return_ABBC:
                
                rts

	; End of function WriteSkirmishScript_DodgeAttack


; =============== S U B R O U T I N E =======================================

; In: A4 = attacker index in RAM
;     A5 = defender index in RAM
; Out: D6 = damage

CalculateDamage:
                
                move.b  (a4),d0
                jsr     GetCurrentATK
                move.w  d1,d2
                move.b  (a5),d0
                jsr     GetCurrentDEF
                sub.w   d1,d2
                bhi.s   loc_ABD6
                moveq   #1,d2
loc_ABD6:
                
                move.w  d2,d6
                move.b  (a5),d0
                jsr     GetMoveCost
                move.w  #$100,d3
                tst.b   d1
                beq.w   loc_ABFA
                move.w  #$E6,d3 
                cmpi.b  #1,d1
loc_ABF2:
                
                beq.w   loc_ABFA
                move.w  #$CD,d3 
loc_ABFA:
                
                mulu.w  d3,d6
                lsr.w   #8,d6
                move.b  (a5),d0
loc_AC00:
                
                jsr     GetUpperMoveType
                cmpi.w  #5,d1
                beq.w   loc_AC1A
                cmpi.w  #6,d1
                beq.w   loc_AC1A
                bra.w   return_AC4C
loc_AC1A:
                
                move.b  (a4),d0
                jsr     GetUpperMoveType
                cmpi.w  #4,d1
                beq.w   loc_AC46
                cmpi.w  #8,d1
                beq.w   loc_AC46
                cmpi.w  #9,d1
                beq.w   loc_AC46
                cmpi.w  #$A,d1
                beq.w   loc_AC46
                bra.w   return_AC4C
loc_AC46:
                
                move.w  d6,d0
                lsr.w   #2,d0
                add.w   d0,d6
return_AC4C:
                
                rts

	; End of function CalculateDamage


; =============== S U B R O U T I N E =======================================

CalculateCriticalHit:
                
                move.b  (a4),d0
                jsr     GetCurrentProwess
                andi.w  #CHAR_PROWESS_MASK_CRIT,d1
                move.w  d1,d2
                lsl.w   #1,d2
                lea     CriticalHitSettings(pc,d2.w),a0 ; values regarding critical hit chance and damage
                clr.w   d0
                move.b  (a0),d0
                beq.s   return_ACC8     ; skip function if 0 crit chance
                tst.b   -$F(a2)
                beq.s   loc_AC70
                moveq   #1,d0
loc_AC70:
                
                tst.b   -BCSTACK_OFFSET_DEBUGCRIT(a2)
                beq.s   loc_AC78
                moveq   #0,d0
loc_AC78:
                
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   return_ACC8
                move.b  1(a0),d0
                beq.s   loc_AC8C
                move.w  d6,d2
                lsr.w   d0,d2
                add.w   d2,d6
loc_AC8C:
                
                cmpi.w  #9,d1
                bcc.s   loc_ACC2
                move.b  #$FF,-3(a2)
                move.b  (a4),d0
                jsr     GetEquippedWeapon
                cmpi.w  #ITEM_GISARME,d1
                bne.s   loc_ACC0
                move.b  (a5),d0
                move.w  #SPELL_DESOUL,d1
                bsr.w   GetResistanceToSpell
                cmpi.w  #3,d2
                beq.s   loc_ACC0
                move.b  #$FF,-BCSTACK_OFFSET_CUTOFF(a2)
                clr.b   -BCSTACK_OFFSET_CRIT(a2)
loc_ACC0:
                
                bra.s   return_ACC8
loc_ACC2:
                
                move.b  #$FF,-2(a2)
return_ACC8:
                
                rts

	; End of function CalculateCriticalHit

