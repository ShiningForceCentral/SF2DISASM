
; ASM FILE code\common\stats\calculatestatgain.asm :
; 0x96BA..0x9736 : Calculate stat gain function

; =============== S U B R O U T I N E =======================================

; In: D1 = current stat value
;     D2 = growth curve index
;     D3 = starting value
;     D4 = projected value
;     D5 = current level
; 
; Out: D1 = stat gain value


CalculateStatGain:
                
                tst.b   d2
                bne.s   @EvaluateLevel  ; keep going if curve type other than None
                move.w  #0,d1           ; otherwise, stat gain value = 0
                rts
@EvaluateLevel:
                
                movem.l d0/d2-a0,-(sp)
                movem.w d1-d5,-(sp)     ; -> push function arguments
                cmpi.w  #CHAR_STATGAIN_PROJECTIONLEVEL,d5 ; If current level within projection
                blt.s   @Continue       ;  ...keep going.
                move.w  #$100,d0
                move.w  #$180,d4
                bra.s   @RandomizeStatGain
@Continue:
                
                andi.w  #GROWTHCURVE_MASK_INDEX,d2
                subq.w  #1,d2
                muls.w  #GROWTHCURVE_DEF_SIZE,d2
                movea.l (p_tbl_StatGrowthCurves).l,a0
                adda.w  d2,a0
                move.w  d5,d2
                subq.w  #1,d2
                lsl.w   #2,d2
                adda.w  d2,a0
                move.w  (a0)+,d0        ; D0 = curve_param_1 for current level
                move.w  (a0)+,d7        ; D7 = curve_param_2 for current level
                sub.w   d3,d4           ; D4 = projected growth
                mulu.w  d7,d4
@RandomizeStatGain:
                
                move.w  #$80,d6 
                jsr     (GenerateRandomNumber).w
                add.w   d7,d4
                jsr     (GenerateRandomNumber).w
                sub.w   d7,d4
                addi.w  #$80,d4 
                lsr.w   #8,d4
                move.w  d4,d6           ; D6 = randomized stat gain
                movem.w (sp)+,d1-d5     ; D1-D5 <- pull function arguments
                sub.w   d3,d4           ; D4 = projected growth
                mulu.w  d4,d0
                addi.w  #$80,d0 
                lsr.w   #8,d0
                add.w   d3,d0           ; D0 = expected minimum stat for current level
                add.w   d6,d1
                cmp.w   d0,d1           ; If new value greater than or equal to expected minimum
                bge.s   @Done           ;  ...we're done.
                addq.w  #1,d6           ;  Otherwise, lovingly apply "loser pity bonus."
@Done:
                
                move.w  d6,d1           ; return stat gain value -> D1
                movem.l (sp)+,d0/d2-a0
                rts

    ; End of function CalculateStatGain

