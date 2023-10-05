
; ASM FILE code\common\tech\interrupts\unused_vint_3.asm :
; 0x13C0..0x140E : Unused Vertical Interrupt engine functions

; =============== S U B R O U T I N E =======================================

; unused DMA code


sub_13C0:
                
                movem.l d0-d1/a0-a1,-(sp)
                lea     ((PLANE_A_MAP_LAYOUT-$1000000)).w,a0
                lea     ($C000).l,a1
                move.w  #$800,d0
                move.w  #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function sub_13C0


; =============== S U B R O U T I N E =======================================

; unused DMA code


sub_13E4:
                
                movem.l d0-d1/a0-a1,-(sp)
                lea     ((PLANE_A_MAP_LAYOUT-$1000000)).w,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                move.w  #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function sub_13E4


; =============== S U B R O U T I N E =======================================

; unused


DmaAndWait:
                
                bsr.s   sub_13C0        
                bra.w   WaitForVInt

    ; End of function DmaAndWait

