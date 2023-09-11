
; ASM FILE code\gameflow\battle\battleactions\attack.asm :
; 0xAAB6..0xAAFC : Write Battlescene Script : Attack

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

WriteBattlesceneScript_Attack:
                
                bsr.w   WriteBattlesceneScript_DetermineDodge
                tst.b   dodge(a2)
                bne.w   loc_AAF6
                bsr.w   WriteBattlesceneScript_CalculateDamage
                bsr.w   WriteBattlesceneScript_DetermineCriticalHit
                bsr.w   WriteBattlesceneScript_InflictDamage
                tst.b   targetDies(a2)
                beq.s   loc_AADC
                bsr.w   WriteBattlesceneScript_DeathMessage
                bra.w   return_AAFA
loc_AADC:
                
                bsr.w   WriteBattlesceneScript_InflictAilment
                bsr.w   WriteBattlesceneScript_InflictCurseDamage
                tst.b   targetDies(a2)
                beq.s   loc_AAF6
                exg     a4,a5
                bsr.w   WriteBattlesceneScript_DeathMessage
                exg     a4,a5
                bra.w   return_AAFA
loc_AAF6:
                
                bsr.w   WriteBattlesceneScript_DetermineDoubleAndCounter
return_AAFA:
                
                rts

    ; End of function WriteBattlesceneScript_Attack

