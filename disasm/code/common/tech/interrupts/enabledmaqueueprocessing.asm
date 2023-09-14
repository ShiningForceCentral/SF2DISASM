
; ASM FILE code\common\tech\interrupts\enabledmaqueueprocessing.asm :
; 0xF1A..0xF2A : Set DMA Request bit function

; =============== S U B R O U T I N E =======================================


EnableDmaQueueProcessing:
                
                bset    #DMA_REQUEST,(VINT_PARAMS).l
                rts

    ; End of function EnableDmaQueueProcessing


; =============== S U B R O U T I N E =======================================


WaitForDmaQueueProcessing:
                
                bsr.s   EnableDmaQueueProcessing
                bra.w   WaitForVInt

    ; End of function WaitForDmaQueueProcessing
