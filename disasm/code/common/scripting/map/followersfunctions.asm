
; ASM FILE code\common\scripting\map\followersfunctions.asm :
; 0x44298..0x444A2 : Followers functions

; =============== S U B R O U T I N E =======================================

InitializeFollowerEntities:
		
		cmpi.b  #$2E,((CURRENT_MAP-$1000000)).w 
						; new granseal headquarters
		beq.w   return_44336    ; HARDCODED maps with no followers
		cmpi.b  #$25,((CURRENT_MAP-$1000000)).w 
						; nazca ship headquarters
		beq.w   return_44336
		movem.l a6,-(sp)
		lea     Followers(pc), a4
		lea     pt_eas_Followers(pc), a6
		lea     ((byte_FFAFB0-$1000000)).w,a5
		move.b  #1,(a5)
		trap    #CHECK_FLAG
		dc.w $41                ; Caravan is unlocked (0x4428A..0x44337, 0x44338..0x44403)
		beq.s   loc_442D2
		bsr.s   IsOverworldMap
		beq.s   loc_442D2
		lea     OverworldFollowers(pc), a4
		lea     pt_eas_WorldmapFollowers(pc), a6
loc_442D2:
		cmpi.w  #$FFFF,(a4)
		beq.w   loc_44332
		movem.w d1,-(sp)
		clr.w   d1
		move.b  (a4),d1
		jsr     j_CheckFlag
		movem.w (sp)+,d1
		beq.s   loc_4432E
		move.w  d0,-(sp)
		clr.w   d0
		move.b  1(a4),d0
		cmpi.b  #$1E,d0         ; HARDCODED max force member index
		bcc.s   loc_44302
		bsr.w   GetForceMemberSpriteIdx
		bra.s   loc_44308
loc_44302:
		clr.w   d4
		move.b  2(a4),d4        ; optional mapsprite index for non-force members
loc_44308:
		move.w  (sp)+,d0
		clr.l   d6
		move.b  1(a4),d6
		tst.b   d6
		bpl.s   loc_44318
		subi.w  #$60,d6 
loc_44318:
		move.b  3(a4),(a5,d0.w)
		move.b  d0,(a1,d6.w)
		move.w  d0,d6
		move.l  (a6)+,d5
		bsr.w   DeclareNewEntity
		move.b  d0,(a3)+
		addq.w  #1,d0
loc_4432E:
		addq.l  #4,a4
		bra.s   loc_442D2
loc_44332:
		movem.l (sp)+,a6
return_44336:
		rts

	; End of function InitializeFollowerEntities

OverworldFollowers:
		incbin "data/overworldfollowers.bin"
Followers:      incbin "data/followers.bin"
pt_eas_Followers:
		dc.l eas_Follower1
		dc.l eas_Follower2
		dc.l eas_Follower3
		dc.l eas_Follower4
		dc.l eas_Follower4
pt_eas_WorldmapFollowers:
		dc.l eas_Follower1      ; when on worldmap
		dc.l eas_OverworldFollower2
		dc.l eas_OverworldFollower3
		dc.l eas_Follower2
		dc.l eas_OverworldFollower5

; =============== S U B R O U T I N E =======================================

InitializeFollowerActscripts:
		
		movem.l a6,-(sp)
		lea     Followers(pc), a4
		lea     pt_eas_Followers(pc), a6
		trap    #CHECK_FLAG
		dc.w $41                ; Caravan is unlocked (0x4428A..0x44337, 0x44338..0x44403)
		beq.s   loc_443D2
		bsr.w   IsOverworldMap
		beq.s   loc_443D2
		lea     OverworldFollowers(pc), a4
		lea     pt_eas_WorldmapFollowers(pc), a6
loc_443D2:
		lea     ((OTHER_ENTITIES-$1000000)).w,a0
loc_443D6:
		cmpi.w  #$FFFF,(a4)
		beq.w   loc_443FE
		movem.w d1,-(sp)
		clr.w   d1
		move.b  (a4),d1
		jsr     j_CheckFlag
		movem.w (sp)+,d1
		beq.s   loc_443FA
		move.l  (a6)+,$14(a0)
		lea     $20(a0),a0
loc_443FA:
		addq.l  #4,a4
		bra.s   loc_443D6
loc_443FE:
		movem.l (sp)+,a6
		rts

	; End of function InitializeFollowerActscripts


; =============== S U B R O U T I N E =======================================

sub_44404:
		cmpi.b  #2,((PLAYER_TYPE-$1000000)).w
		bne.s   loc_44420
		move.b  #$3D,((ENTITY_MAPSPRITE-$1000000)).w 
		bsr.w   sub_4446C
		move.w  #$40,d1 
		move.w  d1,d2
		bra.w   loc_4443C
loc_44420:
		trap    #CHECK_FLAG
		dc.w $40                ; Raft is unlocked (0x05264)
		beq.w   return_4446A
		move.b  ((CURRENT_MAP-$1000000)).w,d0
		cmp.b   ((RAFT_MAP_INDEX-$1000000)).w,d0
		bne.w   return_4446A
		move.b  ((RAFT_X-$1000000)).w,d1
		move.b  ((RAFT_Y-$1000000)).w,d2
loc_4443C:
		move.w  #$1F,d0
		andi.w  #$7F,d1 
		muls.w  #$180,d1
		andi.w  #$7F,d2 
		muls.w  #$180,d2
		moveq   #2,d3
		moveq   #$3D,d4 
		move.l  #eas_Standing,d5
		clr.w   d6
		lea     ((ENTITY_EVENT_IDX_LIST-$1000000)).w,a0
		move.b  d0,$3F(a0)
		move.w  d0,d6
		bsr.w   DeclareNewEntity
return_4446A:
		rts

	; End of function sub_44404


; =============== S U B R O U T I N E =======================================

sub_4446C:
		movem.l d0/a0-a1,-(sp)
		lea     ((FOLLOWERS_LIST-$1000000)).w,a0
		lea     eas_Standing(pc), a1
loc_44478:
		move.b  (a0)+,d0
		cmpi.b  #$FF,d0
		beq.s   loc_4449C
		movem.l a0,-(sp)
		bsr.w   GetEntityRAMAddress
		move.l  #$60006000,(a0)
		move.l  (a0),ENTITYDEF_OFFSET_XDEST(a0)
		move.l  a1,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
		movem.l (sp)+,a0
		bra.s   loc_44478
loc_4449C:
		movem.l (sp)+,d0/a0-a1
		rts

	; End of function sub_4446C

