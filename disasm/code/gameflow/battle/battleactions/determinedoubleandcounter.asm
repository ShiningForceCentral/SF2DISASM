
; ASM FILE code\gameflow\battle\battleactions\determinedoubleandcounter.asm :
; 0xB00E..0xB080 : Write Battlescene Command : Determine Double And Counter function

; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     a4 = actor index pointer
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

battlesceneScript_DetermineDoubleAndCounter:
                
                move.b  (a4),d0         ; evaluate chance to double attack
                jsr     GetCurrentProwess
                lsr.b   #PROWESS_LOWER_DOUBLE_SHIFT_COUNT,d1
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
                
                jsr     (GenerateRandomOrDebugNumber).w
                tst.w   d0
                bne.s   @EvaluateChanceToCounter
                move.b  #-1,doubleAttack(a2)
@EvaluateChanceToCounter:
                
                move.b  (a5),d0         ; evaluate chance to counter using same mechanism as above
                jsr     GetCurrentProwess
                lsr.b   #PROWESS_LOWER_COUNTER_SHIFT_COUNT,d1
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
                
                jsr     (GenerateRandomOrDebugNumber).w
                tst.w   d0
                bne.s   @Return
                move.b  #-1,counterAttack(a2)
@Return:
                
                rts

    ; End of function battlesceneScript_DetermineDoubleAndCounter

