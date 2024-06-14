
; ASM FILE code\gameflow\battle\battleactions\inflictcursedamage.asm :
; 0xAF70..0xB00E : Write Battlescene Command : Inflict Curse Damage function

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
