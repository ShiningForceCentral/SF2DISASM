
; ASM FILE code\gameflow\exploration\exploration.asm :
; 0x3758..0x4544 : Exploration functions

; =============== S U B R O U T I N E =======================================


sub_3758:
                
                clr.w   ((TILE_PALETTE_MASK-$1000000)).w
                cmpi.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                beq.s   @Continue
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                beq.s   @Continue
                move.w  #$2000,((TILE_PALETTE_MASK-$1000000)).w
@Continue:
                
                move.w  ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d4
                cmp.w   d0,d4
                beq.s   @Return
                bset    #3,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
                cmp.w   d0,d4
                bge.s   @Return
                
                movem.w d0-d3,-(sp)
                clr.w   d4
                clr.w   d5
                move.w  ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d0
                asr.w   #NIBBLE_SHIFT_COUNT,d0
                move.w  ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d1
                asr.w   #NIBBLE_SHIFT_COUNT,d1
                addi.w  #256,d0
                move.w  ((VIEW_PLANE_A_X_COUNTER-$1000000)).w,d2
                move.w  ((VIEW_PLANE_A_Y_COUNTER-$1000000)).w,d3
                lea     (PLANE_A_MAP_LAYOUT).l,a1
                bsr.w   sub_3158
                movem.w (sp)+,d0-d3
@Return:
                
                rts

    ; End of function sub_3758


; =============== S U B R O U T I N E =======================================


sub_37B2:
                
                clr.w   ((TILE_PALETTE_MASK-$1000000)).w
                cmpi.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                beq.s   @Continue
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                beq.s   @Continue
                move.w  #$2000,((TILE_PALETTE_MASK-$1000000)).w
@Continue:
                
                move.w  ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d4
                cmp.w   d1,d4
                beq.s   @Return
                bset    #2,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
                cmp.w   d1,d4
                bge.s   @Return
                
                movem.w d0-d3,-(sp)
                clr.w   d4
                clr.w   d5
                move.w  ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d0
                asr.w   #NIBBLE_SHIFT_COUNT,d0
                move.w  ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d1
                asr.w   #NIBBLE_SHIFT_COUNT,d1
                addi.w  #256,d1
                move.w  ((VIEW_PLANE_A_X_COUNTER-$1000000)).w,d2
                move.w  ((VIEW_PLANE_A_Y_COUNTER-$1000000)).w,d3
                lea     (PLANE_A_MAP_LAYOUT).l,a1
                bsr.w   sub_30EE
                movem.w (sp)+,d0-d3
@Return:
                
                rts

    ; End of function sub_37B2


; =============== S U B R O U T I N E =======================================


sub_380C:
                
                clr.w   ((TILE_PALETTE_MASK-$1000000)).w
                cmpi.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                beq.s   @Continue
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                bne.s   @Continue
                move.w  #$2000,((TILE_PALETTE_MASK-$1000000)).w
@Continue:
                
                move.w  ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d4
                cmp.w   d2,d4
                beq.s   @Return
                bset    #1,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
                cmp.w   d2,d4
                bge.s   @Return
                
                movem.w d0-d3,-(sp)
                clr.w   d4
                clr.w   d5
                move.w  ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d0
                asr.w   #NIBBLE_SHIFT_COUNT,d0
                move.w  ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d1
                asr.w   #NIBBLE_SHIFT_COUNT,d1
                addi.w  #256,d0
                move.w  ((VIEW_PLANE_B_X_COUNTER-$1000000)).w,d2
                move.w  ((VIEW_PLANE_B_Y_COUNTER-$1000000)).w,d3
                lea     (PLANE_B_LAYOUT).l,a1
                bsr.w   sub_3158
                movem.w (sp)+,d0-d3
@Return:
                
                rts

    ; End of function sub_380C


; =============== S U B R O U T I N E =======================================


sub_3866:
                
                clr.w   ((TILE_PALETTE_MASK-$1000000)).w
                cmpi.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                beq.s   @Continue
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                bne.s   @Continue
                move.w  #$2000,((TILE_PALETTE_MASK-$1000000)).w
@Continue:
                
                move.w  ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d4
                cmp.w   d3,d4
                beq.s   @Return
                bset    #0,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
                cmp.w   d3,d4
                bge.s   @Return
                
                movem.w d0-d3,-(sp)
                clr.w   d4
                clr.w   d5
                move.w  ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d0
                asr.w   #NIBBLE_SHIFT_COUNT,d0
                move.w  ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d1
                asr.w   #NIBBLE_SHIFT_COUNT,d1
                addi.w  #256,d1
                move.w  ((VIEW_PLANE_B_X_COUNTER-$1000000)).w,d2
                move.w  ((VIEW_PLANE_B_Y_COUNTER-$1000000)).w,d3
                lea     (PLANE_B_LAYOUT).l,a1
                bsr.w   sub_30EE
                movem.w (sp)+,d0-d3
@Return:
                
                rts

    ; End of function sub_3866


; =============== S U B R O U T I N E =======================================


sub_38C0:
                
                movem.l d2-d3/a0,-(sp)
                clr.w   d2
                move.b  ((VIEW_TARGET_ENTITY-$1000000)).w,d2
                bpl.s   @Continue
                
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                bne.s   @MapOnForeground
                move.w  ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d0
                move.w  ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d1
                bra.s   @Goto_Done
@MapOnForeground:
                
                move.w  ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d0
                move.w  ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d1
@Goto_Done:
                
                bra.s   @Done
@Continue:
                
                lsl.w   #ENTITYDEF_SIZE_BITS,d2
                lea     ((ENTITY_DATA-$1000000)).w,a0
                adda.w  d2,a0
                move.w  (a0)+,d2        ; x location
                move.w  (a0)+,d3        ; y location
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                bne.s   @loc_1
                
                sub.w   ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d2
                sub.w   ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d3
                move.w  ((MAP_AREA_LAYER2_STARTX-$1000000)).w,d0
                move.w  ((MAP_AREA_LAYER2_STARTY-$1000000)).w,d1
                bra.s   @loc_2
@loc_1:
                
                sub.w   ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d2
                sub.w   ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d3
                move.w  ((MAP_AREA_BACKGROUND_STARTX-$1000000)).w,d0
                move.w  ((MAP_AREA_BACKGROUND_STARTY-$1000000)).w,d1
@loc_2:
                
                lsl.w   #7,d0
                lsl.w   #7,d1
                addi.w  #3456,d0
                addi.w  #3456,d1
                sub.w   d2,d0
                sub.w   d3,d1
@Done:
                
                movem.l (sp)+,d2-d3/a0
                rts

    ; End of function sub_38C0


; =============== S U B R O U T I N E =======================================

distance = -2

VInt_UpdateScrollingData:
                
                link    a6,#-2
                move.b  ((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w,d0
                andi.b  #$C,d0
                beq.s   loc_3944
                move.b  #-1,((HIDE_WINDOWS_TOGGLE-$1000000)).w
loc_3944:
                
                tst.b   ((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
                beq.w   loc_3C44
                movem.w d0-d7,-(sp)
                clr.w   ((TILE_PALETTE_MASK-$1000000)).w
                cmpi.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                beq.s   loc_3968
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                beq.s   loc_3968
                move.w  #%10000000000000,((TILE_PALETTE_MASK-$1000000)).w
loc_3968:
                
                btst    #3,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
                beq.w   loc_3A1A
                move.w  ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d0
                move.w  d0,d5
                move.w  d0,d7
                move.w  ((VIEW_PLANE_A_PIXEL_X_DEST-$1000000)).w,d1
                move.w  ((PLANE_A_SCROLL_SPEED_X-$1000000)).w,d2
                sub.w   d1,d5
                move.w  d5,distance(a6)
                bge.s   loc_3998
                add.w   d2,d0
                move.w  #256,d6
                move.w  #1,d4
                clr.w   d5
                bra.s   loc_39A2
loc_3998:
                
                sub.w   d2,d0
                move.w  #8,d6
                clr.w   d4
                clr.w   d5
loc_39A2:
                
                eor.w   d0,d7
                btst    #7,d7
                beq.s   loc_39D4
                movem.w d0-d1,-(sp)
                asr.w   #NIBBLE_SHIFT_COUNT,d0
                move.w  ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d1
                asr.w   #NIBBLE_SHIFT_COUNT,d1
                add.w   d6,d0
                move.w  ((VIEW_PLANE_A_X_COUNTER-$1000000)).w,d2
                move.w  ((VIEW_PLANE_A_Y_COUNTER-$1000000)).w,d3
                lea     (PLANE_A_MAP_LAYOUT).l,a1
                lea     (byte_FF9A04).l,a2
                bsr.w   sub_3158
                movem.w (sp)+,d0-d1
loc_39D4:
                
                move.w  distance(a6),d5
                move.w  d0,d4
                sub.w   d1,d4
                bne.s   loc_39E6
                move.w  d1,d0
                bclr    #3,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
loc_39E6:
                
                eor.w   d5,d4
                bge.s   loc_39F2
                move.w  d1,d0
                bclr    #3,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
loc_39F2:
                
                tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
                beq.s   loc_3A0A
                tst.w   d0
                bge.s   loc_3A00
                addi.w  #$6000,d0
loc_3A00:
                
                cmpi.w  #$6000,d0
                blt.s   loc_3A0A
                subi.w  #$6000,d0
loc_3A0A:
                
                move.w  d0,((VIEW_PLANE_A_PIXEL_X-$1000000)).w
                lsr.w   #NIBBLE_SHIFT_COUNT,d0
                neg.w   d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,((VIEW_PLANE_A_X_COUNTER-$1000000)).w
loc_3A1A:
                
                btst    #2,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
                beq.w   loc_3AC8
                move.w  ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d0
                move.w  d0,d5
                move.w  d0,d7
                move.w  ((VIEW_PLANE_A_PIXEL_Y_DEST-$1000000)).w,d1
                move.w  ((PLANE_A_SCROLL_SPEED_Y-$1000000)).w,d2
                sub.w   d1,d5
                move.w  d5,distance(a6)
                bge.s   loc_3A4A
                add.w   d2,d0
                move.w  #256,d6
                clr.w   d4
                move.w  #1,d5
                bra.s   loc_3A54
loc_3A4A:
                
                sub.w   d2,d0
                move.w  #8,d6
                clr.w   d4
                clr.w   d5
loc_3A54:
                
                eor.w   d0,d7
                btst    #7,d7
                beq.s   loc_3A82
                movem.w d0-d1,-(sp)
                asr.w   #NIBBLE_SHIFT_COUNT,d0
                move.w  d0,d1
                move.w  ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d0
                asr.w   #NIBBLE_SHIFT_COUNT,d0
                add.w   d6,d1
                move.w  ((VIEW_PLANE_A_X_COUNTER-$1000000)).w,d2
                move.w  ((VIEW_PLANE_A_Y_COUNTER-$1000000)).w,d3
                lea     (PLANE_A_MAP_LAYOUT).l,a1
                bsr.w   sub_30EE
                movem.w (sp)+,d0-d1
loc_3A82:
                
                move.w  distance(a6),d5
                move.w  d0,d4
                sub.w   d1,d4
                bne.s   loc_3A94
                move.w  d1,d0
                bclr    #2,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
loc_3A94:
                
                eor.w   d5,d4
                bge.s   loc_3AA0
                move.w  d1,d0
                bclr    #2,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
loc_3AA0:
                
                tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_Y-$1000000)).w
                beq.s   loc_3AB8
                tst.w   d0
                bge.s   loc_3AAE
                addi.w  #$6000,d0
loc_3AAE:
                
                cmpi.w  #$6000,d0
                blt.s   loc_3AB8
                subi.w  #$6000,d0
loc_3AB8:
                
                move.w  d0,((VIEW_PLANE_A_PIXEL_Y-$1000000)).w
                lsr.w   #NIBBLE_SHIFT_COUNT,d0
                addq.w  #8,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,((VIEW_PLANE_A_Y_COUNTER-$1000000)).w
loc_3AC8:
                
                clr.w   ((TILE_PALETTE_MASK-$1000000)).w
                cmpi.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                beq.s   loc_3AE0
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                bne.s   loc_3AE0
                move.w  #%10000000000000,((TILE_PALETTE_MASK-$1000000)).w
loc_3AE0:
                
                btst    #1,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
                beq.w   loc_3B92
                move.w  ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d0
                move.w  d0,d5
                move.w  d0,d7
                move.w  ((VIEW_PLANE_B_PIXEL_X_DEST-$1000000)).w,d1
                move.w  ((PLANE_B_SCROLL_SPEED_X-$1000000)).w,d2
                sub.w   d1,d5
                move.w  d5,distance(a6)
                bge.s   loc_3B10
                add.w   d2,d0
                move.w  #256,d6
                move.w  #1,d4
                clr.w   d5
                bra.s   loc_3B1A
loc_3B10:
                
                sub.w   d2,d0
                move.w  #8,d6
                clr.w   d4
                clr.w   d5
loc_3B1A:
                
                eor.w   d0,d7
                btst    #7,d7
                beq.s   loc_3B4C
                movem.w d0-d1,-(sp)
                asr.w   #NIBBLE_SHIFT_COUNT,d0
                move.w  ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d1
                asr.w   #NIBBLE_SHIFT_COUNT,d1
                add.w   d6,d0
                move.w  ((VIEW_PLANE_B_X_COUNTER-$1000000)).w,d2
                move.w  ((VIEW_PLANE_B_Y_COUNTER-$1000000)).w,d3
                lea     (PLANE_B_LAYOUT).l,a1
                lea     (byte_FF9A84).l,a2
                bsr.w   sub_3158
                movem.w (sp)+,d0-d1
loc_3B4C:
                
                move.w  distance(a6),d5
                move.w  d0,d4
                sub.w   d1,d4
                bne.s   loc_3B5E
                move.w  d1,d0
                bclr    #1,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
loc_3B5E:
                
                eor.w   d5,d4
                bge.s   loc_3B6A
                move.w  d1,d0
                bclr    #1,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
loc_3B6A:
                
                tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
                beq.s   loc_3B82
                tst.w   d0
                bge.s   loc_3B78
                addi.w  #$6000,d0
loc_3B78:
                
                cmpi.w  #$6000,d0
                blt.s   loc_3B82
                subi.w  #$6000,d0
loc_3B82:
                
                move.w  d0,((VIEW_PLANE_B_PIXEL_X-$1000000)).w
                lsr.w   #NIBBLE_SHIFT_COUNT,d0
                neg.w   d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,((VIEW_PLANE_B_X_COUNTER-$1000000)).w
loc_3B92:
                
                btst    #0,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
                beq.w   loc_3C40
                move.w  ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d0
                move.w  d0,d5
                move.w  d0,d7
                move.w  ((VIEW_PLANE_B_PIXEL_Y_DEST-$1000000)).w,d1
                move.w  ((PLANE_B_SCROLL_SPEED_Y-$1000000)).w,d2
                sub.w   d1,d5
                move.w  d5,distance(a6)
                bge.s   loc_3BC2
                add.w   d2,d0
                move.w  #256,d6
                clr.w   d4
                move.w  #1,d5
                bra.s   loc_3BCC
loc_3BC2:
                
                sub.w   d2,d0
                move.w  #8,d6
                clr.w   d4
                clr.w   d5
loc_3BCC:
                
                eor.w   d0,d7
                btst    #7,d7
                beq.s   loc_3BFA
                movem.w d0-d1,-(sp)
                asr.w   #NIBBLE_SHIFT_COUNT,d0
                move.w  d0,d1
                move.w  ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d0
                asr.w   #NIBBLE_SHIFT_COUNT,d0
                add.w   d6,d1
                move.w  ((VIEW_PLANE_B_X_COUNTER-$1000000)).w,d2
                move.w  ((VIEW_PLANE_B_Y_COUNTER-$1000000)).w,d3
                lea     (PLANE_B_LAYOUT).l,a1
                bsr.w   sub_30EE
                movem.w (sp)+,d0-d1
loc_3BFA:
                
                move.w  distance(a6),d5
                move.w  d0,d4
                sub.w   d1,d4
                bne.s   loc_3C0C
                move.w  d1,d0
                bclr    #0,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
loc_3C0C:
                
                eor.w   d5,d4
                bge.s   loc_3C18
                move.w  d1,d0
                bclr    #0,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
loc_3C18:
                
                tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
                beq.s   loc_3C30
                tst.w   d0
                bge.s   loc_3C26
                addi.w  #$6000,d0
loc_3C26:
                
                cmpi.w  #$6000,d0
                blt.s   loc_3C30
                subi.w  #$6000,d0
loc_3C30:
                
                move.w  d0,((VIEW_PLANE_B_PIXEL_Y-$1000000)).w
                lsr.w   #NIBBLE_SHIFT_COUNT,d0
                addq.w  #8,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,((VIEW_PLANE_B_Y_COUNTER-$1000000)).w
loc_3C40:
                
                movem.w (sp)+,d0-d7
loc_3C44:
                
                unlk    a6
                move.b  ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w,d0
                beq.s   loc_3C88
                cmpi.b  #128,d0
                bne.s   loc_3C6C
                bsr.w   sub_38C0
                move.w  #16,((PLANE_A_SCROLL_SPEED_X-$1000000)).w
                move.w  d0,((VIEW_PLANE_A_PIXEL_X_DEST-$1000000)).w
                lea     (byte_FF9904).l,a2
                bsr.w   sub_3758
                bra.s   loc_3C82
loc_3C6C:
                
                move.w  ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d1
                ext.w   d0
                add.w   d0,d1
                tst.w   d0
                bpl.s   loc_3C7A
                neg.w   d0
loc_3C7A:
                
                move.w  d0,((PLANE_A_SCROLL_SPEED_X-$1000000)).w
                move.w  d1,((VIEW_PLANE_A_PIXEL_X_DEST-$1000000)).w
loc_3C82:
                
                bset    #3,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
loc_3C88:
                
                move.b  ((MAP_AREA_LAYER1_AUTOSCROLL_Y-$1000000)).w,d0
                beq.s   loc_3CC4
                cmpi.b  #128,d0
                bne.s   loc_3CA8
                bsr.w   sub_38C0
                move.w  #8,((PLANE_A_SCROLL_SPEED_Y-$1000000)).w
                move.w  d1,((VIEW_PLANE_A_PIXEL_Y_DEST-$1000000)).w
                bsr.w   sub_37B2
                bra.s   loc_3CBE
loc_3CA8:
                
                move.w  ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d1
                ext.w   d0
                add.w   d0,d1
                tst.w   d0
                bpl.s   loc_3CB6
                neg.w   d0
loc_3CB6:
                
                move.w  d0,((PLANE_A_SCROLL_SPEED_Y-$1000000)).w
                move.w  d1,((VIEW_PLANE_A_PIXEL_Y_DEST-$1000000)).w
loc_3CBE:
                
                bset    #2,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
loc_3CC4:
                
                move.b  ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w,d0
                beq.s   loc_3D08
                cmpi.b  #128,d0
                bne.s   loc_3CEC
                bsr.w   sub_38C0
                move.w  #16,((PLANE_B_SCROLL_SPEED_X-$1000000)).w
                move.w  d0,((VIEW_PLANE_B_PIXEL_X_DEST-$1000000)).w
                lea     (byte_FF9984).l,a2
                move.w  d0,d2
                bsr.w   sub_380C
                bra.s   loc_3D02
loc_3CEC:
                
                move.w  ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d1
                ext.w   d0
                add.w   d0,d1
                tst.w   d0
                bpl.s   loc_3CFA
                neg.w   d0
loc_3CFA:
                
                move.w  d0,((PLANE_B_SCROLL_SPEED_X-$1000000)).w
                move.w  d1,((VIEW_PLANE_B_PIXEL_X_DEST-$1000000)).w
loc_3D02:
                
                bset    #1,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w
loc_3D08:
                
                move.b  ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w,d0
                beq.s   FinalizeScrollDataUpdate
                cmpi.b  #128,d0
                bne.s   loc_3D2A
                bsr.w   sub_38C0
                move.w  #16,((PLANE_B_SCROLL_SPEED_Y-$1000000)).w
                move.w  d1,((VIEW_PLANE_B_PIXEL_Y_DEST-$1000000)).w
                move.w  d1,d3
                bsr.w   sub_3866
                bra.s   loc_3D40
loc_3D2A:
                
                move.w  ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d1
                ext.w   d0
                add.w   d0,d1
                tst.w   d0
                bpl.s   loc_3D38
                neg.w   d0
loc_3D38:
                
                move.w  d0,((PLANE_B_SCROLL_SPEED_Y-$1000000)).w
                move.w  d1,((VIEW_PLANE_B_PIXEL_Y_DEST-$1000000)).w
loc_3D40:
                
                bset    #0,((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w

    ; End of function VInt_UpdateScrollingData


; =============== S U B R O U T I N E =======================================


FinalizeScrollDataUpdate:
                
                move.l  ((VIEW_PLANE_A_Y_COUNTER-$1000000)).w,(VERTICAL_SCROLL_DATA).l
                move.l  ((VIEW_PLANE_A_X_COUNTER-$1000000)).w,(HORIZONTAL_SCROLL_DATA).l
                move.w  ((QUAKE_AMPLITUDE-$1000000)).w,d6
                beq.s   @Continue
                
                ; Apply the earthquake effect here
                addq.w  #1,d6
            if (STANDARD_BUILD=1)
                bsr.s   GetRandomValue
            else
                bsr.w   GetRandomValue
            endif
                add.w   d0,(HORIZONTAL_SCROLL_DATA).l
                add.w   d0,(HORIZONTAL_SCROLL_DATA+2).l
            if (STANDARD_BUILD=1)
                bsr.s   GetRandomValue
            else
                bsr.w   GetRandomValue
            endif
                add.w   d0,(VERTICAL_SCROLL_DATA).l
                add.w   d0,(VERTICAL_SCROLL_DATA+2).l
@Continue:
                
                bsr.w   UpdateVdpHScrollData
            if (STANDARD_BUILD=1)
                bra.w   UpdateVdpVScrollData
            else
                bsr.w   UpdateVdpVScrollData
                rts
            endif

    ; End of function FinalizeScrollDataUpdate


; =============== S U B R O U T I N E =======================================


GetRandomValue:
                
                bsr.w   GenerateRandomNumber
                move.w  d7,d0
                bsr.w   GenerateRandomNumber
                sub.w   d7,d0
                rts

    ; End of function GetRandomValue


; =============== S U B R O U T I N E =======================================

; unused


sub_3D96:
            if (VANILLA_BUILD=1)
                bsr.w   CopyMapBlocks
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                beq.s   loc_3DA8
                bset    #0,((VIEW_PLANE_UPDATE_TOGGLE_BITFIELD-$1000000)).w
                bra.s   return_3DAE
loc_3DA8:
                
                bset    #1,((VIEW_PLANE_UPDATE_TOGGLE_BITFIELD-$1000000)).w
return_3DAE:
                
                rts
            endif

    ; End of function sub_3D96


; =============== S U B R O U T I N E =======================================


CopyMapBlocks:
                
                movem.l d0-d7/a2,-(sp)
                clr.w   d7
                move.b  d1,d7
                subq.w  #1,d7
                move.w  d1,d6
                lsr.w   #BYTE_SHIFT_COUNT,d6
                subq.w  #1,d6
                clr.w   d3
                move.b  d2,d3
                lsr.w   #BYTE_SHIFT_COUNT,d2
                lsl.w   #6,d3
                add.w   d3,d2
                add.w   d2,d2
                clr.w   d1
                move.b  d0,d1
                lsr.w   #BYTE_SHIFT_COUNT,d0
                lsl.w   #6,d1
                add.w   d1,d0
                add.w   d0,d0
                lea     (FF0000_RAM_START).l,a2
loc_3DDE:
                
                movem.w d0/d2/d6,-(sp)
loc_3DE2:
                
                move.w  (a2,d0.w),(a2,d2.w)
                addq.w  #2,d0
                addq.w  #2,d2
                dbf     d6,loc_3DE2
                
                movem.w (sp)+,d0/d2/d6
                addi.w  #128,d0
                addi.w  #128,d2
                dbf     d7,loc_3DDE
                
                movem.l (sp)+,d0-d7/a2
                rts

    ; End of function CopyMapBlocks


; =============== S U B R O U T I N E =======================================


ResetCurrentMap:
            if (VANILLA_BUILD=1)
                lea     (FF0000_RAM_START).l,a2
                move.w  #MAP_LAYOUT_LONGS_COUNTER,d7
@Clear_Loop:
                
                clr.l   (a2)+
                dbf     d7,@Clear_Loop
                
                lea     (FF2000_LOADING_SPACE).l,a2
                move.l  #$C0F8C0F8,(a2)+
                move.l  #$C0F8C0F8,(a2)+
                move.l  #$C0F8C0F8,(a2)+
                move.l  #$C0F8C0F8,(a2)+
                move.w  #$C0F8,(a2)+
                clr.w   d0
                moveq   #-1,d1          ; reload current map
                bra.w   LoadMap         
            endif

    ; End of function ResetCurrentMap


; =============== S U B R O U T I N E =======================================

; uses door open SFX


OpenDoor:
                
                module
                checkSavedByte #NOT_CURRENTLY_IN_BATTLE, CURRENT_BATTLE
                bne.w   @Return
                
                movem.w d0-d7,-(sp)
                lsr.w   #7,d0
                lsr.w   #7,d1
                lea     table_MapOffsetHash(pc), a2
                add.w   d0,d0
                move.b  (a2,d0.w),d0
                andi.w  #$3F,d0 
                add.w   d1,d1
                move.b  (a2,d1.w),d1
                andi.w  #$3F,d1 
                clr.w   d7
                getSavedByte CURRENT_MAP, d7
                getPointer p_pt_MapData, a2
                lsl.w   #INDEX_SHIFT_COUNT,d7
                movea.l (a2,d7.w),a2
                movea.l MAPDATA_OFFSET_EVENT_STEP(a2),a2 ; get map step events
@Main_Loop:
                
                tst.b   (a2)
                bmi.w   @Done
                cmp.b   (a2),d0
                bne.w   @NextEvent
                cmp.b   1(a2),d1
                bne.w   @NextEvent
                
                tst.w   (a2)+
                move.b  (a2)+,d0
                ext.w   d0
                move.b  (a2)+,d1
                ext.w   d1
                move.b  (a2)+,d6
                ext.w   d6
                subq.b  #1,d6
                move.b  (a2)+,d7
                ext.w   d7
                subq.b  #1,d7
                move.b  (a2)+,d2
                ext.w   d2
                move.b  (a2)+,d3
                ext.w   d3
                lsl.w   #6,d3
                add.w   d3,d2
                add.w   d2,d2
                lsl.w   #6,d1
                add.w   d1,d0
                add.w   d0,d0
                lea     (FF0000_RAM_START).l,a2
                tst.w   d1
                blt.s   loc_3EEC
loc_3EC8:
                
                movem.w d0/d2/d6,-(sp)
loc_3ECC:
                
                move.w  (a2,d0.w),(a2,d2.w)
                addq.w  #2,d0
                addq.w  #2,d2
                dbf     d6,loc_3ECC
                
                movem.w (sp)+,d0/d2/d6
                addi.w  #$80,d0 
                addi.w  #$80,d2 
                dbf     d7,loc_3EC8
                
                bra.s   byte_3F06       ; @PlaySfx
loc_3EEC:
                
                movem.w d2/d6,-(sp)
loc_3EF0:
                
                clr.w   (a2,d2.w)
                addq.w  #2,d2
                dbf     d6,loc_3EF0
                
                movem.w (sp)+,d2/d6
                addi.w  #$80,d2 
                dbf     d7,loc_3EEC
byte_3F06:
                
                @PlaySfx:
                sndCom  SFX_DOOR_OPEN
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                beq.s   @UpdatePlaneB
                bset    #0,((VIEW_PLANE_UPDATE_TOGGLE_BITFIELD-$1000000)).w
                bra.s   @Done
@UpdatePlaneB:
                
                bset    #1,((VIEW_PLANE_UPDATE_TOGGLE_BITFIELD-$1000000)).w
@Done:
                
                movem.w (sp)+,d0-d7
@Return:
                
                rts
@NextEvent:
                
                addq.l  #8,a2
                addq.w  #1,d2
                bra.w   @Main_Loop

    ; End of function OpenDoor

                modend

; =============== S U B R O U T I N E =======================================

; Display (or don't) map roof depending on player's start location.


ToggleRoofOnMapLoad:
                
                movem.l d0-a1,-(sp)
                move.b  ((VIEW_TARGET_ENTITY-$1000000)).w,d4
                bpl.s   @Continue
                clr.w   d4
@Continue:
                
                andi.w  #$3F,d4 
                lsl.w   #ENTITYDEF_SIZE_BITS,d4
                lea     ((ENTITY_DATA-$1000000)).w,a0
                move.w  ENTITYDEF_OFFSET_Y(a0,d4.w),d5
                move.w  (a0,d4.w),d4
                clr.w   d1
                getSavedByte CURRENT_MAP, d1
                getPointer p_pt_MapData, a0
                lsl.w   #INDEX_SHIFT_COUNT,d1
                movea.l (a0,d1.w),a0
                movea.l MAPDATA_OFFSET_EVENT_ROOF(a0),a0
@Loop:
                
                tst.b   (a0)
            if (STANDARD_BUILD=1)
                bmi.s   @Done
            else
                bmi.w   @Done
            endif
                
                move.w  ((MAP_AREA_LAYER2_STARTX-$1000000)).w,d2
                ext.l   d2
                divs.w  #3,d2
                move.w  ((MAP_AREA_LAYER2_STARTY-$1000000)).w,d3
                ext.l   d3
                divs.w  #3,d3
                clr.w   d0
                clr.w   d1
                move.b  6(a0),d0
                move.b  7(a0),d1
                sub.w   d2,d0
                sub.w   d3,d1
                clr.w   d2
                clr.w   d3
                move.b  4(a0),d2
                move.b  5(a0),d3
                add.b   d0,d2
                subq.b  #1,d2
                add.b   d1,d3
                subq.b  #1,d3
                mulu.w  #MAP_TILE_SIZE,d0
                mulu.w  #MAP_TILE_SIZE,d1
                mulu.w  #MAP_TILE_SIZE,d2
                mulu.w  #MAP_TILE_SIZE,d3
                cmp.w   d0,d4
            if (STANDARD_BUILD=1)
                blt.s   @Next
                cmp.w   d1,d5
                blt.s   @Next
                cmp.w   d2,d4
                bgt.s   @Next
                cmp.w   d3,d5
                ble.s   @Break
            else
                blt.w   @Next
                cmp.w   d1,d5
                blt.w   @Next
                cmp.w   d2,d4
                bgt.w   @Next
                cmp.w   d3,d5
                bgt.w   @Next
                bra.w   @Break
            endif
@Next:
                
                addq.l  #8,a0
                bra.s   @Loop
@Break:
                
                clr.w   d0
                move.b  (a0),d0         ; get x trigger coord of block copy script
                mulu.w  #MAP_TILE_SIZE,d0
                clr.w   d1
                move.b  1(a0),d1        ; get y trigger coord of block copy script
                mulu.w  #MAP_TILE_SIZE,d1
            if (STANDARD_BUILD=1)
                bsr.s   PerformMapBlockCopyScript
            else
                bsr.w   PerformMapBlockCopyScript
            endif
@Done:
                
                movem.l (sp)+,d0-a1
                rts

    ; End of function ToggleRoofOnMapLoad


; =============== S U B R O U T I N E =======================================


PerformMapBlockCopyScript:
                
                move.w  d7,-(sp)
                tst.w   ((word_FFAF42-$1000000)).w
                bne.w   loc_40E6
                
                lsr.w   #7,d0
                lsr.w   #7,d1
                moveq   #1,d2
                lea     table_MapOffsetHash(pc), a3
                add.w   d0,d0
                move.b  (a3,d0.w),d0
                andi.w  #$3F,d0 
                add.w   d1,d1
                move.b  (a3,d1.w),d1
                andi.w  #$3F,d1 
                clr.w   d7
                getSavedByte CURRENT_MAP, d7
                getPointer p_pt_MapData, a2
                lsl.w   #INDEX_SHIFT_COUNT,d7
                movea.l (a2,d7.w),a2
                movea.l MAPDATA_OFFSET_EVENT_ROOF(a2),a2
loc_4028:
                
                tst.b   (a2)
                bmi.w   loc_40E6
                cmp.b   (a2),d0
                bne.w   loc_40EA
                cmp.b   1(a2),d1
                bne.w   loc_40EA
                move.w  d2,((word_FFAF42-$1000000)).w
                tst.w   (a2)+
                move.b  (a2)+,d0
                ext.w   d0
                move.b  (a2)+,d1
                ext.w   d1
                move.b  (a2)+,d6
                ext.w   d6
                subq.b  #1,d6
                move.b  (a2)+,d7
                ext.w   d7
                subq.b  #1,d7
                move.b  (a2)+,d2
                ext.w   d2
                move.b  (a2)+,d3
                ext.w   d3
                move.w  d2,(word_FF5C00).l
                move.w  d3,(word_FF5C02).l
                move.w  d6,(word_FF5C04).l
                move.w  d7,(word_FF5C06).l
                lsl.w   #6,d3
                add.w   d3,d2
                add.w   d2,d2
                lsl.w   #6,d1
                add.w   d1,d0
                add.w   d0,d0
                lea     (FF0000_RAM_START).l,a2
                lea     (byte_FF5C08).l,a3
                tst.w   d1
                blt.s   loc_40BA
loc_4092:
                
                movem.w d0/d2-d6,-(sp)
loc_4096:
                
                move.w  (a2,d2.w),(a3)+
                move.w  (a2,d0.w),(a2,d2.w)
                addq.w  #2,d0
                addq.w  #2,d2
                dbf     d6,loc_4096
                
                movem.w (sp)+,d0/d2-d6
                addi.w  #$80,d0 
                addi.w  #$80,d2 
                dbf     d7,loc_4092
                
                bra.s   loc_40D8
loc_40BA:
                
                movem.w d2/d6,-(sp)
loc_40BE:
                
                move.w  (a2,d2.w),(a3)+
                clr.w   (a2,d2.w)
                addq.w  #2,d2
                dbf     d6,loc_40BE
                
                movem.w (sp)+,d2/d6
                addi.w  #$80,d2 
                dbf     d7,loc_40BA
loc_40D8:
                
                move.w  #-1,(a3)
                sndCom  MUSIC_NOTHING
                bset    #0,((VIEW_PLANE_UPDATE_TOGGLE_BITFIELD-$1000000)).w
loc_40E6:
                
                move.w  (sp)+,d7
                rts
loc_40EA:
                
                addq.l  #8,a2
                addq.w  #1,d2
                bra.w   loc_4028

    ; End of function PerformMapBlockCopyScript


; =============== S U B R O U T I N E =======================================


csub_40F2:
                
                movem.w d7,-(sp)
                tst.w   ((word_FFAF42-$1000000)).w
                beq.w   loc_4150
                clr.w   ((word_FFAF42-$1000000)).w
                move.w  (word_FF5C00).l,d2
                move.w  (word_FF5C02).l,d3
                move.w  (word_FF5C04).l,d6
                move.w  (word_FF5C06).l,d7
                lsl.w   #6,d3
                add.w   d3,d2
                add.w   d2,d2
                lea     (FF0000_RAM_START).l,a2
                lea     (byte_FF5C08).l,a3
loc_412C:
                
                movem.w d2/d6,-(sp)
loc_4130:
                
                move.w  (a3)+,(a2,d2.w)
                addq.w  #2,d2
                dbf     d6,loc_4130
                
                movem.w (sp)+,d2/d6
                addi.w  #128,d2
                dbf     d7,loc_412C
                sndCom  MUSIC_NOTHING
                bset    #0,((VIEW_PLANE_UPDATE_TOGGLE_BITFIELD-$1000000)).w
loc_4150:
                
                movem.w (sp)+,d7
                rts

    ; End of function csub_40F2


; =============== S U B R O U T I N E =======================================

; In: d0.w, d1.w = Candidate coordinates


OpenChest:
                
                movem.l d0-d1/a2,-(sp)
                bsr.w   GetChestItem    
                tst.w   d0
                blt.s   @Done
                
                jsr     j_CheckFlag
                beq.s   @Continue
                move.w  #ITEM_NOTHING,d2
@Continue:
                
                jsr     j_SetFlag
                move.w  #MAP_BLOCKINDEX_OPEN_CHEST,(a2,d0.w) ; set block index to open chest
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                beq.s   @UpdatePlaneB
                bset    #0,((VIEW_PLANE_UPDATE_TOGGLE_BITFIELD-$1000000)).w
                bra.s   @Done
@UpdatePlaneB:
                
                bset    #1,((VIEW_PLANE_UPDATE_TOGGLE_BITFIELD-$1000000)).w
@Done:
                
                movem.l (sp)+,d0-d1/a2
                rts

    ; End of function OpenChest


; =============== S U B R O U T I N E =======================================

; In: d0.w, d1.w = Candidate coordinates


CloseChest:
                
                movem.l d0-d1/a2,-(sp)
                bsr.w   GetChestItem    
                tst.w   d0
                blt.s   @Done
                
                jsr     j_ClearFlag
                move.w  #MAP_BLOCKINDEX_CLOSED_CHEST,(a2,d0.w)
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                beq.s   @UpdatePlaneB
                bset    #0,((VIEW_PLANE_UPDATE_TOGGLE_BITFIELD-$1000000)).w
                bra.s   @Done
@UpdatePlaneB:
                
                bset    #1,((VIEW_PLANE_UPDATE_TOGGLE_BITFIELD-$1000000)).w
@Done:
                
                movem.l (sp)+,d0-d1/a2
                rts

    ; End of function CloseChest


; =============== S U B R O U T I N E =======================================

; In: d0.w, d1.w = Candidate coordinates


CheckChestItem:
                
                movem.l d0-d1/a2,-(sp)
                bsr.w   GetChestItem    
                tst.w   d0
                blt.s   @Done
                
                jsr     j_CheckFlag
                beq.s   @Continue
                move.w  #ITEM_NOTHING,d2 ; no item if chest has already been opened
@Continue:
                
                move.w  (a2,d0.w),d0
                andi.w  #$3C00,d0
                cmpi.w  #$1800,d0
                beq.s   @Done
                move.w  #-1,d2
@Done:
                
                movem.l (sp)+,d0-d1/a2
                rts

    ; End of function CheckChestItem


; =============== S U B R O U T I N E =======================================


CheckNonChestItem:
                
                movem.l d0-d1/a2,-(sp)
                bsr.w   GetNonChestItem
                tst.w   d0
                blt.s   @Done
                
                jsr     j_CheckFlag
                beq.s   @Continue
                move.w  #ITEM_NOTHING,d2
@Continue:
                
                jsr     j_SetFlag
@Done:
                
                movem.l (sp)+,d0-d1/a2
                rts

    ; End of function CheckNonChestItem


; =============== S U B R O U T I N E =======================================


RefillNonChestItem:
                
                movem.l d0-d1/a2,-(sp)
                bsr.w   GetNonChestItem
                tst.w   d0
                blt.s   @Done
                
                jsr     j_ClearFlag
@Done:
                
                movem.l (sp)+,d0-d1/a2
                rts

    ; End of function RefillNonChestItem


; =============== S U B R O U T I N E =======================================

; In: d0.w, d1.w = Candidate coordinates
; 
; Out: a2 = Map layout offset
;      d0.w = Layout block offset
;      d1.w = Item flag
;      d2.w = Item index


GetChestItem:
                
                clr.w   d2
                getSavedByte CURRENT_MAP, d2
                getPointer p_pt_MapData, a2
                lsl.w   #INDEX_SHIFT_COUNT,d2
                movea.l (a2,d2.w),a2    ; a2 points to current map data
                movea.l MAPDATA_OFFSET_ITEM_CHEST(a2),a2 ; get address of current map's chest item data
            if (STANDARD_BUILD=1)
                bra.s   GetItem
            else
                bra.w   GetItem
            endif

    ; End of function GetChestItem


; =============== S U B R O U T I N E =======================================


GetNonChestItem:
                
                clr.w   d2
                getSavedByte CURRENT_MAP, d2
                getPointer p_pt_MapData, a2
                lsl.w   #INDEX_SHIFT_COUNT,d2
                movea.l (a2,d2.w),a2
                movea.l MAPDATA_OFFSET_ITEM_OTHER(a2),a2 ; get address of current map's non-chest item data

    ; End of function GetNonChestItem


; =============== S U B R O U T I N E =======================================


GetItem:
                
                movem.w d4-d5,-(sp)
                move.w  d0,d4           ; save d0 and d1
                move.w  d1,d5
                clr.w   d2
                getSavedByte CURRENT_BATTLE, d2
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,d2
            if (STANDARD_BUILD=1)
                beq.s   @Start
            else
                beq.w   @Start
            endif
                
                ; Currently in battle
                movem.l a0,-(sp)
            if (STANDARD_BUILD=1)
                getPointer p_table_BattleMapCoordinates, a0
            else
                lea     (table_BattleMapCoordinates).w,a0
            endif
                mulu.w  #BATTLEMAPCOORDINATES_ENTRY_SIZE,d2 ; US/EU "Open chest in battle" bug here ! Should be 7, not 5 !
                add.b   1(a0,d2.w),d0
                add.b   2(a0,d2.w),d1   ; add x1 and y1 of battle camera bounds
                movem.l (sp)+,a0
@Start:
                
                tst.b   (a2)
            if (STANDARD_BUILD=1)
                bmi.s   @OutOfBounds
            else
                bmi.w   @OutOfBounds    ; if negative, then value > map max coord, so value = $FF : end of data
            endif
                
            if (STANDARD_BUILD=1)
                cmp.b   (a2),d0
                bne.s   @NextItem
                cmp.b   1(a2),d1
                bne.s   @NextItem   
            else
                cmp.b   (a2),d0
                bne.w   @NextItem       ; test coords
                cmp.b   1(a2),d1
                bne.w   @NextItem       
            endif
                move.w  d4,d0           ; get back original coords
                move.w  d5,d1
                andi.w  #$3F,d1 
                lsl.w   #6,d1
                andi.w  #$3F,d0 
                add.w   d1,d0
                add.w   d0,d0           ; get map layout block offset ?
                clr.w   d1
                move.b  2(a2),d1        ; item flag
                clr.w   d2
                move.b  3(a2),d2        ; item index
            if (STANDARD_BUILD=1)
                bra.s   @Continue
            else
                bra.w   @Continue
            endif
@OutOfBounds:
                
                moveq   #-1,d0
                move.w  d0,d1
                move.w  d0,d2
            if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
                andi.b  #ITEMENTRY_MASK_INDEX,d2
            endif
@Continue:
                
                lea     (FF0000_RAM_START).l,a2
                movem.w (sp)+,d4-d5
                rts
@NextItem:
                
                addq.l  #4,a2           ; go to next item
                bra.s   @Start

    ; End of function GetItem


; =============== S U B R O U T I N E =======================================


WarpIfSetAtPoint:
                
                module
                movem.l d0-d1/d7,-(sp)
                ext.l   d0
                ext.l   d1
                divs.w  #MAP_TILE_SIZE,d0
                divs.w  #MAP_TILE_SIZE,d1
                clr.w   d7
                getSavedByte CURRENT_MAP, d7
                getPointer p_pt_MapData, a2
                lsl.w   #INDEX_SHIFT_COUNT,d7
                movea.l (a2,d7.w),a2
                movea.l MAPDATA_OFFSET_EVENT_WARP(a2),a2
loc_4302:
                
                cmpi.w  #-1,(a2)
            if (STANDARD_BUILD=1)
                beq.s   @Done
            else
                beq.w   @Done
            endif
                tst.b   (a2)
                blt.s   loc_4314
                cmp.b   (a2),d0
            if (STANDARD_BUILD=1)
                bne.s   @NextPoint
            else
                bne.w   @NextPoint
            endif
loc_4314:
                
                tst.b   1(a2)
                blt.s   loc_4322
                cmp.b   1(a2),d1
            if (STANDARD_BUILD=1)
                bne.s   @NextPoint
            else
                bne.w   @NextPoint
            endif
loc_4322:
                
                move.w  #MAP_EVENT_WARP,((MAP_EVENT_TYPE-$1000000)).w
                move.l  2(a2),((MAP_EVENT_PARAM_1-$1000000)).w
                move.w  6(a2),((MAP_EVENT_PARAM_5-$1000000)).w
                move.w  #SFX_WARP,((WARP_SFX-$1000000)).w
@Done:
                
                movem.l (sp)+,d0-d1/d7
                rts
@NextPoint:
                
                addq.l  #8,a2
                bra.s   loc_4302

    ; End of function WarpIfSetAtPoint

                modend

; =============== S U B R O U T I N E =======================================


UpdateVdpPlaneA:
                
                movem.l a0-a1,-(sp)
                movem.w d7,-(sp)
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                bne.s   @MapOnForeground
                clr.w   ((TILE_PALETTE_MASK-$1000000)).w
                bra.s   @Continue
@MapOnForeground:
                
                move.w  #$2000,((TILE_PALETTE_MASK-$1000000)).w
@Continue:
                
                move.w  ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d0
                move.w  ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d1
                move.w  ((VIEW_PLANE_A_X_COUNTER-$1000000)).w,d2
                move.w  ((VIEW_PLANE_A_Y_COUNTER-$1000000)).w,d3
                lea     (PLANE_A_MAP_LAYOUT).l,a1
            if (STANDARD_BUILD=1)
                bsr.s   UpdateVdpPlane
            else
                bsr.w   UpdateVdpPlane
            endif
                movea.l ((WINDOW_LAYOUTS_END_POINTER-$1000000)).w,a1
                cmpa.l  #WINDOW_TILE_LAYOUTS,a1
                bne.s   @Done
                
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                lea     ($C000).l,a1    ; Update VDP Plane A layout data
                move.w  #$400,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
@Done:
                
                movem.w (sp)+,d7
                movem.l (sp)+,a0-a1
                rts

    ; End of function UpdateVdpPlaneA


; =============== S U B R O U T I N E =======================================


UpdateVdpPlaneB:
                
                movem.l a0-a1,-(sp)
                movem.w d7,-(sp)
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                beq.s   @MapOnBackground
                clr.w   ((TILE_PALETTE_MASK-$1000000)).w
                bra.s   @Continue
@MapOnBackground:
                
                move.w  #%10000000000000,((TILE_PALETTE_MASK-$1000000)).w
@Continue:
                
                move.w  ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d0
                move.w  ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d1
                move.w  ((VIEW_PLANE_B_X_COUNTER-$1000000)).w,d2
                move.w  ((VIEW_PLANE_B_Y_COUNTER-$1000000)).w,d3
                lea     (PLANE_B_LAYOUT).l,a1
            if (STANDARD_BUILD=1)
                bsr.s   UpdateVdpPlane
            else
                bsr.w   UpdateVdpPlane
            endif
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1    ; Update VDP Plane B layout data
                move.w  #$400,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                movem.w (sp)+,d7
                movem.l (sp)+,a0-a1
                rts

    ; End of function UpdateVdpPlaneB


; =============== S U B R O U T I N E =======================================


UpdateVdpPlane:
                
                neg.w   d2
                andi.w  #BYTE_MASK,d2
                lsr.w   #3,d2
                add.w   d2,d2
                subq.w  #8,d3
                andi.w  #BYTE_MASK,d3
                lsr.w   #3,d3
                add.w   d3,d3
                lsl.w   #5,d3
                andi.w  #$7FE,d3
                add.w   d2,d3
                lsr.w   #7,d0
                lsr.w   #7,d1
                lea     table_MapOffsetHash(pc), a3
                lea     (FF0000_RAM_START).l,a4
                lea     (FF2000_LOADING_SPACE).l,a5
                cmpi.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                bne.w   loc_44B4
                moveq   #32,d7
loc_4434:
                
                movem.w d0/d3,-(sp)
                moveq   #32,d6
loc_443A:
                
                movem.w d0-d1,-(sp)
                add.w   d0,d0
                clr.w   d2
                move.b  1(a3,d0.w),d2
                move.b  (a3,d0.w),d0
                ext.w   d0
                add.w   d1,d1
                clr.w   d5
                move.b  1(a3,d1.w),d5
                move.b  (a3,d1.w),d1
                ext.w   d1
                lsl.w   #6,d1
                add.w   d1,d0
                add.w   d0,d0
                move.w  d5,d4
                add.w   d5,d5
                add.w   d4,d5
                add.w   d5,d2
                add.w   d2,d2
                move.w  (a4,d0.w),d0
                andi.w  #$3FF,d0
                add.w   d0,d0
                move.w  d0,d1
                lsl.w   #3,d0
                add.w   d1,d0
                add.w   d0,d2
                movem.w (sp)+,d0-d1
                move.w  (a5,d2.w),(a1,d3.w)
                move.w  d3,d2
                addq.w  #2,d3
                eor.w   d3,d2
                btst    #6,d2
                beq.s   loc_4496
                subi.w  #64,d3
loc_4496:
                
                addq.w  #1,d0
                dbf     d6,loc_443A
                
                movem.w (sp)+,d0/d3
                addi.w  #64,d3
                bclr    #11,d3
                addq.w  #1,d1
                dbf     d7,loc_4434           
                
            if (STANDARD_BUILD=1)
                bra.w   FinalizeScrollDataUpdate
            else
                bsr.w   FinalizeScrollDataUpdate
                rts
            endif
loc_44B4:
                
                moveq   #32,d7
loc_44B6:
                
                movem.w d0/d3,-(sp)
                moveq   #32,d6
loc_44BC:
                
                movem.w d0-d1,-(sp)
                add.w   d0,d0
                clr.w   d2
                move.b  1(a3,d0.w),d2
                move.b  (a3,d0.w),d0
                ext.w   d0
                add.w   d1,d1
                clr.w   d5
                move.b  1(a3,d1.w),d5
                move.b  (a3,d1.w),d1
                ext.w   d1
                lsl.w   #6,d1
                add.w   d1,d0
                add.w   d0,d0
                move.w  d5,d4
                add.w   d5,d5
                add.w   d4,d5
                add.w   d5,d2
                add.w   d2,d2
                move.w  (a4,d0.w),d0
                cmpi.w  #$C000,d0
                bcs.s   loc_44FA
                clr.w   d4
                bra.s   loc_44FE
loc_44FA:
                
                move.w  ((TILE_PALETTE_MASK-$1000000)).w,d4
loc_44FE:
                
                andi.w  #$3FF,d0
                add.w   d0,d0
                move.w  d0,d1
                lsl.w   #3,d0
                add.w   d1,d0
                add.w   d0,d2
                movem.w (sp)+,d0-d1
                move.w  (a5,d2.w),(a1,d3.w)
                or.w    d4,(a1,d3.w)
                move.w  d3,d2
                addq.w  #2,d3
                eor.w   d3,d2
                btst    #6,d2
                beq.s   loc_452A
                subi.w  #64,d3
loc_452A:
                
                addq.w  #1,d0
                dbf     d6,loc_44BC
                
                movem.w (sp)+,d0/d3
                addi.w  #64,d3
                bclr    #11,d3
                addq.w  #1,d1
                dbf     d7,loc_44B6
                
                rts

    ; End of function UpdateVdpPlane

