
; ASM FILE code\common\menus\minimapscreen.asm :
; 0x1288E..0x12DEC : Menu engine, part 5 : Minimap screen functions

; =============== S U B R O U T I N E =======================================

var_32 = -32
var_30 = -30
var_20 = -20
var_18 = -18
var_14 = -14
var_12 = -12
var_10 = -10
var_8 = -8
windowLayoutEndAddress = -6
windowSlot = -2

BuildMinimapScreen:
                
                link    a6,#-32
                move.l  ((ENTITY_SPECIAL_SPRITE_DATA-$1000000)).w,var_32(a6)
                move.l  #$70007000,((ENTITY_SPECIAL_SPRITE_DATA-$1000000)).w
                move.l  #$70007000,((ENTITY_SPECIAL_SPRITE_DESTINATION-$1000000)).w
                movem.l d0,-(sp)
                jsr     (WaitForVInt).w
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                lea     (PALETTE_1_CURRENT).l,a0
                lea     (PALETTE_2_CURRENT).l,a1
                move.l  $40(a0),$40(a1)
                move.l  (a0)+,(a1)+
                move.l  $40(a0),$40(a1)
                move.l  (a0)+,(a1)+
                move.l  $40(a0),$40(a1)
                move.l  (a0)+,(a1)+
                move.l  $40(a0),$40(a1)
                move.l  (a0)+,(a1)+
                move.l  $40(a0),$40(a1)
                move.l  (a0)+,(a1)+
                move.l  $40(a0),$40(a1)
                move.l  (a0)+,(a1)+
                move.l  $40(a0),$40(a1)
                move.l  (a0)+,(a1)+
                move.l  $40(a0),$40(a1)
                move.l  (a0)+,(a1)+
                jsr     (ApplyVIntCramDma).w
                move.b  #HALF_OUT_TO_BLACK,((FADING_SETTING-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%101,((FADING_PALETTE_BITFIELD-$1000000)).w
                bsr.w   sub_129E8
@WaitForFading:
                
                jsr     (WaitForVInt).w
                tst.b   ((FADING_SETTING-$1000000)).w
                bne.s   @WaitForFading
                
                move.w  var_14(a6),d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                or.w    var_12(a6),d0
                moveq   #$1C,d1
                sub.w   var_12(a6),d1
                lsr.w   #1,d1
                ori.w   #$2000,d1
                jsr     (CreateWindow).w
                move.w  d0,windowSlot(a6)
                move.l  a1,windowLayoutEndAddress(a6)
                bsr.w   sub_12C46
                moveq   #$20,d0 
                sub.w   var_14(a6),d0
                lsr.w   #1,d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                moveq   #$1C,d1
                sub.w   var_12(a6),d1
                lsr.w   #1,d1
                or.w    d0,d1
                move.w  windowSlot(a6),d0
                move.w  #6,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                bsr.w   sub_12CB0
                move.w  var_14(a6),d0
                neg.w   d0
                lsl.w   #BYTE_SHIFT_COUNT,d0
                moveq   #$1C,d1
                sub.w   var_12(a6),d1
                lsr.w   #1,d1
                or.w    d0,d1
                move.w  windowSlot(a6),d0
                move.w  #6,d2
                jsr     (MoveWindowWithSfx).w
                move.b  #FLICKER_ONCE,((FADING_SETTING-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #%101,((FADING_PALETTE_BITFIELD-$1000000)).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  d0,windowSlot(a6)
                jsr     (DeleteWindow).w
                move.b  #%1111,((FADING_PALETTE_BITFIELD-$1000000)).w
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                move.l  var_32(a6),((ENTITY_SPECIAL_SPRITE_DATA-$1000000)).w
                move.l  var_32(a6),((ENTITY_SPECIAL_SPRITE_DESTINATION-$1000000)).w
                lea     (PALETTE_1_BASE).l,a0
                lea     (PALETTE_1_CURRENT).l,a1
                move.w  #CRAM_SIZE,d7
                jsr     (CopyBytes).w   
                jsr     (ApplyVIntCramDma).w
                unlk    a6
                rts

    ; End of function BuildMinimapScreen


; =============== S U B R O U T I N E =======================================

var_32 = -32
var_30 = -30
var_20 = -20
var_18 = -18
var_14 = -14
var_12 = -12
var_10 = -10
var_8 = -8
windowLayoutEndAddress = -6
windowSlot = -2

sub_129E8:
                
                move.w  ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d0
                lsr.w   #7,d0
                ext.l   d0
                divs.w  #3,d0
                move.w  d0,var_20(a6)
                move.w  ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d0
                lsr.w   #7,d0
                ext.l   d0
                divs.w  #3,d0
                move.w  d0,var_18(a6)
                move.w  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,d0
                sub.w   ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d0
                lsr.w   #7,d0
                ext.l   d0
                divs.w  #3,d0
                cmpi.w  #$2F,d0 
                ble.s   loc_12A20
                moveq   #$2F,d0 
loc_12A20:
                
                move.w  d0,var_10(a6)
                move.w  ((MAP_AREA_LAYER1_ENDY-$1000000)).w,d1
                sub.w   ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d1
                lsr.w   #7,d1
                ext.l   d1
                divs.w  #3,d1
                cmpi.w  #$2F,d1 
                ble.s   loc_12A3C
                moveq   #$2F,d1 
loc_12A3C:
                
                move.w  d1,d2
                addq.w  #1,d0
                addq.w  #1,d2
                mulu.w  d2,d0
                cmpi.w  #$600,d0
                ble.s   loc_12A56
                move.w  #$600,d1
                divu.w  d2,d1
                subq.w  #1,d1
                andi.w  #$7FFC,d1
loc_12A56:
                
                move.w  d1,var_8(a6)
                move.w  var_10(a6),d0
                lsr.w   #1,d0
                addq.w  #3,d0
                move.w  d0,var_14(a6)
                move.w  var_8(a6),d0
                lsr.w   #1,d0
                addq.w  #3,d0
                move.w  d0,var_12(a6)
                lea     (FF0000_RAM_START).l,a0
                lea     (FF2000_LOADING_SPACE).l,a2
                lea     (FF6802_LOADING_SPACE).l,a1
                move.w  var_10(a6),d5
                move.w  d5,d6
                add.w   d5,d5
                add.w   d6,d5
                add.w   d5,d5
                moveq   #2,d4
                move.w  var_8(a6),d6
loc_12A96:
                
                move.w  var_10(a6),d7
loc_12A9A:
                
                move.w  var_8(a6),d3
                sub.w   d6,d3
                move.w  var_10(a6),d2
                sub.w   d7,d2
                jsr     (DisableInterrupts).w
                bsr.w   sub_12BA4
                move.w  (VDP_Data).l,(a1)
                move.w  (VDP_Data).l,d0
                move.w  (VDP_Data).l,4(a1)
                move.w  (VDP_Data).l,d0
                move.w  (VDP_Data).l,8(a1)
                move.w  (VDP_Data).l,d0
                move.w  (VDP_Data).l,$C(a1)
                addq.w  #1,d2
                bsr.w   sub_12BA4
                move.w  (VDP_Data).l,2(a1)
                move.w  (VDP_Data).l,d0
                move.w  (VDP_Data).l,6(a1)
                move.w  (VDP_Data).l,d0
                move.w  (VDP_Data).l,$A(a1)
                move.w  (VDP_Data).l,d0
                move.w  (VDP_Data).l,$E(a1)
                subq.w  #1,d2
                addq.w  #1,d3
                bsr.w   sub_12BA4
                move.w  (VDP_Data).l,$10(a1)
                move.w  (VDP_Data).l,d0
                move.w  (VDP_Data).l,$14(a1)
                move.w  (VDP_Data).l,d0
                move.w  (VDP_Data).l,$18(a1)
                move.w  (VDP_Data).l,d0
                move.w  (VDP_Data).l,$1C(a1)
                addq.w  #1,d2
                bsr.w   sub_12BA4
                move.w  (VDP_Data).l,$12(a1)
                move.w  (VDP_Data).l,d0
                move.w  (VDP_Data).l,$16(a1)
                move.w  (VDP_Data).l,d0
                move.w  (VDP_Data).l,$1A(a1)
                move.w  (VDP_Data).l,d0
                move.w  (VDP_Data).l,$1E(a1)
                jsr     (EnableInterrupts).w
                adda.w  #$20,a1 
                subq.w  #2,d7
                bge.w   loc_12A9A
                subq.w  #2,d6
                bge.w   loc_12A96
                jsr     (EnableInterrupts).w
                bra.w   loc_12BF4

    ; End of function sub_129E8


; =============== S U B R O U T I N E =======================================

var_32 = -32
var_30 = -30
var_20 = -20
var_18 = -18
var_14 = -14
var_12 = -12
var_10 = -10
var_8 = -8
windowLayoutEndAddress = -6
windowSlot = -2

sub_12BA4:
                
                movem.w d2-d3,-(sp)
                add.w   var_20(a6),d2
                add.w   var_18(a6),d3
                lsl.w   #6,d3
                add.w   d3,d2
                add.w   d2,d2
                move.w  (a0,d2.w),d2
                andi.w  #$3FF,d2
                mulu.w  #$12,d2
                move.w  8(a2,d2.w),d2
                andi.w  #$7FF,d2
                cmpi.w  #$100,d2
                bne.s   @loc
                
                move.w  #$FF,d2
@loc:
                
                lsl.w   #5,d2
                move.w  d2,d3
                andi.w  #$3FFF,d2
                move.w  d2,(VDP_Control).l
                rol.w   #2,d3
                andi.w  #3,d3
                move.w  d3,(VDP_Control).l
                movem.w (sp)+,d2-d3
                rts

    ; End of function sub_12BA4


; START OF FUNCTION CHUNK FOR sub_129E8

loc_12BF4:
                
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($B800).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                lea     ($C800).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                lea     ($D000).l,a1
                move.w  #$800,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                lea     ($F000).l,a1
                move.w  #$800,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jmp     (WaitForDmaQueueProcessing).w

; END OF FUNCTION CHUNK FOR sub_129E8


; =============== S U B R O U T I N E =======================================

var_32 = -32
var_30 = -30
var_20 = -20
var_18 = -18
var_14 = -14
var_12 = -12
var_10 = -10
var_8 = -8
windowLayoutEndAddress = -6
windowSlot = -2

sub_12C46:
                
                movea.l windowLayoutEndAddress(a6),a0
                move.w  #$A5C0,d5
                move.w  var_10(a6),d7
                lsr.w   #1,d7
                move.w  #$E0F9,(a0)+
loc_12C58:
                
                move.w  #$E0FA,(a0)+
                dbf     d7,loc_12C58
                move.w  #$E8F9,(a0)+
                move.w  var_8(a6),d6
                lsr.w   #1,d6
loc_12C6A:
                
                move.w  var_10(a6),d7
                lsr.w   #1,d7
                move.w  #$E0FB,(a0)+
loc_12C74:
                
                move.w  d5,(a0)+
                addq.w  #1,d5
                cmpi.w  #$A600,d5
                bne.s   loc_12C82
                move.w  #$A640,d5
loc_12C82:
                
                cmpi.w  #$A700,d5
                bne.s   loc_12C8C
                move.w  #$A780,d5
loc_12C8C:
                
                dbf     d7,loc_12C74
                move.w  #$E8FB,(a0)+
                dbf     d6,loc_12C6A
                move.w  var_10(a6),d7
                lsr.w   #1,d7
                move.w  #$F0F9,(a0)+
loc_12CA2:
                
                move.w  #$F0FA,(a0)+
                dbf     d7,loc_12CA2
                move.w  #$F8F9,(a0)+
                rts

    ; End of function sub_12C46


; =============== S U B R O U T I N E =======================================

var_32 = -32
var_30 = -30
var_20 = -20
var_18 = -18
var_14 = -14
var_12 = -12
var_10 = -10
var_8 = -8
windowLayoutEndAddress = -6
windowSlot = -2

sub_12CB0:
                
                module
                moveq   #20,d6
loc_12CB2:
                
                lea     ((ENTITY_DATA-$1000000)).w,a0
                move.b  ((FRAME_COUNTER-$1000000)).w,d0
                andi.w  #1,d0
                lsl.w   #NIBBLE_SHIFT_COUNT,d0
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                adda.w  d0,a0
                lea     (SPRITE_16).l,a1
                moveq   #$2F,d7 
                move.w  var_10(a6),d4
                lsr.w   #2,d4
                lsl.w   #3,d4
                move.w  #$F8,d2 
                sub.w   d4,d2
                move.w  var_8(a6),d4
                lsr.w   #2,d4
                lsl.w   #3,d4
                move.w  #$E7,d3 
                sub.w   d4,d3
                tst.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                beq.s   loc_12CF0
                moveq   #1,d6
loc_12CF0:
                
                move.l  a1,d0
                cmpi.w  #ENTITY_LAST_SPRITE_PLUS_ONE_WORD_ADDRESS,d0
                beq.w   loc_12D82
                cmpi.w  #1,(a1)
                beq.s   loc_12D04
                addq.l  #8,a1
                bra.s   loc_12CF0
loc_12D04:
                
                cmpi.w  #7,d6
                blt.w   loc_12D6E
                cmpa.w  #ENTITY_SPECIAL_SPRITE_WORD_ADDRESS,a0
                bne.s   loc_12D26
                move.w  var_32(a6),d0
                cmpi.w  #$7000,d0
                beq.w   loc_12D6E
                move.w  var_30(a6),d1
                bra.w   loc_12D34       
loc_12D26:
                
                move.w  (a0),d0
                cmpi.w  #$7000,d0
                beq.w   loc_12D6E
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
loc_12D34:
                
                ext.l   d0              ; show combatants on minimap
                ext.l   d1
                divs.w  #96,d0
                divs.w  #96,d1
                add.w   d2,d0
                add.w   d3,d1
                move.w  #VDPTILE_GREEN_DOT|VDPTILE_PALETTE4|VDPTILE_PRIORITY,d4 
                                                        ; minimap ally sprite indicator
            if (STANDARD_BUILD=1)
                ; Subtract 1 from d4.w if mapsprite belongs to an enemy entity, regardless of size
                move.w  d1,-(sp)
              if (EXPANDED_MAPSPRITES=1)
                move.w  ENTITYDEF_OFFSET_MAPSPRITE(a0),d1
              else
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a0),d1
              endif
                cmpi.w  #MAPSPRITES_ENEMIES_START,d1
                blo.s   @isLargeMapsprite
                cmpi.w  #MAPSPRITES_NPCS_START,d1
                bhi.s   @isLargeMapsprite
                
                subq.w  #1,d4
@isLargeMapsprite:
                
                jsr     IsEnemySpecialSprite ; In: d1.w = entity mapsprite index, Out: CCR carry-bit clear if large sprite belongs to an enemy
                movem.w (sp)+,d1             ; MOVEM to pull value back from the stack without affecting the CCR
            else
                ; Subtract 1 from d4.w if mapsprite either belongs to an enemy entity, or is large
                cmpi.b  #MAPSPRITES_ENEMIES_START,ENTITYDEF_OFFSET_MAPSPRITE(a0)
                blo.s   @isLargeMapsprite
                cmpi.b  #MAPSPRITES_NPCS_START,ENTITYDEF_OFFSET_MAPSPRITE(a0)
                bhi.s   @isLargeMapsprite
                
                subq.w  #1,d4           ; subtract 1 if enemy to use the red dot instead
@isLargeMapsprite:
                
                cmpi.b  #MAPSPRITES_SPECIALS_START,ENTITYDEF_OFFSET_MAPSPRITE(a0)
            endif
                bcs.s   loc_12D64
                subq.w  #1,d4           ; also subtract 1 if using a large sprite, assuming they must be an enemy too
loc_12D64:
                
                move.w  d1,(a1)+
                clr.b   (a1)+
                tst.b   (a1)+
                move.w  d4,(a1)+
                move.w  d0,(a1)+
loc_12D6E:
                
                lea     NEXT_ENTITYDEF(a0),a0
                move.l  a0,d0
                cmpi.w  #ENTITY_CURSOR_WORD_ADDRESS,d0
                bne.s   loc_12D7E
                lea     ((ENTITY_DATA-$1000000)).w,a0
loc_12D7E:
                
                dbf     d7,loc_12CF0
loc_12D82:
                
                movem.l d0-d2/d7-a0,-(sp)
                lea     (SPRITE_TABLE).l,a0
                move.w  #56,d0
                moveq   #47,d7
                move.w  #16,d1          ; sprites 16-63
loc_12D96:
                
                move.w  d1,d2
                lsl.w   #3,d2
                tst.b   VDPSPRITE_OFFSET_SIZE(a0,d2.w)
                bne.s   loc_12DA8
                move.b  d1,VDPSPRITE_OFFSET_LINK(a0,d0.w)
                move.w  d1,d0
                lsl.w   #3,d0
loc_12DA8:
                
                addq.w  #1,d1
                dbf     d7,loc_12D96
                
                moveq   #47,d7
                move.w  #16,d1          ; sprites 16-63
loc_12DB4:
                
                move.w  d1,d2
                lsl.w   #3,d2
                tst.b   VDPSPRITE_OFFSET_SIZE(a0,d2.w)
                beq.s   loc_12DC6
                move.b  d1,VDPSPRITE_OFFSET_LINK(a0,d0.w)
                move.w  d1,d0
                lsl.w   #3,d0
loc_12DC6:
                
                addq.w  #1,d1
                dbf     d7,loc_12DB4
                
                clr.b   VDPSPRITE_OFFSET_LINK(a0,d0.w)
                movem.l (sp)+,d0-d2/d7-a0
                jsr     (WaitForVInt).w
                subq.w  #1,d6
                bne.s   loc_12DDE
                moveq   #20,d6
loc_12DDE:
                
                move.b  ((PLAYER_1_INPUT-$1000000)).w,d0
                andi.b  #INPUT_B|INPUT_C|INPUT_A,d0
                beq.w   loc_12CB2
                rts

    ; End of function sub_12CB0

                modend
