
; SCRIPT SECTION system\maps\animations :
; Map animation function

; =============== S U B R O U T I N E =======================================

; 8 = foreground x, 4 = foreground y, 2 = background x, 1 = background y
; 
; Out: Z = is scrolling

IsMapScrollingToFollowCameraTarget:
										
										move.b  ((CAMERA_SCROLLING_MASK-$1000000)).w,d7
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

	; End of function IsMapScrollingToFollowCameraTarget


; =============== S U B R O U T I N E =======================================

VInt_4744:
										
										bclr    #0,((byte_FFA82D-$1000000)).w
										beq.s   loc_4764
										bsr.w   sub_4344
										movea.l ((WINDOW_TILES_END-$1000000)).w,a1
										cmpa.l  #VDP_TILE_IDX_LIST,a1
										beq.s   loc_4764
										bsr.w   CopyFFC000toFFC800
										bsr.w   sub_48A0
loc_4764:
										bclr    #1,((byte_FFA82D-$1000000)).w
										beq.s   return_4770
										bsr.w   sub_43A4
return_4770:
										
										rts

	; End of function VInt_4744


; =============== S U B R O U T I N E =======================================

VInt_UpdateAnimatingTiles:
										
										move.l  ((TILE_ANIM_DATA_ADDR-$1000000)).w,d0
										ble.s   return_47C4
										subq.w  #1,((TILE_ANIM_COUNTER-$1000000)).w
										bne.s   return_47C4
										movea.l d0,a0
										move.w  (a0)+,d1
										bge.w   loc_47A2
										clr.w   d0
										move.b  (TILE_ANIM_MAP_INDEX).l,d0
										movea.l (p_pt_MapData).l,a0
										lsl.w   #2,d0
										movea.l (a0,d0.w),a0
										movea.l $2A(a0),a0
										tst.l   (a0)+
										move.w  (a0)+,d1
loc_47A2:
										move.w  (a0)+,d0
										move.w  (a0)+,d2
										move.w  (a0)+,((TILE_ANIM_COUNTER-$1000000)).w
										move.l  a0,((TILE_ANIM_DATA_ADDR-$1000000)).w
										lsl.w   #5,d1
										lea     (byte_FF9B04).l,a0
										adda.w  d1,a0
										lsl.w   #5,d2
										movea.w d2,a1
										lsl.w   #4,d0
										moveq   #2,d1
										bsr.w   sub_119E        
return_47C4:
										
										rts

	; End of function VInt_UpdateAnimatingTiles

