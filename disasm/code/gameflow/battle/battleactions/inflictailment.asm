
; ASM FILE code\gameflow\battle\battleactions\inflictailment.asm :
; 0xAE32..0xAF70 : Write Battlescene Command : Inflict Ailment function

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

