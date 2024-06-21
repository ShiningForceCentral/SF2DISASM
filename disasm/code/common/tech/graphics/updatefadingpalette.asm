
; ASM FILE code\common\tech\graphics\updatefadingpalette.asm :
; 0x19C8..0x1A84 : Palette update during fading function

; =============== S U B R O U T I N E =======================================


UpdateBasePalettesAndBackupCurrent:
                
                movem.l d7-a1,-(sp)
                lea     (PALETTE_1_BASE).l,a1
                move.w  #CRAM_SIZE,d7
                jsr     CopyBytes(pc)   
                lea     (PALETTE_1_CURRENT).l,a0
                lea     ((PALETTE_1_COPY-$1000000)).w,a1
                move.w  #CRAM_SIZE,d7
                jsr     CopyBytes(pc)   
                move.b  #32,((FADING_TIMER_WORD-$1000000)).w
                movem.l (sp)+,d7-a1
                rts

    ; End of function UpdateBasePalettesAndBackupCurrent


; =============== S U B R O U T I N E =======================================


UpdateFadingPalette:
                
                clr.w   d6
                move.b  ((FADING_TIMER_WORD-$1000000)).w,d6
                bne.s   @Continue
                rts
@Continue:
                
                lea     (PALETTE_1_BASE).l,a0
                lea     (PALETTE_1_CURRENT).l,a1
                lea     ((PALETTE_1_COPY-$1000000)).w,a2
                moveq   #CRAM_COLORS_COUNTER,d7
                subq.w  #1,d6
                move.b  d6,((FADING_TIMER_WORD-$1000000)).w
                lsr.w   #2,d6
@Loop:
                
                clr.w   d0
                clr.w   d1
                move.b  (a2)+,d0
                move.b  (a2)+,d1
                move.w  d1,d2
                lsr.w   #NIBBLE_SHIFT_COUNT,d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d2
                clr.w   d3
                clr.w   d4
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                move.w  d4,d5
                lsr.w   #NIBBLE_SHIFT_COUNT,d4
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d5
                move.w  d7,-(sp)
                moveq   #8,d7
                sub.w   d6,d7
                mulu.w  d6,d0
                mulu.w  d6,d1
                mulu.w  d6,d2
                mulu.w  d7,d3
                mulu.w  d7,d4
                mulu.w  d7,d5
                add.w   d3,d0
                add.w   d4,d1
                add.w   d5,d2
                lsr.w   #3,d0
                lsr.w   #3,d1
                lsr.w   #3,d2
                lsl.w   #NIBBLE_SHIFT_COUNT,d1
                or.w    d1,d2
                move.b  d0,(a1)+
                move.b  d2,(a1)+
                move.w  (sp)+,d7
                dbf     d7,@Loop
                
                jsr     ApplyVIntCramDma(pc)
                tst.b   ((FADING_TIMER_WORD-$1000000)).w
                bne.s   @Return
                
                lea     ((PALETTE_1_COPY-$1000000)).w,a0
                tst.b   ((FADING_TIMER_BYTE-$1000000)).w
                bne.w   UpdateBasePalettesAndBackupCurrent
@Return:
                
                rts

    ; End of function UpdateFadingPalette


; =============== S U B R O U T I N E =======================================


nullsub_1A80:
                
                rts

    ; End of function nullsub_1A80


; =============== S U B R O U T I N E =======================================


nullsub_1A82:
                
                rts

    ; End of function nullsub_1A82

