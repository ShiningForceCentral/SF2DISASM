
; ASM FILE code\common\tech\interrupts\fadingcommands.asm :
; 0xCD6..0xDBA : Commands used in scripts to fade screen in or out of white or black

; =============== S U B R O U T I N E =======================================


FadeInFromBlack:
                
                move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
                bra.w   ExecuteFading

    ; End of function FadeInFromBlack


; =============== S U B R O U T I N E =======================================


FadeOutToBlack:
                
                move.b  #OUT_TO_BLACK,((FADING_SETTING-$1000000)).w
                bra.w   ExecuteFading

    ; End of function FadeOutToBlack


; =============== S U B R O U T I N E =======================================


FadeInFromWhite:
                
                move.b  #IN_FROM_WHITE,((FADING_SETTING-$1000000)).w
                bra.w   ExecuteFading

    ; End of function FadeInFromWhite


; =============== S U B R O U T I N E =======================================


FadeOutToWhite:
                
                move.b  #OUT_TO_WHITE,((FADING_SETTING-$1000000)).w

    ; End of function FadeOutToWhite


; =============== S U B R O U T I N E =======================================


ExecuteFading:
                
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
@Wait:
                
                bsr.w   WaitForVInt
                tst.b   ((FADING_SETTING-$1000000)).w ; wait until fade end
                bne.s   @Wait
                
            if (STANDARD_BUILD=1)
                bra.w   WaitForVInt
            else
                bsr.w   WaitForVInt
                rts
            endif

    ; End of function ExecuteFading


; =============== S U B R O U T I N E =======================================

; In: d0.w = fading data value, d1.w = palette bitfield


ApplyCurrentColorFadingValue:
                
                movem.l d2-a2,-(sp)
                lea     (PALETTE_1_BASE).l,a0
                lea     (PALETTE_1_CURRENT).l,a1
                moveq   #CRAM_PALETTES_COUNTER,d6
@Palettes_Loop:
                
                moveq   #3,d5
                sub.w   d6,d5
                btst    d5,d1
                bne.s   @Continue
                
                adda.w  #CRAM_PALETTE_SIZE,a0
                adda.w  #CRAM_PALETTE_SIZE,a1
                bra.w   @NextPalette
@Continue:
                
                moveq   #CRAM_PER_PALETTE_COLORS_COUNTER,d7
@Colors_Loop:
                
                movem.l d0,-(sp)
                move.w  (a0)+,d2
                add.w   d0,d0
                move.w  d2,d3
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d3
                add.w   d0,d3
                bpl.s   @loc_1
                
                ; Clamp new color value between 0 and 15
                clr.w   d3
                bra.s   @loc_2
@loc_1:
                
                cmpi.w  #$F,d3
                ble.s   @loc_2
                move.w  #$F,d3
@loc_2:
                
                asl.w   #NIBBLE_SHIFT_COUNT,d0
                move.w  d2,d4
                andi.w  #BYTE_UPPER_NIBBLE_MASK,d4
                add.w   d0,d4
                bpl.s   @loc_3
                
                ; Repeat for the two other colors
                clr.w   d4
                bra.s   @loc_4
@loc_3:
                
                cmpi.w  #$F0,d4 
                ble.s   @loc_4
                move.w  #$F0,d4 
@loc_4:
                
                or.w    d4,d3
                asl.w   #NIBBLE_SHIFT_COUNT,d0
                move.w  d2,d4
                andi.w  #WORD_LOWER_NIBBLE_MASK,d4
                add.w   d0,d4
                bpl.s   @loc_5
                clr.w   d4
                bra.s   @loc_6
@loc_5:
                
                cmpi.w  #$F00,d4
                ble.s   @loc_6
                move.w  #$F00,d4
@loc_6:
                
                or.w    d4,d3
                move.w  d3,(a1)+
                movem.l (sp)+,d0
                dbf     d7,@Colors_Loop
@NextPalette:
                
                dbf     d6,@Palettes_Loop
                
                bsr.w   ApplyVIntCramDma
                bsr.w   EnableDmaQueueProcessing
                movem.l (sp)+,d2-a2
                rts

    ; End of function ApplyCurrentColorFadingValue

