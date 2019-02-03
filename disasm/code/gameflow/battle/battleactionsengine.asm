
; ASM FILE code\gameflow\battle\battleactionsengine.asm :
; 0x9B92..0xC09A : Battle actions engine

; =============== S U B R O U T I N E =======================================

; In: D0 = attacker idx

WriteSkirmishScript:
                
                movem.l d0-a6,-(sp)
                link    a2,#-$98
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a3
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a4
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a5
                lea     (FF0000_RAM_START).l,a6; beginning of battle scene command list
                move.b  #0,-BCSTACK_OFFSET_DEBUGDODGE(a2)
                move.b  #0,-BCSTACK_OFFSET_DEBUGCRIT(a2)
loc_9BB8:
                
                move.b  #0,-BCSTACK_OFFSET_DEBUGDOUBLE(a2)
loc_9BBE:
                
                move.b  #0,-BCSTACK_OFFSET_DEBUGCOUNTER(a2)
loc_9BC4:
                
                tst.b   (DEBUG_MODE_ACTIVATED).l
                beq.s   loc_9BE4
                btst    #INPUT_A_START_BIT,((P1_INPUT-$1000000)).w
                beq.s   loc_9BD8
loc_9BD4:
                
                bsr.w   DebugModeSelectAction
loc_9BD8:
                
                btst    #INPUT_A_START_BIT,((P2_INPUT-$1000000)).w
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
loc_9C22:
                
                move.b  d1,-BCSTACK_OFFSET_INEFFECTIVEATTACK(a2)
                bsr.w   DetermineTargetsByAction
                bsr.w   InitSkirmishProperties
                bsr.w   CheckForTaros
loc_9C32:
                
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
loc_9D84:
                
                bsr.w   CreateBattleSceneText
                bsr.w   CreateBattleSceneAnimation
                bsr.w   WriteSkirmishScript_SwitchTargets
                bsr.w   WriteSkirmishScript_DoAction
                bsr.w   WriteSkirmishScript_EnemyDropItem
loc_9D98:
                
                bsr.w   WriteSkirmishScript_IdleSprite
loc_9D9C:
                
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a4
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a5
                tst.b   -BCSTACK_OFFSET_EXPLODE(a2)
                beq.s   loc_9DC4
loc_9DAA:
                
                move.b  #0,-BCSTACK_OFFSET_EXPLODE(a2)
                move.w  #ACTION_BURSTROCK,(a3)
                move.b  -BCSTACK_OFFSET_EXPLODECHAR(a2),(a4)
                move.w  #$C,(a6)+
loc_9DBC:
                
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
                cmpi.b  #BATTLEIDX_TAROS,((CURRENT_BATTLE-$1000000)).w
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
                cmpi.w  #ITEMIDX_ACHILLES_SWORD,d1
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
loc_9F98:
                
                jsr     GetDistanceBetweenEntities
                cmpi.w  #2,d2           ; check if block distance between attacker and target is >= 2
                bcs.s   loc_9FB0
                tst.b   -BCSTACK_OFFSET_MUDDLED(a2)
                bne.s   loc_9FB0
                move.b  #$FF,-BCSTACK_OFFSET_RANGED(a2)
loc_9FB0:
                
                move.b  (a4),d0
loc_9FB2:
                
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
                btst    #SPELLDEF_PROPS_BIT_AFFECTEDBYSILENCE,SPELLDEF_OFFSET_PROPS(a0)
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
                cmpi.w  #$F,d2
                beq.w   loc_A132
                move.w  #$116,d1        ; {NAME} belched{N}out flames!
                cmpi.w  #$11,d2
                beq.w   loc_A132
                cmpi.w  #$29,d2 
                beq.w   loc_A132
                move.w  #$117,d1        ; {NAME} blew out{N}a snowstorm!
                cmpi.w  #$12,d2
                beq.w   loc_A132
                move.w  #$114,d1        ; {NAME} cast{N}demon breath!
                cmpi.w  #$13,d2
                beq.w   loc_A132
                move.w  #$140,d1        ; Odd-eye beam!
                cmpi.w  #$2B,d2 
                beq.w   loc_A132
                move.w  #$11B,d1        ; {NAME} summoned{N}{SPELL}!{D1}
                cmpi.w  #$1D,d2
                beq.w   loc_A132
                cmpi.w  #$1E,d2
                beq.w   loc_A132
                cmpi.w  #$1F,d2
                beq.w   loc_A132
                cmpi.w  #$20,d2 
loc_A10E:
                
                beq.w   loc_A132
                move.w  2(a3),d2
                move.w  #$119,d1        ; {NAME} blew out{N}aqua-breath!
loc_A11A:
                
                cmpi.w  #$28,d2 
                beq.w   loc_A132
                move.w  #$11A,d1        ; {NAME} blew out{N}bubble-breath!
loc_A126:
                
                cmpi.w  #$68,d2 
                beq.w   loc_A132
                move.w  #$112,d1        ; {NAME} cast{N}{SPELL} level {#}!
loc_A132:
                
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d2
loc_A136:
                
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
loc_A170:
                
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
                cmpi.w  #$14,d1         ; MMNK
                beq.w   loc_A29C        
                moveq   #$55,d5 
                cmpi.w  #$1D,d1         ; RBT
                beq.w   loc_A29C        
                moveq   #$56,d5 
                cmpi.w  #$16,d1
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
                cmpi.w  #$1C,d1
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
                move.w  #0,d0
                bra.s   loc_A3BE
loc_A3BC:
                
                addq.w  #1,d0
loc_A3BE:
                
                cmpi.w  #$1D,d0
                bgt.s   loc_A3CE
                move.w  -(a0),d1
                jsr     SetCurrentHP
                bra.s   loc_A3BC
loc_A3CE:
                
                move.w  #$80,d0 
                bra.s   loc_A3D6
loc_A3D4:
                
                addq.w  #1,d0
loc_A3D6:
                
                cmpi.w  #$9F,d0 
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
                lea     byte_A870(pc), a0
loc_A810:
                
                cmpi.b  #$FF,(a0)
                beq.w   loc_A81E
                cmp.b   (a0)+,d0
                bne.s   loc_A810
                lsr.w   #1,d1
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

byte_A870:      dc.b 1
                dc.b $FF

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
loc_A8A4:
                
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
                lea     CriticalHitSettings(pc,d2.w),a0
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
                cmpi.w  #ITEMIDX_GISARME,d1
                bne.s   loc_ACC0
                move.b  (a5),d0
                move.w  #SPELLIDX_DESOUL,d1
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

CriticalHitSettings:
                incbin "data/stats/allies/classes/criticalhitsettings.bin"
                                                        ; values regarding critical hit chance/double attack/etc?

; =============== S U B R O U T I N E =======================================

; In: D6 = damage

WriteSkirmishScript_InflictDamage:
                
                move.b  (a5),d0
                jsr     GetEnemyID
                cmpi.w  #ENEMYIDX_TAROS,d1
                bne.s   loc_AD1C
                tst.b   -BCSTACK_OFFSET_INEFFECTIVEATTACK(a2)
                beq.s   loc_AD1C
                move.w  #$10,(a6)+
                move.w  #TEXTIDX_BATTLE_INEFFECTIVEATTACK,(a6)+
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                bra.w   return_AE30
loc_AD1C:
                
                cmpi.w  #2,((RAM_BattleScene_AttackNumber-$1000000)).w
                bne.s   loc_AD26
                lsr.w   #1,d6
loc_AD26:
                
                move.b  (a5),d0
                jsr     GetEnemyID
                cmpi.w  #ENEMYIDX_BURST_ROCK,d1
                bne.s   loc_AD3E
                tst.w   d6
                bne.s   loc_AD3A
                moveq   #1,d6
loc_AD3A:
                
                bra.w   loc_AD58
loc_AD3E:
                
                move.w  d6,d1
                lsr.w   #3,d1
                addq.w  #1,d1
                move.w  d1,d0
                jsr     (GetRandomOrDebugValue).w
                sub.w   d0,d6
                move.w  d1,d0
                jsr     (GetRandomOrDebugValue).w
                sub.w   d0,d6
                bgt.s   loc_AD58
                moveq   #1,d6
loc_AD58:
                
                jsr     CalculateDamageEXP
                tst.b   -BCSTACK_OFFSET_CUTOFF(a2)
                beq.s   loc_AD74
                move.w  #$18,d4
                move.w  #$FFFF,d5
                bsr.w   WriteSkirmishScript_AnimateSprite
                move.w  #$8000,d6
loc_AD74:
                
                move.b  (a5),d0
                move.w  d6,d1
                jsr     DecreaseCurrentHP
                jsr     GetCurrentHP
                tst.w   d1
                bne.s   loc_AD92
                move.b  #$FF,-BCSTACK_OFFSET_TARGETDIES(a2)
                bsr.w   GiveEXPandGoldForKill
loc_AD92:
                
                move.b  (a5),d0
                move.w  d6,d2
                neg.w   d2
                tst.b   -BCSTACK_OFFSET_TARGETDIES(a2)
                beq.s   loc_ADBA
                jsr     GetEnemyID
                cmpi.b  #ENEMYIDX_BURST_ROCK,d1
                bne.s   loc_ADBA
                tst.w   d7
                bne.s   loc_ADBA
                move.b  #$FF,-BCSTACK_OFFSET_EXPLODE(a2)
                move.b  d0,-BCSTACK_OFFSET_EXPLODECHAR(a2)
                moveq   #0,d2
loc_ADBA:
                
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_ADD8
                move.w  #$B,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_ADE8
loc_ADD8:
                
                move.w  #$A,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_ADE8:
                
                btst    #CHAR_BIT_ENEMY,(a4)
                bne.s   loc_AE00
                tst.b   -BCSTACK_OFFSET_CRIT(a2)
                beq.s   loc_ADFA
                move.w  #TEXTIDX_BATTLE_CRITDAMAGE,d1
                bra.s   loc_ADFE
loc_ADFA:
                
                move.w  #TEXTIDX_BATTLE_DAMAGE_ALLY,d1
loc_ADFE:
                
                bra.s   loc_AE10
loc_AE00:
                
                tst.b   -BCSTACK_OFFSET_CRIT(a2)
                beq.s   loc_AE0C
                move.w  #TEXTIDX_BATTLE_HEAVYDAMAGE,d1
                bra.s   loc_AE10
loc_AE0C:
                
                move.w  #TEXTIDX_BATTLE_DAMAGE_ENEMY,d1
loc_AE10:
                
                tst.b   -BCSTACK_OFFSET_CUTOFF(a2)
                beq.s   loc_AE1A
                move.w  #TEXTIDX_BATTLE_CUTOFF,d1
loc_AE1A:
                
                move.w  #$10,(a6)+
                move.w  d1,(a6)+
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d6,(a6)+
return_AE30:
                
                rts

	; End of function WriteSkirmishScript_InflictDamage


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictAilment:
                
                tst.b   -2(a2)
                beq.w   return_AE88
                move.b  (a4),d0
                jsr     GetCurrentProwess
                andi.w  #$F,d1
                move.w  d1,d2
                subi.w  #9,d2
                move.b  (a5),d0
                jsr     GetStatus
                lsl.w   #2,d2
                movea.l SkirmishAilmentFuncTable(pc,d2.w),a1
                jsr     (a1)
                btst    #7,d0
                bne.s   loc_AE76
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
loc_AE70:
                
                move.w  #0,(a6)+
                bra.s   return_AE88
loc_AE76:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #0,(a6)+
return_AE88:
                
                rts

	; End of function WriteSkirmishScript_InflictAilment

SkirmishAilmentFuncTable:
                dc.l WriteSkirmishScript_InflictPoison
                dc.l WriteSkirmishScript_InflictSleep
                dc.l WriteSkirmishScript_InflictStun
                dc.l WriteSkirmishScript_InflictMuddle
                dc.l WriteSkirmishScript_InflictSlow
                dc.l WriteSkirmishScript_DrainMP
                dc.l WriteSkirmishScript_InflictSilence

; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictPoison:
                
                move.w  #$11,(a6)+
                move.w  #$153,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                ori.w   #2,d1
                rts

	; End of function WriteSkirmishScript_InflictPoison


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictSleep:
                
                move.w  #$11,(a6)+
                move.w  #$152,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                ori.w   #$C0,d1 
                rts

	; End of function WriteSkirmishScript_InflictSleep


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictStun:
                
                move.w  #$11,(a6)+
                move.w  #$15B,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                ori.w   #1,d1
                rts

	; End of function WriteSkirmishScript_InflictStun


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictMuddle:
                
                move.w  #$11,(a6)+
                move.w  #$15A,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
loc_AF08:
                
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                ori.w   #8,d1
                ori.w   #$30,d1 
                rts

	; End of function WriteSkirmishScript_InflictMuddle


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictSlow:
                
                movem.l d0-d1,-(sp)
                bsr.w   WriteSkirmishScript_SlowMessage
                movem.l (sp)+,d0-d1
                ori.w   #$C00,d1
                rts

	; End of function WriteSkirmishScript_InflictSlow


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_DrainMP:
                
                movem.l d0-d1,-(sp)
                jsr     GetCurrentMP
                tst.w   d1
                beq.s   loc_AF3E
                bsr.w   sub_B5D6
loc_AF3E:
                
                movem.l (sp)+,d0-d1
                rts

	; End of function WriteSkirmishScript_DrainMP


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictSilence:
                
                move.w  d1,d3
                moveq   #0,d1
                jsr     GetSpellAndNumberOfSpells
                tst.w   d2
                beq.s   loc_AF6C
                move.w  #$11,(a6)+
                move.w  #$14F,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                ori.w   #$300,d3
loc_AF6C:
                
                move.w  d3,d1
                rts

	; End of function WriteSkirmishScript_InflictSilence


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_InflictCurseDamage:
                
                move.b  (a4),d0
                btst    #7,d0
                bne.w   return_B00C
                jsr     GetStatus
                btst    #2,d1
                beq.w   return_B00C
                moveq   #2,d0
loc_AF8A:
                
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                beq.w   return_B00C
                exg     a4,a5
                bsr.w   WriteSkirmishScript_SwitchTargets
                exg     a4,a5
                bsr.w   WriteSkirmishScript_IdleSprite
                move.b  (a4),d0
                move.w  d6,d3
                lsr.w   #3,d3
                addq.w  #1,d3
                move.w  d3,d1
                jsr     DecreaseCurrentHP
                jsr     GetCurrentHP
                tst.w   d1
                bne.s   loc_AFC0
loc_AFBA:
                
                move.b  #$FF,-4(a2)
loc_AFC0:
                
                move.w  d3,d2
                neg.w   d2
                move.b  (a4),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_AFE4
                move.w  #$B,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_AFF4
loc_AFE4:
                
                move.w  #$A,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_AFF4:
                
                move.w  #$12,(a6)+
                move.w  #$10,(a6)+
                move.w  #$168,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d3,(a6)+
return_B00C:
                
                rts

	; End of function WriteSkirmishScript_InflictCurseDamage


; =============== S U B R O U T I N E =======================================

DetermineDoubleAndCounter:
                
                move.b  (a4),d0
loc_B010:
                
                jsr     GetCurrentProwess
                lsr.b   #4,d1
                moveq   #$20,d0 
                andi.w  #3,d1
                beq.w   loc_B038
                moveq   #$10,d0
                cmpi.b  #1,d1
                beq.w   loc_B038
                moveq   #8,d0
                cmpi.b  #2,d1
                beq.w   loc_B038
                moveq   #4,d0
loc_B038:
                
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   loc_B046
                move.b  #$FF,-BCSTACK_OFFSET_DOUBLE(a2)
loc_B046:
                
                move.b  (a5),d0
                jsr     GetCurrentProwess
                lsr.b   #6,d1
                moveq   #$20,d0 
                andi.w  #3,d1
                beq.w   loc_B070
                moveq   #$10,d0
                cmpi.b  #1,d1
                beq.w   loc_B070
                moveq   #8,d0
                cmpi.b  #2,d1
                beq.w   loc_B070
                moveq   #4,d0
loc_B070:
                
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   return_B07E
                move.b  #$FF,-BCSTACK_OFFSET_COUNTER(a2)
return_B07E:
                
                rts

	; End of function DetermineDoubleAndCounter


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_DeathMessage:
                
                move.b  (a5),d0
                btst    #7,d0
                bne.s   loc_B08E
                move.w  #$123,d1
                bra.s   loc_B092
loc_B08E:
                
                move.w  #$122,d1
loc_B092:
                
                move.w  #$10,(a6)+
                move.w  d1,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                rts

	; End of function WriteSkirmishScript_DeathMessage


; =============== S U B R O U T I N E =======================================

; In: A2 = battle scene stack
;     A3 = address in RAM of scene action type
;     A4 = address in RAM of attacker idx
;     A5 = address in RAM of target idx

WriteSkirmishScript_UseSpell:
                
                move.b  (a5),d0
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d1
                bsr.w   GetResistanceToSpell
                add.w   d1,d1
                move.w  rjt_ItemUsedEffects(pc,d1.w),d1
                jmp     rjt_ItemUsedEffects(pc,d1.w)

	; End of function WriteSkirmishScript_UseSpell

rjt_ItemUsedEffects:
                dc.w sub_B114-rjt_ItemUsedEffects
                dc.w sub_B114-rjt_ItemUsedEffects
                dc.w sub_B194-rjt_ItemUsedEffects
                dc.w sub_B27C-rjt_ItemUsedEffects
                dc.w sub_B30E-rjt_ItemUsedEffects
                dc.w sub_B3A8-rjt_ItemUsedEffects
                dc.w sub_B41A-rjt_ItemUsedEffects
                dc.w spell07_Muddle-rjt_ItemUsedEffects
                dc.w sub_B516-rjt_ItemUsedEffects
                dc.w sub_B57E-rjt_ItemUsedEffects
                dc.w NoItemEffect-rjt_ItemUsedEffects
                dc.w sub_BADC-rjt_ItemUsedEffects
                dc.w sub_BAE2-rjt_ItemUsedEffects
                dc.w sub_BAF4-rjt_ItemUsedEffects
                dc.w sub_BAFA-rjt_ItemUsedEffects
                dc.w sub_B5D6-rjt_ItemUsedEffects
                dc.w sub_B114-rjt_ItemUsedEffects
                dc.w sub_BAD6-rjt_ItemUsedEffects
                dc.w sub_BAE2-rjt_ItemUsedEffects
                dc.w sub_BB00-rjt_ItemUsedEffects
                dc.w sub_B680-rjt_ItemUsedEffects
                dc.w sub_B6E6-rjt_ItemUsedEffects
                dc.w sub_B74C-rjt_ItemUsedEffects
                dc.w sub_B7B2-rjt_ItemUsedEffects
                dc.w sub_B826-rjt_ItemUsedEffects
                dc.w NoItemEffect-rjt_ItemUsedEffects
                dc.w NoItemEffect-rjt_ItemUsedEffects
                dc.w sub_BADC-rjt_ItemUsedEffects
                dc.w sub_BAF4-rjt_ItemUsedEffects
                dc.w sub_BAFA-rjt_ItemUsedEffects
                dc.w sub_BADC-rjt_ItemUsedEffects
                dc.w sub_BAE8-rjt_ItemUsedEffects
                dc.w sub_BAF4-rjt_ItemUsedEffects
                dc.w sub_B194-rjt_ItemUsedEffects
                dc.w sub_BA1C-rjt_ItemUsedEffects
                dc.w sub_B886-rjt_ItemUsedEffects
                dc.w sub_B8F8-rjt_ItemUsedEffects
                dc.w sub_BADC-rjt_ItemUsedEffects
                dc.w sub_BAE2-rjt_ItemUsedEffects
                dc.w sub_BAF4-rjt_ItemUsedEffects
                dc.w sub_BAEE-rjt_ItemUsedEffects
                dc.w sub_BAD6-rjt_ItemUsedEffects
                dc.w sub_BA1C-rjt_ItemUsedEffects
                dc.w sub_BAF4-rjt_ItemUsedEffects

; =============== S U B R O U T I N E =======================================

sub_B114:
                
                move.b  (a5),d0
                jsr     GetMaxHP
                move.w  d1,d2
                jsr     GetCurrentHP
                sub.w   d1,d2
                move.w  2(a3),d1
                jsr     GetSpellDefAddress
                clr.w   d6
                move.b  SPELLDEF_OFFSET_POWER(a0),d6
                cmpi.b  #$FF,d6
                bne.s   loc_B140
                move.w  d2,d6
                bra.s   loc_B144
loc_B140:
                
                bsr.w   GetSpellPowerAdjustedForClass
loc_B144:
                
                cmp.w   d6,d2
                bcc.s   loc_B14A
                move.w  d2,d6
loc_B14A:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B16A
                move.w  #$B,(a6)+
                move.w  d6,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B17A
loc_B16A:
                
                move.w  #$A,(a6)+
                move.w  d6,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B17A:
                
                move.w  #$10,(a6)+
                move.w  #$12A,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d6,(a6)+
                bsr.w   sub_A872
                rts

	; End of function sub_B114


; =============== S U B R O U T I N E =======================================

sub_B194:
                
                move.b  (a5),d0
                jsr     GetStatus
                clr.b   d2
                tst.w   ((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                cmpi.w  #0,((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                beq.w   loc_B1CA
                cmpi.w  #1,((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                beq.w   loc_B1C0
                bclr    #2,d1
                beq.s   loc_B1C0
                ori.b   #4,d2
loc_B1C0:
                
                bclr    #0,d1
                beq.s   loc_B1CA
                ori.b   #2,d2
loc_B1CA:
                
                bclr    #1,d1
                beq.s   loc_B1D4
                ori.b   #1,d2
loc_B1D4:
                
                tst.b   d2
loc_B1D6:
                
                beq.w   loc_B266
                btst    #7,d0
                bne.s   loc_B1F4
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B206
loc_B1F4:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B206:
                
                bsr.w   GiveMagicDrainEXP
                btst    #0,d2
                beq.s   loc_B226
                move.w  #$10,(a6)+
                move.w  #$12D,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
loc_B226:
                
                btst    #1,d2
                beq.s   loc_B242
                move.w  #$10,(a6)+
                move.w  #$12E,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
loc_B242:
                
                btst    #2,d2
                beq.s   loc_B264
                move.w  #$10,(a6)+
                move.w  #$12F,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                jsr     UnequipAllItemsIfNotCursed
loc_B264:
                
                bra.s   loc_B26C
loc_B266:
                
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
loc_B26C:
                
                move.b  (a5),d0
                jsr     SetStatus
                jsr     ApplyStatusAndItemsOnStats
                rts

	; End of function sub_B194


; =============== S U B R O U T I N E =======================================

sub_B27C:
                
                move.b  (a5),d0
                jsr     GetStatus
                move.w  d1,d3
                ori.w   #$3000,d1
                jsr     SetStatus
                andi.w  #$3000,d3
                beq.s   loc_B29C
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
loc_B29C:
                
                btst    #7,d0
                bne.s   loc_B2B6
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B2C8
loc_B2B6:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B2C8:
                
                bsr.w   GiveMagicDrainEXP
                jsr     GetBaseAGI
                mulu.w  #3,d1
                lsr.l   #3,d1
                move.w  #$10,(a6)+
                move.w  #$14C,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                jsr     GetBaseDEF
                mulu.w  #3,d1
                lsr.l   #3,d1
                move.w  #$10,(a6)+
                move.w  #$155,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                rts

	; End of function sub_B27C


; =============== S U B R O U T I N E =======================================

sub_B30E:
                
                tst.w   d2
                beq.s   loc_B314
                addq.w  #5,d2
loc_B314:
                
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatus
                move.w  d1,d3
                ori.w   #$C00,d1
                jsr     SetStatus
                andi.w  #$C00,d3
                beq.s   loc_B336
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
loc_B336:
                
                btst    #7,d0
                bne.s   loc_B350
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_B362
loc_B350:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_B362:
                
                bsr.w   GiveMagicDrainEXP

	; End of function sub_B30E


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_SlowMessage:
                
                jsr     GetBaseAGI
                mulu.w  #3,d1
                lsr.l   #3,d1
                move.w  #$10,(a6)+
                move.w  #$14D,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                jsr     GetBaseDEF
                mulu.w  #3,d1
                lsr.l   #3,d1
                move.w  #$10,(a6)+
                move.w  #$156,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                rts

	; End of function WriteSkirmishScript_SlowMessage


; =============== S U B R O U T I N E =======================================

sub_B3A8:
                
                move.b  (a5),d0
                jsr     GetStatus
                move.w  d1,d3
                ori.w   #$C000,d1
                jsr     SetStatus
                andi.w  #$C000,d3
                beq.s   loc_B3C8
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
loc_B3C8:
                
                btst    #7,d0
                bne.s   loc_B3E2
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B3F4
loc_B3E2:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B3F4:
                
                bsr.w   GiveMagicDrainEXP
                jsr     GetBaseATK
                mulu.w  #3,d1
                lsr.l   #3,d1
loc_B404:
                
                move.w  #$10,(a6)+
                move.w  #$14E,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                rts

	; End of function sub_B3A8


; =============== S U B R O U T I N E =======================================

sub_B41A:
                
                move.w  d2,d3
                move.b  (a5),d0
                moveq   #0,d1
                jsr     GetSpellAndNumberOfSpells
                tst.w   d2
                bne.s   loc_B42E
                moveq   #8,d3
                bra.s   loc_B430
loc_B42E:
                
                addq.w  #5,d3
loc_B430:
                
                move.w  d3,d2
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatus
                ori.w   #$300,d1
                btst    #7,d0
                bne.s   loc_B45A
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_B46C
loc_B45A:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_B46C:
                
                bsr.w   GiveMagicDrainEXP
                move.w  #$10,(a6)+
                move.w  #$14F,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                rts

	; End of function sub_B41A


; =============== S U B R O U T I N E =======================================

; muddle

spell07_Muddle:
                
                move.b  (a5),d0
                tst.w   ((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                beq.w   loc_B4AE        
                addq.w  #5,d2           ; muddle 2, 25% chance
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatus
                ori.w   #COM_STATUS_MASK_MUDDLE2,d1
                ori.w   #COM_STATUS_MASK_MUDDLE,d1
                move.w  #$151,d2
                bra.w   loc_B4D0
loc_B4AE:
                
                moveq   #8,d2           ; muddle 1
                jsr     GetStatus
                andi.w  #COM_STATUS_MASK_MUDDLE2,d1
                bne.s   loc_B4BE        ; if target already affected by Muddle 2, then no chance for Muddle 1 to work.
                moveq   #5,d2           ; 25% chance
loc_B4BE:
                
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatus
                ori.w   #COM_STATUS_MASK_MUDDLE,d1
                move.w  #$151,d2
loc_B4D0:
                
                btst    #7,d0
                bne.s   loc_B4EA
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_B4FC
loc_B4EA:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_B4FC:
                
                bsr.w   GiveMagicDrainEXP
                move.w  #$10,(a6)+
                move.w  d2,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                rts

	; End of function spell07_Muddle


; =============== S U B R O U T I N E =======================================

sub_B516:
                
                addq.w  #5,d2
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B53C
                move.w  #$B,(a6)+
                move.w  #$8000,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_B54E
loc_B53C:
                
                move.w  #$A,(a6)+
                move.w  #$8000,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_B54E:
                
                bsr.w   GiveEXPandGoldForKill
                btst    #7,d0
                bne.s   loc_B55E
                move.w  #$130,d2
                bra.s   loc_B562
loc_B55E:
                
                move.w  #$131,d2
loc_B562:
                
                move.w  #$10,(a6)+
                move.w  d2,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.b  #$FF,-4(a2)
                rts

	; End of function sub_B516


; =============== S U B R O U T I N E =======================================

sub_B57E:
                
                addq.w  #5,d2
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatus
                ori.w   #$C0,d1 
                btst    #7,d0
                bne.s   loc_B5A8
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_B5BA
loc_B5A8:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_B5BA:
                
                bsr.w   GiveMagicDrainEXP
                move.w  #$10,(a6)+
                move.w  #$152,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                rts

	; End of function sub_B57E


; =============== S U B R O U T I N E =======================================

sub_B5D6:
                
                move.b  (a5),d0
                jsr     GetCurrentMP
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #3,d0
                cmp.b   d0,d1
                bcc.s   loc_B5EC
                move.w  d1,d0
loc_B5EC:
                
                move.w  d0,d2
                move.w  d0,d3
                neg.w   d3
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B612
loc_B600:
                
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  d3,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
                bra.s   loc_B622
loc_B612:
                
                move.w  #$A,(a6)+
loc_B616:
                
                move.w  #0,(a6)+
                move.w  d3,(a6)+
                move.w  d1,(a6)+
                move.w  #1,(a6)+
loc_B622:
                
                move.b  (a4),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B642
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  d2,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B652
loc_B642:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  d2,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B652:
                
                bsr.w   GiveMagicDrainEXP
                move.w  #$12,(a6)+
                btst    #7,d0
                bne.s   loc_B666
                move.w  #$13D,d1
                bra.s   loc_B66C
loc_B666:
                
                move.b  (a5),d0
                move.w  #$13A,d1
loc_B66C:
                
                move.w  #$10,(a6)+
                move.w  d1,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d2,(a6)+
                rts

	; End of function sub_B5D6


; =============== S U B R O U T I N E =======================================

sub_B680:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B6A2
                move.w  #$B,(a6)+
loc_B692:
                
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
loc_B69C:
                
                move.w  #2,(a6)+
                bra.s   loc_B6B4
loc_B6A2:
                
                move.w  #$A,(a6)+
loc_B6A6:
                
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
loc_B6B0:
                
                move.w  #2,(a6)+
loc_B6B4:
                
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #2,d0
                move.w  #$10,(a6)+
                move.w  #$96,(a6)+ 
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d0,(a6)+
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseBaseATK
                jsr     ApplyStatusAndItemsOnStats
                rts

	; End of function sub_B680


; =============== S U B R O U T I N E =======================================

sub_B6E6:
                
                move.b  (a5),d0
loc_B6E8:
                
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B708
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B71A
loc_B708:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B71A:
                
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #2,d0
                move.w  #$10,(a6)+
                move.w  #$97,(a6)+ 
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d0,(a6)+
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseBaseDEF
                jsr     ApplyStatusAndItemsOnStats
                rts

	; End of function sub_B6E6


; =============== S U B R O U T I N E =======================================

sub_B74C:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B76E
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B780
loc_B76E:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B780:
                
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #2,d0
                move.w  #$10,(a6)+
                move.w  #$98,(a6)+ 
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d0,(a6)+
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseBaseAGI
                jsr     ApplyStatusAndItemsOnStats
                rts

	; End of function sub_B74C


; =============== S U B R O U T I N E =======================================

sub_B7B2:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B7D4
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B7E6
loc_B7D4:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B7E6:
                
                jsr     GetBaseMOV
                clr.w   d2
                cmpi.b  #9,d1
                beq.w   loc_B802
                moveq   #1,d2
                cmpi.b  #8,d1
                beq.w   loc_B802
                moveq   #2,d2
loc_B802:
                
                move.w  #$10,(a6)+
                move.w  #$99,(a6)+ 
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d2,(a6)+
                move.w  d2,d1
                jsr     IncreaseBaseMOV
                jsr     ApplyStatusAndItemsOnStats
                rts

	; End of function sub_B7B2


; =============== S U B R O U T I N E =======================================

sub_B826:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B848
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B85A
loc_B848:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B85A:
                
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #2,d0
                move.w  #$10,(a6)+
                move.w  #$9A,(a6)+ 
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d0,(a6)+
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseMaxHP
                rts

	; End of function sub_B826


; =============== S U B R O U T I N E =======================================

sub_B886:
                
                move.b  (a5),d0
loc_B888:
                
                jsr     GetMaxMP
                tst.w   d1
                bne.s   loc_B898
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
loc_B898:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B8BA
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B8CC
loc_B8BA:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B8CC:
                
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #2,d0
                move.w  #$10,(a6)+
                move.w  #$9B,(a6)+ 
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d0,(a6)+
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseMaxMP
                rts

	; End of function sub_B886


; =============== S U B R O U T I N E =======================================

sub_B8F8:
                
                move.b  (a5),d0
                moveq   #0,d1
                jsr     SetCurrentEXP
                jsr     LevelUp
                lea     ((byte_FFAF82-$1000000)).w,a1
                cmpi.b  #$FF,(a1)
                bne.s   loc_B918
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
loc_B918:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_B93A
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_B94C
loc_B93A:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_B94C:
                
                clr.l   d1
                move.b  (a1)+,d1
                move.w  #$10,(a6)+
                move.w  #$F4,(a6)+ 
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
                move.b  (a1)+,d1
                beq.s   loc_B97C
                move.w  #$10,(a6)+
                move.w  #$10A,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
loc_B97C:
                
                move.b  (a1)+,d1
                beq.s   loc_B994
                move.w  #$10,(a6)+
                move.w  #$10B,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
loc_B994:
                
                move.b  (a1)+,d1
                beq.s   loc_B9AC
                move.w  #$10,(a6)+
                move.w  #$10C,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
loc_B9AC:
                
                move.b  (a1)+,d1
                beq.s   loc_B9C4
                move.w  #$10,(a6)+
                move.w  #$10D,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
loc_B9C4:
                
                move.b  (a1)+,d1
                beq.s   loc_B9DC
                move.w  #$10,(a6)+
                move.w  #$10E,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
loc_B9DC:
                
                move.b  (a1)+,d1
                cmpi.b  #$FF,d1
                beq.s   return_BA1A
                move.w  d1,d2
                andi.w  #$3F,d2 
                lsr.w   #6,d1
                bne.s   loc_BA04
                move.w  #$10,(a6)+
                move.w  #$10F,(a6)+
                move.w  d0,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                bra.s   return_BA1A
loc_BA04:
                
                addq.w  #1,d1
                move.w  #$10,(a6)+
                move.w  #$110,(a6)+
                move.w  d2,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d1,(a6)+
return_BA1A:
                
                rts

	; End of function sub_B8F8


; =============== S U B R O U T I N E =======================================

sub_BA1C:
                
                move.b  (a5),d0
                jsr     GetMaxMP
                move.w  d1,d2
                jsr     GetCurrentMP
                sub.w   d1,d2
                move.w  2(a3),d1
                jsr     GetSpellDefAddress
                clr.w   d6
                move.b  7(a0),d6
                cmpi.b  #$FF,d6
                bne.s   loc_BA46
                move.w  d2,d6
loc_BA46:
                
                cmp.w   d6,d2
                bcc.s   loc_BA4C
                move.w  d2,d6
loc_BA4C:
                
                move.b  (a5),d0
                jsr     GetStatus
                btst    #7,d0
                bne.s   loc_BA6C
                move.w  #$B,(a6)+
                move.w  #0,(a6)+
                move.w  d6,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
                bra.s   loc_BA7C
loc_BA6C:
                
                move.w  #$A,(a6)+
                move.w  #0,(a6)+
                move.w  d6,(a6)+
                move.w  d1,(a6)+
                move.w  #2,(a6)+
loc_BA7C:
                
                move.w  #$10,(a6)+
                move.w  #$12C,(a6)+
                move.w  d0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  d6,(a6)+
                bsr.w   sub_A872
                rts

	; End of function sub_BA1C


; =============== S U B R O U T I N E =======================================

NoItemEffect:
                
                rts

	; End of function NoItemEffect


; =============== S U B R O U T I N E =======================================

ApplyRandomEffectiveness:
                
                move.l  d0,-(sp)
                tst.b   -$17(a2)
                beq.s   loc_BAA2
                moveq   #8,d2
loc_BAA2:
                
                moveq   #8,d0
                jsr     (GetRandomOrDebugValue).w
                cmp.w   d2,d0
                bcc.s   loc_BAD2
                move.w  #$10,(a6)+
                move.w  #$127,(a6)+
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.b  #$FF,-5(a2)
                move.l  (sp)+,d0
                move.l  (sp)+,d0
                rts
loc_BAD2:
                
                move.l  (sp)+,d0
                rts

	; End of function ApplyRandomEffectiveness


; =============== S U B R O U T I N E =======================================

sub_BAD6:
                
                moveq   #$10,d3
                bra.w   loc_BB02

	; End of function sub_BAD6


; =============== S U B R O U T I N E =======================================

sub_BADC:
                
                moveq   #$20,d3 
                bra.w   loc_BB02

	; End of function sub_BADC


; =============== S U B R O U T I N E =======================================

sub_BAE2:
                
                moveq   #$20,d3 
                bra.w   loc_BB02

	; End of function sub_BAE2


; =============== S U B R O U T I N E =======================================

sub_BAE8:
                
                moveq   #$10,d3
                bra.w   loc_BB02

	; End of function sub_BAE8


; =============== S U B R O U T I N E =======================================

sub_BAEE:
                
                moveq   #8,d3
                bra.w   loc_BB02

	; End of function sub_BAEE


; =============== S U B R O U T I N E =======================================

sub_BAF4:
                
                moveq   #8,d3
                bra.w   loc_BB02

	; End of function sub_BAF4


; =============== S U B R O U T I N E =======================================

sub_BAFA:
                
                moveq   #$20,d3 
                bra.w   loc_BB02

	; End of function sub_BAFA


; =============== S U B R O U T I N E =======================================

sub_BB00:
                
                moveq   #0,d3

	; End of function sub_BB00


; START OF FUNCTION CHUNK FOR sub_BAD6

loc_BB02:
                
                move.w  2(a3),d1
                jsr     GetSpellDefAddress
                clr.w   d6
                move.b  7(a0),d6
                bsr.w   GetSpellPowerAdjustedForClass
                move.w  d6,d1
                lsr.w   #2,d1
                cmpi.b  #1,d2
                bne.s   loc_BB22
                sub.w   d1,d6
loc_BB22:
                
                cmpi.b  #2,d2
                bne.s   loc_BB2A
                lsr.w   #1,d6
loc_BB2A:
                
                cmpi.b  #3,d2
                bne.s   loc_BB32
                add.w   d1,d6
loc_BB32:
                
                move.w  d3,d0
                beq.s   loc_BB46
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   loc_BB46
                add.w   d1,d6
                move.b  #$FF,-3(a2)
loc_BB46:
                
                bsr.w   WriteSkirmishScript_InflictDamage
                tst.b   -4(a2)
                beq.s   return_BB54
                bsr.w   WriteSkirmishScript_DeathMessage
return_BB54:
                
                rts

; END OF FUNCTION CHUNK FOR sub_BAD6


; =============== S U B R O U T I N E =======================================

;     Miscellaneous hacks to alter spell damage. (125% if promoted, damage divided if SORC spells)
;     In: D6 = original damage
;     Out: D6 = altered damage

GetSpellPowerAdjustedForClass:
                
                movem.l d0-d1/a0,-(sp)
                cmpi.w  #1,(a3)
                bne.w   loc_BB78
                move.b  (a4),d0
                jsr     GetClass
                cmpi.b  #CHAR_CLASS_FIRSTPROMOTED,d1
                bcs.w   loc_BB78
                mulu.w  #5,d6
                lsr.w   #2,d6
loc_BB78:
                
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d1
                cmpi.w  #SPELLIDX_DAO,d1; HARDCODED spell indexes
                beq.w   loc_BBA0
                cmpi.w  #SPELLIDX_APOLLO,d1
                beq.w   loc_BBA0
                cmpi.w  #SPELLIDX_NEPTUN,d1
                beq.w   loc_BBA0
                cmpi.w  #SPELLIDX_ATLAS,d1
                beq.w   loc_BBA0
                bra.w   loc_BBB2
loc_BBA0:
                
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d0
                beq.w   loc_BBB2
                andi.w  #$FFFF,d6
                divu.w  d0,d6
                andi.w  #$FFFF,d6
loc_BBB2:
                
                movem.l (sp)+,d0-d1/a0
                rts

	; End of function GetSpellPowerAdjustedForClass


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_UseItem:
                
                move.w  ((CURRENT_BATTLE_ITEM-$1000000)).w,d1
                jsr     GetItemDefAddress
                move.b  9(a0),d0
                move.w  d0,2(a3)
                andi.w  #$3F,d0 
                move.w  d0,((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w
                move.b  9(a0),d0
                lsr.b   #6,d0
                andi.w  #3,d0
                move.w  d0,((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                bra.w   WriteSkirmishScript_UseSpell

	; End of function WriteSkirmishScript_UseItem


; =============== S U B R O U T I N E =======================================

nullsub_9:
                
                rts

	; End of function nullsub_9


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_BreakUsedItem:
                
                movem.l d0-d3/a0,-(sp)
                cmpi.w  #ACTION_ITEM,(a3)
                bne.w   loc_BC94
                move.w  ((CURRENT_BATTLE_ITEM-$1000000)).w,d1
                jsr     GetItemType     
                tst.w   d2
                beq.w   loc_BC88
                jsr     GetItemDefAddress
                btst    #7,ITEMDEF_OFFSET_TYPE(a0)
                beq.w   loc_BC94
                btst    #CHAR_BIT_ENEMY,(a4)
                bne.w   loc_BC94
                move.w  ((CURRENT_BATTLE_ITEM-$1000000)).w,d0
                btst    #ITEM_BIT_BROKEN,d0
                bne.w   loc_BC5C
                moveq   #4,d0
                jsr     (GetRandomOrDebugValue).w
                tst.b   d0
                bne.s   loc_BC58
                moveq   #0,d0
                jsr     GetItemBreakMessage(pc)
                nop
                move.w  #$10,(a6)+
                move.w  d3,(a6)+
                move.w  d1,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.b  (a4),d0
                move.w  6(a3),d1
                jsr     BreakItem       
loc_BC58:
                
                bra.w   loc_BC94
loc_BC5C:
                
                moveq   #1,d0
                jsr     GetItemBreakMessage(pc)
                nop
                move.w  #$10,(a6)+
                move.w  d3,(a6)+
                move.w  d1,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.b  (a4),d0
                move.w  6(a3),d1
                jsr     RemoveItemBySlot
                bra.w   loc_BC94
loc_BC88:
                
                move.b  (a4),d0
                move.w  6(a3),d1
                jsr     RemoveItemBySlot
loc_BC94:
                
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function WriteSkirmishScript_BreakUsedItem


; =============== S U B R O U T I N E =======================================

; In: A2 = skirmish properties stack
;     D0 = whether item is already damaged (0=no, 1=yes)
; Out: D3 = message idx

GetItemBreakMessage:
                
                movem.l d0/a0,-(sp)
                tst.b   d0
                bne.s   loc_BCB4
                tst.b   -5(a2)
                bne.s   loc_BCAE        
loc_BCA8:
                
                move.w  #$174,d3        ; But smoke rose from{N}the {ITEM}.{D1}
                bra.s   loc_BCB2
loc_BCAE:
                
                move.w  #$17E,d3        ; And smoke emerged from{N}the {ITEM}.{D1}
loc_BCB2:
                
                bra.s   loc_BCC4
loc_BCB4:
                
                tst.b   -5(a2)
                bne.s   loc_BCC0        
                move.w  #$179,d3        ; But, the {ITEM}{N}burst into flames.
                bra.s   loc_BCC4
loc_BCC0:
                
                move.w  #$183,d3        ; And the {ITEM}{N}burst into flames.
loc_BCC4:
                
                move.w  ((CURRENT_BATTLE_ITEM-$1000000)).w,d0
                andi.w  #$7F,d0 
                lea     ItemBreakMessages(pc), a0
loc_BCD0:
                
                cmpi.w  #$FFFF,(a0)
                beq.w   loc_BCEA
                cmp.b   (a0),d0
                beq.w   loc_BCE2
                addq.l  #2,a0
                bra.s   loc_BCD0
loc_BCE2:
                
                moveq   #0,d0
                move.b  1(a0),d0
                add.w   d0,d3
loc_BCEA:
                
                movem.l (sp)+,d0/a0
                rts

	; End of function GetItemBreakMessage

ItemBreakMessages:
                incbin "data/stats/items/itembreakmessages.bin"

; =============== S U B R O U T I N E =======================================

; In: A2 = battle scene stack
;     A3 = address in RAM of scene action type
;     A4 = address in RAM of attacker idx
;     A5 = address in RAM of target idx

WriteSkirmishScript_EnemyDropItem:
                
                movem.l d0-d3/a0,-(sp)
                btst    #CHAR_BIT_ENEMY,(a4)
                bne.w   loc_BE4C
                btst    #CHAR_BIT_ENEMY,(a5)
                beq.w   loc_BE4C
                tst.b   -BCSTACK_OFFSET_TARGETDIES(a2)
                beq.w   loc_BE4C
                move.b  ((CURRENT_BATTLE-$1000000)).w,d3
                lea     EnemyItemDrops(pc), a0
loc_BD48:
                
                cmp.b   (a0),d3
                bne.w   loc_BD6A
                move.b  (a5),d0
                cmp.b   1(a0),d0
                bne.w   loc_BD6A
                clr.w   d1
                move.b  2(a0),d1
                bsr.w   GetItemSlotContainingIndex
                cmpi.w  #CODE_NOTHING_WORD,d2
                bne.w   loc_BD78
loc_BD6A:
                
                adda.w  #4,a0
                cmpi.w  #CODE_TERMINATOR_WORD,(a0)
                bne.s   loc_BD48
                bra.w   loc_BE4C
loc_BD78:
                
                move.w  d1,d3
                andi.w  #ITEM_MASK_IDX,d3
                move.w  d2,d4
                cmpi.w  #ITEMIDX_TAROS_SWORD,d3; HARDCODED special items with 1/32 drop chances
                beq.w   loc_BD9C
                cmpi.w  #ITEMIDX_IRON_BALL,d3
                beq.w   loc_BD9C
                cmpi.w  #ITEMIDX_COUNTER_SWORD,d3
                beq.w   loc_BD9C
                bra.w   loc_BDC4
loc_BD9C:
                
                moveq   #$20,d0 
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.w   loc_BE4C
                bra.w   loc_BDC4
                jsr     j_IsSpecialBattle
                tst.w   d1
                beq.w   loc_BDC4        ; if battle index not in list
                moveq   #3,d0           ; else
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                beq.w   loc_BE4C
loc_BDC4:
                
                clr.w   d0
                move.b  3(a0),d0
                lea     ((ENEMY_ITEM_DROPS-$1000000)).w,a0
                divu.w  #8,d0
                adda.w  d0,a0
                swap    d0
                bset    d0,(a0)
                bne.w   loc_BE4C
                move.b  (a5),d0
                move.w  d4,d1
                jsr     RemoveItemBySlot
                move.b  (a4),d0
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_BE36
                move.w  d3,d1
                jsr     AddItem         
                tst.b   d2
                bne.w   loc_BE36
                move.w  #$10,(a6)+
                move.w  #TEXTIDX_BATTLE_DROPPEDITEM,(a6)+
                                                        ; {NAME} dropped{N}a {ITEM}.{D1}
                move.b  #0,(a6)+
                move.b  (a5),(a6)+
                move.w  d1,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                move.w  #$10,(a6)+
                move.w  #TEXTIDX_BATTLE_PICKEDUPITEM,(a6)+
                                                        ; {NAME} received{N}the {ITEM}.
                move.b  #0,(a6)+
                move.b  (a4),(a6)+
                move.w  d1,(a6)+
                move.w  #0,(a6)+
                move.w  #0,(a6)+
                bra.w   loc_BE4C
loc_BE36:
                
                move.w  d3,d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_RARE,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   loc_BE4C
                jsr     AddItemToDeals  
loc_BE4C:
                
                movem.l (sp)+,d0-d3/a0
                rts

	; End of function WriteSkirmishScript_EnemyDropItem

EnemyItemDrops: incbin "data/battles/global/enemyitemdrops.bin"
EnemyGold:      incbin "data/stats/enemies/enemygold.bin"

; =============== S U B R O U T I N E =======================================

GetEnemyDestination:
                
                movem.l d0/a0,-(sp)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                jsr     GetYPos
                move.w  d1,d2
                jsr     GetXPos
loc_C03A:
                
                move.b  (a0)+,d0
                cmpi.b  #$FF,d0
                beq.w   loc_C06A
                tst.b   d0
                bne.s   loc_C04C
                addq.w  #1,d1
                bra.s   loc_C068
loc_C04C:
                
                subq.b  #1,d0
                bne.s   loc_C054
                subq.w  #1,d2
                bra.s   loc_C068
loc_C054:
                
                subq.b  #1,d0
                bne.s   loc_C05C
                subq.w  #1,d1
                bra.s   loc_C068
loc_C05C:
                
                subq.b  #1,d0
                bne.s   loc_C064
                addq.w  #1,d2
                bra.s   loc_C068
loc_C064:
                
                bra.w   loc_C06A
loc_C068:
                
                bra.s   loc_C03A
loc_C06A:
                
                movem.l (sp)+,d0/a0
                rts

	; End of function GetEnemyDestination


; =============== S U B R O U T I N E =======================================

ClearEnemyMoveInfo:
                
                movem.l d0-a6,-(sp)
                lea     ((ENEMY_TARGETTING_COMMAND_LIST-$1000000)).w,a0
                lea     ((byte_FFB1DC-$1000000)).w,a1
                clr.w   d0
                move.w  #$30,d1 
loc_C082:
                
                move.b  #$FF,(a0,d0.w)
                move.b  #0,(a1,d0.w)
                addq.w  #1,d0
                subq.w  #1,d1
                bne.s   loc_C082
                movem.l (sp)+,d0-a6
                rts

	; End of function ClearEnemyMoveInfo

