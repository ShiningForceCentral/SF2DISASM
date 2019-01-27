
; ASM FILE code\common\maps\egressinit.asm :
; 0x75EC..0x764E : Egress map init function

; =============== S U B R O U T I N E =======================================

; In: D0 = from map idx
; Out: D0 = to map idx
;      D1 = X
;      D2 = Y
;      D3 = facing

GetEgressPositionForMap:
		
		 
		chkFlg $18F             ; set after first battle's cutscene OR first save? Checked at witch screens
		bne.s   loc_75FC        ; egress always goes back to granseal church (Wiz : or is it Bowie's room ?) if you haven't triggered the gizmos cutscene
		moveq   #3,d0           ; HARDCODED default egress position
		moveq   #$38,d1 
		moveq   #3,d2
		moveq   #3,d3
		rts
loc_75FC:
		move.l  a0,-(sp)
		moveq   #1,d1
		moveq   #1,d2
		moveq   #1,d3
		conditionalPc lea,SavepointMapCoords,a0
loc_7608:
		cmpi.b  #$FF,(a0)
		beq.w   byte_7620       
		cmp.b   (a0),d0
		beq.s   loc_7618
		addq.l  #4,a0
		bra.s   loc_7608
loc_7618:
		move.b  (a0)+,d0
		move.b  (a0)+,d1
		move.b  (a0)+,d2
		move.b  (a0)+,d3
byte_7620:
		chkFlg $40              ; Raft is unlocked (0x05264)
		beq.s   loc_764A
		conditionalPc lea,RaftResetMapCoords,a0
						; separate raft egress locations?
loc_762A:
		addq.l  #4,a0
		cmpi.b  #$FF,(a0)
		beq.w   loc_7638
		cmp.b   (a0),d0
		bne.s   loc_762A
loc_7638:
		move.b  1(a0),((RAFT_MAP_INDEX-$1000000)).w
		move.b  2(a0),((RAFT_X-$1000000)).w
		move.b  3(a0),((RAFT_Y-$1000000)).w
loc_764A:
		movea.l (sp)+,a0
		rts

	; End of function GetEgressPositionForMap

