
; ASM FILE code\common\tech\graphics\unused_display.asm :
; 0x30BE..0x30EE : Unused display function

; =============== S U B R O U T I N E =======================================

; unused


sub_30BE:
                
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                bra.w   WaitForDmaQueueProcessing

    ; End of function sub_30BE

