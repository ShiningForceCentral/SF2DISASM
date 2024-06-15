
; ASM FILE code\common\scripting\map\followersfunctions_2.asm :
; 0x4438A..0x444A2 : Follower functions, part 2
pt_eas_Followers:
                dc.l eas_Follower1
                dc.l eas_Follower2
                dc.l eas_Follower3
                dc.l eas_Follower4
                dc.l eas_Follower4
pt_eas_OverworldFollowers:
                dc.l eas_Follower1      ; when on overworld
                dc.l eas_OverworldFollower2
                dc.l eas_OverworldFollower3
                dc.l eas_Follower2
                dc.l eas_OverworldFollower5

; =============== S U B R O U T I N E =======================================


InitializeFollowerActscripts:
                
                movem.l a6,-(sp)
                lea     table_Followers(pc), a4
                lea     pt_eas_Followers(pc), a6
                chkFlg  65              ; Caravan is unlocked
                beq.s   loc_443D2
                bsr.w   IsOverworldMap  
                beq.s   loc_443D2
                lea     table_OverworldFollowers(pc), a4
                lea     pt_eas_OverworldFollowers(pc), a6
loc_443D2:
                
                lea     ((OTHER_ENTITIES_DATA-$1000000)).w,a0
loc_443D6:
                
                cmpi.w  #-1,(a4)
                beq.w   loc_443FE
                movem.w d1,-(sp)
                clr.w   d1
                move.b  (a4),d1
                jsr     j_CheckFlag
                movem.w (sp)+,d1
                beq.s   loc_443FA
                move.l  (a6)+,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                lea     NEXT_ENTITYDEF(a0),a0
loc_443FA:
                
                addq.l  #FOLLOWER_ENTITY_SIZE,a4
                bra.s   loc_443D6
loc_443FE:
                
                movem.l (sp)+,a6
                rts

    ; End of function InitializeFollowerActscripts


; =============== S U B R O U T I N E =======================================


sub_44404:
                
                module
                checkSavedByte #PLAYERTYPE_RAFT, PLAYER_TYPE
                bne.s   byte_44420      
                
                ; Player is a raft
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                move.w  #MAPSPRITE_RAFT,((ENTITY_MAPSPRITE-$1000000)).w
            else
                move.b  #MAPSPRITE_RAFT,((ENTITY_MAPSPRITE-$1000000)).w
            endif
                bsr.w   MakeFollowersStand
                move.w  #$40,d1 
                move.w  d1,d2
                bra.w   loc_4443C
byte_44420:
                
                chkFlg  64              ; Raft is unlocked
                beq.w   return_4446A
                getSavedByte CURRENT_MAP, d0
                checkRaftMap d0
                bne.w   return_4446A
                getSavedByte RAFT_X, d1
                getSavedByte RAFT_Y, d2
loc_4443C:
                
                move.w  #ENTITY_RAFT,d0
                andi.w  #$7F,d1 
                muls.w  #MAP_TILE_SIZE,d1
                andi.w  #$7F,d2 
                muls.w  #MAP_TILE_SIZE,d2
                moveq   #LEFT,d3        ; facing
            if (STANDARD_BUILD=1)
                move.w  #MAPSPRITE_RAFT,d4 ; EXPANDED_MAPSPRITES
            else
                moveq   #MAPSPRITE_RAFT,d4
            endif
                move.l  #eas_Standing,d5
                clr.w   d6
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
                move.b  d0,$3F(a0)
                move.w  d0,d6
                bsr.w   DeclareNewEntity
return_4446A:
                
                rts

    ; End of function sub_44404

                modend

; =============== S U B R O U T I N E =======================================


MakeFollowersStand:
                
                movem.l d0/a0-a1,-(sp)
                lea     ((EXPLORATION_ENTITIES-$1000000)).w,a0
                lea     eas_Standing(pc), a1
@Loop:
                
                move.b  (a0)+,d0
                cmpi.b  #-1,d0
                beq.s   @Done
                
                movem.l a0,-(sp)
                bsr.w   GetEntityEntryAddress
                move.l  #$60006000,(a0)
                move.l  (a0),ENTITYDEF_OFFSET_XDEST(a0)
                move.l  a1,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                movem.l (sp)+,a0
                bra.s   @Loop
@Done:
                
                movem.l (sp)+,d0/a0-a1
                rts

    ; End of function MakeFollowersStand

