
; ASM FILE code\common\scripting\map\mapfunctions.asm :
; 0x440CC..0x4428A : Map functions

; =============== S U B R O U T I N E =======================================


InitializeMapEntities:
                
                movem.l d0-a5,-(sp)
                bra.w   loc_440E2

    ; End of function InitializeMapEntities


; =============== S U B R O U T I N E =======================================

; unused InitializeMapEntities entry point


sub_440D4:
                
                movem.l d0-a5,-(sp)
                lea     GetEntityPortaitAndSpeechSfx(pc), a0
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0

    ; End of function sub_440D4


; START OF FUNCTION CHUNK FOR InitializeMapEntities

loc_440E2:
                
                mulu.w  #$180,d1
                mulu.w  #$180,d2
                bsr.w   ClearEntities
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a1
                lea     NEXT_ENTITYDEF(a1),a2
                lea     ((FOLLOWERS_LIST-$1000000)).w,a3
                movem.w d1-d3,-(sp)
                moveq   #1,d0
                bsr.w   InitializeFollowerEntities
loc_44104:
                
                move.b  (a0)+,d1
                cmpi.b  #$FF,d1
                beq.w   loc_44180
                andi.w  #$3F,d1 
                muls.w  #$180,d1
                move.b  (a0)+,d2
                andi.w  #$3F,d2 
                muls.w  #$180,d2
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                cmpi.b  #$F0,d4
                bcs.s   loc_44146
                movem.w d0,-(sp)
                move.w  #$2F,d0 
                move.b  d0,(a2)+
                move.l  (a0)+,d5
                clr.l   d6
                move.w  #$20,d6 
                bsr.w   DeclareNewEntity
                movem.w (sp)+,d0
                bra.s   loc_44104
loc_44146:
                
                cmpi.b  #COMBATANT_ALLIES_NUMBER,d4
                bcc.s   loc_44170
                ext.w   d4
                tst.b   (a1,d4.w)
                beq.s   loc_4415A
                move.l  (a0)+,d5
                bra.w   loc_4417E
loc_4415A:
                
                move.b  d0,(a1,d4.w)
                movem.w d0-d1,-(sp)
                clr.w   d0
                move.b  d4,d0
                bsr.w   GetAllyMapSprite
                movem.w (sp)+,d0-d1
                bra.s   loc_44172
loc_44170:
                
                move.b  d0,(a2)+
loc_44172:
                
                move.l  (a0)+,d5
                clr.l   d6
                move.w  d0,d6
                bsr.w   DeclareNewEntity
                addq.w  #1,d0
loc_4417E:
                
                bra.s   loc_44104
loc_44180:
                
                movem.w (sp)+,d1-d3
                clr.w   d0
                clr.l   d6
                bsr.w   GetAllyMapSprite
                move.l  #eas_Idle,d5
                bsr.w   DeclareNewEntity
                move.w  #$10,((SPRITE_SIZE-$1000000)).w
                move.b  #$FF,(a3)
                bsr.w   sub_44404
                movem.l (sp)+,d0-a5
                rts

; END OF FUNCTION CHUNK FOR InitializeMapEntities


; =============== S U B R O U T I N E =======================================


sub_441AA:
                
                module
                movem.l d0-a1,-(sp)
                checkSavedByte #PLAYERTYPE_RAFT, PLAYER_TYPE
                beq.w   @Done
                checkSavedByte #PLAYERTYPE_CARAVAN, PLAYER_TYPE
                beq.w   byte_441F0      ; No followers
                mulu.w  #$180,d1
                mulu.w  #$180,d2
                lea     ((FOLLOWERS_LIST-$1000000)).w,a0
                lea     ((ENTITY_DATA-$1000000)).w,a1
@GetFollowerPosition_Loop:
                
                clr.w   d0
                move.b  (a0)+,d0
                cmpi.b  #CODE_TERMINATOR_BYTE,d0
                beq.s   byte_441F0      ; No followers
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                move.w  d1,(a1,d0.w)
                move.w  d2,ENTITYDEF_OFFSET_Y(a1,d0.w)
                move.w  d1,ENTITYDEF_OFFSET_XDEST(a1,d0.w)
                move.w  d2,ENTITYDEF_OFFSET_YDEST(a1,d0.w)
                bra.s   @GetFollowerPosition_Loop
byte_441F0:
                
                ; No followers
                chkFlg  64              ; Raft is unlocked
                beq.w   @Done
                getSavedByte CURRENT_MAP, d0
                checkRaftMap d0
                bne.s   @RaftNotOnMap
                getSavedByte RAFT_X, d1
                getSavedByte RAFT_Y, d2
                move.w  #FOLLOWER_B,d0
                andi.w  #$7F,d1 
                muls.w  #$180,d1
                andi.w  #$7F,d2 
                muls.w  #$180,d2
                moveq   #LEFT,d3        ; facing
                moveq   #MAPSPRITE_RAFT,d4
                move.l  #eas_Standing,d5
                clr.w   d6
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
                move.b  d0,$3F(a0)
                move.w  d0,d6
                bsr.w   DeclareNewEntity
                move.w  #FOLLOWER_B,d0
                move.w  d3,d1
                moveq   #$FFFFFFFF,d2
                moveq   #$FFFFFFFF,d3
                jsr     (UpdateEntityProperties).w
                bra.s   @Done
@RaftNotOnMap:
                
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
                clr.b   $3F(a0)
                lea     ((ENTITY_RAFT_DATA-$1000000)).w,a0
                move.l  #$70007000,(a0)
                move.l  #$70007000,ENTITYDEF_OFFSET_XDEST(a0)
@Done:
                
                movem.l (sp)+,d0-a1
                rts

    ; End of function sub_441AA

                modend

; =============== S U B R O U T I N E =======================================

; Out: ccr zero-bit clear if true


IsOverworldMap:
                
                movem.l d0-d1/a0,-(sp)
                clr.w   d1
                lea     tbl_OverworldMaps(pc), a0
@Loop:
                
                move.b  (a0)+,d0
                bmi.w   @Break
                checkCurrentMap d0
                bne.s   @Next
                addq.w  #1,d1
@Next:
                
                bra.s   @Loop
@Break:
                
                tst.w   d1
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function IsOverworldMap

