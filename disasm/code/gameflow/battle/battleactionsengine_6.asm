
; ASM FILE code\gameflow\battle\battleactionsengine_6.asm :
; 0xACEA..0xBCF0 : Battle actions engine

; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame
;     A4 = pointer to actor index in RAM
;     A5 = pointer to target index in RAM
;     D6 = damage

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

WriteBattlesceneScript_InflictDamage:
                
                move.b  (a5),d0
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_TAROS,d1 ; if enemy target is Taros, check if attack is ineffective
                bne.s   @CheckCounterAttack ; otherwise, go to next step
                tst.b   ineffectiveAttack(a2)
                beq.s   @CheckCounterAttack
                displayMessage #MESSAGE_BATTLE_INEFFECTIVE_ATTACK,(a5),#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                bra.w   @Return
@CheckCounterAttack:
                
                cmpi.w  #BATTLEACTION_ATTACKTYPE_COUNTER,((BATTLESCENE_ATTACK_TYPE-$1000000)).w
                bne.s   @CheckBurstRock
                lsr.w   #1,d6           ; inflict 1/2 damage if counter attack
@CheckBurstRock:
                
                move.b  (a5),d0
                jsr     GetEnemyIndex   
                cmpi.w  #ENEMY_BURST_ROCK,d1
                bne.s   @ApplyDamageVariance
                tst.w   d6
                bne.s   @GoTo_CheckCutoff
                moveq   #1,d6
@GoTo_CheckCutoff:
                
                bra.w   @CheckCutoff
@ApplyDamageVariance:
                
                move.w  d6,d1
                lsr.w   #3,d1
                addq.w  #1,d1
                move.w  d1,d0
                jsr     (GetRandomOrDebugValue).w
                sub.w   d0,d6           ; randomly subtract 0..(damage/8)
                move.w  d1,d0
                jsr     (GetRandomOrDebugValue).w
                sub.w   d0,d6           ; do it again
                bgt.s   @CheckCutoff
                moveq   #1,d6           ; minimum damage = 1
@CheckCutoff:
                
                jsr     CalculateDamageEXP
                tst.b   cutoff(a2)
                beq.s   @CheckTargetDies
                move.w  #SPELLANIMATION_CUTOFF,d4
                move.w  #$FFFF,d5
                bsr.w   WriteBattlesceneScript_AnimateAction
                move.w  #$8000,d6
@CheckTargetDies:
                
                move.b  (a5),d0
                move.w  d6,d1
                jsr     DecreaseCurrentHP
                jsr     GetCurrentHP
                tst.w   d1
                bne.s   @CheckExplode
                move.b  #$FF,targetDies(a2)
                bsr.w   GiveEXPandGoldForKill
@CheckExplode:
                
                move.b  (a5),d0
                move.w  d6,d2
                neg.w   d2
                tst.b   targetDies(a2)
                beq.s   @WriteScriptCommands
                jsr     GetEnemyIndex   
                cmpi.b  #ENEMY_BURST_ROCK,d1
                bne.s   @WriteScriptCommands
                tst.w   d7
                bne.s   @WriteScriptCommands
                move.b  #$FF,explode(a2)
                move.b  d0,explodingActor(a2)
                moveq   #0,d2
@WriteScriptCommands:
                
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction d2,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @DetermineBattleMessage
@EnemyReaction:
                
                executeEnemyReaction d2,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@DetermineBattleMessage:
                
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.s   @EnemyAttacker
                tst.b   criticalHit(a2)
                beq.s   @RegularDamageMessageIfAllyAttacker
                move.w  #MESSAGE_BATTLE_CRITICAL_HIT,d1 ; critical hit message when actor is ally
                bra.s   @GoTo_CutoffMessage
@RegularDamageMessageIfAllyAttacker:
                
                move.w  #MESSAGE_BATTLE_DAMAGE_ALLY,d1
@GoTo_CutoffMessage:
                
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
                beq.s   @DisplayBattleMessage
                move.w  #MESSAGE_BATTLE_CUTOFF,d1 ; message when target is cut off
@DisplayBattleMessage:
                
                displayMessage d1,(a5),#0,d6 ; Message, Combatant, Item or Spell, Number
@Return:
                
                rts

    ; End of function WriteBattlesceneScript_InflictDamage


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame

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

WriteBattlesceneScript_InflictAilment:
                
                tst.b   inflictAilment(a2)
                beq.w   @Return
                move.b  (a4),d0
                jsr     GetCurrentProwess
                andi.w  #PROWESS_MASK_CRITICAL,d1
                move.w  d1,d2
                subi.w  #PROWESS_INFLICT_AILMENTS_START,d2
                move.b  (a5),d0
                jsr     GetStatusEffects
                lsl.w   #2,d2
                movea.l pt_InflictAilmentFunctions(pc,d2.w),a1
                jsr     (a1)
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy          
                executeAllyReaction #0,#0,d1,#0 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @Return
@Enemy:
                
                executeEnemyReaction #0,#0,d1,#0 ; HP change (signed), MP change (signed), Status Effects, Flags
@Return:
                
                rts

    ; End of function WriteBattlesceneScript_InflictAilment

pt_InflictAilmentFunctions:
                dc.l WriteBattlesceneScript_InflictPoison
                dc.l WriteBattlesceneScript_InflictSleep
                dc.l WriteBattlesceneScript_InflictStun
                dc.l WriteBattlesceneScript_InflictMuddle
                dc.l WriteBattlesceneScript_InflictSlow
                dc.l WriteBattlesceneScript_DrainMP
                dc.l WriteBattlesceneScript_InflictSilence
WriteBattlesceneScript_InflictPoison:
                displayMessageWithNoWait #MESSAGE_BATTLE_IS_POISONED,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                ori.w   #STATUSEFFECT_POISON,d1
                rts
WriteBattlesceneScript_InflictSleep:
                displayMessageWithNoWait #MESSAGE_BATTLE_FELL_ASLEEP,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                ori.w   #STATUSEFFECT_SLEEP,d1
                rts
WriteBattlesceneScript_InflictStun:
                displayMessageWithNoWait #MESSAGE_BATTLE_IS_STUNNED,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                ori.w   #STATUSEFFECT_STUN,d1
                rts
WriteBattlesceneScript_InflictMuddle:
                displayMessageWithNoWait #MESSAGE_BATTLE_BECOMES_CONFUSED,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                ori.w   #STATUSEFFECT_MUDDLE2,d1
                ori.w   #STATUSEFFECT_MUDDLE,d1
                rts

; =============== S U B R O U T I N E =======================================


WriteBattlesceneScript_InflictSlow:
                
                movem.l d0-d1,-(sp)
                bsr.w   WriteBattlesceneScript_SlowMessage
                movem.l (sp)+,d0-d1
                ori.w   #STATUSEFFECT_SLOW,d1
                rts

    ; End of function WriteBattlesceneScript_InflictSlow


; =============== S U B R O U T I N E =======================================


WriteBattlesceneScript_DrainMP:
                
                movem.l d0-d1,-(sp)
                jsr     GetCurrentMP
                tst.w   d1
                beq.s   @Skip           ; skip if target has no MP
                bsr.w   SpellEffect_DrainMP
@Skip:
                
                movem.l (sp)+,d0-d1
                rts

    ; End of function WriteBattlesceneScript_DrainMP


; =============== S U B R O U T I N E =======================================


WriteBattlesceneScript_InflictSilence:
                
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

    ; End of function WriteBattlesceneScript_InflictSilence


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame
;     D6 = damage

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

WriteBattlesceneScript_InflictCurseDamage:
                
                move.b  (a4),d0
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.w   @Return
                jsr     GetStatusEffects
                btst    #STATUSEFFECT_BIT_CURSE,d1
                beq.w   @Return
                moveq   #CHANCE_TO_INFLICT_CURSE_DAMAGE,d0 ; 1/2 chance to inflict curse damage
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                beq.w   @Return
                exg     a4,a5
                bsr.w   WriteBattlesceneScript_SwitchTargets
                exg     a4,a5
                bsr.w   WriteBattlesceneScript_IdleSprite
                move.b  (a4),d0
                move.w  d6,d3
                lsr.w   #3,d3
                addq.w  #1,d3           ; D3 = curse damage = (damage / 8) + 1
                move.w  d3,d1
                jsr     DecreaseCurrentHP
                jsr     GetCurrentHP
                tst.w   d1
                bne.s   @Continue
                move.b  #$FF,targetDies(a2) ; killed by curse damage
@Continue:
                
                move.w  d3,d2
                neg.w   d2
                move.b  (a4),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy          
                executeAllyReaction d2,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @Message
@Enemy:
                
                executeEnemyReaction d2,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@Message:
                
                bscHideTextBox
                displayMessage #MESSAGE_BATTLE_IS_CURSED_AND_DAMAGED,d0,#0,d3 
                                                        ; Message, Combatant, Item or Spell, Number
@Return:
                
                rts

    ; End of function WriteBattlesceneScript_InflictCurseDamage


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame
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

DetermineDoubleAndCounter:
                
                move.b  (a4),d0         ; evaluate chance to double attack
                jsr     GetCurrentProwess
                lsr.b   #PROWESS_LOWER_DOUBLE_SHIFTCOUNT,d1
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
                
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   @EvaluateChanceToCounter
                move.b  #$FF,doubleAttack(a2)
@EvaluateChanceToCounter:
                
                move.b  (a5),d0         ; evaluate chance to counter using same mechanism as above
                jsr     GetCurrentProwess
                lsr.b   #PROWESS_LOWER_COUNTER_SHIFTCOUNT,d1
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
                
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   @Return
                move.b  #$FF,counterAttack(a2)
@Return:
                
                rts

    ; End of function DetermineDoubleAndCounter


; =============== S U B R O U T I N E =======================================


WriteBattlesceneScript_DeathMessage:
                
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

    ; End of function WriteBattlesceneScript_DeathMessage


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene stack
;     A3 = scene action type in RAM
;     A4 = actor index in RAM
;     A5 = target index in RAM


WriteBattlesceneScript_CastSpell:
                
                move.b  (a5),d0
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d1
                bsr.w   GetResistanceToSpell
                add.w   d1,d1
                move.w  rjt_SpellEffects(pc,d1.w),d1
                jmp     rjt_SpellEffects(pc,d1.w)

    ; End of function WriteBattlesceneScript_CastSpell

rjt_SpellEffects:
                dc.w SpellEffect_Heal-rjt_SpellEffects ; HEAL
                dc.w SpellEffect_Heal-rjt_SpellEffects ; AURA
                dc.w SpellEffect_Detox-rjt_SpellEffects ; DETOX
                dc.w SpellEffect_Boost-rjt_SpellEffects ; BOOST
                dc.w SpellEffect_Slow-rjt_SpellEffects ; SLOW
                dc.w SpellEffect_Attack-rjt_SpellEffects ; ATTACK
                dc.w SpellEffect_Dispel-rjt_SpellEffects ; DISPEL
                dc.w SpellEffect_Muddle-rjt_SpellEffects ; MUDDLE
                dc.w SpellEffect_Desoul-rjt_SpellEffects ; DESOUL
                dc.w SpellEffect_Sleep-rjt_SpellEffects ; SLEEP
                dc.w SpellEffect_None-rjt_SpellEffects ; EGRESS
                dc.w SpellEffect_Blaze-rjt_SpellEffects ; BLAZE
                dc.w SpellEffect_Freeze-rjt_SpellEffects ; FREEZE
                dc.w SpellEffect_Bolt-rjt_SpellEffects ; BOLT
                dc.w SpellEffect_Blast-rjt_SpellEffects ; BLAST
                dc.w SpellEffect_DrainMP-rjt_SpellEffects ; SPOIT
                dc.w SpellEffect_Heal-rjt_SpellEffects ; HEALIN
                dc.w SpellEffect_FlameBreath-rjt_SpellEffects ; FLAME
                dc.w SpellEffect_Freeze-rjt_SpellEffects ; SNOW
                dc.w SpellEffect_DemonBreath-rjt_SpellEffects ; DEMON
                dc.w SpellEffect_PowerWater-rjt_SpellEffects ; POWER
                dc.w SpellEffect_ProtectMilk-rjt_SpellEffects ; GUARD
                dc.w SpellEffect_QuickChicken-rjt_SpellEffects ; SPEED
                dc.w SpellEffect_RunningPimento-rjt_SpellEffects ; IDATEN
                dc.w SpellEffect_CheerfulBread-rjt_SpellEffects ; HEALTH
                dc.w SpellEffect_None-rjt_SpellEffects ; B.ROCK
                dc.w SpellEffect_None-rjt_SpellEffects ; LASER
                dc.w SpellEffect_Blaze-rjt_SpellEffects ; KATON
                dc.w SpellEffect_Bolt-rjt_SpellEffects ; RAIJIN
                dc.w SpellEffect_Blast-rjt_SpellEffects ; DAO
                dc.w SpellEffect_Blaze-rjt_SpellEffects ; APOLLO
                dc.w SpellEffect_Neptun-rjt_SpellEffects ; NEPTUN
                dc.w SpellEffect_Bolt-rjt_SpellEffects ; ATLAS
                dc.w SpellEffect_Detox-rjt_SpellEffects ; POWDER
                dc.w SpellEffect_FairyTear-rjt_SpellEffects ; G.TEAR
                dc.w SpellEffect_BrightHoney-rjt_SpellEffects ; HANNY
                dc.w SpellEffect_BraveApple-rjt_SpellEffects ; BRAVE
                dc.w SpellEffect_Blaze-rjt_SpellEffects ; F.BALL
                dc.w SpellEffect_Freeze-rjt_SpellEffects ; BREZAD
                dc.w SpellEffect_Bolt-rjt_SpellEffects ; THUNDR
                dc.w SpellEffect_BubbleBreath-rjt_SpellEffects ; AQUA
                dc.w SpellEffect_FlameBreath-rjt_SpellEffects ; KIWI
                dc.w SpellEffect_FairyTear-rjt_SpellEffects ; SHINE
                dc.w SpellEffect_Bolt-rjt_SpellEffects ; ODDEYE
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell44
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell45
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell46
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell47
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell48
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell49
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell50
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell51
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell52
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell53
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell54
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell55
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell56
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell57
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell58
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell59
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell60
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell61
                    dc.w SpellEffect_None-rjt_SpellEffects       ; spell62
                endif

; =============== S U B R O U T I N E =======================================


SpellEffect_Heal:
                
                move.b  (a5),d0
                jsr     GetMaxHP
                move.w  d1,d2
                jsr     GetCurrentHP
                sub.w   d1,d2           ; D2 = target's missing HP
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                jsr     FindSpellDefAddress
                clr.w   d6
                move.b  SPELLDEF_OFFSET_POWER(a0),d6
                cmpi.b  #255,d6         ; full recovery if spell power is 255
                bne.s   @AdjustSpellPower
                move.w  d2,d6
                bra.s   @CapRecovery    
@AdjustSpellPower:
                
                bsr.w   AdjustSpellPower
@CapRecovery:
                
                cmp.w   d6,d2           ; cap recovery amount if missing HP is lower than spell power
                bcc.s   @WriteScriptCommands
                move.w  d2,d6
@WriteScriptCommands:
                
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction d6,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage  
@EnemyReaction:
                
                executeEnemyReaction d6,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                displayMessage #MESSAGE_BATTLE_RECOVERED_HIT_POINTS,d0,#0,d6 
                                                        ; Message, Combatant, Item or Spell, Number
                bsr.w   CalculateHealingEXP
                rts

    ; End of function SpellEffect_Heal


; =============== S U B R O U T I N E =======================================


SpellEffect_Detox:
                
                move.b  (a5),d0
                jsr     GetStatusEffects
                clr.b   d2
                tst.w   ((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                cmpi.w  #0,((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w 
                                                        ; useless compare instruction
                beq.w   @CurePoison     ; if spell level 1, cure poison
                                        ; else if spell level 2, cure poison and stun 
                                        ; otherwise, cure poison, stun, and curse
                cmpi.w  #1,((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                beq.w   @CureStun
                bclr    #STATUSEFFECT_BIT_CURSE,d1
                beq.s   @CureStun
                ori.b   #4,d2           ; D2 = bit 2 set if curse was cured
@CureStun:
                
                bclr    #STATUSEFFECT_BIT_STUN,d1
                beq.s   @CurePoison
                ori.b   #2,d2           ; D2 = bit 1 set if stun was cured
@CurePoison:
                
                bclr    #STATUSEFFECT_BIT_POISON,d1
                beq.s   @CheckIfAnyStatusCured
                ori.b   #1,d2           ; D2 = bit 0 set if poison was cured
@CheckIfAnyStatusCured:
                
                tst.b   d2
                beq.w   @Ineffective
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @WriteEnemyReactionCommand
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @CheckIfPoisonCured
@WriteEnemyReactionCommand:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@CheckIfPoisonCured:
                
                bsr.w   GiveStatusEffectSpellsEXP
                btst    #0,d2
                beq.s   @CheckIfStunCured
                displayMessage #MESSAGE_BATTLE_IS_NO_LONGER_POISONED,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
@CheckIfStunCured:
                
                btst    #1,d2
                beq.s   @CheckIfCurseCured
                displayMessage #MESSAGE_BATTLE_IS_NO_LONGER_STUNNED,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
@CheckIfCurseCured:
                
                btst    #2,d2
                beq.s   @Skip
                displayMessage #MESSAGE_BATTLE_IS_NO_LONGER_CURSED,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                jsr     UnequipAllItemsIfNotCursed
@Skip:
                
                bra.s   @UpdateStatusEffects
@Ineffective:
                
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
@UpdateStatusEffects:
                
                move.b  (a5),d0
                jsr     SetStatusEffects
                jsr     ApplyStatusEffectsAndItemsOnStats
                rts

    ; End of function SpellEffect_Detox


; =============== S U B R O U T I N E =======================================


SpellEffect_Boost:
                
                move.b  (a5),d0
                jsr     GetStatusEffects
                move.w  d1,d3
                ori.w   #STATUSEFFECT_BOOST,d1
                jsr     SetStatusEffects
                andi.w  #STATUSEFFECT_BOOST,d3
                beq.s   @WriteScriptCommands
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
@WriteScriptCommands:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
@EnemyReaction:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                bsr.w   GiveStatusEffectSpellsEXP
                jsr     GetBaseAGI
                mulu.w  #3,d1
                lsr.l   #3,d1
                displayMessage #MESSAGE_BATTLE_BOOST_SPELL_AGI_INCREASE,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
                jsr     GetBaseDEF
                mulu.w  #3,d1
                lsr.l   #3,d1
                displayMessage #MESSAGE_BATTLE_BOOST_SPELL_DEF_INCREASE,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
                rts

    ; End of function SpellEffect_Boost


; =============== S U B R O U T I N E =======================================


SpellEffect_Slow:
                
                tst.w   d2
                beq.s   @Skip
                addq.w  #CHANCE_TO_INFLICT_SLOW,d2 ; 3/8 base chance to inflict slow
@Skip:
                
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatusEffects
                move.w  d1,d3
                ori.w   #STATUSEFFECT_SLOW,d1
                jsr     SetStatusEffects
                andi.w  #STATUSEFFECT_SLOW,d3
                beq.s   @WriteScriptCommands
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
@WriteScriptCommands:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @GiveEXP
@EnemyReaction:
                
                executeEnemyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@GiveEXP:
                
                bsr.w   GiveStatusEffectSpellsEXP

    ; End of function SpellEffect_Slow

WriteBattlesceneScript_SlowMessage:
                jsr     GetBaseAGI
                mulu.w  #3,d1
                lsr.l   #3,d1
byte_B372:      displayMessage #MESSAGE_BATTLE_AGILITY_DECREASED_BY,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
                jsr     GetBaseDEF
                mulu.w  #3,d1
                lsr.l   #3,d1
                displayMessage #MESSAGE_BATTLE_DEFENSE_DECREASED_BY,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
                rts

; =============== S U B R O U T I N E =======================================


SpellEffect_Attack:
                
                move.b  (a5),d0
                jsr     GetStatusEffects
                move.w  d1,d3
                ori.w   #STATUSEFFECT_ATTACK,d1
                jsr     SetStatusEffects
                andi.w  #STATUSEFFECT_ATTACK,d3
                beq.s   @WriteScriptCommands
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
@WriteScriptCommands:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
@EnemyReaction:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                bsr.w   GiveStatusEffectSpellsEXP
                jsr     GetBaseATT
                mulu.w  #3,d1
                lsr.l   #3,d1
byte_B404:
                
                displayMessage #MESSAGE_BATTLE_ATTACK_SPELL_EFFECT,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
                rts

    ; End of function SpellEffect_Attack


; =============== S U B R O U T I N E =======================================


SpellEffect_Dispel:
                
                move.w  d2,d3
                move.b  (a5),d0
                moveq   #0,d1
                jsr     GetSpellAndNumberOfSpells
                tst.w   d2
                bne.s   @TargetHasSpells
                moveq   #8,d3
                bra.s   @DetermineSuccess
@TargetHasSpells:
                
                addq.w  #CHANCE_TO_INFLICT_SILENCE,d3 ; if target has spells, 3/8 base chance to inflict silence
@DetermineSuccess:
                
                move.w  d3,d2
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatusEffects
                ori.w   #STATUSEFFECT_SILENCE,d1
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
@EnemyReaction:
                
                executeEnemyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                bsr.w   GiveStatusEffectSpellsEXP
                displayMessage #MESSAGE_BATTLE_HAS_BEEN_SILENCED,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                rts

    ; End of function SpellEffect_Dispel


; =============== S U B R O U T I N E =======================================


SpellEffect_Muddle:
                
                move.b  (a5),d0
                tst.w   ((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                beq.w   @Muddle1        
                addq.w  #CHANCE_TO_INFLICT_MUDDLE2,d2 ; 3/8 base chance to inflict muddle 2
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatusEffects
                ori.w   #STATUSEFFECT_MUDDLE2,d1
                ori.w   #STATUSEFFECT_MUDDLE,d1
                move.w  #MESSAGE_BATTLE_IS_IN_A_DEEP_HAZE,d2
                bra.w   @WriteScriptCommands
@Muddle1:
                
                moveq   #8,d2           ; muddle 1
                jsr     GetStatusEffects
                andi.w  #STATUSEFFECT_MUDDLE2,d1
                bne.s   @DetermineSuccess ; if target already affected by Muddle 2, then no chance for Muddle 1 to work
                moveq   #CHANCE_TO_INFLICT_MUDDLE1,d2 ; otherwise, 3/8 base chance to inflict muddle 1
@DetermineSuccess:
                
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatusEffects
                ori.w   #STATUSEFFECT_MUDDLE,d1
                move.w  #MESSAGE_BATTLE_IS_IN_A_DEEP_HAZE,d2
@WriteScriptCommands:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
@EnemyReaction:
                
                executeEnemyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                bsr.w   GiveStatusEffectSpellsEXP
                displayMessage d2,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                rts

    ; End of function SpellEffect_Muddle


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame

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

SpellEffect_Desoul:
                
                addq.w  #CHANCE_TO_INFLICT_DESOUL,d2 ; 3/8 base chance to inflict desoul
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #$8000,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @DetermineBattleMessage
@EnemyReaction:
                
                executeEnemyReaction #$8000,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@DetermineBattleMessage:
                
                bsr.w   GiveEXPandGoldForKill
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyMessage
                move.w  #MESSAGE_BATTLE_SOUL_WAS_STOLEN_ALLY,d2 ; ally message
                bra.s   @BattleMessage  
@EnemyMessage:
                
                move.w  #MESSAGE_BATTLE_SOUL_WAS_STOLEN_ENEMY,d2
@BattleMessage:
                
                displayMessage d2,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                move.b  #$FF,targetDies(a2)
                rts

    ; End of function SpellEffect_Desoul


; =============== S U B R O U T I N E =======================================


SpellEffect_Sleep:
                
                addq.w  #CHANCE_TO_INFLICT_SLEEP,d2 ; 3/8 base chance to inflict sleep
                bsr.w   ApplyRandomEffectiveness
                jsr     GetStatusEffects
                ori.w   #STATUSEFFECT_SLEEP,d1
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
@EnemyReaction:
                
                executeEnemyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                bsr.w   GiveStatusEffectSpellsEXP
                displayMessage #MESSAGE_BATTLE_FELL_ASLEEP,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                rts

    ; End of function SpellEffect_Sleep


; =============== S U B R O U T I N E =======================================


SpellEffect_DrainMP:
                
                move.b  (a5),d0
                jsr     GetCurrentMP
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #3,d0
                cmp.b   d0,d1
                bcc.s   @TargetReaction
                move.w  d1,d0           ; clamp random value to target's current MP
@TargetReaction:
                
                move.w  d0,d2
                move.w  d0,d3
                neg.w   d3
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyTarget    
                executeAllyReaction #0,d3,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @ActorReaction
@EnemyTarget:
                
                executeEnemyReaction #0,d3,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@ActorReaction:
                
                move.b  (a4),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyActor     
                executeAllyReaction #0,d2,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @DetermineMessage
@EnemyActor:
                
                executeEnemyReaction #0,d2,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@DetermineMessage:
                
                bsr.w   GiveStatusEffectSpellsEXP
                bscHideTextBox
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyMessage
                move.w  #MESSAGE_BATTLE_ABSORBED_MAGIC_POINTS,d1 ; ally message
                bra.s   @DisplayMessage 
@EnemyMessage:
                
                move.b  (a5),d0
                move.w  #MESSAGE_BATTLE_MP_WAS_DRAINED_BY,d1
@DisplayMessage:
                
                displayMessage d1,d0,#0,d2 ; Message, Combatant, Item or Spell, Number
                rts

    ; End of function SpellEffect_DrainMP


; =============== S U B R O U T I N E =======================================


SpellEffect_PowerWater:
                
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @Continue
@EnemyReaction:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@Continue:
                
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #2,d0
                displayMessage #MESSAGE_BATTLE_ATTACK_POWER_IS_BOOSTED_BY,(a5),#0,d0 
                                                        ; Message, Combatant, Item or Spell, Number
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseBaseATT
                jsr     ApplyStatusEffectsAndItemsOnStats
                rts

    ; End of function SpellEffect_PowerWater


; =============== S U B R O U T I N E =======================================


SpellEffect_ProtectMilk:
                
                move.b  (a5),d0
loc_B6E8:
                
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
@EnemyReaction:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #2,d0
                displayMessage #MESSAGE_BATTLE_DEFENSIVE_POWER_IS_BOOSTED_BY,(a5),#0,d0 
                                                        ; Message, Combatant, Item or Spell, Number
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseBaseDEF
                jsr     ApplyStatusEffectsAndItemsOnStats
                rts

    ; End of function SpellEffect_ProtectMilk


; =============== S U B R O U T I N E =======================================


SpellEffect_QuickChicken:
                
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
@EnemyReaction:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #2,d0
byte_B788:
                
                displayMessage #MESSAGE_BATTLE_AGILITY_IS_BOOSTED_BY,(a5),#0,d0 
                                                        ; Message, Combatant, Item or Spell, Number
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseBaseAGI
                jsr     ApplyStatusEffectsAndItemsOnStats
                rts

    ; End of function SpellEffect_QuickChicken


; =============== S U B R O U T I N E =======================================


SpellEffect_RunningPimento:
                
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @DetermineIncreaseValue
@EnemyReaction:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@DetermineIncreaseValue:
                
                jsr     GetBaseMOV
                clr.w   d2
                cmpi.b  #9,d1
                beq.w   @BattleMessage  
                moveq   #1,d2
                cmpi.b  #8,d1
                beq.w   @BattleMessage  
                moveq   #2,d2
@BattleMessage:
                
                displayMessage #MESSAGE_BATTLE_MOVEMENT_RANGE_IS_ENLARGED_BY,d0,#0,d2 
                                                        ; Message, Combatant, Item or Spell, Number
                move.w  d2,d1
                jsr     IncreaseBaseMOV
                jsr     ApplyStatusEffectsAndItemsOnStats
                rts

    ; End of function SpellEffect_RunningPimento


; =============== S U B R O U T I N E =======================================


SpellEffect_CheerfulBread:
                
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
@EnemyReaction:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #2,d0
                displayMessage #MESSAGE_BATTLE_MAX_HP_ARE_RAISED_BY,(a5),#0,d0 
                                                        ; Message, Combatant, Item or Spell, Number
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseMaxHP
                rts

    ; End of function SpellEffect_CheerfulBread


; =============== S U B R O U T I N E =======================================


SpellEffect_BrightHoney:
                
                move.b  (a5),d0
loc_B888:
                
                jsr     GetMaxMP
                tst.w   d1
                bne.s   @TargetHasMP
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
@TargetHasMP:
                
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
@EnemyReaction:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                moveq   #3,d0
                jsr     (GetRandomOrDebugValue).w
                addq.w  #2,d0
                displayMessage #MESSAGE_BATTLE_MAX_MP_ARE_RAISED_BY,(a5),#0,d0 
                                                        ; Message, Combatant, Item or Spell, Number
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseMaxMP
                rts

    ; End of function SpellEffect_BrightHoney


; =============== S U B R O U T I N E =======================================


SpellEffect_BraveApple:
                
                move.b  (a5),d0
                moveq   #0,d1
                jsr     SetCurrentEXP
                jsr     LevelUp         
                lea     ((LEVELUP_ARGUMENTS-$1000000)).w,a1
                cmpi.b  #$FF,(a1)       ; check if target is able to level up
                bne.s   @AbleToLevelUp
                moveq   #8,d2
                bsr.w   ApplyRandomEffectiveness
@AbleToLevelUp:
                
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
@EnemyReaction:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                clr.l   d1
                move.b  (a1)+,d1
byte_B950:
                
                displayMessage #MESSAGE_BATTLE_BECAME_LEVEL,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
                move.b  (a1)+,d1        ; evaluate stat gain : HP
                beq.s   @EvaluateStatGain_MP
                displayMessage #MESSAGE_BATTLE_HP_INCREASED_BY,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
@EvaluateStatGain_MP:
                
                move.b  (a1)+,d1
                beq.s   @EvaluateStatGain_ATT
                displayMessage #MESSAGE_BATTLE_MP_INCREASED_BY,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
@EvaluateStatGain_ATT:
                
                move.b  (a1)+,d1
                beq.s   @EvaluateStatGain_DEF
                displayMessage #MESSAGE_BATTLE_ATTACK_INCREASED_BY,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
@EvaluateStatGain_DEF:
                
                move.b  (a1)+,d1
                beq.s   @EvaluateStatGain_AGI
                displayMessage #MESSAGE_BATTLE_DEFENSE_INCREASED_BY,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
@EvaluateStatGain_AGI:
                
                move.b  (a1)+,d1
                beq.s   @EvaluateLearnedSpell
                displayMessage #MESSAGE_BATTLE_AGILITY_INCREASED_BY,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
@EvaluateLearnedSpell:
                
                move.b  (a1)+,d1
                cmpi.b  #$FF,d1
                beq.s   @Return
                move.w  d1,d2
                andi.w  #SPELLENTRY_MASK_INDEX,d2 
                lsr.w   #6,d1
                bne.s   @SpellLevelIncreasedMessage
                displayMessage #MESSAGE_BATTLE_LEARNED_THE_NEW_MAGIC_SPELL,d0,d2,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                bra.s   @Return
@SpellLevelIncreasedMessage:
                
                addq.w  #1,d1
                displayMessage #MESSAGE_BATTLE_SPELL_INCREASED_TO_LEVEL,d2,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
@Return:
                
                rts

    ; End of function SpellEffect_BraveApple


; =============== S U B R O U T I N E =======================================


SpellEffect_FairyTear:
                
                move.b  (a5),d0
                jsr     GetMaxMP
                move.w  d1,d2
                jsr     GetCurrentMP
                sub.w   d1,d2
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                jsr     FindSpellDefAddress
                clr.w   d6
                move.b  SPELLDEF_OFFSET_POWER(a0),d6
                cmpi.b  #255,d6         ; full recovery if spell power is 255
                bne.s   @CapRecovery    
                move.w  d2,d6
@CapRecovery:
                
                cmp.w   d6,d2           ; cap recovery amount if missing MP is lower than spell power
                bcc.s   @WriteScriptCommands
                move.w  d2,d6
@WriteScriptCommands:
                
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyReaction  
                executeAllyReaction #0,d6,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage  
@EnemyReaction:
                
                executeEnemyReaction #0,d6,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                displayMessage #MESSAGE_BATTLE_RECOVERED_MAGIC_POINTS,d0,#0,d6 
                                                        ; Message, Combatant, Item or Spell, Number
                bsr.w   CalculateHealingEXP
                rts

    ; End of function SpellEffect_FairyTear


; =============== S U B R O U T I N E =======================================


SpellEffect_None:
                
                rts

    ; End of function SpellEffect_None


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame

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

ApplyRandomEffectiveness:
                
                move.l  d0,-(sp)
                tst.b   debugDodge(a2)
                beq.s   @DetermineSuccess
                moveq   #8,d2
@DetermineSuccess:
                
                moveq   #8,d0
                jsr     (GetRandomOrDebugValue).w
                cmp.w   d2,d0
                bcc.s   @Success
                displayMessage #MESSAGE_BATTLE_THE_SPELL_HAS_NO_EFFECT,(a5),#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                move.b  #$FF,dodge(a2)
                move.l  (sp)+,d0
                move.l  (sp)+,d0
                rts
@Success:
                
                move.l  (sp)+,d0
                rts

    ; End of function ApplyRandomEffectiveness


; =============== S U B R O U T I N E =======================================


SpellEffect_FlameBreath:
                
                moveq   #CHANCE_TO_CRITICAL_FLAME_BREATH,d3 ; 1/16 chance to critical hit
                bra.w   CalculateDamage_Spell

    ; End of function SpellEffect_FlameBreath


; =============== S U B R O U T I N E =======================================


SpellEffect_Blaze:
                
                moveq   #CHANCE_TO_CRITICAL_BLAZE,d3 ; 1/32 chance to critical hit
                bra.w   CalculateDamage_Spell

    ; End of function SpellEffect_Blaze


; =============== S U B R O U T I N E =======================================


SpellEffect_Freeze:
                
                moveq   #CHANCE_TO_CRITICAL_FREEZE,d3 ; 1/32 chance to critical hit
                bra.w   CalculateDamage_Spell

    ; End of function SpellEffect_Freeze


; =============== S U B R O U T I N E =======================================


SpellEffect_Neptun:
                
                moveq   #CHANCE_TO_CRITICAL_NEPTUN,d3 ; 1/16 chance to critical hit
                bra.w   CalculateDamage_Spell

    ; End of function SpellEffect_Neptun


; =============== S U B R O U T I N E =======================================


SpellEffect_BubbleBreath:
                
                moveq   #CHANCE_TO_CRITICAL_BUBBLE_BREATH,d3 ; 1/8 chance to critical hit
                bra.w   CalculateDamage_Spell

    ; End of function SpellEffect_BubbleBreath


; =============== S U B R O U T I N E =======================================


SpellEffect_Bolt:
                
                moveq   #CHANCE_TO_CRITICAL_BOLT,d3 ; 1/8 chance to critical hit
                bra.w   CalculateDamage_Spell

    ; End of function SpellEffect_Bolt


; =============== S U B R O U T I N E =======================================


SpellEffect_Blast:
                
                moveq   #CHANCE_TO_CRITICAL_BLAST,d3 ; 1/32 chance to critical hit
                bra.w   CalculateDamage_Spell

    ; End of function SpellEffect_Blast


; =============== S U B R O U T I N E =======================================


SpellEffect_DemonBreath:
                
                moveq   #CHANCE_TO_CRITICAL_DEMON_BREATH,d3 ; no chance to critical hit

    ; End of function SpellEffect_DemonBreath


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame
;     D2 = resistance setting (0=none, 1=minor, 2=major, 3=weakness)
;     D3 = chance to critical hit

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

CalculateDamage_Spell:
                
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                jsr     FindSpellDefAddress
                clr.w   d6
                move.b  SPELLDEF_OFFSET_POWER(a0),d6
                bsr.w   AdjustSpellPower
                move.w  d6,d1
                lsr.w   #2,d1           ; D1 = spell power divided by 4
                cmpi.b  #RESISTANCESETTING_MINOR,d2
                bne.s   @CheckMajorResistance
                sub.w   d1,d6           ; -25% damage if target has minor resistance
@CheckMajorResistance:
                
                cmpi.b  #RESISTANCESETTING_MAJOR,d2
                bne.s   @CheckWeakness
                lsr.w   #1,d6           ; -50% damage if target has major resistance
@CheckWeakness:
                
                cmpi.b  #RESISTANCESETTING_WEAKNESS,d2
                bne.s   @DetermineCriticalHit
                add.w   d1,d6           ; +25% damage if target is weak
@DetermineCriticalHit:
                
                move.w  d3,d0
                beq.s   @Skip           ; skip if no chance to critical hit
                jsr     (GetRandomOrDebugValue).w
                tst.w   d0
                bne.s   @Skip
                add.w   d1,d6           ; +25% damage if successful critical hit
                move.b  #$FF,criticalHit(a2)
@Skip:
                
                bsr.w   WriteBattlesceneScript_InflictDamage
                tst.b   targetDies(a2)
                beq.s   @Return
                bsr.w   WriteBattlesceneScript_DeathMessage
@Return:
                
                rts

    ; End of function CalculateDamage_Spell


; =============== S U B R O U T I N E =======================================

; Miscellaneous hacks to alter spell power (125% if promoted, damage divided if SORC spells)
; 
;       In: A3 = pointer to action type index in RAM
;           A4 = pointer to caster's index in RAM
;           D6 = original spell power
; 
;       Out: D6 = altered spell power


AdjustSpellPower:
                
                movem.l d0-d1/a0,-(sp)
                cmpi.w  #BATTLEACTION_CAST_SPELL,(a3)
                bne.w   @CheckSummon    ; go to next step if action is not a spell
                move.b  (a4),d0
                jsr     GetClass        
                cmpi.b  #CHAR_CLASS_FIRSTPROMOTED,d1
                bcs.w   @CheckSummon    ; go to next step if caster is not promoted
                mulu.w  #5,d6
                lsr.w   #2,d6           ; +25% spell power
@CheckSummon:
                
                move.w  ((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w,d1
                cmpi.w  #SPELL_DAO,d1   ; HARDCODED spell indexes
                beq.w   @DivideSpellPower
                cmpi.w  #SPELL_APOLLO,d1
                beq.w   @DivideSpellPower
                cmpi.w  #SPELL_NEPTUN,d1
                beq.w   @DivideSpellPower
                cmpi.w  #SPELL_ATLAS,d1
                beq.w   @DivideSpellPower
                bra.w   @Done
@DivideSpellPower:
                
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d0
                beq.w   @Done
                andi.w  #$FFFF,d6
                divu.w  d0,d6           ; divide spell power by number of targets
                andi.w  #$FFFF,d6
@Done:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function AdjustSpellPower


; =============== S U B R O U T I N E =======================================


WriteBattlesceneScript_UseItem:
                
                move.w  ((CURRENT_BATTLE_ITEM-$1000000)).w,d1
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d0
                move.w  d0,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3)
                andi.w  #SPELLENTRY_MASK_INDEX,d0
                move.w  d0,((CURRENT_BATTLE_SPELL_INDEX-$1000000)).w
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d0
                lsr.b   #SPELLENTRY_OFFSET_LV,d0
                andi.w  #SPELLENTRY_LOWERMASK_LV,d0
                move.w  d0,((CURRENT_BATTLE_SPELL_LEVEL-$1000000)).w
                bra.w   WriteBattlesceneScript_CastSpell

    ; End of function WriteBattlesceneScript_UseItem


; =============== S U B R O U T I N E =======================================


nullsub_BBE4:
                
                rts

    ; End of function nullsub_BBE4


; =============== S U B R O U T I N E =======================================


WriteBattlesceneScript_BreakUsedItem:
                
                movem.l d0-d3/a0,-(sp)
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.w   @Done           ; skip if action type is not "use item"
                move.w  ((CURRENT_BATTLE_ITEM-$1000000)).w,d1
                jsr     GetEquipmentType
                tst.w   d2
                beq.w   @RemoveItem     ; remove item if neither weapon or ring
                jsr     GetItemDefAddress
                btst    #ITEMTYPE_BIT_BREAKABLE,ITEMDEF_OFFSET_TYPE(a0)
                beq.w   @Done           ; skip if item has no chance to break
                btst    #COMBATANT_BIT_ENEMY,(a4)
                bne.w   @Done           ; skip if user is an enemy
                move.w  ((CURRENT_BATTLE_ITEM-$1000000)).w,d0
                btst    #ITEMENTRY_BIT_BROKEN,d0
                bne.w   @DestroyItem    ; destroy item if already broken
                moveq   #CHANCE_TO_BREAK_USED_ITEM,d0 ; 1/4 chance to break used item
                jsr     (GetRandomOrDebugValue).w
                tst.b   d0
                bne.s   @Skip           ; skip if item does not break
                moveq   #0,d0
                jsr     GetItemBreakMessage(pc)
                nop
                displayMessage d3,d1,#0,#0 ; Message, Combatant, Item or Spell, Number
                move.b  (a4),d0
                move.w  6(a3),d1
                jsr     BreakItem       
@Skip:
                
                bra.w   @Done
@DestroyItem:
                
                moveq   #1,d0
                jsr     GetItemBreakMessage(pc)
                nop
                displayMessage d3,d1,#0,#0 ; Message, Combatant, Item or Spell, Number
                move.b  (a4),d0
                move.w  6(a3),d1
                jsr     RemoveItemBySlot
                bra.w   @Done
@RemoveItem:
                
                move.b  (a4),d0
                move.w  6(a3),d1
                jsr     RemoveItemBySlot
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function WriteBattlesceneScript_BreakUsedItem


; =============== S U B R O U T I N E =======================================

; In: A2 = battlescene script stack frame
;     D0 = whether item is already damaged (0=no, 1=yes)
; 
; Out: D3 = message index

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

GetItemBreakMessage:
                
                movem.l d0/a0,-(sp)
                tst.b   d0
                bne.s   loc_BCB4
                tst.b   dodge(a2)
                bne.s   loc_BCAE        
loc_BCA8:
                
                move.w  #MESSAGE_BATTLE_USED_ITEM_HIT_AND_BROKEN_START,d3 
                                                        ; But smoke rose from{N}the {ITEM}.{D1}
                bra.s   loc_BCB2
loc_BCAE:
                
                move.w  #MESSAGE_BATTLE_USED_ITEM_MISS_AND_BROKEN_START,d3 
                                                        ; And smoke emerged from{N}the {ITEM}.{D1}
loc_BCB2:
                
                bra.s   loc_BCC4
loc_BCB4:
                
                tst.b   dodge(a2)
                bne.s   loc_BCC0        
                move.w  #MESSAGE_BATTLE_USED_ITEM_HIT_AND_DESTROYED_START,d3 
                                                        ; But, the {ITEM}{N}burst into flames.
                bra.s   loc_BCC4
loc_BCC0:
                
                move.w  #MESSAGE_BATTLE_USED_ITEM_MISS_AND_DESTROYED_START,d3 
                                                        ; And the {ITEM}{N}burst into flames.
loc_BCC4:
                
                move.w  ((CURRENT_BATTLE_ITEM-$1000000)).w,d0
                andi.w  #ITEMENTRY_MASK_INDEX,d0
                lea     tbl_ItemBreakMessages(pc), a0
loc_BCD0:
                
                cmpi.w  #CODE_TERMINATOR_WORD,(a0)
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

