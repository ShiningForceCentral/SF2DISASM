
; ASM FILE code\common\maps\animations.asm :
; 0x4728..0x47C6 : Map animation function

; =============== S U B R O U T I N E =======================================

; Out: Z = is scrolling


IsMapScrollingToViewTarget:
                
                move.b  ((VIEW_SCROLLING_PLANES_BITMAP-$1000000)).w,d7
                tst.w   ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
                beq.s   loc_4736
                andi.b  #3,d7
loc_4736:
                
                tst.w   ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
                beq.s   loc_4740
                andi.b  #$C,d7
loc_4740:
                
                tst.b   d7
                rts

    ; End of function IsMapScrollingToViewTarget


; =============== S U B R O U T I N E =======================================


VInt_UpdateMapPlanes:
                
                bclr    #0,((VIEW_PLANE_UPDATE_TRIGGERS-$1000000)).w
                beq.s   loc_4764
                bsr.w   UpdateVdpPlaneA 
                movea.l ((WINDOW_LAYOUTS_END-$1000000)).w,a1
                cmpa.l  #WINDOW_TILE_LAYOUTS,a1
                beq.s   loc_4764
                bsr.w   CopyPlaneALayoutForWindows
                bsr.w   FixWindowsPositions
loc_4764:
                
                bclr    #1,((VIEW_PLANE_UPDATE_TRIGGERS-$1000000)).w
                beq.s   return_4770
                bsr.w   UpdateVdpPlaneB 
return_4770:
                
                rts

    ; End of function VInt_UpdateMapPlanes


; =============== S U B R O U T I N E =======================================


VInt_UpdateMapAnimations:
                
                move.l  ((TILE_ANIMATION_DATA_ADDRESS-$1000000)).w,d0
                ble.s   return_47C4
                subq.w  #1,((TILE_ANIMATION_COUNTER-$1000000)).w
                bne.s   return_47C4
                movea.l d0,a0
                move.w  (a0)+,d1
                bge.w   loc_47A2
                clr.w   d0
                move.b  (TILE_ANIMATION_MAP_INDEX).l,d0
                movea.l (p_pt_MapData).l,a0
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                movea.l $2A(a0),a0
                tst.l   (a0)+
                move.w  (a0)+,d1
loc_47A2:
                
                move.w  (a0)+,d0
                move.w  (a0)+,d2
                move.w  (a0)+,((TILE_ANIMATION_COUNTER-$1000000)).w
                move.l  a0,((TILE_ANIMATION_DATA_ADDRESS-$1000000)).w
                lsl.w   #5,d1
                lea     (byte_FF9B04).l,a0
                adda.w  d1,a0
                lsl.w   #5,d2
                movea.w d2,a1
                lsl.w   #4,d0
                moveq   #2,d1
                bsr.w   ApplyVIntVramDma
return_47C4:
                
                rts

    ; End of function VInt_UpdateMapAnimations

