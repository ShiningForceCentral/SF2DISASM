
; ASM FILE code\common\scripting\map\mapfunctions.asm :
; 0x440CC..0x4428A : Map functions

; =============== S U B R O U T I N E =======================================


InitMapEntities:
                
                movem.l d0-a5,-(sp)
                bra.w   loc_440E2

    ; End of function InitMapEntities


; =============== S U B R O U T I N E =======================================


sub_440D4:
                
                movem.l d0-a5,-(sp)
                lea     GetEntityPortaitAndSpeechSfx(pc), a0
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0

    ; End of function sub_440D4


; START OF FUNCTION CHUNK FOR InitMapEntities

loc_440E2:
                
                mulu.w  #$180,d1
                mulu.w  #$180,d2
                bsr.w   ClearEntities
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a1
                lea     $20(a1),a2
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

; END OF FUNCTION CHUNK FOR InitMapEntities


; =============== S U B R O U T I N E =======================================


sub_441AA:
                
                movem.l d0-a1,-(sp)
                cmpi.b  #2,((PLAYER_TYPE-$1000000)).w
                beq.w   loc_44262
                cmpi.b  #1,((PLAYER_TYPE-$1000000)).w
                beq.w   byte_441F0      
                mulu.w  #$180,d1
                mulu.w  #$180,d2
                lea     ((FOLLOWERS_LIST-$1000000)).w,a0
                lea     ((ENTITY_DATA-$1000000)).w,a1
loc_441D2:
                
                clr.w   d0
                move.b  (a0)+,d0
                cmpi.b  #$FF,d0
                beq.s   byte_441F0      
                lsl.w   #5,d0
                move.w  d1,(a1,d0.w)
                move.w  d2,2(a1,d0.w)
                move.w  d1,$C(a1,d0.w)
                move.w  d2,$E(a1,d0.w)
                bra.s   loc_441D2
byte_441F0:
                
                chkFlg  64              ; Raft is unlocked
                beq.w   loc_44262
                move.b  ((CURRENT_MAP-$1000000)).w,d0
                cmp.b   ((RAFT_MAP_INDEX-$1000000)).w,d0
                bne.s   loc_44248
                move.b  ((RAFT_X-$1000000)).w,d1
                move.b  ((RAFT_Y-$1000000)).w,d2
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
                move.w  #$1F,d0
                move.w  d3,d1
                moveq   #$FFFFFFFF,d2
                moveq   #$FFFFFFFF,d3
                jsr     (UpdateEntityProperties).w
                bra.s   loc_44262
loc_44248:
                
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
                clr.b   $3F(a0)
                lea     ((byte_FFACE2-$1000000)).w,a0
                move.l  #$70007000,(a0)
                move.l  #$70007000,$C(a0)
loc_44262:
                
                movem.l (sp)+,d0-a1
                rts

    ; End of function sub_441AA


; =============== S U B R O U T I N E =======================================


IsOverworldMap:
                
                movem.l d0-d1/a0,-(sp)
                clr.w   d1
                lea     OverworldMaps(pc), a0
loc_44272:
                
                move.b  (a0)+,d0
                bmi.w   loc_44282
                cmp.b   ((CURRENT_MAP-$1000000)).w,d0
                bne.s   loc_44280
                addq.w  #1,d1
loc_44280:
                
                bra.s   loc_44272
loc_44282:
                
                tst.w   d1
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function IsOverworldMap

