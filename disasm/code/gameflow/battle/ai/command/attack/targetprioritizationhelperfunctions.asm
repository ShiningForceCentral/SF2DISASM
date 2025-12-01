
; ASM FILE code\gameflow\battle\ai\command\attack\targetprioritizationhelperfunctions.asm :
; 0xD2D2..0xD38A : Target prioritization helper functions

; =============== S U B R O U T I N E =======================================

; unused


IsCurrentHpAboveOneThirdOfMax:
                
                module
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHp
                move.w  d1,d2
                jsr     GetMaxHp
                bra.w   @Continue

    ; End of function IsCurrentHpAboveOneThirdOfMax


; =============== S U B R O U T I N E =======================================

; unused


IsRemainingHpAboveOneThirdOfMax:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHp
                bra.w   @Continue

    ; End of function IsRemainingHpAboveOneThirdOfMax


; =============== S U B R O U T I N E =======================================

; Is defender expected to have more than 1/3 of current HP remain after attack?
; 
; In: d0.w = defender index
;     d1.w = defender's remaining HP after max potential damage
; 
; Out: CCR carry-bit set if true


IsRemainingHpAboveOneThirdOfCurrent:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHp
@Continue:
                
                mulu.w  #3,d2
                cmp.w   d2,d1           ; compare defender's current HP to 3x their remaining HP after the attack
                movem.l (sp)+,d1-d2
                rts

    ; End of function IsRemainingHpAboveOneThirdOfCurrent

                modend

; =============== S U B R O U T I N E =======================================

; unused


IsCurrentHpAboveOneFourthOfMax:
                
                module
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHp
                move.w  d1,d2
                jsr     GetMaxHp
                bra.w   @Continue

    ; End of function IsCurrentHpAboveOneFourthOfMax


; =============== S U B R O U T I N E =======================================

; unused


IsRemainingHpAboveOneFourthOfMax:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHp
                bra.w   @Continue

    ; End of function IsRemainingHpAboveOneFourthOfMax


; =============== S U B R O U T I N E =======================================

; unused


IsRemainingHpAboveOneFourthOfCurrent:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHp
@Continue:
                
                lsl.w   #2,d2
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2
                rts

    ; End of function IsRemainingHpAboveOneFourthOfCurrent

                modend

; =============== S U B R O U T I N E =======================================

; unused


IsCurrentHpAboveOneFifthOfMax:
                
                module
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHp
                move.w  d1,d2
                jsr     GetMaxHp
                bra.w   @Continue

    ; End of function IsCurrentHpAboveOneFifthOfMax


; =============== S U B R O U T I N E =======================================

; Is defender expected to have more than 1/5 of max HP remain after attack?
; 
; In: d0.w = defender index
;     d1.w = defender's remaining HP after max potential damage
; 
; Out: CCR carry-bit set if true


IsRemainingHpAboveOneFifthOfMax:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHp
                bra.w   @Continue

    ; End of function IsRemainingHpAboveOneFifthOfMax


; =============== S U B R O U T I N E =======================================

; unused


IsRemainingHpAboveOneFifthOfCurrent:
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHp
@Continue:
                
                mulu.w  #5,d2
                cmp.w   d2,d1           ; Compare defender's max HP to 5x their theoretical remaining HP after the attack
                movem.l (sp)+,d1-d2
                rts

    ; End of function IsRemainingHpAboveOneFifthOfCurrent

                modend
