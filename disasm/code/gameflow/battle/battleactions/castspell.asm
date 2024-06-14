
; ASM FILE code\gameflow\battle\battleactions\castspell.asm :
; 0xB0A8..0xBB02 : Write Battlescene Script : Cast Spell

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     a3 = battleaction data pointer
;     a4 = actor index pointer
;     a5 = target index pointer


battlesceneScript_CastSpell:
                
                move.b  (a5),d0
                move.w  ((BATTLESCENE_SPELL_INDEX-$1000000)).w,d1
                bsr.w   GetResistanceToSpell
                add.w   d1,d1
                move.w  rjt_SpellEffects(pc,d1.w),d1
                jmp     rjt_SpellEffects(pc,d1.w)

    ; End of function battlesceneScript_CastSpell

rjt_SpellEffects:
                dc.w spellEffect_Heal-rjt_SpellEffects ; HEAL
                dc.w spellEffect_Heal-rjt_SpellEffects ; AURA
                dc.w spellEffect_Detox-rjt_SpellEffects ; DETOX
                dc.w spellEffect_Boost-rjt_SpellEffects ; BOOST
                dc.w spellEffect_Slow-rjt_SpellEffects ; SLOW
                dc.w spellEffect_Attack-rjt_SpellEffects ; ATTACK
                dc.w spellEffect_Dispel-rjt_SpellEffects ; DISPEL
                dc.w spellEffect_Muddle-rjt_SpellEffects ; MUDDLE
                dc.w spellEffect_Desoul-rjt_SpellEffects ; DESOUL
                dc.w spellEffect_Sleep-rjt_SpellEffects ; SLEEP
                dc.w spellEffect_None-rjt_SpellEffects ; EGRESS
                dc.w spellEffect_Blaze-rjt_SpellEffects ; BLAZE
                dc.w spellEffect_Freeze-rjt_SpellEffects ; FREEZE
                dc.w spellEffect_Bolt-rjt_SpellEffects ; BOLT
                dc.w spellEffect_Blast-rjt_SpellEffects ; BLAST
                dc.w spellEffect_AbsorbMp-rjt_SpellEffects ; SPOIT
                dc.w spellEffect_Heal-rjt_SpellEffects ; HEALIN
                dc.w spellEffect_FlameBreath-rjt_SpellEffects ; FLAME
                dc.w spellEffect_Freeze-rjt_SpellEffects ; SNOW
                dc.w spellEffect_DemonBreath-rjt_SpellEffects ; DEMON
                dc.w spellEffect_PowerWater-rjt_SpellEffects ; POWER
                dc.w spellEffect_ProtectMilk-rjt_SpellEffects ; GUARD
                dc.w spellEffect_QuickChicken-rjt_SpellEffects ; SPEED
                dc.w spellEffect_RunningPimento-rjt_SpellEffects ; IDATEN
                dc.w spellEffect_CheerfulBread-rjt_SpellEffects ; HEALTH
                dc.w spellEffect_None-rjt_SpellEffects ; B.ROCK
                dc.w spellEffect_None-rjt_SpellEffects ; LASER
                dc.w spellEffect_Blaze-rjt_SpellEffects ; KATON
                dc.w spellEffect_Bolt-rjt_SpellEffects ; RAIJIN
                dc.w spellEffect_Blast-rjt_SpellEffects ; DAO
                dc.w spellEffect_Blaze-rjt_SpellEffects ; APOLLO
                dc.w spellEffect_Neptun-rjt_SpellEffects ; NEPTUN
                dc.w spellEffect_Bolt-rjt_SpellEffects ; ATLAS
                dc.w spellEffect_Detox-rjt_SpellEffects ; POWDER
                dc.w spellEffect_FairyTear-rjt_SpellEffects ; G.TEAR
                dc.w spellEffect_BrightHoney-rjt_SpellEffects ; HANNY
                dc.w spellEffect_BraveApple-rjt_SpellEffects ; BRAVE
                dc.w spellEffect_Blaze-rjt_SpellEffects ; F.BALL
                dc.w spellEffect_Freeze-rjt_SpellEffects ; BREZAD
                dc.w spellEffect_Bolt-rjt_SpellEffects ; THUNDR
                dc.w spellEffect_BubbleBreath-rjt_SpellEffects ; AQUA
                dc.w spellEffect_FlameBreath-rjt_SpellEffects ; KIWI
                dc.w spellEffect_FairyTear-rjt_SpellEffects ; SHINE
                dc.w spellEffect_Bolt-rjt_SpellEffects ; ODDEYE
            if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
                dc.w spellEffect_None-rjt_SpellEffects       ; spell44
                dc.w spellEffect_None-rjt_SpellEffects       ; spell45
                dc.w spellEffect_None-rjt_SpellEffects       ; spell46
                dc.w spellEffect_None-rjt_SpellEffects       ; spell47
                dc.w spellEffect_None-rjt_SpellEffects       ; spell48
                dc.w spellEffect_None-rjt_SpellEffects       ; spell49
                dc.w spellEffect_None-rjt_SpellEffects       ; spell50
                dc.w spellEffect_None-rjt_SpellEffects       ; spell51
                dc.w spellEffect_None-rjt_SpellEffects       ; spell52
                dc.w spellEffect_None-rjt_SpellEffects       ; spell53
                dc.w spellEffect_None-rjt_SpellEffects       ; spell54
                dc.w spellEffect_None-rjt_SpellEffects       ; spell55
                dc.w spellEffect_None-rjt_SpellEffects       ; spell56
                dc.w spellEffect_None-rjt_SpellEffects       ; spell57
                dc.w spellEffect_None-rjt_SpellEffects       ; spell58
                dc.w spellEffect_None-rjt_SpellEffects       ; spell59
                dc.w spellEffect_None-rjt_SpellEffects       ; spell60
                dc.w spellEffect_None-rjt_SpellEffects       ; spell61
                dc.w spellEffect_None-rjt_SpellEffects       ; spell62
            endif

; =============== S U B R O U T I N E =======================================


spellEffect_Heal:
                
                module
                move.b  (a5),d0
                jsr     GetMaxHp
                move.w  d1,d2
                jsr     GetCurrentHp
                sub.w   d1,d2           ; D2 = target's missing HP
                move.w  BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3),d1
                jsr     FindSpellDefAddress
                clr.w   d6
                move.b  SPELLDEF_OFFSET_POWER(a0),d6
                cmpi.b  #255,d6
                bne.s   @Continue
                move.w  d2,d6
                bra.s   @CapRecovery    ; if spell power = 255, full recovery
@Continue:
                
                bsr.w   AdjustSpellPower
@CapRecovery:
                
                cmp.w   d6,d2           ; cap recovery amount if missing HP is lower than spell power
                bcc.s   @WriteScriptCommands
                move.w  d2,d6
@WriteScriptCommands:
                
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B16A       
                executeAllyReaction d6,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   byte_B17A
byte_B16A:
                
                executeEnemyReaction d6,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
byte_B17A:
                
                displayMessage #MESSAGE_BATTLE_RECOVERED_HIT_POINTS,d0,#0,d6 
                                                        ; Message, Combatant, Item or Spell, Number
                bsr.w   battlesceneScript_CalculateHealingExp
                rts

    ; End of function spellEffect_Heal

                modend

; =============== S U B R O U T I N E =======================================


spellEffect_Detox:
                
                module
                move.b  (a5),d0
                jsr     GetStatusEffects
                clr.b   d2
                tst.w   ((BATTLESCENE_SPELL_LEVEL-$1000000)).w
                cmpi.w  #0,((BATTLESCENE_SPELL_LEVEL-$1000000)).w ; useless compare instruction
                beq.w   @CurePoison     ; if spell level 1, cure Poison
                                        ; else if spell level 2, cure Poison and Stun 
                                        ; otherwise, cure Poison, Stun, and Curse
                cmpi.w  #1,((BATTLESCENE_SPELL_LEVEL-$1000000)).w
                
                ; Cure Curse
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
                beq.s   @CheckIfAnyStatusEffectWasCured
                ori.b   #1,d2           ; D2 = bit 0 set if poison was cured
@CheckIfAnyStatusEffectWasCured:
                
                tst.b   d2
                beq.w   @Ineffective
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B1F4
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @GiveEXP
byte_B1F4:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@GiveEXP:
                
                bsr.w   battlesceneScript_AddStatusEffectSpellExp
                
                ; Check if Poison was cured
                btst    #0,d2
                beq.s   @CheckIfStunWasCured
                displayMessage #MESSAGE_BATTLE_IS_NO_LONGER_POISONED,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
@CheckIfStunWasCured:
                
                btst    #1,d2
                beq.s   @CheckIfCurseWasCured
                displayMessage #MESSAGE_BATTLE_IS_NO_LONGER_STUNNED,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
@CheckIfCurseWasCured:
                
                btst    #2,d2
                beq.s   @Skip
                displayMessage #MESSAGE_BATTLE_IS_NO_LONGER_CURSED,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                jsr     UnequipAllItemsIfNotCursed
@Skip:
                
                bra.s   @UpdateStatusEffects
@Ineffective:
                
                moveq   #8,d2
                bsr.w   battlesceneScript_DetermineSpellEffectiveness
@UpdateStatusEffects:
                
                move.b  (a5),d0
                jsr     SetStatusEffects
                jsr     ApplyStatusEffectsAndItemsOnStats
                rts

    ; End of function spellEffect_Detox

                modend

; =============== S U B R O U T I N E =======================================


spellEffect_Boost:
                
                module
                move.b  (a5),d0
                jsr     GetStatusEffects
                move.w  d1,d3
                ori.w   #STATUSEFFECT_BOOST,d1
                jsr     SetStatusEffects
                andi.w  #STATUSEFFECT_BOOST,d3
            if (STANDARD_BUILD&SPELLS_REFRESH_STATUS_COUNTERS=1)
                cmpi.w  #STATUSEFFECT_BOOST,d3 ; check if status counter is already at max value
            endif
                beq.s   @WriteScriptCommands
                moveq   #8,d2
                bsr.w   battlesceneScript_DetermineSpellEffectiveness
@WriteScriptCommands:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B2B6
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
byte_B2B6:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                bsr.w   battlesceneScript_AddStatusEffectSpellExp
                jsr     GetBaseAgi
            if (STANDARD_BUILD&SPELLS_REFRESH_STATUS_COUNTERS=1)
                move.w  d1,d2
            endif
                mulu.w  #3,d1
                lsr.l   #3,d1
            if (STANDARD_BUILD&SPELLS_REFRESH_STATUS_COUNTERS=1)
                rol.w   #4,d3           ; calculate difference between full and current BOOST increase values
                mulu.w  d3,d2
                lsr.l   #3,d2
                sub.w   d2,d1
            endif
                displayMessage #MESSAGE_BATTLE_BOOST_SPELL_AGI_INCREASE,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
                jsr     GetBaseDef
            if (STANDARD_BUILD&SPELLS_REFRESH_STATUS_COUNTERS=1)
                move.w  d1,d2
            endif
                mulu.w  #3,d1
                lsr.l   #3,d1
            if (STANDARD_BUILD&SPELLS_REFRESH_STATUS_COUNTERS=1)
                mulu.w  d3,d2
                lsr.l   #3,d2
                sub.w   d2,d1
            endif
                displayMessage #MESSAGE_BATTLE_BOOST_SPELL_DEF_INCREASE,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
                rts

    ; End of function spellEffect_Boost

                modend

; =============== S U B R O U T I N E =======================================

; In: d2.w = target's resistance setting


spellEffect_Slow:
                
                module
                tst.w   d2
                beq.s   @Skip
                addq.w  #CHANCE_TO_INFLICT_SLOW,d2 ; 3/8 base chance to inflict slow
@Skip:
                
                bsr.w   battlesceneScript_DetermineSpellEffectiveness
                jsr     GetStatusEffects
                move.w  d1,d3
                ori.w   #STATUSEFFECT_SLOW,d1
                jsr     SetStatusEffects
                andi.w  #STATUSEFFECT_SLOW,d3
            if (STANDARD_BUILD&SPELLS_REFRESH_STATUS_COUNTERS=1)
                cmpi.w  #STATUSEFFECT_SLOW,d3 ; check if status counter is already at max value
            endif
                beq.s   @WriteScriptCommands
                moveq   #8,d2
                bsr.w   battlesceneScript_DetermineSpellEffectiveness
@WriteScriptCommands:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B350       ; @Reaction_Enemy
                executeAllyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @GiveEXP
byte_B350:
                
                @Reaction_Enemy:
                executeEnemyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@GiveEXP:
                
                bsr.w   battlesceneScript_AddStatusEffectSpellExp
battlesceneScript_DisplaySlowMessages:
                
                jsr     GetBaseAgi
            if (STANDARD_BUILD&SPELLS_REFRESH_STATUS_COUNTERS=1)
                move.w  d1,d2
            endif
                mulu.w  #3,d1
                lsr.l   #3,d1
            if (STANDARD_BUILD&SPELLS_REFRESH_STATUS_COUNTERS=1)
                rol.w   #6,d3           ; calculate difference between full and current SLOW increase values
                mulu.w  d3,d2
                lsr.l   #3,d2
                sub.w   d2,d1
            endif
                displayMessage #MESSAGE_BATTLE_AGILITY_DECREASED_BY,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
                jsr     GetBaseDef
            if (STANDARD_BUILD&SPELLS_REFRESH_STATUS_COUNTERS=1)
                move.w  d1,d2
            endif
                mulu.w  #3,d1
                lsr.l   #3,d1
            if (STANDARD_BUILD&SPELLS_REFRESH_STATUS_COUNTERS=1)
                mulu.w  d3,d2
                lsr.l   #3,d2
                sub.w   d2,d1
            endif
                displayMessage #MESSAGE_BATTLE_DEFENSE_DECREASED_BY,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
                rts

    ; End of function spellEffect_Slow

                modend

; =============== S U B R O U T I N E =======================================


spellEffect_Attack:
                
                module
                move.b  (a5),d0
                jsr     GetStatusEffects
                move.w  d1,d3
                ori.w   #STATUSEFFECT_ATTACK,d1
                jsr     SetStatusEffects
                andi.w  #STATUSEFFECT_ATTACK,d3
            if (STANDARD_BUILD&SPELLS_REFRESH_STATUS_COUNTERS=1)
                cmpi.w  #STATUSEFFECT_ATTACK,d3 ; check if status counter is already at max value
            endif
                beq.s   @WriteScriptCommands
                moveq   #8,d2
                bsr.w   battlesceneScript_DetermineSpellEffectiveness
@WriteScriptCommands:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B3E2       
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
byte_B3E2:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                bsr.w   battlesceneScript_AddStatusEffectSpellExp
                jsr     GetBaseAtt
            if (STANDARD_BUILD&SPELLS_REFRESH_STATUS_COUNTERS=1)
                move.w  d1,d2
            endif
                mulu.w  #3,d1
                lsr.l   #3,d1
            if (STANDARD_BUILD&SPELLS_REFRESH_STATUS_COUNTERS=1)
                rol.w   #2,d3           ; calculate difference between full and current ATTACK increase values
                mulu.w  d3,d2
                lsr.l   #3,d2
                sub.w   d2,d1
            endif
                displayMessage #MESSAGE_BATTLE_ATTACK_SPELL_EFFECT,d0,#0,d1 
                                                        ; Message, Combatant, Item or Spell, Number
                rts

    ; End of function spellEffect_Attack

                modend

; =============== S U B R O U T I N E =======================================

; In: d2.w = target's resistance setting


spellEffect_Dispel:
                
                module
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
                bsr.w   battlesceneScript_DetermineSpellEffectiveness
                jsr     GetStatusEffects
                ori.w   #STATUSEFFECT_SILENCE,d1
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B45A
                executeAllyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
byte_B45A:
                
                executeEnemyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                bsr.w   battlesceneScript_AddStatusEffectSpellExp
                displayMessage #MESSAGE_BATTLE_HAS_BEEN_SILENCED,d0,#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                rts

    ; End of function spellEffect_Dispel

                modend

; =============== S U B R O U T I N E =======================================

; In: d2.w = target's resistance setting


spellEffect_Muddle:
                
                module
                move.b  (a5),d0
                tst.w   ((BATTLESCENE_SPELL_LEVEL-$1000000)).w
                beq.w   @Muddle1        
                addq.w  #CHANCE_TO_INFLICT_MUDDLE2,d2 ; 3/8 base chance to inflict muddle 2
                bsr.w   battlesceneScript_DetermineSpellEffectiveness
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
                
                bsr.w   battlesceneScript_DetermineSpellEffectiveness
                jsr     GetStatusEffects
                ori.w   #STATUSEFFECT_MUDDLE,d1
                move.w  #MESSAGE_BATTLE_IS_IN_A_DEEP_HAZE,d2
@WriteScriptCommands:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B4EA
                executeAllyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
byte_B4EA:
                
                executeEnemyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                bsr.w   battlesceneScript_AddStatusEffectSpellExp
                displayMessage d2,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                rts

    ; End of function spellEffect_Muddle

                modend

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     d2.w = target's resistance setting

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

spellEffect_Desoul:
                
                module
                addq.w  #CHANCE_TO_INFLICT_DESOUL,d2 ; 3/8 base chance to inflict desoul
                bsr.w   battlesceneScript_DetermineSpellEffectiveness
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B53C
                executeAllyReaction #$8000,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @DetermineBattleMessage
byte_B53C:
                
                executeEnemyReaction #$8000,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@DetermineBattleMessage:
                
                bsr.w   battlesceneScript_AddExpAndGoldForKill
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyMessage
                move.w  #MESSAGE_BATTLE_SOUL_WAS_STOLEN_ALLY,d2 ; ally message
                bra.s   byte_B562
@EnemyMessage:
                
                move.w  #MESSAGE_BATTLE_SOUL_WAS_STOLEN_ENEMY,d2
byte_B562:
                
                displayMessage d2,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                move.b  #-1,targetDies(a2)
                rts

    ; End of function spellEffect_Desoul

                modend

; =============== S U B R O U T I N E =======================================

; In: d2.w = target's resistance setting


spellEffect_Sleep:
                
                module
                addq.w  #CHANCE_TO_INFLICT_SLEEP,d2 ; 3/8 base chance to inflict sleep
                bsr.w   battlesceneScript_DetermineSpellEffectiveness
                jsr     GetStatusEffects
                ori.w   #STATUSEFFECT_SLEEP,d1
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B5A8
                executeAllyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
byte_B5A8:
                
                executeEnemyReaction #0,#0,d1,#1 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                bsr.w   battlesceneScript_AddStatusEffectSpellExp
                displayMessage #MESSAGE_BATTLE_FELL_ASLEEP,d0,#0,#0 ; Message, Combatant, Item or Spell, Number
                rts

    ; End of function spellEffect_Sleep

                modend

; =============== S U B R O U T I N E =======================================


spellEffect_AbsorbMp:
                
                module
                move.b  (a5),d0
                jsr     GetCurrentMp
                moveq   #3,d0
                jsr     (GenerateRandomOrDebugNumber).w
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
                bne.s   byte_B642
                executeAllyReaction #0,d2,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @DetermineMessage
byte_B642:
                
                executeEnemyReaction #0,d2,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@DetermineMessage:
                
                bsr.w   battlesceneScript_AddStatusEffectSpellExp
                bscCloseDialogueWindow
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @EnemyMessage
                move.w  #MESSAGE_BATTLE_ABSORBED_MAGIC_POINTS,d1 ; ally message
                bra.s   byte_B66C
@EnemyMessage:
                
                move.b  (a5),d0
                move.w  #MESSAGE_BATTLE_MP_WAS_DRAINED_BY,d1
byte_B66C:
                
                displayMessage d1,d0,#0,d2 ; Message, Combatant, Item or Spell, Number
                rts

    ; End of function spellEffect_AbsorbMp

                modend

; =============== S U B R O U T I N E =======================================


spellEffect_PowerWater:
                
                module
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B6A2
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @Continue
byte_B6A2:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@Continue:
                
                moveq   #3,d0
                jsr     (GenerateRandomOrDebugNumber).w
                addq.w  #2,d0
                displayMessage #MESSAGE_BATTLE_ATTACK_POWER_IS_BOOSTED_BY,(a5),#0,d0 
                                                        ; Message, Combatant, Item or Spell, Number
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseBaseAtt
                jsr     ApplyStatusEffectsAndItemsOnStats
                rts

    ; End of function spellEffect_PowerWater

                modend

; =============== S U B R O U T I N E =======================================


spellEffect_ProtectMilk:
                
                module
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B708
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
byte_B708:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                moveq   #3,d0
                jsr     (GenerateRandomOrDebugNumber).w
                addq.w  #2,d0
                displayMessage #MESSAGE_BATTLE_DEFENSIVE_POWER_IS_BOOSTED_BY,(a5),#0,d0 
                                                        ; Message, Combatant, Item or Spell, Number
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseBaseDef
                jsr     ApplyStatusEffectsAndItemsOnStats
                rts

    ; End of function spellEffect_ProtectMilk

                modend

; =============== S U B R O U T I N E =======================================


spellEffect_QuickChicken:
                
                module
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B76E
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
byte_B76E:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                moveq   #3,d0
                jsr     (GenerateRandomOrDebugNumber).w
                addq.w  #2,d0
                displayMessage #MESSAGE_BATTLE_AGILITY_IS_BOOSTED_BY,(a5),#0,d0 
                                                        ; Message, Combatant, Item or Spell, Number
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseBaseAgi
                jsr     ApplyStatusEffectsAndItemsOnStats
                rts

    ; End of function spellEffect_QuickChicken

                modend

; =============== S U B R O U T I N E =======================================


spellEffect_RunningPimento:
                
                module
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B7D4
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @DetermineIncreaseValue
byte_B7D4:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@DetermineIncreaseValue:
                
                jsr     GetBaseMov
                clr.w   d2
                cmpi.b  #9,d1
                beq.w   byte_B802
                moveq   #1,d2
                cmpi.b  #8,d1
                beq.w   byte_B802
                moveq   #2,d2
byte_B802:
                
                displayMessage #MESSAGE_BATTLE_MOVEMENT_RANGE_IS_ENLARGED_BY,d0,#0,d2 
                                                        ; Message, Combatant, Item or Spell, Number
                move.w  d2,d1
                jsr     IncreaseBaseMov
                jsr     ApplyStatusEffectsAndItemsOnStats
                rts

    ; End of function spellEffect_RunningPimento

                modend

; =============== S U B R O U T I N E =======================================


spellEffect_CheerfulBread:
                
                module
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B848       ; @Reaction_Enemy
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @Message
byte_B848:
                
                @Reaction_Enemy:
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@Message:
                
                moveq   #3,d0
                jsr     (GenerateRandomOrDebugNumber).w
                addq.w  #2,d0
                displayMessage #MESSAGE_BATTLE_MAX_HP_ARE_RAISED_BY,(a5),#0,d0 
                                                        ; Message, Combatant, Item or Spell, Number
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseMaxHp
                rts

    ; End of function spellEffect_CheerfulBread

                modend

; =============== S U B R O U T I N E =======================================


spellEffect_BrightHoney:
                
                module
                move.b  (a5),d0
                jsr     GetMaxMp
                tst.w   d1
                bne.s   @TargetHasMP
                moveq   #8,d2
                bsr.w   battlesceneScript_DetermineSpellEffectiveness
@TargetHasMP:
                
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B8BA
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
byte_B8BA:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                moveq   #3,d0
                jsr     (GenerateRandomOrDebugNumber).w
                addq.w  #2,d0
                displayMessage #MESSAGE_BATTLE_MAX_MP_ARE_RAISED_BY,(a5),#0,d0 
                                                        ; Message, Combatant, Item or Spell, Number
                move.w  d0,d1
                move.b  (a5),d0
                jsr     IncreaseMaxMp
                rts

    ; End of function spellEffect_BrightHoney

                modend

; =============== S U B R O U T I N E =======================================


spellEffect_BraveApple:
                
                module
                move.b  (a5),d0
                moveq   #0,d1
                jsr     SetCurrentExp
                jsr     LevelUp         
                lea     ((LEVELUP_ARGUMENTS-$1000000)).w,a1
                cmpi.b  #-1,(a1)        ; check if target is able to level up
                bne.s   @AbleToLevelUp
                moveq   #8,d2
                bsr.w   battlesceneScript_DetermineSpellEffectiveness
@AbleToLevelUp:
                
                move.b  (a5),d0
                jsr     GetStatusEffects
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   byte_B93A
                executeAllyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   @BattleMessage
byte_B93A:
                
                executeEnemyReaction #0,#0,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
@BattleMessage:
                
                clr.l   d1
                move.b  (a1)+,d1
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
                cmpi.b  #-1,d1
                beq.s   @Return
                
                move.w  d1,d2
                andi.w  #SPELLENTRY_MASK_INDEX,d2
                lsr.w   #SPELLENTRY_OFFSET_LV,d1
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

    ; End of function spellEffect_BraveApple

                modend

; =============== S U B R O U T I N E =======================================


spellEffect_FairyTear:
                
                module
                move.b  (a5),d0
                jsr     GetMaxMp
                move.w  d1,d2
                jsr     GetCurrentMp
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
                bne.s   byte_BA6C
                executeAllyReaction #0,d6,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
                bra.s   byte_BA7C
byte_BA6C:
                
                executeEnemyReaction #0,d6,d1,#2 ; HP change (signed), MP change (signed), Status Effects, Flags
byte_BA7C:
                
                displayMessage #MESSAGE_BATTLE_RECOVERED_MAGIC_POINTS,d0,#0,d6 
                                                        ; Message, Combatant, Item or Spell, Number
                bsr.w   battlesceneScript_CalculateHealingExp
                rts

    ; End of function spellEffect_FairyTear

                modend

; =============== S U B R O U T I N E =======================================


spellEffect_None:
                
                rts

    ; End of function spellEffect_None


; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     d2.w = resistance setting (0=none, 1=minor, 2=major, 3=immunity)

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

battlesceneScript_DetermineSpellEffectiveness:
                
                move.l  d0,-(sp)
                tst.b   debugDodge(a2)
                beq.s   @DetermineSuccess
                moveq   #8,d2
@DetermineSuccess:
                
                moveq   #8,d0
                jsr     (GenerateRandomOrDebugNumber).w
                cmp.w   d2,d0
                bcc.s   @Success
                displayMessage #MESSAGE_BATTLE_THE_SPELL_HAS_NO_EFFECT,(a5),#0,#0 
                                                        ; Message, Combatant, Item or Spell, Number
                move.b  #-1,dodge(a2)
                move.l  (sp)+,d0
                move.l  (sp)+,d0
                rts
@Success:
                
                move.l  (sp)+,d0
                rts

    ; End of function battlesceneScript_DetermineSpellEffectiveness


; =============== S U B R O U T I N E =======================================


spellEffect_FlameBreath:
                
                moveq   #CHANCE_TO_CRITICAL_FLAME_BREATH,d3 ; 1/16 chance to critical hit
                bra.w   battlesceneScript_CalculateSpellDamage

    ; End of function spellEffect_FlameBreath


; =============== S U B R O U T I N E =======================================


spellEffect_Blaze:
                
                moveq   #CHANCE_TO_CRITICAL_BLAZE,d3 ; 1/32 chance to critical hit
                bra.w   battlesceneScript_CalculateSpellDamage

    ; End of function spellEffect_Blaze


; =============== S U B R O U T I N E =======================================


spellEffect_Freeze:
                
                moveq   #CHANCE_TO_CRITICAL_FREEZE,d3 ; 1/32 chance to critical hit
                bra.w   battlesceneScript_CalculateSpellDamage

    ; End of function spellEffect_Freeze


; =============== S U B R O U T I N E =======================================


spellEffect_Neptun:
                
                moveq   #CHANCE_TO_CRITICAL_NEPTUN,d3 ; 1/16 chance to critical hit
                bra.w   battlesceneScript_CalculateSpellDamage

    ; End of function spellEffect_Neptun


; =============== S U B R O U T I N E =======================================


spellEffect_BubbleBreath:
                
                moveq   #CHANCE_TO_CRITICAL_BUBBLE_BREATH,d3 ; 1/8 chance to critical hit
                bra.w   battlesceneScript_CalculateSpellDamage

    ; End of function spellEffect_BubbleBreath


; =============== S U B R O U T I N E =======================================


spellEffect_Bolt:
                
                moveq   #CHANCE_TO_CRITICAL_BOLT,d3 ; 1/8 chance to critical hit
                bra.w   battlesceneScript_CalculateSpellDamage

    ; End of function spellEffect_Bolt


; =============== S U B R O U T I N E =======================================


spellEffect_Blast:
                
                moveq   #CHANCE_TO_CRITICAL_BLAST,d3 ; 1/32 chance to critical hit
                bra.w   battlesceneScript_CalculateSpellDamage

    ; End of function spellEffect_Blast


; =============== S U B R O U T I N E =======================================


spellEffect_DemonBreath:
                
                moveq   #CHANCE_TO_CRITICAL_DEMON_BREATH,d3 ; no chance to critical hit

    ; End of function spellEffect_DemonBreath

