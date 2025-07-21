
; ASM FILE code\common\scripting\map\bbcs_11_function.asm :
; 0x458E..0x45C2 : Specific to before battle 11 cutscene function

; =============== S U B R O U T I N E =======================================


csub_458E:
            if (STANDARD_BUILD=1)
                jsr     (sub_38C0).w
            else
                bsr.w   sub_38C0
            endif
                move.w  d0,((VIEW_PLANE_B_PIXEL_X-$1000000)).w
                move.w  d0,((VIEW_PLANE_B_PIXEL_X_DEST-$1000000)).w
                lsr.w   #NIBBLE_SHIFT_COUNT,d0
                neg.w   d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,((VIEW_PLANE_B_X_COUNTER-$1000000)).w
                move.w  d1,((VIEW_PLANE_B_PIXEL_Y-$1000000)).w
                move.w  d1,((VIEW_PLANE_B_PIXEL_Y_DEST-$1000000)).w
                lsr.w   #NIBBLE_SHIFT_COUNT,d1
                addq.w  #8,d1
                andi.w  #BYTE_MASK,d1
                move.w  d1,((VIEW_PLANE_B_Y_COUNTER-$1000000)).w
                bset    #1,((VIEW_PLANE_UPDATE_TOGGLE_BITFIELD-$1000000)).w
                rts

    ; End of function csub_458E

