
; ASM FILE code\common\scripting\entity\entityscriptengine_1.asm :
; 0x4C68..0x4E86 : Entity script engine, part 1

; =============== S U B R O U T I N E =======================================


VInt_UpdateSprites:
                
                tst.b   ((byte_FFAF69-$1000000)).w
                bne.s   loc_4C74
                move.b  ((byte_FFAF6A-$1000000)).w,((byte_FFAF69-$1000000)).w
loc_4C74:
                
                subq.b  #1,((byte_FFAF69-$1000000)).w
                move.b  ((byte_FFAF69-$1000000)).w,d6
                sub.b   ((byte_FFAF6B-$1000000)).w,d6
                lea     ((ENTITY_DATA-$1000000)).w,a0
                lea     (SPRITE_16).l,a1
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                bne.s   loc_4CB2
                move.w  ((VIEW_PLANE_B_X_COUNTER-$1000000)).w,d2
                sub.w   (HORIZONTAL_SCROLL_DATA+2).l,d2
                asl.w   #4,d2
                add.w   ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d2
                move.w  (VERTICAL_SCROLL_DATA+2).l,d3
                sub.w   ((VIEW_PLANE_B_Y_COUNTER-$1000000)).w,d3
                asl.w   #4,d3
                add.w   ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d3
                bra.s   loc_4CD2
loc_4CB2:
                
                move.w  ((VIEW_PLANE_A_X_COUNTER-$1000000)).w,d2
                sub.w   (HORIZONTAL_SCROLL_DATA).l,d2
                asl.w   #4,d2
                add.w   ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d2
                move.w  (VERTICAL_SCROLL_DATA).l,d3
                sub.w   ((VIEW_PLANE_A_Y_COUNTER-$1000000)).w,d3
                asl.w   #4,d3
                add.w   ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d3
loc_4CD2:
                
                subi.w  #$F,d2
                subi.w  #$F,d3
                moveq   #$2F,d7 ; number of entities, for iterating
loc_4CDC:
                
                move.w  (a0),d0
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                sub.w   d2,d0
                sub.w   d3,d1
                asr.w   #4,d0
                asr.w   #4,d1
                cmpi.w  #$FFE8,d0
                blt.w   sub_4E1E
                cmpi.w  #$100,d0
                bgt.w   sub_4E1E
                cmpi.w  #$FFE8,d1
                blt.w   sub_4E1E
                cmpi.w  #$100,d1
                bgt.w   sub_4E1E
                btst    #7,ENTITYDEF_OFFSET_FLAGS_B(a0)
                beq.s   loc_4D18
                tst.b   d6
                bge.w   sub_4E1E
loc_4D18:
                
                tst.w   d7
                bne.s   loc_4D2A
                move.b  ENTITYDEF_OFFSET_LAYER(a0),d5
                jsr     j_UpdateSpecialSprites
                bra.w   loc_4DC4
loc_4D2A:
                
                move.b  ENTITYDEF_OFFSET_ANIMCOUNTER(a0),d4
                cmpi.b  #$F,d4
                bge.s   loc_4D3A
                move.w  #$380,d5
                bra.s   loc_4D3E
loc_4D3A:
                
                move.w  #$389,d5
loc_4D3E:
                
                cmpi.b  #$FF,d4
                beq.s   loc_4D5C
                addq.b  #1,d4
                btst    #4,ENTITYDEF_OFFSET_FLAGS_B(a0)
                beq.s   loc_4D50
                addq.b  #2,d4
loc_4D50:
                
                cmpi.b  #$1E,d4
                ble.s   loc_4D58
                clr.w   d4
loc_4D58:
                
                move.b  d4,ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
loc_4D5C:
                
                move.w  d6,-(sp)
                clr.w   d4
                move.b  ENTITYDEF_OFFSET_ENTNUM(a0),d4
                move.w  d4,d6
                lsl.w   #3,d4
                add.w   d6,d4
                add.w   d4,d4
                add.w   d4,d5
                addi.w  #$80,d0 
                addi.w  #$70,d1 
                move.w  d0,VDPSPRITE_OFFSET_X(a1)
                move.w  d1,(a1)
                move.w  #64,d6          ; link
                sub.w   d7,d6
                addi.w  #VDPSPRITESIZE_V3|VDPSPRITESIZE_H3,d6
                move.w  d6,VDPSPRITE_OFFSET_SIZE(a1)
                ori.w   #VDPTILE_PALETTE3,d5
                move.b  ENTITYDEF_OFFSET_FLAGS_B(a0),d0
                andi.w  #3,d0
                cmpi.w  #2,d0
                bne.s   loc_4DA0
                ori.w   #VDPTILE_FLIP,d5
loc_4DA0:
                
                move.b  ENTITYDEF_OFFSET_FACING(a0),d0
                ext.w   d0
                move.b  byte_4E16(pc,d0.w),d0
                bne.s   loc_4DB0
                ori.w   #VDPTILE_MIRROR,d5
loc_4DB0:
                
                move.b  ((WINDOW_IS_PRESENT-$1000000)).w,d6
                cmp.b   ENTITYDEF_OFFSET_LAYER(a0),d6
                bge.s   loc_4DBE
                ori.w   #VDPTILE_PRIORITY,d5
loc_4DBE:
                
                move.w  d5,VDPSPRITE_OFFSET_TILE(a1)
                move.w  (sp)+,d6
loc_4DC4:
                
                adda.w  #ENTITYDEF_SIZE,a0
                addq.l  #8,a1
                dbf     d7,loc_4CDC
                clr.b   -5(a1)
                move.w  (a0),d0
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                sub.w   d2,d0
                sub.w   d3,d1
                asr.w   #4,d0
                asr.w   #4,d1
                cmpi.w  #$FFE8,d0
                blt.w   loc_4E0A
                cmpi.w  #$100,d0
                bgt.w   loc_4E0A
                cmpi.w  #$FFE8,d1
                blt.w   loc_4E0A
                cmpi.w  #$100,d1
                bgt.w   loc_4E0A
                jsr     j_UpdateUnitCursorSprites
                bra.w   loc_4E10
loc_4E0A:
                
                jsr     sub_20024
loc_4E10:
            if (STANDARD_BUILD=1)
                bra.s   sub_4E24
            else
                bsr.w   sub_4E24
                rts
            endif

    ; End of function VInt_UpdateSprites

byte_4E16:      dc.b 0
                dc.b 1
                dc.b 2
                dc.b 3
                dc.b 0
                dc.b 2
                dc.b 2
                dc.b 0

; =============== S U B R O U T I N E =======================================


sub_4E1E:
                
                move.w  #1,(a1)
                bra.s   loc_4DC4

    ; End of function sub_4E1E


; =============== S U B R O U T I N E =======================================


sub_4E24:
                
                lea     (SPRITE_TABLE).l,a1
                moveq   #7,d7
                move.w  #$40,d6 
loc_4E30:
                
                cmpi.b  #$10,VDPSPRITE_OFFSET_LINK(a1,d6.w)
                beq.s   loc_4E3E
                addq.w  #8,d6
                dbf     d7,loc_4E30
loc_4E3E:
                
                clr.b   VDPSPRITE_OFFSET_LINK(a1,d6.w)
                move.w  #$38,d6 
                moveq   #$2F,d7 
                lea     ((byte_FFAFB0-$1000000)).w,a0
loc_4E4C:
                
                tst.b   (a0)+
                beq.s   loc_4E5E
                move.w  #$3F,d0 
                sub.w   d7,d0
                move.b  d0,VDPSPRITE_OFFSET_LINK(a1,d6.w)
                move.w  d0,d6
                lsl.w   #3,d6
loc_4E5E:
                
                dbf     d7,loc_4E4C
                moveq   #$2F,d7 
                lea     ((byte_FFAFB0-$1000000)).w,a0
loc_4E68:
                
                tst.b   (a0)+
                bne.s   loc_4E7A
                move.w  #$3F,d0 
                sub.w   d7,d0
                move.b  d0,VDPSPRITE_OFFSET_LINK(a1,d6.w)
                move.w  d0,d6
                lsl.w   #3,d6
loc_4E7A:
                
                dbf     d7,loc_4E68
loc_4E7E:
                
                move.b  #8,VDPSPRITE_OFFSET_LINK(a1,d6.w)
                rts

    ; End of function sub_4E24

