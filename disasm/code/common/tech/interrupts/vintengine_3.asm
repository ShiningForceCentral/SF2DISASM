
; ASM FILE code\common\tech\interrupts\vintengine_3.asm :
; 0x1382..0x13C0 : Vertical Interrupt Engine - Main Technical Engine - Triggered at each frame display, part 3

; =============== S U B R O U T I N E =======================================

; In: a0 = Source, a1 = Destination, d0.w = Length, d1.l = Auto-increment


ApplyImmediateVramDmaOnCompressedTiles:
                
                movem.w d1,-(sp)
                bsr.s   DecompressTilesForVramDma
                bsr.w   ApplyImmediateVramDma
                movem.w (sp)+,d1
                rts

    ; End of function ApplyImmediateVramDmaOnCompressedTiles


; =============== S U B R O U T I N E =======================================


DecompressTilesForVramDma:
                
                movem.l d0-d1/a1,-(sp)
                lea     (FF8804_LOADING_SPACE).l,a1
                bsr.w   LoadStackCompressedData
                lea     (FF8804_LOADING_SPACE).l,a0
                movem.l (sp)+,d0-d1/a1
                move.w  #2,d1
                rts

    ; End of function DecompressTilesForVramDma


; =============== S U B R O U T I N E =======================================


ApplyVIntVramDmaOnCompressedTiles:
                
                movem.w d1,-(sp)
                bsr.s   DecompressTilesForVramDma
                bsr.w   ApplyVIntVramDma
                movem.w (sp)+,d1
                rts

    ; End of function ApplyVIntVramDmaOnCompressedTiles

