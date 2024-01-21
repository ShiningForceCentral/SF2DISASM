
; ASM FILE code\gameflow\battle\battleactions\isabletocounterattack-standard.asm :
; Standard reimplementation of counter attack checker function.

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
; Out: -12(a2) = 0 if false, otherwise true

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

battlesceneScript_ValidateCounterAttack:
                
                movem.l d0-d4/a0,-(sp)
                tst.b   counterAttack(a2)
                beq.s   @NoCounter
                tst.b   targetDies(a2)
                bne.s   @NoCounter
                tst.b   muddledActor(a2)
                bne.s   @NoCounter
                tst.b   targetIsOnSameSide(a2)
                bne.s   @NoCounter
                
                ; Check status effects
                move.b  (a4),d0
                bsr.w   GetStatusEffects
                andi.w  #STATUSEFFECT_STUN|STATUSEFFECT_SLEEP,d1
                bne.s   @NoCounter
                
                ; Enemies that cannot counter
                moveq   #0,d2
                lea     table_UnableToCounterEnemies(pc), a0
                move.b  (a5),d0
                bsr.w   GetEnemy
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcc.s   @NoCounter
                
                ; Enemies that cannot be countered
                lea     table_CannotBeCounteredEnemies(pc), a0
                move.b  (a4),d0
                bsr.w   GetEnemy
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcc.s   @NoCounter
                
                ; Check if target is in range
                move.b  (a5),d1
                bsr.w   GetDistanceBetweenBattleEntities
                bsr.w   GetAttackRange  
                cmp.b   d3,d2
                bhi.s   @NoCounter
                cmp.b   d4,d2
                bcc.s   @Continue
                
@NoCounter:     clr.b   counterAttack(a2)
@Continue:      tst.b   debugCounter(a2)
                beq.s   @Done
                st      counterAttack(a2)
@Done:          movem.l (sp)+,d0-d4/a0
                rts

    ; End of function battlesceneScript_ValidateCounterAttack

