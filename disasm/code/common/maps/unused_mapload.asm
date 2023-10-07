
; ASM FILE code\common\maps\unused_mapload.asm :
; 0x2EC0..0x2F6A : Unused map loading functions

; =============== S U B R O U T I N E =======================================

; unused


sub_2EC0:
                
                move.w  #$20,d6 
                bsr.w   GenerateRandomNumber
                move.w  d7,d0
                move.w  #4,d6
                bsr.w   GenerateRandomNumber
                move.w  d7,d1
                addi.w  #$1C,d1
                move.w  #$10,d6
                bsr.w   GenerateRandomNumber
                move.w  d7,d2
                move.w  #4,d6
                bsr.w   GenerateRandomNumber
                move.w  d7,d3
                move.w  #4,d4
                move.w  #4,d5
                move.w  #4,d6
                move.w  #4,d7
                bsr.w   sub_36B2        
                bsr.w   WaitForVInt
loc_2F04:
                
                move.w  #$8721,d0
                bsr.w   SetVdpReg
                move.w  #$8700,d0
                bsr.w   SetVdpReg
                bsr.w   WaitForVInt
                bsr.w   sub_2F24        
                tst.b   ((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
                bne.s   loc_2F04
                rts

    ; End of function sub_2EC0


; =============== S U B R O U T I N E =======================================

; unused


sub_2F24:
                
                move.w  d0,-(sp)
                move.w  ((PLANE_A_SCROLL_SPEED_X-$1000000)).w,d0
                addq.w  #1,d0           ; increment speed up to 128
                cmpi.w  #128,d0
                bgt.s   loc_2F36
                move.w  d0,((PLANE_A_SCROLL_SPEED_X-$1000000)).w
loc_2F36:
                
                move.w  ((PLANE_A_SCROLL_SPEED_Y-$1000000)).w,d0
                addq.w  #1,d0
                cmpi.w  #128,d0
                bgt.s   loc_2F46
                move.w  d0,((PLANE_A_SCROLL_SPEED_Y-$1000000)).w
loc_2F46:
                
                move.w  ((PLANE_B_SCROLL_SPEED_X-$1000000)).w,d0
                addq.w  #1,d0
                cmpi.w  #128,d0
                bgt.s   loc_2F56
                move.w  d0,((PLANE_B_SCROLL_SPEED_X-$1000000)).w
loc_2F56:
                
                move.w  ((PLANE_B_SCROLL_SPEED_Y-$1000000)).w,d0
                addq.w  #1,d0
                cmpi.w  #128,d0
                bgt.s   loc_2F66
                move.w  d0,((PLANE_B_SCROLL_SPEED_Y-$1000000)).w
loc_2F66:
                
                move.w  (sp)+,d0
                rts

    ; End of function sub_2F24

