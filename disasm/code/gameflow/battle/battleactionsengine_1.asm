
; ASM FILE code\gameflow\battle\battleactionsengine_1.asm :
; 0x9B92..0xACCA : Battle actions engine

; =============== S U B R O U T I N E =======================================

; In: D0 = attacker index

WriteSkirmishScript:
                
                movem.l d0-a6,-(sp)
                link    a2,#BTLSCENE_STACKNEGSIZE
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
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                beq.s   loc_9BD8
                bsr.w   DebugModeActionSelect
loc_9BD8:
                
                btst    #INPUT_BIT_START,((P2_INPUT-$1000000)).w
                beq.s   loc_9BE4
                bsr.w   DebugModeSelectHits
loc_9BE4:
                
                move.b  d0,((BATTLESCENE_ATTACKER-$1000000)).w
                move.b  d0,((BATTLESCENE_ATTACKER_COPY-$1000000)).w
                moveq   #0,d1
                move.w  d1,((BATTLESCENE_EXP-$1000000)).w
                move.w  d1,((BATTLESCENE_GOLD-$1000000)).w
                move.w  d1,((BATTLESCENE_ATTACK_TYPE-$1000000)).w
                move.b  d1,-BCSTACK_OFFSET_DOUBLE(a2)
                move.b  d1,-BCSTACK_OFFSET_COUNTER(a2)
                move.b  d1,-BCSTACK_OFFSET_SILENCED(a2)
                move.b  d1,-BCSTACK_OFFSET_INACTION_STUN(a2)
                move.b  d1,-BCSTACK_OFFSET_INACTION_CURSE(a2)
                move.b  d1,-BCSTACK_OFFSET_MUDDLED(a2)
                move.b  d1,-BCSTACK_OFFSET_SAMESIDE(a2)
                move.b  d1,-BCSTACK_OFFSET_RANGED(a2)
                move.b  d1,-BCSTACK_OFFSET_FORCEDCRIT(a2)
                move.b  d1,-BCSTACK_OFFSET_EXPLODE(a2)
                move.b  d1,-BCSTACK_OFFSET_INEFFECTIVEATTACK(a2)
                bsr.w   DetermineTargetsByAction
                bsr.w   InitSkirmishProperties
                bsr.w   CheckForTaros
                bsr.w   InitSkirmishDisplayedCombatants
                tst.b   -BCSTACK_OFFSET_INACTION_CURSE(a2)
                beq.s   loc_9C5A
                displayMessage #MESSAGE_BATTLE_IS_CURSED_AND_STUNNED,(a4),#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                bra.w   loc_9DC4
loc_9C5A:
                
                tst.b   -BCSTACK_OFFSET_INACTION_STUN(a2)
                beq.s   loc_9C7E
                displayMessage #MESSAGE_BATTLE_IS_STUNNED_AND_CANNOT_MOVE,(a4),#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                bra.w   loc_9DC4
loc_9C7E:
                
                bsr.w   CreateBattleSceneText
                bsr.w   CreateBattleSceneAnimation
                tst.b   -BCSTACK_OFFSET_SILENCED(a2)
                beq.s   loc_9CAA
                displayMessage #MESSAGE_BATTLE_SILENCED,(a4),#0,#0 ; Message, Combatant, Item or Spell, Number
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
                move.w  #BATTLEACTION_ATTACKTYPE_SECOND,((BATTLESCENE_ATTACK_TYPE-$1000000)).w
                moveq   #0,d1
                move.b  d1,-5(a2)
                move.b  d1,-3(a2)
                move.b  d1,-2(a2)
                move.b  d1,-1(a2)
                move.b  d1,-4(a2)
                move.b  d1,-$F(a2)
                makeActorIdleAndEndAnimation
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
                move.w  #BATTLEACTION_ATTACKTYPE_COUNTER,((BATTLESCENE_ATTACK_TYPE-$1000000)).w
                moveq   #0,d1
                move.b  d1,-BCSTACK_OFFSET_DODGE(a2)
                move.b  d1,-BCSTACK_OFFSET_CRIT(a2)
                move.b  d1,-BCSTACK_OFFSET_INFLICTAILMENT(a2)
                move.b  d1,-BCSTACK_OFFSET_CUTOFF(a2)
                move.b  d1,-BCSTACK_OFFSET_TARGETDIES(a2)
                move.b  d1,-BCSTACK_OFFSET_FORCEDCRIT(a2)
                move.b  d1,-BCSTACK_OFFSET_INEFFECTIVEATTACK(a2)
                makeActorIdleAndEndAnimation
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
                move.w  #BATTLEACTION_BURST_ROCK,(a3)
                move.b  -BCSTACK_OFFSET_EXPLODECHAR(a2),(a4)
                makeActorIdleAndEndAnimation
                bsr.w   DetermineTargetsByAction
                bra.w   loc_9C7E
loc_9DC4:
                
                move.b  ((BATTLESCENE_ATTACKER_COPY-$1000000)).w,((BATTLESCENE_ATTACKER-$1000000)).w
                bsr.w   sub_A34E
                unlk    a2
                movem.l (sp)+,d0-a6
                rts

    ; End of function WriteSkirmishScript


; =============== S U B R O U T I N E =======================================

; In: A3 = action data

DetermineTargetsByAction:
                
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.s   @CheckCastSpell
                move.w  #1,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
                move.b  BATTLEACTION_OFFSET_3(a3),((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w
                bra.s   @Done
@CheckCastSpell:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   @CheckUseItem
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                move.w  BATTLEACTION_OFFSET_4(a3),d0
                jsr     CreateTargetGridFromSpell
                bra.s   @Done
@CheckUseItem:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.w   @CheckBurstRock
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                move.w  BATTLEACTION_OFFSET_4(a3),d0
                jsr     CreateTargetGridFromUsedItem
                bra.s   @Done
@CheckBurstRock:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.w   @CheckNoAction
                move.b  (a4),d0
                move.w  #SPELL_B_ROCK,d1
                jsr     CreateTargetGridFromSpell
                bra.s   @Done
@CheckNoAction:
                
                cmpi.w  #BATTLEACTION_NOTHING,(a3)
                bne.w   @CheckPrismLaser
                move.w  #0,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
                bra.s   @Done
@CheckPrismLaser:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.w   @Done
                jsr     MakeTargetListEverybody
                move.b  #$FF,((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w
                move.b  (a4),d0
                jsr     sub_1AC05C      
@Done:
                
                bsr.w   SortTargets
                rts

    ; End of function DetermineTargetsByAction


; =============== S U B R O U T I N E =======================================

; In: A2 = battle scene stack
;     A3 = pointer to action type in RAM
;     A4 = pointer to actor index in RAM
;     A5 = pointer to target index in RAM

InitSkirmishDisplayedCombatants:
                
                move.b  #$FF,d3
                move.b  #$FF,d4
                move.b  (a4),d0
                move.b  (a5),d1
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyActor
                move.b  d0,d3
                btst    #COMBATANT_BIT_ENEMY,d1
                beq.s   @AllyTarget
                tst.b   -BCSTACK_OFFSET_RANGED(a2)
                bne.s   @AllyTarget
                move.b  d1,d4
@AllyTarget:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.s   @Continue
                move.b  #$FF,d4
@Continue:
                
                bra.s   @LoadDisplayedCombatantIndexes
@EnemyActor:
                
                move.b  d0,d4
                btst    #COMBATANT_BIT_ENEMY,d1
                bne.s   @CheckForBurstRockAction
                tst.b   -BCSTACK_OFFSET_RANGED(a2)
                bne.s   @CheckForBurstRockAction
                move.b  d1,d3
@CheckForBurstRockAction:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.s   @CheckForPrismLaserAction
                move.b  #$FF,d3
@CheckForPrismLaserAction:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.s   @LoadDisplayedCombatantIndexes
                move.b  #$FF,d3
@LoadDisplayedCombatantIndexes:
                
                move.b  d3,((SKIRMISH_FIRST_ALLY-$1000000)).w
                move.b  d3,((SKIRMISH_LAST_ALLY-$1000000)).w
                move.b  d4,((SKIRMISH_FIRST_ENEMY-$1000000)).w
                move.b  d4,((SKIRMISH_LAST_ENEMY-$1000000)).w
                rts

    ; End of function InitSkirmishDisplayedCombatants


; =============== S U B R O U T I N E =======================================

CheckForTaros:
                
                movem.l d0-d1,-(sp)
                cmpi.b  #BATTLE_VERSUS_TAROS,((CURRENT_BATTLE-$1000000)).w
                bne.w   loc_9F22
                clrFlg  $70             ; Currently attacking Taros with Achilles Sword
                tst.b   (a4)
                bne.w   loc_9F08
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.w   loc_9F08
                move.b  (a5),d0
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_TAROS,d1
                bne.w   loc_9F08
                move.b  (a4),d0
                jsr     GetEquippedWeapon
                cmpi.w  #ITEM_ACHILLES_SWORD,d1
                bne.w   loc_9F08
                setFlg  $70             ; Currently attacking Taros with Achilles Sword
loc_9F08:
                
                move.b  (a5),d0
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_TAROS,d1
                bne.s   loc_9F22
                chkFlg  $70             ; Currently attacking Taros with Achilles Sword
                bne.s   loc_9F22
                move.b  #$FF,-BCSTACK_OFFSET_INEFFECTIVEATTACK(a2)
loc_9F22:
                
                movem.l (sp)+,d0-d1
                rts

    ; End of function CheckForTaros


; =============== S U B R O U T I N E =======================================

; In: A2 = battle scene stack
;     A3 = address in RAM of scene action type
;     A4 = address in RAM of attacker index
;     A5 = address in RAM of target index

InitSkirmishProperties:
                
                movem.l d0-d3/a0,-(sp)
                lea     -BCSTACK_OFFSET_18(a2),a0
                move.w  #COMBATANT_ALLIES_START,d0
                bra.s   @CreateListOfAlliesCurrentHP
@CreateListOfAlliesCurrentHP_Loop:
                
                addq.w  #1,d0
@CreateListOfAlliesCurrentHP:
                
                cmpi.w  #COMBATANT_ALLIES_END,d0
                bgt.s   @Break1
                jsr     GetCurrentHP
                move.w  d1,-(a0)
                bra.s   @CreateListOfAlliesCurrentHP_Loop
@Break1:
                
                move.w  #COMBATANT_ENEMIES_START,d0
                bra.s   @CreateListOfEnemiesCurrentHP
@CreateListOfEnemiesCurrentHP_Loop:
                
                addq.w  #1,d0
@CreateListOfEnemiesCurrentHP:
                
                cmpi.w  #COMBATANT_ENEMIES_END,d0
                bgt.s   @Break2
                jsr     GetCurrentHP
                move.w  d1,-(a0)
                bra.s   @CreateListOfEnemiesCurrentHP_Loop
@Break2:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                beq.w   @CheckAttack
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                beq.w   @CheckAttack
                move.b  (a4),d0
                jsr     GetStatus
                andi.w  #STATUSEFFECTS_MASK_MUDDLE2,d1
                beq.s   @CheckSameSide
                move.b  #$FF,-BCSTACK_OFFSET_MUDDLED(a2)
                bra.s   @CheckAttack
@CheckSameSide:
                
                move.b  (a5),d1
                eor.b   d1,d0
                spl     -BCSTACK_OFFSET_SAMESIDE(a2)
@CheckAttack:
                
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.s   @CheckCastSpell
                move.b  (a4),d0
                move.b  (a5),d1
                jsr     GetDistanceBetweenEntities
                cmpi.w  #2,d2           ; check if block distance between attacker and target is >= 2
                bcs.s   @CheckInactionCurse
                tst.b   -BCSTACK_OFFSET_MUDDLED(a2)
                bne.s   @CheckInactionCurse
                move.b  #$FF,-BCSTACK_OFFSET_RANGED(a2)
@CheckInactionCurse:
                
                move.b  (a4),d0
                jsr     GetStatus
                andi.w  #STATUSEFFECTS_MASK_CURSE,d1
                beq.s   @CheckInactionStun
                moveq   #INACTION_CHANCE_CURSE,d0
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                seq     -BCSTACK_OFFSET_INACTION_CURSE(a2)
@CheckInactionStun:
                
                move.b  (a4),d0
                jsr     GetStatus
                andi.w  #STATUSEFFECTS_MASK_STUN,d1
                beq.s   @Skip1
                moveq   #INACTION_CHANCE_STUN,d0
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                seq     -BCSTACK_OFFSET_INACTION_STUN(a2)
@Skip1:
                
                bra.s   @Done
@CheckCastSpell:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   @CheckUseItem
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d0
                andi.w  #SPELLENTRY_MASK_INDEX,d0
                move.w  d0,((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d0
                lsr.b   #SPELLENTRY_OFFSET_LV,d0
                andi.w  #SPELLENTRY_UPPERMASK_LV,d0
                move.w  d0,((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d1
                jsr     j_GetSpellDefAddress
                btst    #SPELLPROPS_BIT_AFFECTEDBYSILENCE,SPELLDEF_OFFSET_PROPS(a0)
                beq.s   @Skip2
                move.b  (a4),d0
                jsr     GetStatus
                andi.w  #STATUSEFFECTS_MASK_SILENCE,d1
                sne     -BCSTACK_OFFSET_SILENCED(a2)
@Skip2:
                
                bra.s   @Done
@CheckUseItem:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.s   @CheckBurstRock
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),((CURRENT_BATTLE_ITEM-$1000000)).w
                bra.w   @Done
@CheckBurstRock:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.s   @CheckNoAction
                bra.w   @Done
@CheckNoAction:
                
                cmpi.w  #BATTLEACTION_NOTHING,(a3)
                bne.s   @CheckPrismLaser
                bra.w   @Done
@CheckPrismLaser:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.w   *+4
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function InitSkirmishProperties


; =============== S U B R O U T I N E =======================================

; Load proper battle scene text script depending on attack action
; 
; In: A3 = RAM index containing action type
;     A4 = RAM index containing attacker index
; 
; <HARDCODED> enemy and text indexes

CreateBattleSceneText:
                
                movem.l d0-d3/a0,-(sp)
                move.b  (a4),d0
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.s   @CheckCastSpell ; HARDCODED attack lines
                move.w  ((BATTLESCENE_ATTACK_TYPE-$1000000)).w,d2
                move.w  #MESSAGE_BATTLE_ATTACK,d1 ; {NAME}'s attack!
                tst.w   d2
                beq.w   @BattleMessage_Attack
                move.w  #MESSAGE_BATTLE_SECOND_ATTACK,d1 ; {NAME}'s second{N}attack!
                cmpi.w  #BATTLEACTION_ATTACKTYPE_SECOND,d2
                beq.w   @BattleMessage_Attack
                move.w  #MESSAGE_BATTLE_COUNTER_ATTACK,d1 ; {NAME}'s counter{N}attack!
@BattleMessage_Attack:
                
                displayMessage d1,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                bra.w   @Done
@CheckCastSpell:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.w   @CheckUseItem   ; HARDCODED spell text indexes !
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d2
                move.w  #MESSAGE_BATTLE_PUT_ON_A_DEMON_SMILE,d1 ; {NAME} put on{N}a demon's smile.
                cmpi.w  #SPELL_SPOIT,d2
                beq.w   @BattleMessage_CastSpell
                move.w  #MESSAGE_BATTLE_BELCHED_OUT_FLAMES,d1 ; {NAME} belched{N}out flames!
                cmpi.w  #SPELL_FLAME,d2
                beq.w   @BattleMessage_CastSpell
                cmpi.w  #SPELL_KIWI,d2
                beq.w   @BattleMessage_CastSpell
                move.w  #MESSAGE_BATTLE_BLEW_OUT_A_SNOWSTORM,d1 ; {NAME} blew out{N}a snowstorm!
                cmpi.w  #SPELL_SNOW,d2
                beq.w   @BattleMessage_CastSpell
                move.w  #MESSAGE_BATTLE_CAST_DEMON_BREATH,d1 ; {NAME} cast{N}demon breath!
                cmpi.w  #SPELL_DEMON,d2
                beq.w   @BattleMessage_CastSpell
                move.w  #MESSAGE_BATTLE_ODD_EYE_BEAM,d1 ; Odd-eye beam!
                cmpi.w  #SPELL_ODDEYE,d2
                beq.w   @BattleMessage_CastSpell
                move.w  #MESSAGE_BATTLE_SUMMONED,d1 ; {NAME} summoned{N}{SPELL}!{D1}
                cmpi.w  #SPELL_DAO,d2
                beq.w   @BattleMessage_CastSpell
                cmpi.w  #SPELL_APOLLO,d2
                beq.w   @BattleMessage_CastSpell
                cmpi.w  #SPELL_NEPTUN,d2
                beq.w   @BattleMessage_CastSpell
                cmpi.w  #SPELL_ATLAS,d2
                beq.w   @BattleMessage_CastSpell
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d2
                move.w  #MESSAGE_BATTLE_BLEW_OUT_AQUA_BREATH,d1 ; {NAME} blew out{N}aqua-breath!
                cmpi.w  #SPELL_AQUA,d2
                beq.w   @BattleMessage_CastSpell
                move.w  #MESSAGE_BATTLE_BLEW_OUT_BUBBLE_BREATH,d1 ; {NAME} blew out{N}bubble-breath!
                cmpi.w  #SPELL_AQUA|SPELL_LV2,d2
                beq.w   @BattleMessage_CastSpell
                move.w  #MESSAGE_BATTLE_CAST_SPELL,d1 ; {NAME} cast{N}{SPELL} level {#}!
@BattleMessage_CastSpell:
                
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d2
                move.w  ((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w,d3
                addq.w  #1,d3
                displayMessage d1,d0,d2,d3 ; Message, Combatant, Item or Spell, Number
                bra.w   @Done
@CheckUseItem:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.w   @CheckBurstRock
                move.w  ((CURRENT_BATTLE_ITEM-$1000000)).w,d2
                displayMessage #MESSAGE_BATTLE_USED_ITEM,d0,d2,#0 ; Message, Combatant, Item or Spell, Number
                bra.w   @Done
@CheckBurstRock:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.w   @CheckMuddled
                displayMessage #MESSAGE_BATTLE_EXPLODED,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                bra.s   @Done
@CheckMuddled:
                
                cmpi.w  #BATTLEACTION_NOTHING,(a3)
                bne.w   @CheckPrismLaser
                move.w  d0,d2           ; random MUDDLE lines
                move.w  #MESSAGE_BATTLE_MUDDLED_ACTIONS_START,d1 ; HARDCODED Muddle line start index
                moveq   #$10,d0
                jsr     (GetRandomOrDebugValue).w
                cmpi.w  #9,d0           ; HARDCODED number of available Muddle lines
                bls.s   @BattleMessage_Muddled
                clr.w   d0
@BattleMessage_Muddled:
                
                add.w   d0,d1
                move.w  d2,d0
                displayMessage d1,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                bra.s   @Done
@CheckPrismLaser:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.s   @Done
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_ZEON_GUARD,d1
                bne.s   @PrismFlower    
                move.w  #MESSAGE_BATTLE_DEMON_LASER,d1 ; 0141=Demon laser!
                bra.s   @BattleMessage_PrismLaser
@PrismFlower:
                
                move.w  #MESSAGE_BATTLE_PRISM_LASER,d1 ; 013F=Prism laser!
@BattleMessage_PrismLaser:
                
                displayMessage d1,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function CreateBattleSceneText


; =============== S U B R O U T I N E =======================================

; Load proper battle scene sprite/magic animation properties
; 
;       In: A3 = pointer to action data in RAM
;           A4 = battle scene attacker index in RAM

CreateBattleSceneAnimation:
                
                movem.l d0-d3/a0,-(sp)
                move.b  (a4),d0
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   @CheckMuddled
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                jsr     GetSpellCost    
                move.w  d1,d2
                neg.w   d2
                jsr     GetStatus
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,d2,d1,#0 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @CheckMuddled
@EnemyReaction:
                
                executeEnemyReaction #0,d2,d1,#0 ; HP change (signed), MP change (signed), Status Effects, Flags
@CheckMuddled:
                
                cmpi.w  #BATTLEACTION_NOTHING,(a3)
                beq.w   @Skip           ; skip if action type is "muddled"
                bscHideTextBox
                bsr.w   GetSpellAnimation
                moveq   #BATTLEANIMATION_ATTACK,d5
                tst.w   (a3)
                bne.s   @CheckCastSpell
                move.b  (a4),d0
                jsr     GetClass        
                moveq   #ALLYBATTLEANIMATION_SPECIAL_MMNK,d5
                cmpi.w  #CLASS_MMNK,d1  ; MMNK
                beq.w   @DetermineSpecialAnimation
                moveq   #ALLYBATTLEANIMATION_SPECIAL_RBT,d5
                cmpi.w  #CLASS_RBT,d1   ; RBT
                beq.w   @DetermineSpecialAnimation
                moveq   #ALLYBATTLEANIMATION_SPECIAL_BRGN,d5
                cmpi.w  #CLASS_BRGN,d1  ; BRGN
                bne.s   @RegularAttackAnimation
                jsr     GetEquippedWeapon
                cmpi.w  #$FFFF,d1
                bne.s   @RegularAttackAnimation
                moveq   #ALLYBATTLEANIMATION_SPECIAL_BRGN,d5
                moveq   #0,d4
                beq.w   @AnimateSprite
@RegularAttackAnimation:
                
                moveq   #BATTLEANIMATION_ATTACK,d5
                bra.w   @AnimateSprite
@DetermineSpecialAnimation:
                
                moveq   #CHANCE_TO_PERFORM_SPECIAL_ATTACK,d0 ; 1/16 chance to perform special MMNK or RBT attack animation (which also forces a critical hit)
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   @RegularAttackAnimation_0
                move.b  #$FF,-BCSTACK_OFFSET_FORCEDCRIT(a2)
                bra.w   @AnimateSprite
@RegularAttackAnimation_0:
                
                moveq   #BATTLEANIMATION_ATTACK,d5
                bra.w   @AnimateSprite
@CheckCastSpell:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   @CheckUseItem
                move.b  (a4),d0
                jsr     GetClass        
                moveq   #ALLYBATTLEANIMATION_SPECIAL_MNST,d5
                cmpi.w  #CLASS_MNST,d1  ; MNST
                beq.w   @AnimateSprite
                jsr     GetEnemyIndex   
                moveq   #ENEMYBATTLEANIMATION_SPECIAL_HELL_HOUND,d5
                cmpi.w  #ENEMY_HELL_HOUND,d1 ; HARDCODED enemy indexes
                beq.w   @AnimateSprite
                cmpi.w  #ENEMY_CERBERUS,d1
                beq.w   @AnimateSprite
                moveq   #ENEMYBATTLEANIMATION_SPECIAL_DEVIL_GRIFFIN,d5
                cmpi.w  #ENEMY_DEVIL_GRIFFIN,d1
                beq.w   @AnimateSprite
                moveq   #ENEMYBATTLEANIMATION_SPECIAL_ODD_EYE,d5
                cmpi.w  #ENEMY_ODD_EYE,d1
                beq.w   @AnimateSprite
                moveq   #BATTLEANIMATION_ATTACK,d5
@CheckUseItem:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.s   @AnimateSprite
                moveq   #BATTLEANIMATION_USE_ITEM,d5
@AnimateSprite:
                
                bsr.w   WriteSkirmishScript_AnimateSprite
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.s   @Skip           ; skip if action type is NOT "burst rock"
                move.w  #$8000,d2
                jsr     GetStatus
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction_BurstRock
                executeAllyReaction d2,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BurstRockSelfDestruction
@EnemyReaction_BurstRock:
                
                executeEnemyReaction d2,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@BurstRockSelfDestruction:
                
                moveq   #0,d1           ; Burst Rock is killed when it explodes
                jsr     SetCurrentHP
@Skip:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function CreateBattleSceneAnimation


; =============== S U B R O U T I N E =======================================

sub_A34E:
                
                movem.l d0-d3/a0,-(sp)
                endAnimation
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
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_A396
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_A3B2
                bra.s   loc_A3AE
loc_A396:
                
                cmpi.w  #BATTLEACTION_ATTACKTYPE_COUNTER,((BATTLESCENE_ATTACK_TYPE-$1000000)).w
                bne.w   loc_A3B2
                move.b  (a5),d0
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_A3B2
loc_A3AE:
                
                bsr.w   WriteSkirmishScript_EXPandGold
loc_A3B2:
                
                lea     -$18(a2),a0
                move.w  #COMBATANT_ALLIES_START,d0
                bra.s   loc_A3BE
loc_A3BC:
                
                addq.w  #1,d0
loc_A3BE:
                
                cmpi.w  #COMBATANT_ALLIES_END,d0
                bgt.s   loc_A3CE
                move.w  -(a0),d1
                jsr     SetCurrentHP
                bra.s   loc_A3BC
loc_A3CE:
                
                move.w  #COMBATANT_ENEMIES_START,d0
                bra.s   loc_A3D6
loc_A3D4:
                
                addq.w  #1,d0
loc_A3D6:
                
                cmpi.w  #COMBATANT_ENEMIES_END,d0
                bgt.s   byte_A3E6
                move.w  -(a0),d1
                jsr     SetCurrentHP
                bra.s   loc_A3D4
byte_A3E6:
                
                bscHideTextBox
                bscEnd
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function sub_A34E


; =============== S U B R O U T I N E =======================================

; In: A2 = battle scene stack
;     A3 = address in RAM of scene action type
;     A4 = address in RAM of attacker index
;     A5 = address in RAM of target index

WriteSkirmishScript_DoAction:
                
                movem.l d0-d3/a0,-(sp)
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.s   loc_A404
                bsr.w   WriteSkirmishScript_Attack
                bra.s   loc_A458
loc_A404:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   loc_A410
                bsr.w   WriteSkirmishScript_CastSpell
                bra.s   loc_A458
loc_A410:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.s   loc_A41C
                bsr.w   WriteSkirmishScript_UseItem
                bra.s   loc_A458
loc_A41C:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.s   loc_A436
                move.w  #BATTLEACTION_BURST_ROCK_POWER,d6
                bsr.w   WriteSkirmishScript_InflictDamage
                tst.b   -BCSTACK_OFFSET_TARGETDIES(a2)
                beq.s   loc_A434
                bsr.w   WriteSkirmishScript_DeathMessage
loc_A434:
                
                bra.s   loc_A458
loc_A436:
                
                cmpi.w  #BATTLEACTION_NOTHING,(a3)
                bne.w   loc_A440
                bra.s   loc_A458
loc_A440:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.s   loc_A458
                move.w  #BATTLEACTION_PRISM_LASER_POWER,d6
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
                tst.b   -BCSTACK_OFFSET_COUNTER(a2)
                beq.w   @ClearCounter
                tst.b   -BCSTACK_OFFSET_TARGETDIES(a2)
                bne.w   @ClearCounter
                tst.b   -BCSTACK_OFFSET_MUDDLED(a2)
                bne.w   @ClearCounter
                tst.b   -BCSTACK_OFFSET_SAMESIDE(a2)
                bne.w   @ClearCounter
                move.b  (a4),d0
                jsr     j_GetStatus
                andi.w  #STATUSEFFECTS_MASK_SLEEP,d1
                bne.w   @ClearCounter
                jsr     j_GetStatus
                andi.w  #STATUSEFFECTS_MASK_STUN,d1
                bne.w   @ClearCounter
                move.b  (a5),d0
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_TAROS,d1
                beq.w   @ClearCounter
                move.b  (a4),d0
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_BURST_ROCK,d1
                beq.w   @ClearCounter
                cmpi.w  #ENEMY_KRAKEN_HEAD,d1
                beq.w   @ClearCounter
                cmpi.w  #ENEMY_PRISM_FLOWER,d1
                beq.w   @ClearCounter
                cmpi.w  #ENEMY_ZEON_GUARD,d1
                beq.w   @ClearCounter
                move.b  (a4),d0
                move.b  (a5),d1
                jsr     GetDistanceBetweenEntities
                move.b  (a4),d0
                jsr     GetWeaponRange  
                cmp.b   d3,d2
                bhi.w   @ClearCounter
                cmp.b   d4,d2
                bcs.w   @ClearCounter
                bra.w   @CheckDebugCounter
@ClearCounter:
                
                clr.b   -BCSTACK_OFFSET_COUNTER(a2)
@CheckDebugCounter:
                
                tst.b   -BCSTACK_OFFSET_DEBUGCOUNTER(a2)
                beq.s   @Done
                move.b  #$FF,-BCSTACK_OFFSET_COUNTER(a2)
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function FinalCounterAttackCheck


; =============== S U B R O U T I N E =======================================

; In: A2 = cutscene stack
;     A3 = battle action in RAM
;     A4 = battle scene attacker index in RAM
; 
; Out: D4 = spell animation index
; 
; <HARDCODED> class, enemy and weapon indexes

GetSpellAnimation:
                
                movem.l d0-d3/a0,-(sp)
                moveq   #SPELLANIMATION_NONE,d4 ; no effect graphics by default
                move.b  (a4),d0
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.w   @CheckCastSpell
                tst.b   -BCSTACK_OFFSET_RANGED(a2)
                beq.w   @Next           ; move on to next step if not a ranged attack
                moveq   #SPELLANIMATION_BRGN_ATTACK,d4 ; otherwise, check if we should perform the BRGN attack animation
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @CheckDarkGunner ; if attacker is an enemy, check if Dark Gunner
                jsr     GetClass        
                cmpi.b  #CLASS_BRGN,d1
                beq.w   @Next           ; move on to next step if ally attacker is BRGN class
                bra.s   @CheckAllyWeapon ; otherwise, check ally's equipped weapon
@CheckDarkGunner:
                
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_DARK_GUNNER,d1
                beq.w   @Next           ; move on to next step if enemy attacker is Dark Gunner
@CheckAllyWeapon:
                
                jsr     GetEquippedWeapon
                moveq   #SPELLANIMATION_PROJECTILE_ATTACK,d4
                cmpi.w  #ITEM_WOODEN_ARROW,d1
                beq.w   @Next           
                cmpi.w  #ITEM_IRON_ARROW,d1
                beq.w   @Next           
                cmpi.w  #ITEM_STEEL_ARROW,d1
                beq.w   @Next           
                moveq   #SPELLANIMATION_PROJECTILE_ATTACK|SPELLANIMATION_VARIATION2,d4
                cmpi.w  #ITEM_ROBIN_ARROW,d1
                beq.w   @Next           
                cmpi.w  #ITEM_ASSAULT_SHELL,d1
                beq.w   @Next           
                moveq   #SPELLANIMATION_CANNON_ATTACK,d4
                cmpi.w  #ITEM_NAZCA_CANNON,d1
                beq.w   @Next           
                cmpi.w  #ITEM_HYPER_CANNON,d1
                beq.w   @Next           
                cmpi.w  #ITEM_GRAND_CANNON,d1
                beq.w   @Next           
                moveq   #SPELLANIMATION_SHOT_ATTACK,d4
                cmpi.w  #ITEM_GREAT_SHOT,d1
                beq.w   @Next           
                cmpi.w  #ITEM_BUSTER_SHOT,d1
                beq.w   @Next           
                cmpi.w  #ITEM_EVIL_SHOT,d1
                beq.w   @Next           
                move.w  #SPELLANIMATION_PROJECTILE_ATTACK|SPELLANIMATION_VARIATION3,d4
                cmpi.w  #ITEM_SHORT_SPEAR,d1
                beq.w   @Next           
                cmpi.w  #ITEM_BRONZE_LANCE,d1
                beq.w   @Next           
                cmpi.w  #ITEM_SPEAR,d1
                beq.w   @Next           
                cmpi.w  #ITEM_STEEL_LANCE,d1
                beq.w   @Next           
                cmpi.w  #ITEM_POWER_SPEAR,d1
                beq.w   @Next           
                cmpi.w  #ITEM_HEAVY_LANCE,d1
                beq.w   @Next           
                cmpi.w  #ITEM_JAVELIN,d1
                beq.w   @Next           
                cmpi.w  #ITEM_CHROME_LANCE,d1
                beq.w   @Next           
                cmpi.w  #ITEM_VALKYRIE,d1
                beq.w   @Next           
                cmpi.w  #ITEM_HOLY_LANCE,d1
                beq.w   @Next           
                cmpi.w  #ITEM_MIST_JAVELIN,d1
                beq.w   @Next           
                cmpi.w  #ITEM_HALBERD,d1
                beq.w   @Next           
                cmpi.w  #ITEM_EVIL_LANCE,d1
                beq.w   @Next           
                moveq   #SPELLANIMATION_NONE,d4
@Next:
                
                bra.s   @CheckMirrored  ; check if effect should originate from enemy
@CheckCastSpell:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   @CheckUseItem
                tst.b   -BCSTACK_OFFSET_SILENCED(a2) ; check if caster is silenced
                bne.s   @Silenced
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                jsr     GetSpellDefAddress
                clr.w   d4
                move.b  SPELLDEF_OFFSET_GRAPHICS(a0),d4
@Silenced:
                
                bra.s   @CheckMirrored
@CheckUseItem:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.w   @CheckBurstRock
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                jsr     GetItemType     
                tst.b   d2
                beq.w   @Next_0         ; move on to next step if used item is neither a weapon or a ring
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                cmpi.b  #$FF,d1
                beq.w   @Next_0         ; move on to next step if used item has no use effect
                jsr     GetSpellDefAddress
                move.b  SPELLDEF_OFFSET_GRAPHICS(a0),d4
@Next_0:
                
                bra.s   @CheckMirrored
@CheckBurstRock:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.w   @CheckMuddled
                moveq   #SPELLANIMATION_BURST_ROCK_EXPLOSION,d4
                bra.s   @CheckMirrored
@CheckMuddled:
                
                cmpi.w  #BATTLEACTION_NOTHING,(a3)
                bne.w   @CheckPrismLaser
                moveq   #SPELLANIMATION_NONE,d4
                bra.s   @CheckMirrored
@CheckPrismLaser:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.w   @CheckMirrored
                moveq   #SPELLANIMATION_PRISM_LASER,d4
@CheckMirrored:
                
                btst    #COMBATANT_BIT_ENEMY,(a4)
                beq.s   @Done
                bset    #SPELLANIMATION_BIT_MIRRORED,d4
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function GetSpellAnimation


; =============== S U B R O U T I N E =======================================

; Load proper battle scene sprite animation properties
; 
;       In: D4 = projectile
;           D5 = special script index

WriteSkirmishScript_AnimateSprite:
                
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.s   @Enemy          
                animateAllyAction d5,d4 ; Animation Type, Spell/Item/Projectile
                bra.s   @Return
@Enemy:
                
                animateEnemyAction d5,d4 ; Animation Type, Spell/Item/Projectile
@Return:
                
                rts

    ; End of function WriteSkirmishScript_AnimateSprite


; =============== S U B R O U T I N E =======================================

WriteSkirmishScript_SwitchTargets:
                
                movem.l d0-d1,-(sp)
                move.b  (a5),d0
                jsr     GetCurrentHP
                tst.w   d1
                beq.w   loc_A7CA
                bscHideTextBox
                move.w  d6,d1
                tst.b   -BCSTACK_OFFSET_SAMESIDE(a2)
                bne.w   loc_A72C
                tst.b   -BCSTACK_OFFSET_MUDDLED(a2)
                bne.w   loc_A72C
                moveq   #0,d1
loc_A72C:
                
                move.b  (a5),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_A780
                cmp.b   ((SKIRMISH_LAST_ALLY-$1000000)).w,d0
                beq.s   loc_A77E
                move.b  d0,((SKIRMISH_LAST_ALLY-$1000000)).w
                tst.b   -BCSTACK_OFFSET_RANGED(a2)
                bne.w   byte_A772       
                cmpi.b  #$FF,((SKIRMISH_LAST_ENEMY-$1000000)).w
                beq.s   byte_A75E       
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                beq.w   byte_A772       
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                beq.w   byte_A772       
byte_A75E:
                
                bscWait #$1E            ; Duration (in frames)
                switchAllies d0,d1      ; Combatant, Direction (0 = Right, 1 = Left)
                bra.w   loc_A7CA
byte_A772:
                
                switchToAllyAlone d0    ; Combatant
                move.b  #$FF,((SKIRMISH_LAST_ENEMY-$1000000)).w
loc_A77E:
                
                bra.s   loc_A7CA
loc_A780:
                
                cmp.b   ((SKIRMISH_LAST_ENEMY-$1000000)).w,d0
                beq.s   loc_A7CA
                move.b  d0,((SKIRMISH_LAST_ENEMY-$1000000)).w
                tst.b   -BCSTACK_OFFSET_RANGED(a2)
                bne.w   byte_A7BE       
                cmpi.b  #$FF,((SKIRMISH_LAST_ALLY-$1000000)).w
                beq.s   byte_A7AA       
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                beq.w   byte_A7BE       
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                beq.w   byte_A7BE       
byte_A7AA:
                
                bscWait #$1E            ; Duration (in frames)
                switchEnemies d0,d1     ; Combatant, Direction (0 = Right, 1 = Left)
                bra.w   loc_A7CA
byte_A7BE:
                
                switchToEnemyAlone d0   ; Combatant
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
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.s   byte_A7EE
                makeAllyIdle
                bra.s   loc_A7F2
byte_A7EE:
                
                makeEnemyIdle
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
                bgt.s   byte_A840
                moveq   #1,d1
byte_A840:
                
                giveEXP d1
loc_A846:
                
                move.w  ((BATTLESCENE_GOLD-$1000000)).w,d1
                tst.w   d1
                beq.s   loc_A86A
                displayMessage #MESSAGE_BATTLE_FOUND_GOLD_COINS,#0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
                jsr     IncreaseGold
loc_A86A:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function WriteSkirmishScript_EXPandGold

HalvedEXPEarnedBattles:
                dc.b BATTLE_INSIDE_ANCIENT_TOWER
                dc.b CODE_TERMINATOR_BYTE

; =============== S U B R O U T I N E =======================================

CalculateHealingEXP:
                
                movem.l d0-d3/a0,-(sp)
                move.b  (a4),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.w   @Skip           ; skip if enemy
                
                ; Check if healer class
                jsr     GetClass        
                cmpi.b  #CLASS_PRST,d1  ; HARDCODED healer class indexes
                beq.w   @Continue
                cmpi.b  #CLASS_VICR,d1
                beq.w   @Continue
                cmpi.b  #CLASS_MMNK,d1
                beq.w   @Continue
                bra.w   @Skip           ; skip if not a healer class
@Continue:
                
                move.b  (a5),d0
                jsr     GetMaxHP
                tst.w   d1
                beq.w   @Skip           ; safety measure to prevent division by 0
                move.w  #25,d5
                mulu.w  d6,d5
                divu.w  d1,d5
                cmpi.w  #10,d5
                bcc.s   @GiveEXP
                moveq   #10,d5
@GiveEXP:
                
                bsr.w   GiveEXPandHealingCap
@Skip:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function CalculateHealingEXP


; =============== S U B R O U T I N E =======================================

CalculateDamageEXP:
                
                movem.l d0-d3/a0,-(sp)
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   @Skip           ; skip function if actor is an enemy
                move.b  (a5),d0
                jsr     GetMaxHP
                tst.w   d1
                beq.w   @Skip           ; skip function to prevent division by zero error
                bsr.w   GetAmountOfEXPforEncounter
                mulu.w  d6,d5
                divu.w  d1,d5
                bsr.w   GiveEXPandCap
@Skip:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function CalculateDamageEXP


; =============== S U B R O U T I N E =======================================

GiveStatusEffectSpellsEXP:
                
                movem.l d0-d3/a0,-(sp)
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   @Done
                moveq   #STATUSEFFECT_SPELLS_EXP,d5
                bsr.w   GiveEXPandCap
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function GiveStatusEffectSpellsEXP


; =============== S U B R O U T I N E =======================================

GiveEXPandGoldForKill:
                
                movem.l d0-d3/a0,-(sp)
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   loc_A93A
                bsr.w   GetAmountOfEXPforEncounter
                bsr.w   GiveEXPandCap
                move.b  (a5),d0
                bpl.s   loc_A93A
loc_A926:
                
                jsr     GetEnemyIndex   
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

; Get amount of EXP gained from encounter based on attacker level and target level
; 
; In: A4 = address of attacker byte in RAM
;     A5 = address of target byte in RAM
; 
; Out: D5 = amount of EXP

GetAmountOfEXPforEncounter:
                
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

    ; End of function GetAmountOfEXPforEncounter


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
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_BURST_ROCK,d1
                bne.s   loc_A9F8
                ori.b   #COMBATANT_MASK_SORT_BIT,d0
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
                
                btst    #COMBATANT_BIT_SORT,(a0,d6.w)
                beq.s   loc_AA78
                move.b  (a0,d6.w),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_ENEMY_BIT,d0
                jsr     GetCurrentHP
                move.w  d1,d2
                move.b  1(a0,d6.w),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_ENEMY_BIT,d0
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
                
                andi.b  #COMBATANT_MASK_INDEX_AND_ENEMY_BIT,(a0,d7.w)
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

; In: A4 = pointer to attacker index in RAM
;     A5 = pointer to target index in RAM

WriteSkirmishScript_DodgeAttack:
                
                move.b  (a5),d0
                jsr     j_GetStatus
                andi.w  #STATUSEFFECTS_MASK_SLEEP,d1
                bne.w   @Return
                jsr     j_GetStatus
                andi.w  #STATUSEFFECTS_MASK_STUN,d1
                bne.w   @Return
                moveq   #CHANCE_TO_DODGE_MUDDLED_ATTACKER,d2 ; 1/2 chance to dodge if attacker is muddled
                move.b  (a4),d0
                jsr     GetStatus
                andi.w  #STATUSEFFECTS_MASK_MUDDLE1,d1
                bne.w   @CheckDebugDodge
                moveq   #CHANCE_TO_DODGE_DEFAULT,d2 ; 1/32 chance to miss otherwise ?
                move.b  (a5),d0
                jsr     GetUpperMoveType
                cmpi.w  #MOVETYPE_LOWER_FLYING,d1 ; check if target is either flying or hovering
                beq.w   @CheckIfAttackerIsAnArcher
                cmpi.w  #MOVETYPE_LOWER_HOVERING,d1
                beq.w   @CheckIfAttackerIsAnArcher
                bra.w   @CheckDebugDodge
@CheckIfAttackerIsAnArcher:
                
                move.b  (a4),d0
                jsr     GetUpperMoveType
                cmpi.w  #MOVETYPE_LOWER_BRASS_GUNNER,d1
                beq.w   @CheckDebugDodge
                cmpi.w  #MOVETYPE_LOWER_ARCHER,d1
                beq.w   @CheckDebugDodge
                cmpi.w  #MOVETYPE_LOWER_CENTAUR_ARCHER,d1
                beq.w   @CheckDebugDodge
                cmpi.w  #MOVETYPE_LOWER_STEALTH_ARCHER,d1
                beq.w   @CheckDebugDodge
                moveq   #CHANCE_TO_DODGE_FOR_AIRBORNE_TARGET,d2 ; 1/8 chance to dodge if target is flying or hovering, and if attacker is not an archer
@CheckDebugDodge:
                
                tst.b   -BCSTACK_OFFSET_DEBUGDODGE(a2)
                beq.s   @DetermineDodge
                moveq   #0,d2
@DetermineDodge:
                
                move.w  d2,d0
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.w   @Return
                move.w  #$FFFF,d4
                move.w  #1,d5
                exg     a4,a5
                bsr.w   WriteSkirmishScript_AnimateSprite
                displayMessage #MESSAGE_BATTLE_DODGE,(a4),#0,#0 ; Message, Combatant, Item or Spell, Number
                bsr.w   WriteSkirmishScript_IdleSprite
                exg     a4,a5
                move.b  #$FF,-BCSTACK_OFFSET_DODGE(a2)
@Return:
                
                rts

    ; End of function WriteSkirmishScript_DodgeAttack


; =============== S U B R O U T I N E =======================================

; In: A4 = attacker index in RAM
;     A5 = defender index in RAM
; 
; Out: D6 = damage

CalculateDamage:
                
                move.b  (a4),d0
                jsr     GetCurrentATT
                move.w  d1,d2
                move.b  (a5),d0
                jsr     GetCurrentDEF
                sub.w   d1,d2
                bhi.s   @BaseDamage     
                moveq   #1,d2           ; minimum base damage = 1
@BaseDamage:
                
                move.w  d2,d6           ; D6 = base damage
                
                ; Evaluate land effect's damage reduction
                move.b  (a5),d0
                jsr     GetLandEffectSetting
                move.w  #256,d3         ; if land effect displays "0%", do not reduce damage
                tst.b   d1
                beq.w   @ApplyLandEffectToDamage
                move.w  #230,d3         ; else if land effect displays "15%", reduce damage to 230/256
                cmpi.b  #1,d1
                beq.w   @ApplyLandEffectToDamage
                move.w  #205,d3         ; otherwise, reduce damage to 205/256
@ApplyLandEffectToDamage:
                
                mulu.w  d3,d6
                lsr.w   #8,d6
                
                ; Check if defender is flying or hovering
                move.b  (a5),d0
                jsr     GetUpperMoveType
                cmpi.w  #MOVETYPE_LOWER_FLYING,d1
                beq.w   @CheckIfAttackerIsAnArcher
                cmpi.w  #MOVETYPE_LOWER_HOVERING,d1
                beq.w   @CheckIfAttackerIsAnArcher
                bra.w   @Return
@CheckIfAttackerIsAnArcher:
                
                move.b  (a4),d0
                jsr     GetUpperMoveType
                cmpi.w  #MOVETYPE_LOWER_BRASS_GUNNER,d1
                beq.w   @ApplyArcherDamageBonus
                cmpi.w  #MOVETYPE_LOWER_ARCHER,d1
                beq.w   @ApplyArcherDamageBonus
                cmpi.w  #MOVETYPE_LOWER_CENTAUR_ARCHER,d1
                beq.w   @ApplyArcherDamageBonus
                cmpi.w  #MOVETYPE_LOWER_STEALTH_ARCHER,d1
                beq.w   @ApplyArcherDamageBonus
                bra.w   @Return
@ApplyArcherDamageBonus:
                
                move.w  d6,d0
                lsr.w   #2,d0
                add.w   d0,d6           ; inflict an additional 25% of damage if an archer is attacking a flying or hovering combatant
@Return:
                
                rts

    ; End of function CalculateDamage


; =============== S U B R O U T I N E =======================================

; In: D6 = damage

CalculateCriticalHit:
                
                move.b  (a4),d0
                jsr     GetCurrentProwess
                andi.w  #PROWESS_MASK_CRITICAL,d1
                move.w  d1,d2
                lsl.w   #1,d2
                lea     tbl_CriticalHitSettings(pc,d2.w),a0 ; values regarding critical hit chance and damage
                clr.w   d0
                move.b  (a0),d0
                beq.s   @Return         ; skip function if 0 crit chance
                tst.b   -BCSTACK_OFFSET_FORCEDCRIT(a2)
                beq.s   @CheckDebugCritical
                moveq   #1,d0
@CheckDebugCritical:
                
                tst.b   -BCSTACK_OFFSET_DEBUGCRIT(a2)
                beq.s   @DetermineSuccess
                moveq   #0,d0
@DetermineSuccess:
                
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   @Return
                move.b  CRITICALHITSETTING_OFFSET_DAMAGE_MODIFIER(a0),d0 
                                                        ; success !
                beq.s   @CheckInflictAilment
                move.w  d6,d2
                lsr.w   d0,d2
                add.w   d2,d6
@CheckInflictAilment:
                
                cmpi.w  #PROWESS_INFLICT_AILMENTS_START,d1
                bcc.s   @SetInflictAilment
                move.b  #$FF,-BCSTACK_OFFSET_CRIT(a2)
                move.b  (a4),d0
                jsr     GetEquippedWeapon
                cmpi.w  #ITEM_GISARME,d1
                bne.s   @Skip
                move.b  (a5),d0
                move.w  #SPELL_DESOUL,d1
                bsr.w   GetResistanceToSpell
                cmpi.w  #RESISTANCESETTING_STATUSEFFECT_IMMUNITY,d2
                beq.s   @Skip           ; skip if target is immune to desoul
                move.b  #$FF,-BCSTACK_OFFSET_CUTOFF(a2)
                clr.b   -BCSTACK_OFFSET_CRIT(a2)
@Skip:
                
                bra.s   @Return
@SetInflictAilment:
                
                move.b  #$FF,-BCSTACK_OFFSET_INFLICTAILMENT(a2)
@Return:
                
                rts

    ; End of function CalculateCriticalHit

