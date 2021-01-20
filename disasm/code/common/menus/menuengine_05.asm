
; ASM FILE code\common\menus\menuengine_05.asm :
; 0x12606..0x1263A : Menu engine

; =============== S U B R O U T I N E =======================================


sub_12606:
                
                lea     (PLANE_B_LAYOUT).l,a0
                move.w  #$97F,d0
loc_12610:
                
                move.w  (a0)+,d1
                andi.w  #$6000,d1
                bne.s   loc_1261C
                clr.w   -2(a0)
loc_1261C:
                
                dbf     d0,loc_12610
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$800,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jmp     (WaitForDmaQueueProcessing).w

    ; End of function sub_12606

