
; ASM FILE code\common\maps\animations.asm :
; 0x4728..0x47C6 : Map animation function

; =============== S U B R O U T I N E =======================================

; Out: Z = is scrolling


IsMapScrollingToViewTarget:
                
                move.b  ((VIEW_SCROLLING_PLANES_BITFIELD-$1000000)).w,d7
                tst.w   ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
                beq.s   @loc_1
                andi.b  #3,d7
@loc_1:
                
                tst.w   ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
                beq.s   @loc_2
                andi.b  #$C,d7
@loc_2:
                
                tst.b   d7
                rts

    ; End of function IsMapScrollingToViewTarget


; =============== S U B R O U T I N E =======================================


VInt_UpdateMapPlanes:
                
                bclr    #0,((VIEW_PLANE_UPDATE_TOGGLE_BITFIELD-$1000000)).w
                beq.s   @PlaneB
                bsr.w   UpdateVdpPlaneA
                movea.l ((WINDOW_LAYOUTS_END_POINTER-$1000000)).w,a1
                cmpa.l  #WINDOW_TILE_LAYOUTS,a1
                beq.s   @PlaneB
                bsr.w   CopyPlaneALayoutForWindows
                bsr.w   FixWindowsPositions
@PlaneB:
                
                bclr    #1,((VIEW_PLANE_UPDATE_TOGGLE_BITFIELD-$1000000)).w
                beq.s   @Return
                bsr.w   UpdateVdpPlaneB
@Return:
                
                rts

    ; End of function VInt_UpdateMapPlanes


; =============== S U B R O U T I N E =======================================


VInt_UpdateMapAnimations:
                
                module
                move.l  ((TILE_ANIMATION_DATA_ADDRESS-$1000000)).w,d0
                ble.s   @Return
                subq.w  #1,((TILE_ANIMATION_COUNTER-$1000000)).w
                bne.s   @Return
                
                movea.l d0,a0
                move.w  (a0)+,d1
                bge.w   loc_47A2
                
                clr.w   d0
                move.b  (TILE_ANIMATION_MAP_INDEX).l,d0
                getPointer p_pt_MapData, a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                movea.l MAPDATA_OFFSET_ANIMATIONS(a0),a0
                tst.l   (a0)+
                move.w  (a0)+,d1
loc_47A2:
                
                move.w  (a0)+,d0
                move.w  (a0)+,d2
                move.w  (a0)+,((TILE_ANIMATION_COUNTER-$1000000)).w
                move.l  a0,((TILE_ANIMATION_DATA_ADDRESS-$1000000)).w
                lsl.w   #5,d1
                lea     (CURRENT_MAP_TILESET_2_COPY).l,a0
                adda.w  d1,a0
                lsl.w   #5,d2
                movea.w d2,a1
                lsl.w   #NIBBLE_SHIFT_COUNT,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
@Return:
                
                rts

    ; End of function VInt_UpdateMapAnimations

                modend
