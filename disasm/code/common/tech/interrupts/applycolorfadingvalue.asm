
; ASM FILE code\common\tech\interrupts\applycolorfadingvalue.asm :
; 0xD1E..0xDBA : Vertical Interrupt Engine - Color fading function

; =============== S U B R O U T I N E =======================================

; In: d1.w = palette bitfield


ApplyCurrentColorFadingValue:
                
                movem.l d2-a2,-(sp)
                lea     (PALETTE_1_BASE).l,a0
                lea     (PALETTE_1_CURRENT).l,a1
                moveq   #3,d6
loc_D30:
                
                moveq   #3,d5
                sub.w   d6,d5
                btst    d5,d1
                bne.s   loc_D44
                adda.w  #CRAM_PALETTE_SIZE,a0
                adda.w  #CRAM_PALETTE_SIZE,a1
                bra.w   loc_DA8
loc_D44:
                
                moveq   #15,d7
loc_D46:
                
                movem.l d0,-(sp)
                move.w  (a0)+,d2
                add.w   d0,d0
                move.w  d2,d3
                andi.w  #$F,d3
                add.w   d0,d3
                bpl.s   loc_D5C
                clr.w   d3
                bra.s   loc_D66
loc_D5C:
                
                cmpi.w  #$F,d3
                ble.s   loc_D66
                move.w  #$F,d3
loc_D66:
                
                asl.w   #4,d0
                move.w  d2,d4
                andi.w  #$F0,d4 
                add.w   d0,d4
                bpl.s   loc_D76
                clr.w   d4
                bra.s   loc_D80
loc_D76:
                
                cmpi.w  #$F0,d4 
                ble.s   loc_D80
                move.w  #$F0,d4 
loc_D80:
                
                or.w    d4,d3
                asl.w   #4,d0
                move.w  d2,d4
                andi.w  #$F00,d4
                add.w   d0,d4
                bpl.s   loc_D92
                clr.w   d4
                bra.s   loc_D9C
loc_D92:
                
                cmpi.w  #$F00,d4
                ble.s   loc_D9C
                move.w  #$F00,d4
loc_D9C:
                
                or.w    d4,d3
                move.w  d3,(a1)+
                movem.l (sp)+,d0
                dbf     d7,loc_D46
loc_DA8:
                
                dbf     d6,loc_D30
                bsr.w   ApplyVIntCramDma
                bsr.w   EnableDmaQueueProcessing
                movem.l (sp)+,d2-a2
                rts

    ; End of function ApplyCurrentColorFadingValue
