
; ASM FILE code\common\scripting\entity\entityscriptengine_1.asm :
; 0x4C68..0x4E86 : Entity script engine, part 1

; =============== S U B R O U T I N E =======================================


VInt_UpdateSprites:
                
                module
                tst.b   ((SPRITES_FRAME_COUNTER-$1000000)).w
                bne.s   @Continue
                
                ; Loop counter back to start
                move.b  ((SPRITES_FRAME_COUNTER_START-$1000000)).w,((SPRITES_FRAME_COUNTER-$1000000)).w
@Continue:
                
                subq.b  #1,((SPRITES_FRAME_COUNTER-$1000000)).w
                move.b  ((SPRITES_FRAME_COUNTER-$1000000)).w,d6
                sub.b   ((SPRITES_FRAME_BLINKING_THRESHOLD-$1000000)).w,d6
                lea     ((ENTITY_DATA-$1000000)).w,a0
                lea     (SPRITE_16).l,a1
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                bne.s   @MapOnForeground
                
                move.w  ((VIEW_PLANE_B_X_COUNTER-$1000000)).w,d2
                sub.w   (HORIZONTAL_SCROLL_DATA+2).l,d2
                asl.w   #NIBBLE_SHIFT_COUNT,d2
                add.w   ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d2
                move.w  (VERTICAL_SCROLL_DATA+2).l,d3
                sub.w   ((VIEW_PLANE_B_Y_COUNTER-$1000000)).w,d3
                asl.w   #NIBBLE_SHIFT_COUNT,d3
                add.w   ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d3
                bra.s   @loc_1
@MapOnForeground:
                
                move.w  ((VIEW_PLANE_A_X_COUNTER-$1000000)).w,d2
                sub.w   (HORIZONTAL_SCROLL_DATA).l,d2
                asl.w   #NIBBLE_SHIFT_COUNT,d2
                add.w   ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d2
                move.w  (VERTICAL_SCROLL_DATA).l,d3
                sub.w   ((VIEW_PLANE_A_Y_COUNTER-$1000000)).w,d3
                asl.w   #NIBBLE_SHIFT_COUNT,d3
                add.w   ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d3
@loc_1:
                
                subi.w  #15,d2
                subi.w  #15,d3
                moveq   #ENTITIES_COUNTER_MINUS_ONE,d7 ; number of entities, for iterating
@Loop:
                
                move.w  (a0),d0
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                sub.w   d2,d0
                sub.w   d3,d1
                asr.w   #NIBBLE_SHIFT_COUNT,d0
                asr.w   #NIBBLE_SHIFT_COUNT,d1
                cmpi.w  #-24,d0
                blt.w   @MoveSpriteOffScreen
                cmpi.w  #256,d0
                bgt.w   @MoveSpriteOffScreen
                cmpi.w  #-24,d1
                blt.w   @MoveSpriteOffScreen
                cmpi.w  #256,d1
                bgt.w   @MoveSpriteOffScreen
                
                ; Is entity blinking?
                btst    #7,ENTITYDEF_OFFSET_FLAGS_B(a0)
                beq.s   @IsSpecialSprite
                tst.b   d6
                bge.w   @MoveSpriteOffScreen ; move sprite off-screen to produce blinking effect
@IsSpecialSprite:
                
                tst.w   d7
                bne.s   @DetermineWalkingFrame
                move.b  ENTITYDEF_OFFSET_LAYER(a0),d5
                jsr     j_UpdateSpecialSprite
                bra.w   @NextEntity
@DetermineWalkingFrame:
                
                move.b  ENTITYDEF_OFFSET_ANIMCOUNTER(a0),d4
                cmpi.b  #15,d4
                bge.s   @WalkingFrame2
                move.w  #VDPTILE_ENTITIES_FRAME_1_START,d5 ; use first walking frame
                bra.s   @IsAnimated
@WalkingFrame2:
                
                move.w  #VDPTILE_ENTITIES_FRAME_2_START,d5 ; use second walking frame
@IsAnimated:
                
                cmpi.b  #-1,d4
                beq.s   @loc_2
                addq.b  #1,d4           ; increment counter if so
                
                ; Is 2x animation speed?
                btst    #4,ENTITYDEF_OFFSET_FLAGS_B(a0)
                beq.s   @CheckCounterEnd
                addq.b  #2,d4
@CheckCounterEnd:
                
                cmpi.b  #30,d4
                ble.s   @UpdateCounter
                clr.w   d4
@UpdateCounter:
                
                move.b  d4,ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
@loc_2:
                
                move.w  d6,-(sp)
                clr.w   d4
                move.b  ENTITYDEF_OFFSET_ENTNUM(a0),d4
                move.w  d4,d6           ; multiply by 18
                lsl.w   #3,d4
                add.w   d6,d4
                add.w   d4,d4
                add.w   d4,d5
                addi.w  #128,d0
                addi.w  #112,d1
                move.w  d0,VDPSPRITE_OFFSET_X(a1)
                move.w  d1,(a1)
                move.w  #64,d6          ; link
                sub.w   d7,d6
                addi.w  #VDPSPRITESIZE_V3|VDPSPRITESIZE_H3,d6
                move.w  d6,VDPSPRITE_OFFSET_SIZE(a1)
                ori.w   #VDPTILE_PALETTE3,d5
                move.b  ENTITYDEF_OFFSET_FLAGS_B(a0),d0
                andi.w  #ORIENTATION_MASK,d0
                cmpi.w  #ORIENTATION_INVERTED,d0
                bne.s   loc_4DA0
                ori.w   #VDPTILE_FLIP,d5
loc_4DA0:
                
                move.b  ENTITYDEF_OFFSET_FACING(a0),d0
                ext.w   d0
                move.b  table_4E16(pc,d0.w),d0
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
@NextEntity:
                
                adda.w  #ENTITYDEF_SIZE,a0
                addq.l  #VDP_SPRITE_ENTRY_SIZE,a1
                dbf     d7,@Loop
                
                clr.b   -5(a1)
                move.w  (a0),d0
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                sub.w   d2,d0
                sub.w   d3,d1
                asr.w   #NIBBLE_SHIFT_COUNT,d0
                asr.w   #NIBBLE_SHIFT_COUNT,d1
                cmpi.w  #-24,d0
                blt.w   loc_4E0A
                cmpi.w  #256,d0
                bgt.w   loc_4E0A
                cmpi.w  #-24,d1
                blt.w   loc_4E0A
                cmpi.w  #256,d1
                bgt.w   loc_4E0A
                jsr     j_UpdateCursorSprites
                bra.w   loc_4E10
loc_4E0A:
                
                jsr     j_UpdateSpritesHelper
loc_4E10:
            if (STANDARD_BUILD=1)
                bra.s   sub_4E24
            else
                bsr.w   sub_4E24
                rts
            endif

    ; End of function VInt_UpdateSprites

table_4E16:     dc.b 0
                dc.b 1
                dc.b 2
                dc.b 3
                dc.b 0
                dc.b 2
                dc.b 2
                dc.b 0

; START OF FUNCTION CHUNK FOR VInt_UpdateSprites

@MoveSpriteOffScreen:
                
                move.w  #1,(a1)
                bra.s   @NextEntity

; END OF FUNCTION CHUNK FOR VInt_UpdateSprites

                modend

; =============== S U B R O U T I N E =======================================


sub_4E24:
                
                lea     (SPRITE_TABLE).l,a1
                moveq   #7,d7           ; cursor sprite counter
                move.w  #64,d6          ; start at sprite 8
loc_4E30:
                
                cmpi.b  #16,VDPSPRITE_OFFSET_LINK(a1,d6.w)
                beq.s   loc_4E3E
                addq.w  #VDP_SPRITE_ENTRY_SIZE,d6
                dbf     d7,loc_4E30
loc_4E3E:
                
                clr.b   VDPSPRITE_OFFSET_LINK(a1,d6.w) ; link with sprite 0
                move.w  #56,d6          ; start at sprite 7
                moveq   #47,d7
                lea     ((byte_FFAFB0-$1000000)).w,a0
loc_4E4C:
                
                tst.b   (a0)+
                beq.s   loc_4E5E
                move.w  #63,d0
                sub.w   d7,d0
                move.b  d0,VDPSPRITE_OFFSET_LINK(a1,d6.w)
                move.w  d0,d6
                lsl.w   #3,d6           ; multiply by sprite entry size
loc_4E5E:
                
                dbf     d7,loc_4E4C
                
                moveq   #47,d7
                lea     ((byte_FFAFB0-$1000000)).w,a0
loc_4E68:
                
                tst.b   (a0)+
                bne.s   loc_4E7A
                move.w  #63,d0
                sub.w   d7,d0
                move.b  d0,VDPSPRITE_OFFSET_LINK(a1,d6.w)
                move.w  d0,d6
                lsl.w   #3,d6           ; multiply by sprite entry size
loc_4E7A:
                
                dbf     d7,loc_4E68
                
                move.b  #8,VDPSPRITE_OFFSET_LINK(a1,d6.w) ; link with sprite 8
                rts

    ; End of function sub_4E24

