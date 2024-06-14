
; ASM FILE code\gameflow\battle\battleactions\inflictdamage.asm :
; 0xACEA..0xAE32 : Write Battlescene Command : Inflict Damage function

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
                cmpi.b  #ENEMY_BURST_ROCK,d1 ; HARDCODED enemy index
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
