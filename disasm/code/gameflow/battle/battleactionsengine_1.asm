
; ASM FILE code\gameflow\battle\battleactionsengine_1.asm :
; 0x9B92..0x9EC4 : Battle actions engine

; =============== S U B R O U T I N E =======================================

; In: D0 = actor index

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttack = -14
doubleAttack = -13
counterAttack = -12
silencedActor = -11
stunInaction = -10
curseInaction = -9
muddledActor = -8
targetIsOnSameSide = -7
rangedAttack = -6
dodge = -5
targetDies = -4
criticalHit = -3
inflictAilment = -2
cutoff = -1

WriteBattlesceneScript:
                
                movem.l d0-a6,-(sp)
                link    a2,#-152
                lea     ((BATTLESCENE_ACTION_TYPE-$1000000)).w,a3
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a4
                lea     ((TARGETS_LIST-$1000000)).w,a5
                lea     (FF0000_RAM_START).l,a6 ; beginning of battlescene command list
                move.b  #0,debugDodge(a2)
                move.b  #0,debugCritical(a2)
                move.b  #0,debugDouble(a2)
                move.b  #0,debugCounter(a2)
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
                move.b  d1,doubleAttack(a2)
                move.b  d1,counterAttack(a2)
                move.b  d1,silencedActor(a2)
                move.b  d1,stunInaction(a2)
                move.b  d1,curseInaction(a2)
                move.b  d1,muddledActor(a2)
                move.b  d1,targetIsOnSameSide(a2)
                move.b  d1,rangedAttack(a2)
                move.b  d1,specialCritical(a2)
                move.b  d1,explode(a2)
                move.b  d1,ineffectiveAttack(a2)
                bsr.w   DetermineTargetsByAction
                bsr.w   InitBattlesceneProperties
                bsr.w   DetermineIneffectiveAttack
                bsr.w   InitBattlesceneDisplayedCombatants
                tst.b   curseInaction(a2)
                beq.s   loc_9C5A
                displayMessage #MESSAGE_BATTLE_IS_CURSED_AND_STUNNED,(a4),#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                bra.w   loc_9DC4
loc_9C5A:
                
                tst.b   stunInaction(a2)
                beq.s   loc_9C7E
                displayMessage #MESSAGE_BATTLE_IS_STUNNED_AND_CANNOT_MOVE,(a4),#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                bra.w   loc_9DC4
loc_9C7E:
                
                bsr.w   CreateBattlesceneMessage
                bsr.w   CreateBattlesceneAnimation
                tst.b   silencedActor(a2)
                beq.s   loc_9CAA
                displayMessage #MESSAGE_BATTLE_SILENCED,(a4),#0,#0 ; Message, Combatant, Item or Spell, Number
                bra.w   loc_9DC4
loc_9CAA:
                
                moveq   #1,d6
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   loc_9DC4
loc_9CB6:
                
                moveq   #0,d1
                move.b  d1,dodge(a2)
                move.b  d1,criticalHit(a2)
                move.b  d1,inflictAilment(a2)
                move.b  d1,cutoff(a2)
                move.b  d1,targetDies(a2)
                bsr.w   WriteBattlesceneScript_SwitchTargets
                bsr.w   WriteBattlesceneScript_DoAction
                bsr.w   WriteBattlesceneScript_EnemyDropItem
                addq.w  #1,a5
                moveq   #2,d6
                dbf     d7,loc_9CB6
                bsr.w   WriteBattlesceneScript_IdleSprite
                bsr.w   WriteBattlesceneScript_BreakUsedItem
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a4
                lea     ((TARGETS_LIST-$1000000)).w,a5
                bsr.w   FinalDoubleAttackCheck
                tst.b   doubleAttack(a2)
                beq.s   loc_9D3E
                move.w  #BATTLEACTION_ATTACKTYPE_SECOND,((BATTLESCENE_ATTACK_TYPE-$1000000)).w
                moveq   #0,d1
                move.b  d1,dodge(a2)
                move.b  d1,criticalHit(a2)
                move.b  d1,inflictAilment(a2)
                move.b  d1,cutoff(a2)
                move.b  d1,targetDies(a2)
                move.b  d1,specialCritical(a2)
                makeActorIdleAndEndAnimation
                exg     a4,a5
                bsr.w   WriteBattlesceneScript_SwitchTargets
                exg     a4,a5
                bsr.w   CreateBattlesceneMessage
                bsr.w   CreateBattlesceneAnimation
                bsr.w   WriteBattlesceneScript_SwitchTargets
                bsr.w   WriteBattlesceneScript_DoAction
                bsr.w   WriteBattlesceneScript_EnemyDropItem
                bsr.w   WriteBattlesceneScript_IdleSprite
loc_9D3E:
                
                lea     ((TARGETS_LIST-$1000000)).w,a4
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a5
                bsr.w   IsAbleToCounterAttack
                tst.b   counterAttack(a2)
                beq.s   loc_9D9C
                move.w  #BATTLEACTION_ATTACKTYPE_COUNTER,((BATTLESCENE_ATTACK_TYPE-$1000000)).w
                moveq   #0,d1
                move.b  d1,dodge(a2)
                move.b  d1,criticalHit(a2)
                move.b  d1,inflictAilment(a2)
                move.b  d1,cutoff(a2)
                move.b  d1,targetDies(a2)
                move.b  d1,specialCritical(a2)
                move.b  d1,ineffectiveAttack(a2)
                makeActorIdleAndEndAnimation
                exg     a4,a5
                bsr.w   WriteBattlesceneScript_SwitchTargets
                exg     a4,a5
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a5
                bsr.w   CreateBattlesceneMessage
                bsr.w   CreateBattlesceneAnimation
                bsr.w   WriteBattlesceneScript_SwitchTargets
                bsr.w   WriteBattlesceneScript_DoAction
                bsr.w   WriteBattlesceneScript_EnemyDropItem
                bsr.w   WriteBattlesceneScript_IdleSprite
loc_9D9C:
                
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a4
                lea     ((TARGETS_LIST-$1000000)).w,a5
                tst.b   explode(a2)
                beq.s   loc_9DC4
                move.b  #0,explode(a2)
                move.w  #BATTLEACTION_BURST_ROCK,(a3)
                move.b  explodingActor(a2),(a4)
                makeActorIdleAndEndAnimation
                bsr.w   DetermineTargetsByAction
                bra.w   loc_9C7E
loc_9DC4:
                
                move.b  ((BATTLESCENE_ATTACKER_COPY-$1000000)).w,((BATTLESCENE_ATTACKER-$1000000)).w
                bsr.w   WriteBattlesceneScript_End
                unlk    a2
                movem.l (sp)+,d0-a6
                rts

    ; End of function WriteBattlesceneScript


; =============== S U B R O U T I N E =======================================

; In: A3 = action data


DetermineTargetsByAction:
                
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.s   @CheckCastSpell
                move.w  #1,((TARGETS_LIST_LENGTH-$1000000)).w
                move.b  BATTLEACTION_OFFSET_3(a3),((TARGETS_LIST-$1000000)).w
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
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                bra.s   @Done
@CheckPrismLaser:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.w   @Done
                jsr     MakeTargetListEverybody
                move.b  #$FF,((TARGETS_LIST-$1000000)).w
                move.b  (a4),d0
                jsr     sub_1AC05C      
@Done:
                
                bsr.w   SortTargets
                rts

    ; End of function DetermineTargetsByAction


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame
;     A3 = pointer to action type in RAM
;     A4 = pointer to actor index in RAM
;     A5 = pointer to target index in RAM

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttack = -14
doubleAttack = -13
counterAttack = -12
silencedActor = -11
stunInaction = -10
curseInaction = -9
muddledActor = -8
targetIsOnSameSide = -7
rangedAttack = -6
dodge = -5
targetDies = -4
criticalHit = -3
inflictAilment = -2
cutoff = -1

InitBattlesceneDisplayedCombatants:
                
                move.b  #$FF,d3
                move.b  #$FF,d4
                move.b  (a4),d0
                move.b  (a5),d1
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyActor
                move.b  d0,d3
                btst    #COMBATANT_BIT_ENEMY,d1
                beq.s   @AllyTarget
                tst.b   rangedAttack(a2)
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
                tst.b   rangedAttack(a2)
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
                
                move.b  d3,((BATTLESCENE_FIRST_ALLY-$1000000)).w
                move.b  d3,((BATTLESCENE_LAST_ALLY-$1000000)).w
                move.b  d4,((BATTLESCENE_FIRST_ENEMY-$1000000)).w
                move.b  d4,((BATTLESCENE_LAST_ENEMY-$1000000)).w
                rts

    ; End of function InitBattlesceneDisplayedCombatants

