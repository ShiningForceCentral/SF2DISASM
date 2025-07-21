
; ASM FILE code\common\tech\interrupts\applycolorfadingvalue-standard.asm :


; =============== S U B R O U T I N E =======================================

; In: d0.w = fading data value, d1.w = palette bitfield


ApplyCurrentColorFadingValue:
                
                movem.l d2-a2,-(sp)
                lea     (PALETTE_1_BASE).l,a0
                lea     (PALETTE_1_CURRENT).l,a1
                moveq   #3,d6
                
@Palettes_Loop: moveq   #3,d5
                sub.w   d6,d5
                btst    d5,d1
                bne.s   @Continue
                
                adda.w  #CRAM_PALETTE_SIZE,a0
                adda.w  #CRAM_PALETTE_SIZE,a1
                bra.s   @NextPalette
@Continue:      moveq   #15,d7

@Colors_Loop:   movem.l d0,-(sp)
                move.w  (a0)+,d2
                add.w   d0,d0
                move.w  d2,d3
                andi.w  #$F,d3
                add.w   d0,d3
                bpl.s   @loc_1
                
                ; Clamp new color value between 0 and 15
                clr.w   d3
                bra.s   @loc_2
                
@loc_1:         cmpi.w  #$F,d3
                ble.s   @loc_2
                move.w  #$F,d3
                
@loc_2:         asl.w   #4,d0
                move.w  d2,d4
                andi.w  #$F0,d4 
                add.w   d0,d4
                bpl.s   @loc_3
                
                ; Repeat for the two other colors
                clr.w   d4
                bra.s   @loc_4
                
@loc_3:         cmpi.w  #$F0,d4 
                ble.s   @loc_4
                move.w  #$F0,d4 
                
@loc_4:         or.w    d4,d3
                asl.w   #4,d0
                move.w  d2,d4
                andi.w  #$F00,d4
                add.w   d0,d4
                bpl.s   @loc_5
                clr.w   d4
                bra.s   @loc_6
                
@loc_5:         cmpi.w  #$F00,d4
                ble.s   @loc_6
                move.w  #$F00,d4
                
@loc_6:         or.w    d4,d3
                move.w  d3,(a1)+
                movem.l (sp)+,d0
                dbf     d7,@Colors_Loop
                
@NextPalette:   dbf     d6,@Palettes_Loop
                
                bsr.w   ApplyVIntCramDma
                bsr.s   EnableDmaQueueProcessing
                movem.l (sp)+,d2-a2
                rts

    ; End of function ApplyCurrentColorFadingValue


; =============== S U B R O U T I N E =======================================


WaitForDmaQueueProcessing:
                
                pea     WaitForVInt(pc)
EnableDmaQueueProcessing:
                
                bset    #DMA_REQUEST,(VINT_PARAMETERS).l
                rts

    ; End of function EnableDmaQueueProcessing
