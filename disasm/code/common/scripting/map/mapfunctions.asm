
; ASM FILE code\common\scripting\map\mapfunctions.asm :
; 0x440CC..0x4428A : Map functions

; =============== S U B R O U T I N E =======================================


InitializeMapEntities:
                
                module
                movem.l d0-a5,-(sp)
                bra.w   loc_440E2

    ; End of function InitializeMapEntities


; =============== S U B R O U T I N E =======================================

; unused InitializeMapEntities entry point


sub_440D4:
                
                movem.l d0-a5,-(sp)
                lea     GetEntityPortaitAndSpeechSfx(pc), a0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0

    ; End of function sub_440D4


; START OF FUNCTION CHUNK FOR InitializeMapEntities

loc_440E2:
                
                mulu.w  #MAP_TILE_SIZE,d1
                mulu.w  #MAP_TILE_SIZE,d2
                bsr.w   ClearEntities
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a1
                lea     NEXT_ENTITYDEF(a1),a2
                lea     ((EXPLORATION_ENTITIES-$1000000)).w,a3
                movem.w d1-d3,-(sp)
                moveq   #1,d0
                bsr.w   InitializeFollowerEntities
@Start:
                
                move.b  (a0)+,d1
                cmpi.b  #-1,d1
                beq.w   loc_44180
                andi.w  #$3F,d1 
                muls.w  #MAP_TILE_SIZE,d1
                move.b  (a0)+,d2
                andi.w  #$3F,d2 
                muls.w  #MAP_TILE_SIZE,d2
            if (STANDARD_BUILD=1)
                ; Get word-sized facing direction value -> d3.w, and mapsprite index -> d4.w
                move.w  (a0)+,d3        ; EXPANDED_MAPSPRITES
                move.w  (a0)+,d4
                
                move.w  d1,-(sp)
                move.w  d4,d1
                jsr     IsSpecialSprite ; Out: CCR carry-bit clear if true
                movem.w (sp)+,d1        ; MOVEM to pull value back from the stack without affecting the CCR
            else
                move.b  (a0)+,d3
                move.b  (a0)+,d4
                
                cmpi.b  #MAPSPRITES_SPECIALS_START,d4
            endif
                bcs.s   @RegularSprite
                
                ; Declare a new special sprite
                movem.w d0,-(sp)
                move.w  #ENTITY_SPECIAL_SPRITE,d0
                move.b  d0,(a2)+
                move.l  (a0)+,d5
                clr.l   d6
                move.w  #ENTITY_ENEMY_START,d6
                bsr.w   DeclareNewEntity
                movem.w (sp)+,d0
                bra.s   @Start
@RegularSprite:
                
            if (STANDARD_BUILD=1)
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d4 ; EXPANDED_MAPSPRITES
            else
                cmpi.b  #COMBATANT_ALLIES_NUMBER,d4
            endif
                bcc.s   loc_44170
                ext.w   d4
                tst.b   (a1,d4.w)
                beq.s   loc_4415A
                move.l  (a0)+,d5
            if (STANDARD_BUILD=1)
                bra.s   @Start ; optimization
            else
                bra.w   @goto_start
            endif
loc_4415A:
                
                move.b  d0,(a1,d4.w)
                movem.w d0-d1,-(sp)
                clr.w   d0
                move.b  d4,d0
                bsr.w   GetAllyMapsprite
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
@goto_start:
                
            if (STANDARD_BUILD=1)
                bra.w   @Start ; to accomodate expanded code
            else
                bra.s   @Start
            endif
loc_44180:
                
                movem.w (sp)+,d1-d3
                clr.w   d0
                clr.l   d6
                bsr.w   GetAllyMapsprite
                move.l  #eas_Idle,d5
                bsr.w   DeclareNewEntity
                move.w  #16,((SPRITE_SIZE-$1000000)).w
                move.b  #-1,(a3)
                bsr.w   sub_44404
                movem.l (sp)+,d0-a5
                rts

; END OF FUNCTION CHUNK FOR InitializeMapEntities

                modend

; =============== S U B R O U T I N E =======================================


DeclareRaftEntity:
                
                module
                movem.l d0-a1,-(sp)
                checkSavedByte #PLAYERTYPE_RAFT, PLAYER_TYPE
                beq.w   @Done
                checkSavedByte #PLAYERTYPE_CARAVAN, PLAYER_TYPE
                beq.w   byte_441F0      ; no followers
                
                mulu.w  #MAP_TILE_SIZE,d1
                mulu.w  #MAP_TILE_SIZE,d2
                lea     ((EXPLORATION_ENTITIES-$1000000)).w,a0
                lea     ((ENTITY_DATA-$1000000)).w,a1
@GetFollowerPosition_Loop:
                
                clr.w   d0
                move.b  (a0)+,d0
                cmpi.b  #-1,d0
                beq.s   byte_441F0      ; no followers
                
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                move.w  d1,(a1,d0.w)
                move.w  d2,ENTITYDEF_OFFSET_Y(a1,d0.w)
                move.w  d1,ENTITYDEF_OFFSET_XDEST(a1,d0.w)
                move.w  d2,ENTITYDEF_OFFSET_YDEST(a1,d0.w)
                bra.s   @GetFollowerPosition_Loop
byte_441F0:
                
                
                ; Is raft unlocked?
                chkFlg  64
                beq.w   @Done
                
                ; Is raft present on map?
                getSavedByte CURRENT_MAP, d0
                checkRaftMap d0
                bne.s   @RaftNotOnMap
                
                ; Declare raft entity
                getSavedByte RAFT_X, d1
                getSavedByte RAFT_Y, d2
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
                move.w  #ENTITY_RAFT,d0
                move.w  d3,d1
                moveq   #-1,d2
                moveq   #-1,d3
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

    ; End of function DeclareRaftEntity

                modend

; =============== S U B R O U T I N E =======================================

; Out: ccr zero-bit clear if true


IsOverworldMap:
                
                movem.l d0-d1/a0,-(sp)
                clr.w   d1
                lea     table_OverworldMaps(pc), a0
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

