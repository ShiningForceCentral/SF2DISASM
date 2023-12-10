
; ASM FILE code\gameflow\battle\battleactions\determinedodge-standard.asm :
;

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     a4 = pointer to actor index in RAM
;     a5 = pointer to target index in RAM

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

battlesceneScript_DetermineDodge:
                
                tst.b   debugDodge(a2)
                bne.s   @Success    ; always dodge if dodge debug flag is set
                
                ; Is target stunned or asleep?
                move.b  (a5),d0
                bsr.w   GetStatusEffects
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_SLEEP,d1
                bne.w   @Return     ; never dodge if true
                
                ; Is attacker muddled?
                move.w  #CHANCE_TO_DODGE_FOR_MUDDLED_ATTACKER,d2    ; 1/2 chance to dodge if attacker is muddled
                move.b  (a4),d0
                bsr.w   GetStatusEffects
                andi.w  #STATUSEFFECT_MUDDLE,d1
                bne.s   @DetermineDodge
                
                move.l  a0,-(sp)
                moveq   #0,d2       ; zero property bytes
                
                ; Is target airborne? (i.e., either flying or hovering)
                lea     table_AirborneMovetypes(pc), a0
                move.b  (a5),d0
                bsr.w   GetMoveType
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @DefaultChance
                
                ; Is attacker an archer?
                lea     table_ArcherMovetypes(pc), a0
                move.b  (a4),d0
                bsr.w   GetMoveType
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcc.s   @DefaultChance
                
                moveq   #CHANCE_TO_DODGE_FOR_AIRBORNE_TARGET,d2 ; 1/8 chance to dodge if target is airborne and attacker is not an archer
                bra.s   @Done
                
@DefaultChance: moveq   #CHANCE_TO_DODGE_DEFAULT,d2             ; 1/32 chance to dodge otherwise
@Done:          movea.l (sp)+,a0

@DetermineDodge:
            if (STANDARD_BUILD&AGILITY_AFFECTS_CHANCE_TO_DODGE=1)
                ; Adjust chance to dodge for AGI
                move.b  (a4),d0
                bsr.w   GetCurrentAGI
                andi.w  #TURN_AGILITY_MASK,d1
                move.w  d1,d4                   ; d4.w = attacker's AGI
                move.b  (a5),d0
                bsr.w   GetCurrentAGI
                andi.w  #TURN_AGILITY_MASK,d1   ; d1.w = target's AGI
                lsl.w   #8,d1                   
                divu.w  d4,d1
                mulu.w  d1,d2
                lsr.w   #8,d2                   ; d2.w = newDodge = (baseDodge * ((targetAgi * 256) / attackerAgi)) / 256
            endif
                
                ; Determine dodge
                move.w  #256,d0
                jsr     (GenerateRandomOrDebugNumber).w
                cmp.w   d2,d0
                bhs.s   @Return
                
                ; Successfully dodge
@Success:       move.w  #-1,d4
                move.w  #1,d5
                exg     a4,a5
                bsr.w   battlesceneScript_AnimateAction
                displayMessage #MESSAGE_BATTLE_DODGE,(a4),#0,#0 ; Message, Combatant, Item or Spell, Number
                bsr.w   battlesceneScript_MakeActorIdle
                exg     a4,a5
                st      dodge(a2)
@Return:        rts

    ; End of function battlesceneScript_DetermineDodge

