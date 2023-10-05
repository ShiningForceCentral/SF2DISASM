
; ASM FILE code\gameflow\battle\battleactions\attack.asm :
; 0xAAB6..0xAAFC : Write Battlescene Script : Attack

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     a4 = pointer to attacker index in RAM
;     a5 = pointer to target index in RAM

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

battlesceneScript_Attack:
                
                bsr.w   battlesceneScript_DetermineDodge
                tst.b   dodge(a2)
                bne.w   @DoubleAndCounter
                bsr.w   battlesceneScript_CalculateDamage
                bsr.w   battlesceneScript_DetermineCriticalHit
                bsr.w   battlesceneScript_InflictDamage
                tst.b   targetDies(a2)
                beq.s   @Continue
                bsr.w   battlesceneScript_DisplayDeathMessage
                bra.w   @Return
@Continue:
                
                bsr.w   battlesceneScript_InflictAilment
                bsr.w   battlesceneScript_InflictCurseDamage
                tst.b   targetDies(a2)
                beq.s   @DoubleAndCounter
                exg     a4,a5
                bsr.w   battlesceneScript_DisplayDeathMessage
                exg     a4,a5
                bra.w   @Return
@DoubleAndCounter:
                
                bsr.w   battlesceneScript_DetermineDoubleAndCounter
@Return:
                
                rts

    ; End of function battlesceneScript_Attack

