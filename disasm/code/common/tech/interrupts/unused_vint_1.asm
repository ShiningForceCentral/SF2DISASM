
; ASM FILE code\common\tech\interrupts\unused_vint_1.asm :
; 0xF1A..0xF2A : Unused Vertical Interrupt engine functions

; =============== S U B R O U T I N E =======================================

; unused


RequestVdpCommandQueueProcessing:
                
                bset    #VDP_COMMAND_REQUEST,(VINT_PARAMETERS).l
                rts

    ; End of function RequestVdpCommandQueueProcessing


; =============== S U B R O U T I N E =======================================

; unused


WaitForVdpCommandQueueProcessing:
                
                bsr.s   RequestVdpCommandQueueProcessing
                bra.w   WaitForVInt

    ; End of function WaitForVdpCommandQueueProcessing

