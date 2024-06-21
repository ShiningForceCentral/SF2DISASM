
; ASM FILE code\common\maps\camerafunctions.asm :
; 0x45C2..0x4728 : Camera function

; =============== S U B R O U T I N E =======================================


VInt_UpdateViewData:
                
                module
                clr.w   d0
                move.b  ((VIEW_TARGET_ENTITY-$1000000)).w,d0
                bmi.w   loc_468C        
                
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                adda.w  d0,a0
                move.w  (a0)+,d4        ; Entity X
                move.w  (a0)+,d5        ; Entity Y
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                bne.s   @MapOnForeground
                move.w  ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d2
                move.w  ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d3
                bra.s   @Continue
@MapOnForeground:
                
                move.w  ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d2
                move.w  ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d3
@Continue:
                
                clr.w   d6
                bsr.w   IsMapScrollingToViewTarget
                bne.w   return_4706
                move.w  d2,d7
                addi.w  #1536,d7
                cmp.w   d7,d4
                bge.s   loc_4616
                cmp.w   ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d2
                ble.w   loc_4638
                subi.w  #MAP_TILE_SIZE,d2
                addq.w  #1,d6
                bra.w   loc_4638
loc_4616:
                
                move.w  d2,d7
                addi.w  #2304,d7
                cmp.w   d7,d4
                ble.s   loc_4638
                move.w  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,d7
                subi.w  #3840,d7
                cmp.w   d7,d2
                bge.w   loc_4638
                addi.w  #MAP_TILE_SIZE,d2
                addq.w  #1,d6
                bra.w   *+4
loc_4638:
                
                move.w  d3,d7
                addi.w  #1536,d7
                cmp.w   d7,d5
                bge.s   loc_4654
                cmp.w   ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d3
                ble.w   loc_4676
                subi.w  #MAP_TILE_SIZE,d3
                addq.w  #1,d6
                bra.w   loc_4676
loc_4654:
                
                move.w  d3,d7
                addi.w  #2304,d7
                cmp.w   d7,d5
                ble.s   loc_4676
                move.w  ((MAP_AREA_LAYER1_ENDY-$1000000)).w,d7
                subi.w  #3456,d7
                cmp.w   d7,d3
                bge.w   loc_4676
                addi.w  #MAP_TILE_SIZE,d3
                addq.w  #1,d6
                bra.w   *+4
loc_4676:
                
                tst.w   d6
                beq.s   loc_4688
                move.w  d2,d0
                move.w  d3,d1
                bsr.w   SetViewDestination
                addq.w  #1,((word_FFA828-$1000000)).w
                bra.s   loc_468C        
loc_4688:
                
                clr.w   ((word_FFA828-$1000000)).w
loc_468C:
                
                move.w  ((word_FFA828-$1000000)).w,d7 ; No entity to follow
                cmpi.w  #6,d7
                ble.s   loc_469C
                move.w  #32,d7
                bra.s   loc_46A0
loc_469C:
                
                move.w  #24,d7
loc_46A0:
                
                cmpi.b  #ENTITY_CURSOR,((VIEW_TARGET_ENTITY-$1000000)).w
                bne.s   loc_46AA
                moveq   #64,d7
loc_46AA:
                
                cmpi.b  #PULSATING_1,((FADING_SETTING-$1000000)).w
                bne.s   loc_46B4
                moveq   #32,d7
loc_46B4:
                
                tst.w   ((VIEW_SCROLLING_SPEED-$1000000)).w
                beq.s   loc_46BE
                move.w  ((VIEW_SCROLLING_SPEED-$1000000)).w,d7
loc_46BE:
                
                tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
                bne.s   loc_46D0
                move.w  d7,d0
                mulu.w  ((MAP_AREA_LAYER1_PARALLAX_X-$1000000)).w,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.w  d0,((PLANE_A_SCROLL_SPEED_X-$1000000)).w
loc_46D0:
                
                tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_Y-$1000000)).w
                bne.s   loc_46E2
                move.w  d7,d0
                mulu.w  ((MAP_AREA_LAYER1_PARALLAX_Y-$1000000)).w,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.w  d0,((PLANE_A_SCROLL_SPEED_Y-$1000000)).w
loc_46E2:
                
                tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
                bne.s   loc_46F4
                move.w  d7,d0
                mulu.w  ((MAP_AREA_LAYER2_PARALLAX_X-$1000000)).w,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.w  d0,((PLANE_B_SCROLL_SPEED_X-$1000000)).w
loc_46F4:
                
                tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
                bne.s   return_4706
                move.w  d7,d0
                mulu.w  ((MAP_AREA_LAYER2_PARALLAX_Y-$1000000)).w,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.w  d0,((PLANE_B_SCROLL_SPEED_Y-$1000000)).w
return_4706:
                
                rts

    ; End of function VInt_UpdateViewData

                modend

; =============== S U B R O U T I N E =======================================


WaitForViewScrollEnd:
                
                move.w  d7,-(sp)
loc_470A:
                
                bsr.w   IsMapScrollingToViewTarget
                beq.s   loc_4716
                bsr.w   WaitForVInt
                bra.s   loc_470A
loc_4716:
                
                bsr.w   WaitForVInt
                bsr.w   IsMapScrollingToViewTarget
                bne.s   loc_470A
                bsr.w   WaitForVInt
                move.w  (sp)+,d7
                rts

    ; End of function WaitForViewScrollEnd

