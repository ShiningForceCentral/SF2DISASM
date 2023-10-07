
; ASM FILE code\common\tech\interrupts\enabledmaqueueprocessing.asm :
; 0xF2A..0xF3A : Vertical Interrupt Engine - DMA Request bit setter function

; =============== S U B R O U T I N E =======================================


EnableDmaQueueProcessing:
                
                bset    #DMA_REQUEST,(VINT_PARAMETERS).l
                rts

    ; End of function EnableDmaQueueProcessing


; =============== S U B R O U T I N E =======================================


WaitForDmaQueueProcessing:
                
                bsr.s   EnableDmaQueueProcessing
                bra.w   WaitForVInt

    ; End of function WaitForDmaQueueProcessing

