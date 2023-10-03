
; ASM FILE code\gameflow\battle\battleactions\battleactionsengine_5.asm :
; 0xACEA..0xB0A8 : Battleactions Engine, part 5

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     a4 = actor index pointer
;     a5 = target index pointer
;     d6.w = damage value

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

battlesceneScript_InflictDamage:
                
                module
                move.b  (a5),d0
                jsr     GetEnemy        
                cmpi.w  #ENEMY_TAROS,d1 ; if enemy target is Taros, check if attack is ineffective
                bne.s   @CheckCounterAttack ; otherwise, go to next step
                tst.b   ineffectiveAttackToggle(a2)
                beq.s   @CheckCounterAttack
                displayMessage #MESSAGE_BATTLE_INEFFECTIVE_ATTACK,(a5),#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                bra.w   @Return
@CheckCounterAttack:
                
                cmpi.w  #BATTLEACTION_ATTACKTYPE_COUNTER,((BATTLESCENE_ATTACK_TYPE-$1000000)).w
                bne.s   @CheckBurstRock 
                lsr.w   #1,d6           ; inflict 1/2 damage if counter attack
@CheckBurstRock:
                
                move.b  (a5),d0         ; No damage variance if target is Burst Rock
                jsr     GetEnemy        
                cmpi.w  #ENEMY_BURST_ROCK,d1
                bne.s   @ApplyDamageVariance
                tst.w   d6
                bne.s   @Goto_CheckCutoff
                moveq   #1,d6           ; minimum damage = 1
@Goto_CheckCutoff:
                
                bra.w   @CheckCutoff
@ApplyDamageVariance:
                
                move.w  d6,d1
                lsr.w   #3,d1
                addq.w  #1,d1
                move.w  d1,d0
                jsr     (GenerateRandomOrDebugNumber).w
                sub.w   d0,d6           ; randomly subtract 0..(damage/8)
                move.w  d1,d0
                jsr     (GenerateRandomOrDebugNumber).w
                sub.w   d0,d6           ; do it again
                bgt.s   @CheckCutoff
                moveq   #1,d6           ; minimum damage = 1
@CheckCutoff:
                
                jsr     battlesceneScript_CalculateDamageExp
                tst.b   cutoff(a2)
                beq.s   @CheckTargetDies
                move.w  #SPELLANIMATION_CUTOFF,d4
                move.w  #-1,d5
                bsr.w   battlesceneScript_AnimateAction
                move.w  #$8000,d6
@CheckTargetDies:
                
                move.b  (a5),d0
                move.w  d6,d1
                jsr     DecreaseCurrentHp
                jsr     GetCurrentHp
                tst.w   d1
                bne.s   @CheckExplode
                move.b  #-1,targetDies(a2)
                bsr.w   battlesceneScript_AddExpAndGoldForKill
@CheckExplode:
                
                move.b  (a5),d0
                move.w  d6,d2
                neg.w   d2
                tst.b   targetDies(a2)
                beq.s   @WriteScriptCommands
                jsr     GetEnemy        
                cmpi.b  #ENEMY_BURST_ROCK,d1
                bne.s   @WriteScriptCommands
                tst.w   d7
                bne.s   @WriteScriptCommands
                move.b  #-1,explode(a2)
                move.b  d0,explodingActor(a2)
                moveq   #0,d2
@WriteScriptCommands:
                
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_ADD8       ; @Reaction_Enemy
                executeAllyReaction d2,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @DetermineBattleMessage
byte_ADD8:
                
                @Reaction_Enemy:
                executeEnemyReaction d2,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@DetermineBattleMessage:
                
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.s   @EnemyAttacker
                tst.b   criticalHit(a2)
                beq.s   @RegularDamageMessageIfAllyAttacker
                move.w  #MESSAGE_BATTLE_CRITICAL_HIT,d1 ; critical hit message when actor is ally
                bra.s   @Goto_CutoffMessage
@RegularDamageMessageIfAllyAttacker:
                
                move.w  #MESSAGE_BATTLE_DAMAGE_ALLY,d1
@Goto_CutoffMessage:
                
                bra.s   @CutoffMessage
@EnemyAttacker:
                
                tst.b   criticalHit(a2)
                beq.s   @RegularDamageMessageIfEnemyAttacker
                move.w  #MESSAGE_BATTLE_HEAVY_ATTACK,d1 ; critical hit message when actor is enemy
                bra.s   @CutoffMessage
@RegularDamageMessageIfEnemyAttacker:
                
                move.w  #MESSAGE_BATTLE_DAMAGE_ENEMY,d1
@CutoffMessage:
                
                tst.b   cutoff(a2)
                beq.s   byte_AE1A       ; @Message
                move.w  #MESSAGE_BATTLE_CUTOFF,d1 ; message when target is cut off
byte_AE1A:
                
                @Message:
                displayMessage d1,(a5),#0,d6 ; Message, Combatant, Item or Spell, Number
@Return:
                
                rts

    ; End of function battlesceneScript_InflictDamage

                modend

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame

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

battlesceneScript_InflictAilment:
                
                module
                tst.b   inflictAilment(a2)
                beq.w   @Return
                
                move.b  (a4),d0
                jsr     GetCurrentProwess
                andi.w  #PROWESS_MASK_CRITICAL,d1
                move.w  d1,d2
                subi.w  #PROWESS_INFLICT_AILMENTS_START,d2
                move.b  (a5),d0
                jsr     GetStatusEffects
                lsl.w   #INDEX_SHIFT_COUNT,d2
                movea.l pt_InflictAilmentFunctions(pc,d2.w),a1
                jsr     (a1)
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_AE76       ; @Reaction_Enemy
                executeAllyReaction #0,#0,d1,#0 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @Return
byte_AE76:
                
                @Reaction_Enemy:
                executeEnemyReaction #0,#0,d1,#0 ; HP change (signed), MP change (signed), Status Effects, Flags
@Return:
                
                rts

    ; End of function battlesceneScript_InflictAilment

                modend
pt_InflictAilmentFunctions:
                dc.l inflictAilment_Poison
                dc.l inflictAilment_Sleep
                dc.l inflictAilment_Stun
                dc.l inflictAilment_Muddle
                dc.l inflictAilment_Slow
                dc.l inflictAilment_AbsorbMp
                dc.l inflictAilment_Silence
inflictAilment_Poison:
                displayMessageWithNoWait #MESSAGE_BATTLE_IS_POISONED,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                ori.w   #STATUSEFFECT_POISON,d1
                rts
inflictAilment_Sleep:
                displayMessageWithNoWait #MESSAGE_BATTLE_FELL_ASLEEP,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                ori.w   #STATUSEFFECT_SLEEP,d1
                rts
inflictAilment_Stun:
                displayMessageWithNoWait #MESSAGE_BATTLE_IS_STUNNED,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                ori.w   #STATUSEFFECT_STUN,d1
                rts
inflictAilment_Muddle:
                displayMessageWithNoWait #MESSAGE_BATTLE_BECOMES_CONFUSED,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                ori.w   #STATUSEFFECT_MUDDLE2,d1
                ori.w   #STATUSEFFECT_MUDDLE,d1
                rts

; =============== S U B R O U T I N E =======================================


inflictAilment_Slow:
                
                movem.l d0-d1,-(sp)
                bsr.w   battlesceneScript_DisplaySlowMessages
                movem.l (sp)+,d0-d1
                ori.w   #STATUSEFFECT_SLOW,d1
                rts

    ; End of function inflictAilment_Slow


; =============== S U B R O U T I N E =======================================


inflictAilment_AbsorbMp:
                
                movem.l d0-d1,-(sp)
                jsr     GetCurrentMp
                tst.w   d1
                beq.s   @Skip           ; skip if target has no MP
                bsr.w   spellEffect_AbsorbMp
@Skip:
                
                movem.l (sp)+,d0-d1
                rts

    ; End of function inflictAilment_AbsorbMp


; =============== S U B R O U T I N E =======================================


inflictAilment_Silence:
                
                move.w  d1,d3
                moveq   #0,d1
                jsr     GetSpellAndNumberOfSpells
                tst.w   d2
                beq.s   @Skip           ; skip if target has no spells
                displayMessageWithNoWait #MESSAGE_BATTLE_HAS_BEEN_SILENCED,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                ori.w   #STATUSEFFECT_SILENCE,d3
@Skip:
                
                move.w  d3,d1
                rts

    ; End of function inflictAilment_Silence


; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     d6.w = final damage

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

battlesceneScript_InflictCurseDamage:
                
                module
                move.b  (a4),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.w   @Return
                jsr     GetStatusEffects
                btst    #STATUSEFFECT_BIT_CURSE,d1
                beq.w   @Return
                moveq   #CHANCE_TO_INFLICT_CURSE_DAMAGE,d0 ; 1/2 chance to inflict curse damage
                jsr     (GenerateRandomOrDebugNumber).w
                tst.w   d0
                beq.w   @Return
                exg     a4,a5
                bsr.w   battlesceneScript_SwitchTargets
                exg     a4,a5
                bsr.w   battlesceneScript_MakeActorIdle
                move.b  (a4),d0
                move.w  d6,d3
                lsr.w   #3,d3
                addq.w  #1,d3           ; D3 = curse damage = (damage / 8) + 1
                move.w  d3,d1
                jsr     DecreaseCurrentHp
                jsr     GetCurrentHp
                tst.w   d1
                bne.s   @Continue
                move.b  #-1,targetDies(a2) ; killed by curse damage
@Continue:
                
                move.w  d3,d2
                neg.w   d2
                move.b  (a4),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_AFE4       ; @Reaction_Enemy
                executeAllyReaction d2,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   byte_AFF4       ; @Message
byte_AFE4:
                
                @Reaction_Enemy:
                executeEnemyReaction d2,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
byte_AFF4:
                
                @Message:
                bscCloseDialogueWindow
                displayMessage #MESSAGE_BATTLE_IS_CURSED_AND_DAMAGED,d0,#0,d3 
                                                        ; Message, Combatant, Item or Spell, Number
@Return:
                
                rts

    ; End of function battlesceneScript_InflictCurseDamage

                modend

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
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

battlesceneScript_DetermineDoubleAndCounter:
                
                move.b  (a4),d0         ; evaluate chance to double attack
                jsr     GetCurrentProwess
                lsr.b   #PROWESS_LOWER_DOUBLE_SHIFT_COUNT,d1
                moveq   #32,d0          ; 1/32 chance to double attack if setting value is 0
                andi.w  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d1
                beq.w   @DetermineDouble
                moveq   #16,d0          ; 1/16 if setting value is 1
                cmpi.b  #1,d1
                beq.w   @DetermineDouble
                moveq   #8,d0           ; 1/8 if setting value is 2
                cmpi.b  #2,d1
                beq.w   @DetermineDouble
                moveq   #4,d0           ; 1/4 otherwise
@DetermineDouble:
                
                jsr     (GenerateRandomOrDebugNumber).w
                tst.w   d0
                bne.s   @EvaluateChanceToCounter
                move.b  #-1,doubleAttack(a2)
@EvaluateChanceToCounter:
                
                move.b  (a5),d0         ; evaluate chance to counter using same mechanism as above
                jsr     GetCurrentProwess
                lsr.b   #PROWESS_LOWER_COUNTER_SHIFT_COUNT,d1
                moveq   #32,d0
                andi.w  #PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER,d1
                beq.w   @DetermineCounter
                moveq   #16,d0
                cmpi.b  #1,d1
                beq.w   @DetermineCounter
                moveq   #8,d0
                cmpi.b  #2,d1
                beq.w   @DetermineCounter
                moveq   #4,d0
@DetermineCounter:
                
                jsr     (GenerateRandomOrDebugNumber).w
                tst.w   d0
                bne.s   @Return
                move.b  #-1,counterAttack(a2)
@Return:
                
                rts

    ; End of function battlesceneScript_DetermineDoubleAndCounter


; =============== S U B R O U T I N E =======================================


battlesceneScript_DisplayDeathMessage:
                
                move.b  (a5),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                move.w  #MESSAGE_BATTLE_IS_EXHAUSTED,d1
                bra.s   @WriteBattleMessageCommand
@Enemy:
                
                move.w  #MESSAGE_BATTLE_WAS_DEFEATED,d1
@WriteBattleMessageCommand:
                
                displayMessage d1,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                rts

    ; End of function battlesceneScript_DisplayDeathMessage

