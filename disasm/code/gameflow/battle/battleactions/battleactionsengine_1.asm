
; ASM FILE code\gameflow\battle\battleactions\battleactionsengine_1.asm :
; 0x9B92..0x9EC4 : Battleactions Engine, part 1

; =============== S U B R O U T I N E =======================================

; In: d0.w = actor index

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttackToggle = -14
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
                
                module
                movem.l d0-a6,-(sp)
                link    a2,#BATTLESCENE_STACK_NEGSIZE
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a3
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a4
                lea     ((TARGETS_LIST-$1000000)).w,a5
                lea     (FF0000_RAM_START).l,a6 ; beginning of battlescene command list
                move.b  #0,debugDodge(a2)
                move.b  #0,debugCritical(a2)
                move.b  #0,debugDouble(a2)
                move.b  #0,debugCounter(a2)
                tst.b   (DEBUG_MODE_TOGGLE).l
                beq.s   @InitializeBattlesceneData
                
                ; Debug mode
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                beq.s   @loc_1
                bsr.w   DebugModeActionSelect
@loc_1:
                
                btst    #INPUT_BIT_START,((PLAYER_2_INPUT-$1000000)).w
                beq.s   @InitializeBattlesceneData
                bsr.w   DebugModeSelectHits
@InitializeBattlesceneData:
                
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
                move.b  d1,ineffectiveAttackToggle(a2)
                bsr.w   battlesceneScript_DetermineTargetsByAction
                bsr.w   battlesceneScript_InitializeBattlesceneProperties
                bsr.w   battlesceneScript_DetermineIneffectiveAttack
                bsr.w   battlesceneScript_InitializeActors
                tst.b   curseInaction(a2)
                beq.s   @CheckStunInaction
                
                ; Cursed and stunned
                displayMessage #MESSAGE_BATTLE_IS_CURSED_AND_STUNNED,(a4),#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                bra.w   @End
@CheckStunInaction:
                
                tst.b   stunInaction(a2)
                beq.s   @Continue
                
                ; Stunned and cannot move
                displayMessage #MESSAGE_BATTLE_IS_STUNNED_AND_CANNOT_MOVE,(a4),#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                bra.w   @End
@Continue:
                
                bsr.w   battlesceneScript_DisplayMessage
                bsr.w   battlesceneScript_PerformAnimation
                tst.b   silencedActor(a2)
                beq.s   @NotSilenced
                
                ; Silenced
                displayMessage #MESSAGE_BATTLE_SILENCED,(a4),#0,#0 ; Message, Combatant, Item or Spell, Number
                bra.w   @End
@NotSilenced:
                
                moveq   #1,d6
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   @End
@ApplyActionOnTargets_Loop:
                
                moveq   #0,d1
                move.b  d1,dodge(a2)
                move.b  d1,criticalHit(a2)
                move.b  d1,inflictAilment(a2)
                move.b  d1,cutoff(a2)
                move.b  d1,targetDies(a2)
                bsr.w   battlesceneScript_SwitchTargets
                bsr.w   battlesceneScript_ApplyActionEffect
                bsr.w   battlesceneScript_DropEnemyItem
                addq.w  #1,a5
                moveq   #2,d6
                dbf     d7,@ApplyActionOnTargets_Loop
                
                bsr.w   battlesceneScript_MakeActorIdle
                bsr.w   battlesceneScript_BreakUsedItem
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a4
                lea     ((TARGETS_LIST-$1000000)).w,a5
                bsr.w   battlesceneScript_ValidateDoubleAttack
                tst.b   doubleAttack(a2)
                beq.s   @CounterAttack
                
                ; Perform second attack
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
                bsr.w   battlesceneScript_SwitchTargets
                exg     a4,a5
                bsr.w   battlesceneScript_DisplayMessage
                bsr.w   battlesceneScript_PerformAnimation
                bsr.w   battlesceneScript_SwitchTargets
                bsr.w   battlesceneScript_ApplyActionEffect
                bsr.w   battlesceneScript_DropEnemyItem
                bsr.w   battlesceneScript_MakeActorIdle
@CounterAttack:
                
                lea     ((TARGETS_LIST-$1000000)).w,a4
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a5
                bsr.w   battlesceneScript_ValidateCounterAttack
                tst.b   counterAttack(a2)
                beq.s   @CheckExplode
                
                ; Perform counter attack
                move.w  #BATTLEACTION_ATTACKTYPE_COUNTER,((BATTLESCENE_ATTACK_TYPE-$1000000)).w
                moveq   #0,d1
                move.b  d1,dodge(a2)
                move.b  d1,criticalHit(a2)
                move.b  d1,inflictAilment(a2)
                move.b  d1,cutoff(a2)
                move.b  d1,targetDies(a2)
                move.b  d1,specialCritical(a2)
                move.b  d1,ineffectiveAttackToggle(a2)
                makeActorIdleAndEndAnimation
                exg     a4,a5
                bsr.w   battlesceneScript_SwitchTargets
                exg     a4,a5
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a5
                bsr.w   battlesceneScript_DisplayMessage
                bsr.w   battlesceneScript_PerformAnimation
                bsr.w   battlesceneScript_SwitchTargets
                bsr.w   battlesceneScript_ApplyActionEffect
                bsr.w   battlesceneScript_DropEnemyItem
                bsr.w   battlesceneScript_MakeActorIdle
@CheckExplode:
                
                lea     ((BATTLESCENE_ATTACKER-$1000000)).w,a4
                lea     ((TARGETS_LIST-$1000000)).w,a5
                tst.b   explode(a2)
                beq.s   @End
                
                ; Prepare to explode
                move.b  #0,explode(a2)
                move.w  #BATTLEACTION_BURST_ROCK,(a3)
                move.b  explodingActor(a2),(a4)
                makeActorIdleAndEndAnimation
                bsr.w   battlesceneScript_DetermineTargetsByAction
                bra.w   @Continue
@End:
                
                move.b  ((BATTLESCENE_ATTACKER_COPY-$1000000)).w,((BATTLESCENE_ATTACKER-$1000000)).w
                bsr.w   battlesceneScript_End
                unlk    a2
                movem.l (sp)+,d0-a6
                rts

    ; End of function WriteBattlesceneScript

                modend

; =============== S U B R O U T I N E =======================================

; In: a3 = battleaction data pointer


battlesceneScript_DetermineTargetsByAction:
                
                cmpi.w  #BATTLEACTION_ATTACK,(a3)
                bne.s   @IsCastSpell
                
                move.w  #1,((TARGETS_LIST_LENGTH-$1000000)).w
                move.b  BATTLEACTION_OFFSET_ITEM_OR_SPELL_LOWER_BYTE(a3),((TARGETS_LIST-$1000000)).w
                bra.s   @Done
@IsCastSpell:
                
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.s   @IsUseItem
                
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                move.w  BATTLEACTION_OFFSET_TARGET(a3),d0
                jsr     PopulateTargetableGrid_CastSpell
                bra.s   @Done
@IsUseItem:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.w   @IsBurstRock
                
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                move.w  BATTLEACTION_OFFSET_TARGET(a3),d0
                jsr     PopulateTargetableGrid_UseItem
                bra.s   @Done
@IsBurstRock:
                
                cmpi.w  #BATTLEACTION_BURST_ROCK,(a3)
                bne.w   @IsMuddled
                
                move.b  (a4),d0
                move.w  #SPELL_B_ROCK,d1
                jsr     PopulateTargetableGrid_CastSpell
                bra.s   @Done
@IsMuddled:
                
                cmpi.w  #BATTLEACTION_MUDDLED,(a3)
                bne.w   @IsPrismLaser
                
                move.w  #0,((TARGETS_LIST_LENGTH-$1000000)).w
                bra.s   @Done
@IsPrismLaser:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.w   @Done
                jsr     PopulateTargetsArrayWithAllCombatants
                move.b  #-1,((TARGETS_LIST-$1000000)).w
                move.b  (a4),d0
                jsr     j_GetLaserFacing
@Done:
                
                bsr.w   battlesceneScript_SortTargets
                rts

    ; End of function battlesceneScript_DetermineTargetsByAction


; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     a3 = battleaction data pointer
;     a4 = actor index pointer
;     a5 = target index pointer

allCombatantsCurrentHpTable = -24
debugDodge = -23
debugCritical = -22
debugDouble = -21
debugCounter = -20
explodingActor = -17
explode = -16
specialCritical = -15
ineffectiveAttackToggle = -14
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

battlesceneScript_InitializeActors:
                
                move.b  #-1,d3
                move.b  #-1,d4
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
                move.b  #-1,d4
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
                move.b  #-1,d3
@CheckForPrismLaserAction:
                
                cmpi.w  #BATTLEACTION_PRISM_LASER,(a3)
                bne.s   @LoadDisplayedCombatantIndexes
                move.b  #-1,d3
@LoadDisplayedCombatantIndexes:
                
                move.b  d3,((BATTLESCENE_FIRST_ALLY-$1000000)).w
                move.b  d3,((BATTLESCENE_LAST_ALLY-$1000000)).w
                move.b  d4,((BATTLESCENE_FIRST_ENEMY-$1000000)).w
                move.b  d4,((BATTLESCENE_LAST_ENEMY-$1000000)).w
                rts

    ; End of function battlesceneScript_InitializeActors

