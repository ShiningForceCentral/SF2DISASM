
; ASM FILE code\gameflow\battle\battleactions\isabletocounterattack.asm :
; 0xA49C..0xA54E : Is Able To Counter Attack function

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

FinalCounterAttackCheck:
                
                movem.l d0-d3/a0,-(sp)
                tst.b   counterAttack(a2)
                beq.w   @ClearCounter
                tst.b   targetDies(a2)
                bne.w   @ClearCounter
                tst.b   muddledActor(a2)
                bne.w   @ClearCounter
                tst.b   targetIsOnSameSide(a2)
                bne.w   @ClearCounter
                
                ; Check status effects
                move.b  (a4),d0
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_SLEEP,d1
                bne.w   @ClearCounter
                jsr     j_GetStatusEffects
                andi.w  #STATUSEFFECT_STUN,d1
                bne.w   @ClearCounter
                
                ; Enemies that cannot counter
                move.b  (a5),d0
                jsr     GetEnemy        
                cmpi.w  #ENEMY_TAROS,d1 ; HARDCODED enemy indexes
                beq.w   @ClearCounter
                
                ; Enemies that cannot be countered
                move.b  (a4),d0
                jsr     GetEnemy        
                cmpi.w  #ENEMY_BURST_ROCK,d1
                beq.w   @ClearCounter
                cmpi.w  #ENEMY_KRAKEN_HEAD,d1
                beq.w   @ClearCounter
                cmpi.w  #ENEMY_PRISM_FLOWER,d1
                beq.w   @ClearCounter
                cmpi.w  #ENEMY_ZEON_GUARD,d1
                beq.w   @ClearCounter
                
                ; Check if target is in range
                move.b  (a4),d0
                move.b  (a5),d1
                jsr     GetDistanceBetweenEntities
                move.b  (a4),d0
                jsr     GetAttackRange  
                cmp.b   d3,d2
                bhi.w   @ClearCounter
                cmp.b   d4,d2
                bcs.w   @ClearCounter
                bra.w   @CheckDebugCounter
@ClearCounter:
                
                clr.b   counterAttack(a2)
@CheckDebugCounter:
                
                tst.b   debugCounter(a2)
                beq.s   @Done
                move.b  #$FF,counterAttack(a2)
@Done:
                
                movem.l (sp)+,d0-d3/a0
                rts

    ; End of function FinalCounterAttackCheck

