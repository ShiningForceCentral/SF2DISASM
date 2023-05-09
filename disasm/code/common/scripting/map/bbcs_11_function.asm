
; ASM FILE code\common\scripting\map\bbcs_11_function.asm :
; 0x458E..0x45C2 : Specific to before battle 11 cutscene function

; =============== S U B R O U T I N E =======================================


sub_458E:
                
                bsr.w   sub_38C0
                move.w  d0,((VIEW_PLANE_B_PIXEL_X-$1000000)).w
                move.w  d0,((word_FFA81C-$1000000)).w
                lsr.w   #4,d0
                neg.w   d0
                andi.w  #$FF,d0
                move.w  d0,((VIEW_PLANE_B_X_COUNTER-$1000000)).w
                move.w  d1,((VIEW_PLANE_B_PIXEL_Y-$1000000)).w
                move.w  d1,((word_FFA81E-$1000000)).w
                lsr.w   #4,d1
                addq.w  #8,d1
                andi.w  #$FF,d1
                move.w  d1,((VIEW_PLANE_B_Y_COUNTER-$1000000)).w
                bset    #1,((VIEW_PLANE_UPDATE_TRIGGERS-$1000000)).w
                rts

    ; End of function sub_458E

