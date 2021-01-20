
; ASM FILE code\common\scripting\map\followersfunctions_2.asm :
; 0x4438A..0x444A2 : Follower functions, part 2
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
                lea     FollowersTable(pc), a4
                lea     pt_eas_Followers(pc), a6
                chkFlg  65              ; Caravan is unlocked
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
                bne.s   byte_44420      
                move.b  #$3D,((ENTITY_MAPSPRITE-$1000000)).w 
                bsr.w   sub_4446C
                move.w  #$40,d1 
                move.w  d1,d2
                bra.w   loc_4443C
byte_44420:
                
                chkFlg  64              ; Raft is unlocked
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
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
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
                bsr.w   GetEntityEntryAddress
                move.l  #$60006000,(a0)
                move.l  (a0),ENTITYDEF_OFFSET_XDEST(a0)
                move.l  a1,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                movem.l (sp)+,a0
                bra.s   loc_44478
loc_4449C:
                
                movem.l (sp)+,d0/a0-a1
                rts

    ; End of function sub_4446C

