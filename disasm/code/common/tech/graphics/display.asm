
; ASM FILE code\common\tech\graphics\display.asm :
; 0x30EE..0x3758 : Display functions

; =============== S U B R O U T I N E =======================================


sub_30EE:
                
                movem.l a0-a5,-(sp)
                movem.w d0-d5/d7,-(sp)
                neg.w   d2
                andi.w  #BYTE_MASK,d2
                lsr.w   #3,d2
                add.w   d2,d2
                subq.w  #8,d3
                andi.w  #BYTE_MASK,d3
                lsr.w   #3,d3
                add.w   d5,d3
                add.w   d3,d3
                lsl.w   #5,d3
                andi.w  #$7FE,d3
                adda.w  d3,a1
                move.w  d2,d3
                moveq   #32,d7
                lsr.w   #3,d0
                lsr.w   #3,d1
                lea     table_MapOffsetHash(pc), a3
                lea     (FF0000_RAM_START).l,a4
                lea     (FF2000_LOADING_SPACE).l,a5
@Loop:
                
                bsr.w   sub_364E
                move.w  d2,(a1,d3.w)
                addq.w  #2,d3
                bclr    #6,d3
                addq.w  #1,d0
                dbf     d7,@Loop
                
                movea.l a1,a0
                moveq   #32,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
                movem.w (sp)+,d0-d5/d7
                movem.l (sp)+,a0-a5
                rts

    ; End of function sub_30EE


; =============== S U B R O U T I N E =======================================


sub_3158:
                
                movem.l a0-a5,-(sp)
                movem.w d0-d5/d7,-(sp)
                neg.w   d2
                andi.w  #BYTE_MASK,d2
                lsr.w   #3,d2
                add.w   d4,d2
                add.w   d2,d2
                andi.w  #$3E,d2 
                adda.w  d2,a1
                subq.w  #8,d3
                andi.w  #BYTE_MASK,d3
                lsr.w   #3,d3
                add.w   d3,d3
                move.w  d3,d5
                lsl.w   #5,d3
                moveq   #32,d7
                lsr.w   #3,d0
                lsr.w   #3,d1
                lea     table_MapOffsetHash(pc), a3
                lea     (FF0000_RAM_START).l,a4
                lea     (FF2000_LOADING_SPACE).l,a5
@Loop:
                
                bsr.w   sub_364E
                move.w  d2,(a1,d3.w)
                addi.w  #64,d3
                bclr    #11,d3
                move.w  d2,(a2,d5.w)
                addq.w  #2,d5
                bclr    #6,d5
                addq.w  #1,d1
                dbf     d7,@Loop
                
                movea.l a2,a0
                moveq   #32,d0
                moveq   #64,d1
                bsr.w   ApplyVIntVramDma
                bsr.w   EnableDmaQueueProcessing
                movem.w (sp)+,d0-d5/d7
                movem.l (sp)+,a0-a5
                rts

    ; End of function sub_3158

table_MapOffsetHash:
                incbin "data/maps/global/mapoffsethashtable.bin"

; =============== S U B R O U T I N E =======================================


sub_364E:
                
                movem.w d0-d1/d3-d4/d6,-(sp)
                add.w   d0,d0
                clr.w   d2
                move.b  1(a3,d0.w),d2
                move.b  (a3,d0.w),d0
                ext.w   d0
                add.w   d1,d1
                clr.w   d3
                move.b  1(a3,d1.w),d3
                move.b  (a3,d1.w),d1
                ext.w   d1
                lsl.w   #6,d1
                add.w   d1,d0
                add.w   d0,d0
                move.w  d3,d4
                add.w   d3,d3
                add.w   d4,d3
                add.w   d3,d2
                add.w   d2,d2
                move.w  (a4,d0.w),d0
                cmpi.w  #VRAM_ADDRESS_PLANE_A,d0
                bcs.s   loc_368C
                clr.w   d6
                bra.s   loc_3690
loc_368C:
                
                move.w  ((TILE_PALETTE_MASK-$1000000)).w,d6
loc_3690:
                
                andi.w  #$3FF,d0
                add.w   d0,d0
                move.w  d0,d1
                lsl.w   #3,d0
                add.w   d1,d0
                add.w   d0,d2
                move.w  (a5,d2.w),d2
                or.w    d6,d2
                movem.w (sp)+,d0-d1/d3-d4/d6
                rts

    ; End of function sub_364E


; =============== S U B R O U T I N E =======================================


SetViewDestination:
                
                movem.w d0-d7,-(sp)
            if (VANILLA_BUILD=1)
                bra.w   loc_36BE
            endif

    ; End of function SetViewDestination


; =============== S U B R O U T I N E =======================================

; unused


sub_36B2:
            if (VANILLA_BUILD=1)
                movem.w d0-d7,-(sp)
                lsl.w   #7,d0
                lsl.w   #7,d1
                lsl.w   #7,d2
                lsl.w   #7,d3
            endif
loc_36BE:
                
                move.w  ((MAP_AREA_LAYER2_STARTX-$1000000)).w,d4
                move.w  ((MAP_AREA_LAYER2_STARTY-$1000000)).w,d5
                move.w  ((MAP_AREA_BACKGROUND_STARTX-$1000000)).w,d6
                move.w  ((MAP_AREA_BACKGROUND_STARTY-$1000000)).w,d7
                lsl.w   #7,d4
                lsl.w   #7,d5
                lsl.w   #7,d6
                lsl.w   #7,d7
                mulu.w  ((MAP_AREA_LAYER1_PARALLAX_X-$1000000)).w,d0
                lsr.l   #BYTE_SHIFT_COUNT,d0
                mulu.w  ((MAP_AREA_LAYER1_PARALLAX_Y-$1000000)).w,d1
                lsr.l   #BYTE_SHIFT_COUNT,d1
                mulu.w  ((MAP_AREA_LAYER2_PARALLAX_X-$1000000)).w,d2
                lsr.l   #BYTE_SHIFT_COUNT,d2
                mulu.w  ((MAP_AREA_LAYER2_PARALLAX_Y-$1000000)).w,d3
                lsr.l   #BYTE_SHIFT_COUNT,d3
                add.w   d4,d0
                add.w   d5,d1
                add.w   d6,d2
                add.w   d7,d3
                tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
                bne.s   loc_3702
                move.w  d0,((VIEW_PLANE_A_PIXEL_X_DEST-$1000000)).w
                bra.s   loc_3706
loc_3702:
                
                move.w  ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d0
loc_3706:
                
                tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_Y-$1000000)).w
                bne.s   loc_3712
                move.w  d1,((VIEW_PLANE_A_PIXEL_Y_DEST-$1000000)).w
                bra.s   loc_3716
loc_3712:
                
                move.w  ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d1
loc_3716:
                
                tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
                bne.s   loc_3722
                move.w  d2,((VIEW_PLANE_B_PIXEL_X_DEST-$1000000)).w
                bra.s   loc_3726
loc_3722:
                
                move.w  ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d2
loc_3726:
                
                tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
                bne.s   loc_3732
                move.w  d3,((VIEW_PLANE_B_PIXEL_Y_DEST-$1000000)).w
                bra.s   loc_3736
loc_3732:
                
                move.w  ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d3
loc_3736:
                
                lea     (byte_FF9A04).l,a2
                bsr.w   sub_3758
                bsr.w   sub_37B2
                lea     (byte_FF9A84).l,a2
                bsr.w   sub_380C
                bsr.w   sub_3866
                movem.w (sp)+,d0-d7
                rts

    ; End of function sub_36B2

