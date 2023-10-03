
; ASM FILE code\gameflow\battle\battleactions\determinedodge.asm :
; 0xAAFC..0xABBE : Determine dodge function

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     a4 = attacker index pointer
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

battlesceneScript_DetermineDodge:
                
                move.b  (a5),d0
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_SLEEP,d1
                bne.w   @Return
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_STUN,d1
                bne.w   @Return
                moveq   #CHANCE_TO_DODGE_FOR_MUDDLED_ATTACKER,d2 ; 1/2 chance to dodge if attacker is muddled
                move.b  (a4),d0
                jsr     GetStatusEffects
                andi.w  #STATUSEFFECT_MUDDLE,d1
                bne.w   @CheckDebugDodge
                moveq   #CHANCE_TO_DODGE_DEFAULT,d2 ; 1/32 chance to dodge otherwise
                
                ; Check if target is either flying or hovering
                move.b  (a5),d0
                jsr     GetMoveType     
                cmpi.w  #MOVETYPE_LOWER_FLYING,d1 ; HARDCODED airborne movetypes
                beq.w   @CheckIfAttackerIsAnArcher
                cmpi.w  #MOVETYPE_LOWER_HOVERING,d1
                beq.w   @CheckIfAttackerIsAnArcher
                bra.w   @CheckDebugDodge
@CheckIfAttackerIsAnArcher:
                
                move.b  (a4),d0
                jsr     GetMoveType     
                cmpi.w  #MOVETYPE_LOWER_BRASS_GUNNER,d1 ; HARDCODED archer movetypes
                beq.w   @CheckDebugDodge
                cmpi.w  #MOVETYPE_LOWER_ARCHER,d1
                beq.w   @CheckDebugDodge
                cmpi.w  #MOVETYPE_LOWER_CENTAUR_ARCHER,d1
                beq.w   @CheckDebugDodge
                cmpi.w  #MOVETYPE_LOWER_STEALTH_ARCHER,d1
                beq.w   @CheckDebugDodge
                moveq   #CHANCE_TO_DODGE_FOR_AIRBORNE_TARGET,d2 ; 1/8 chance to dodge if target is flying or hovering, and if attacker is not an archer
@CheckDebugDodge:
                
                tst.b   debugDodge(a2)
                beq.s   @DetermineDodge
                moveq   #0,d2
@DetermineDodge:
                
                move.w  d2,d0
                jsr     (GenerateRandomOrDebugNumber).w
                tst.w   d0
                bne.w   @Return
                move.w  #-1,d4
                move.w  #1,d5
                exg     a4,a5
                bsr.w   battlesceneScript_AnimateAction
                displayMessage #MESSAGE_BATTLE_DODGE,(a4),#0,#0 ; Message, Combatant, Item or Spell, Number
                bsr.w   battlesceneScript_MakeActorIdle
                exg     a4,a5
                move.b  #-1,dodge(a2)
@Return:
                
                rts

    ; End of function battlesceneScript_DetermineDodge

