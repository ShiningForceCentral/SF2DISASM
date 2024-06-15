
; ASM FILE code\common\menus\menuengine_05.asm :
; 0x1288E..0x135A6 : Menu engine, part 5

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
loc_1291E:
                
                jsr     (WaitForVInt).w
                tst.b   ((FADING_SETTING-$1000000)).w
                bne.s   loc_1291E
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
                bne.s   loc_12BD4
                move.w  #$FF,d2
loc_12BD4:
                
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
                move.w  #$E0FE,d4
                cmpi.b  #MAPSPRITES_ENEMIES_START,ENTITYDEF_OFFSET_MAPSPRITE(a0)
                bcs.s   loc_12D5A
                cmpi.b  #MAPSPRITES_NPCS_START,ENTITYDEF_OFFSET_MAPSPRITE(a0)
                bhi.s   loc_12D5A
                subq.w  #1,d4           ; subtract 1 if enemy
loc_12D5A:
                
                cmpi.b  #MAPSPRITES_SPECIALS_START,ENTITYDEF_OFFSET_MAPSPRITE(a0)
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


; =============== S U B R O U T I N E =======================================


PlayEndingKissSequence:
                
                move.b  #-1,(DEACTIVATE_WINDOW_HIDING).l
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                move.w  #$120E,d0
                move.w  #$707,d1
                jsr     (CreateWindow).w
                move.w  d0,d4
                move.w  #$A640,d5
                moveq   #$F,d7
                move.w  #$E000,(a1)+
loc_12E10:
                
                move.w  #$E000,(a1)+
                dbf     d7,loc_12E10
                move.w  #$E800,(a1)+
                moveq   #$B,d6
loc_12E1E:
                
                moveq   #$F,d7
                move.w  #$E000,(a1)+
loc_12E24:
                
                move.w  d5,(a1)+
                addq.w  #1,d5
                dbf     d7,loc_12E24
                move.w  #$E800,(a1)+
                dbf     d6,loc_12E1E
                moveq   #$F,d7
                move.w  #$F000,(a1)+
loc_12E3A:
                
                move.w  #$F000,(a1)+
                dbf     d7,loc_12E3A
                move.w  #$F800,(a1)+
                move.b  #5,((FADING_COUNTER_MAX-$1000000)).w
                lea     (PALETTE_3_CURRENT).l,a0
                lea     (PALETTE_4_CURRENT).l,a1
                move.w  #CRAM_PALETTE_SIZE,d7
                jsr     (CopyBytes).w   
                lea     (PALETTE_3_CURRENT).l,a0
                lea     (PALETTE_3_BASE).l,a1
                move.w  #CRAM_PALETTE_SIZE,d7
                jsr     (CopyBytes).w   
                movea.l (p_palette_EndingKiss).l,a0
                lea     (PALETTE_2_CURRENT).l,a1
                move.w  #CRAM_PALETTE_SIZE,d7
                jsr     (CopyBytes).w   
                lea     $80(a1),a1
                jsr     (CopyBytes).w   
                jsr     (ApplyVIntCramDma).w
                lea     (PALETTE_1_CURRENT).l,a0
                lea     (PALETTE_1_BASE).l,a1
                move.w  #CRAM_SIZE,d7
                jsr     (CopyBytes).w   
                lea     (FF6802_LOADING_SPACE).l,a1
                move.w  #$5FF,d0
                moveq   #0,d1
loc_12EB4:
                
                move.l  d1,(a1)+
                dbf     d0,loc_12EB4
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($C800).l,a1
                move.w  #$600,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                lea     (byte_FF7402).l,a0
                lea     ($D400).l,a1
                move.w  #$600,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                move.w  d4,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                jsr     j_DisplayEndingKissPicture
                move.w  #180,d0
                jsr     (Sleep).w       
                move.w  d4,d0
                jsr     (DeleteWindow).w
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function PlayEndingKissSequence


; =============== S U B R O U T I N E =======================================

goldWindowLayoutEndAddress = -18

OpenGoldWindow:
                
                tst.w   ((GOLD_WINDOW_INDEX-$1000000)).w
                bne.w   return_12F5C
                movem.l d0-a1,-(sp)
                link    a6,#-32
                move.w  #WINDOW_GOLD_SIZE,d0
                move.w  #WINDOW_GOLD_DEST,d1
                jsr     (CreateWindow).l
                addq.w  #1,d0
                move.w  d0,((GOLD_WINDOW_INDEX-$1000000)).w
                move.l  a1,goldWindowLayoutEndAddress(a6)
                bsr.w   WriteGoldAmount 
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$1617,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                unlk    a6
                movem.l (sp)+,d0-a1
return_12F5C:
                
                rts

    ; End of function OpenGoldWindow


; =============== S U B R O U T I N E =======================================

goldWindowLayoutEndAddress = -18

HideGoldWindow:
                
                tst.w   ((GOLD_WINDOW_INDEX-$1000000)).w
                beq.s   return_12F5C
                movem.l d0-a1,-(sp)
                link    a6,#-32
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.l  a1,goldWindowLayoutEndAddress(a6)
                bsr.w   WriteGoldAmount 
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                unlk    a6
                movem.l (sp)+,d0-a1
                rts

    ; End of function HideGoldWindow


; =============== S U B R O U T I N E =======================================


CloseGoldWindow:
                
                tst.w   ((GOLD_WINDOW_INDEX-$1000000)).w
                beq.s   return_12F5C
                movem.l d0-a1,-(sp)
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$2017,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  ((DIALOGUE_WINDOW_INDEX-$1000000)).w,d0
                beq.s   @Skip
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
@Skip:
                
                jsr     (WaitForWindowMovementEnd).l
                move.w  ((GOLD_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                jsr     (DeleteWindow).l
                clr.w   ((GOLD_WINDOW_INDEX-$1000000)).w
                movem.l (sp)+,d0-a1
                rts

    ; End of function CloseGoldWindow


; =============== S U B R O U T I N E =======================================


InitializeMembersListScreen:
                
                clr.b   ((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                clr.b   ((CURRENT_MEMBERSUMMARY_PAGE-$1000000)).w
                cmpi.b  #WINDOW_MEMBERS_LIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bne.s   @Continue
                clr.b   ((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
@Continue:
                
                bra.w   BuildMembersListScreen

    ; End of function InitializeMembersListScreen


; =============== S U B R O U T I N E =======================================


BuildMembersListScreen_NewAttAndDefPage:
                
                move.b  #WINDOW_MEMBERSUMMARY_PAGE_ITEMS,((CURRENT_MEMBERSUMMARY_PAGE-$1000000)).w
                move.w  ((SELECTED_ITEM_INDEX-$1000000)).w,d1
                jsr     j_GetEquipmentType
                tst.w   d2
                beq.s   loc_13020
                move.b  #WINDOW_MEMBERS_LIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bra.s   loc_1302C
loc_13020:
                
                cmpi.b  #WINDOW_MEMBERS_LIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bne.s   loc_1302C
                clr.b   ((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
loc_1302C:
                
                bra.w   BuildMembersListScreen

    ; End of function BuildMembersListScreen_NewAttAndDefPage


; =============== S U B R O U T I N E =======================================


BuildMembersListScreen_MagicPage:
                
                clr.b   ((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                move.b  #WINDOW_MEMBERSUMMARY_PAGE_MAGIC,((CURRENT_MEMBERSUMMARY_PAGE-$1000000)).w
                cmpi.b  #WINDOW_MEMBERS_LIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bne.s   BuildMembersListScreen
                clr.b   ((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w

    ; End of function BuildMembersListScreen_MagicPage


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

BuildMembersListScreen:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                move.w  ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d0
                add.w   ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d0
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d0
                blt.s   loc_13066
                clr.w   ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w
                clr.w   ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w
loc_13066:
                
                link    a6,#-16
                bsr.w   GetSelectedMember
                move.w  d0,selectedMember(a6)
                bsr.w   LoadCombatantPortrait
                move.w  #WINDOW_MEMBERS_LIST_SIZE,d0
                move.w  #WINDOW_MEMBERS_LIST_DEST,d1
                jsr     (CreateWindow).l
                move.w  d0,membersListWindow(a6)
                move.w  #$80A,d0
                move.w  #$F8F6,d1
                jsr     (CreateWindow).l
                move.w  d0,portraitWindow(a6)
                move.w  #WINDOW_MEMBERSUMMARY_SIZE,d0
                move.w  #WINDOW_MEMBERSUMMARY_DEST,d1
                jsr     (CreateWindow).l
                move.w  d0,memberSummaryWindow(a6)
                bsr.w   sub_1354C
                move.w  membersListWindow(a6),d0
                move.w  #$20E,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  portraitWindow(a6),d0
                move.w  #$201,d1
                jsr     (MoveWindowWithSfx).l
                move.w  memberSummaryWindow(a6),d0
                move.w  #$A01,d1
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForVInt).w
                lea     tiles_TextHighlight(pc), a0
                lea     ($B800).l,a1
                move.w  #$A0,d0 
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                jsr     (WaitForWindowMovementEnd).l
                moveq   #$14,d1
loc_13100:
                
                move.w  d1,-(sp)
                move.w  ((SELECTED_ITEM_INDEX-$1000000)).w,d1
                jsr     j_GetEquipmentType
                tst.w   d2
                beq.s   loc_13114
                moveq   #WINDOW_MEMBERS_LIST_PAGE_NEWATTANDDEF,d2
                bra.s   loc_13116
loc_13114:
                
                moveq   #WINDOW_MEMBERS_LIST_PAGE_STATS,d2
loc_13116:
                
                move.w  (sp)+,d1
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_13138
                move.b  ((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w,d0
                addq.b  #1,d0
                sndCom  SFX_MENU_SELECTION
                cmp.b   d2,d0
                ble.s   loc_13130
                clr.b   d0
loc_13130:
                
                move.b  d0,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bsr.w   sub_13478
loc_13138:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_13156
                move.b  ((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w,d0
                subq.b  #1,d0
                sndCom  SFX_MENU_SELECTION
                bge.s   loc_1314E
                move.b  d2,d0
loc_1314E:
                
                move.b  d0,((CURRENT_MEMBERS_LIST_PAGE-$1000000)).w
                bsr.w   sub_13478
loc_13156:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1319A
                move.w  ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d0
                subq.w  #1,d0
                blt.s   loc_1317A
                clr.w   d1
                bsr.w   sub_133A0
                sndCom  SFX_MENU_SELECTION
                move.w  d0,((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w
                bsr.w   sub_13478
                bra.s   loc_1319A
loc_1317A:
                
                move.w  ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d0
                subq.w  #1,d0
                blt.s   loc_1319A
                clr.w   d1
                bsr.w   sub_133A0
                sndCom  SFX_MENU_SELECTION
                move.w  d0,((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w
                move.b  #1,((word_FFAF9E-$1000000)).w
                bsr.w   sub_134A8
loc_1319A:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_131F6
                move.w  ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d0
                addq.w  #1,d0
                cmpi.w  #4,d0
                bgt.s   loc_131CE
                move.w  d0,d2
                add.w   ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d2
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d2
                bge.s   loc_131CC
                clr.w   d1
                bsr.w   sub_133A0
                sndCom  SFX_MENU_SELECTION
                move.w  d0,((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w
                bsr.w   sub_13478
loc_131CC:
                
                bra.s   loc_131F6
loc_131CE:
                
                move.w  ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d0
                addq.w  #1,d0
                move.w  d0,d2
                add.w   ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d2
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d2
                bge.s   loc_131F6
                clr.w   d1
                bsr.w   sub_133A0
                sndCom  SFX_MENU_SELECTION
                move.w  d0,((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w
                clr.b   ((word_FFAF9E-$1000000)).w
                bsr.w   sub_134A8
loc_131F6:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_13254
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_13220
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_13220
loc_13214:
                
                bsr.w   sub_133A0
                jsr     (WaitForVInt).w
                bra.w   loc_13100
loc_13220:
                
                move.w  ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d0
                add.w   ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d0
                lea     ((GENERIC_LIST-$1000000)).w,a0
                move.b  (a0,d0.w),d0
                bsr.w   sub_132BC
                beq.s   loc_1323E
                sndCom  SFX_REFUSAL
                moveq   #$A,d1
                bra.s   loc_13214
loc_1323E:
                
                bsr.w   sub_13328
                cmpi.w  #-1,d1
                bne.s   loc_13250
                
                bsr.w   sub_13478
                moveq   #$14,d1
                bra.s   loc_13214
loc_13250:
                
                bra.w   loc_13256
loc_13254:
                
                moveq   #-1,d0
loc_13256:
                
                movem.w d0-d2,-(sp)
                clr.w   d1
                bsr.w   sub_133A0
                move.w  membersListWindow(a6),d0
                move.w  #$220,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  portraitWindow(a6),d0
                move.w  #$F8F6,d1
                jsr     (MoveWindowWithSfx).l
                move.w  memberSummaryWindow(a6),d0
                move.w  #$20F3,d1
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                move.w  membersListWindow(a6),d0
                jsr     (DeleteWindow).l
                move.w  portraitWindow(a6),d0
                jsr     (DeleteWindow).l
                move.w  memberSummaryWindow(a6),d0
                jsr     (DeleteWindow).l
                movem.w (sp)+,d0-d2
                unlk    a6
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function BuildMembersListScreen


; =============== S U B R O U T I N E =======================================


sub_132BC:
                
                tst.b   ((CURRENT_MEMBERSUMMARY_PAGE-$1000000)).w
                bne.s   loc_132C6
                clr.w   d1
                rts
loc_132C6:
                
                cmpi.b  #WINDOW_MEMBERSUMMARY_PAGE_ITEMS,((CURRENT_MEMBERSUMMARY_PAGE-$1000000)).w
                bne.w   loc_13314
                btst    #0,((byte_FFB13C-$1000000)).w
                beq.s   return_13312
                cmpi.b  #1,((byte_FFB13C-$1000000)).w
                bne.s   loc_132F6
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                tst.w   d2
                bne.s   loc_132F0
                moveq   #-1,d1
                bra.s   return_132F2
loc_132F0:
                
                clr.w   d1
return_132F2:
                
                rts
                bra.s   return_13312
loc_132F6:
                
                clr.w   d1
                jsr     j_GetEquippableWeapons
                move.w  d1,d2
                jsr     j_GetEquippableRings
                add.w   d1,d2
                bne.s   loc_1330E
                moveq   #-1,d1
                bra.s   return_13310
loc_1330E:
                
                clr.w   d1
return_13310:
                
                rts
return_13312:
                
                rts
loc_13314:
                
                clr.w   d1
                jsr     j_GetSpellAndNumberOfSpells
                tst.w   d2
                bne.s   loc_13324
                moveq   #-1,d1
                bra.s   return_13326
loc_13324:
                
                clr.w   d1
return_13326:
                
                rts

    ; End of function sub_132BC


; =============== S U B R O U T I N E =======================================


sub_13328:
                
                module
                tst.b   ((CURRENT_MEMBERSUMMARY_PAGE-$1000000)).w
                beq.w   @Return
                cmpi.b  #WINDOW_MEMBERSUMMARY_PAGE_ITEMS,((CURRENT_MEMBERSUMMARY_PAGE-$1000000)).w
                bne.w   @MagicPage
                
                ; Items member summary page
                tst.b   ((byte_FFB13C-$1000000)).w
                beq.w   @Return
                
                cmpi.b  #1,((byte_FFB13C-$1000000)).w
                bne.s   loc_13358
                
                moveq   #$A,d1
                bsr.w   sub_133A0
                bsr.w   sub_13F14
                bra.w   @Return
loc_13358:
                
                cmpi.b  #2,((byte_FFB13C-$1000000)).w
                bne.s   loc_1337C
                
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                cmpi.w  #COMBATANT_ITEMSLOTS,d2
                bne.s   @Goto_Return
                
                moveq   #$A,d1
                bsr.w   sub_133A0
                bsr.w   sub_13F14
@Goto_Return:
                
                bra.w   @Return
loc_1337C:
                
                moveq   #$A,d1
                bsr.w   sub_133A0
                bsr.w   sub_14108       
@Return:
                
                rts
@MagicPage:
                
                moveq   #$A,d1
                bsr.w   sub_133A0
                bsr.w   sub_1445A       
                rts

    ; End of function sub_13328

                modend

; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

LoadCombatantPortrait:
                
                move.w  selectedMember(a6),d0
                bsr.w   GetCombatantPortrait
                bra.w   LoadPortrait    

    ; End of function LoadCombatantPortrait


; =============== S U B R O U T I N E =======================================


sub_133A0:
                
                tst.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                beq.s   loc_133A8
                moveq   #1,d1
loc_133A8:
                
                move.w  d0,-(sp)
                lea     (SPRITE_BATTLE_CURSOR).l,a0
                lea     sprite_MembersListHighlight(pc), a1
                cmpi.w  #7,d1           ; blink on/off
                bge.s   loc_133C0
                move.w  #256,d0
                bra.s   loc_133C2
loc_133C0:
                
                clr.w   d0
loc_133C2:
                
                move.w  ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d2
                lsl.w   #NIBBLE_SHIFT_COUNT,d2
                add.w   d2,d0
                moveq   #WINDOW_MEMBERS_LIST_HIGHLIGHTSPRITES_COUNTER,d7
loc_133CC:
                
                move.w  (a1)+,(a0)
                add.w   d0,(a0)
                move.w  (a1)+,d2
                move.w  d2,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_TILE(a0)
                move.w  (a1)+,VDPSPRITE_OFFSET_X(a0)
                addq.l  #VDP_SPRITE_ENTRY_SIZE,a0
                dbf     d7,loc_133CC
                
                move.w  #1,(a0)
                move.w  #1,VDPSPRITE_OFFSET_X(a0)
                tst.w   ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w
                beq.s   loc_13404
                
                cmpi.w  #7,d1           ; blink on/off
                blt.s   loc_13404
                move.w  #151,VDPSPRITE_OFFSET_X(a0)
                move.w  #260,(a0)
loc_13404:
                
                move.w  #WINDOW_MEMBERS_LIST_SPRITELINK_DOWNARROW,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  #VDPTILE_V_ARROW|VDPTILE_FLIP|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a0)
                addq.l  #VDP_SPRITE_ENTRY_SIZE,a0
                move.w  #1,(a0)
                move.w  #1,VDPSPRITE_OFFSET_X(a0)
                move.w  ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d0
                addq.w  #5,d0
                cmp.w   ((GENERIC_LIST_LENGTH-$1000000)).w,d0
                bge.s   loc_13438
                
                cmpi.w  #7,d1           ; blink on/off
                blt.s   loc_13438
                move.w  #151,VDPSPRITE_OFFSET_X(a0)
                move.w  #333,(a0)
loc_13438:
                
                move.w  #WINDOW_MEMBERS_LIST_SPRITELINK_UPARROW,VDPSPRITE_OFFSET_SIZE(a0)
                move.w  #VDPTILE_V_ARROW|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a0)
                subq.w  #1,d1
                bne.s   loc_1344A
                moveq   #20,d1
loc_1344A:
                
                move.w  (sp)+,d0
                bsr.w   sub_101E6
                rts

    ; End of function sub_133A0

sprite_MembersListHighlight:
                
; Syntax        vdpSprite y, [VDPSPRITESIZE_]bitfield|link, vdpTile, x
;
;      vdpTile: [VDPTILE_]enum[|MIRROR|FLIP|palette|PRIORITY]
;
;      palette: PALETTE1 = 0 (default when omitted)
;               PALETTE2 = $2000
;               PALETTE3 = $4000
;               PALETTE4 = $6000
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                vdpSprite 260, V2|H4|9, 1472|PALETTE3|PRIORITY, 156
                vdpSprite 260, V2|H4|10, 1472|MIRROR|PALETTE3|PRIORITY, 188

; =============== S U B R O U T I N E =======================================

;     Get index of currently selected force member (in menus).
;     Out: D0 = selected index (capped to 255)


GetSelectedMember:
                
                move.w  ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d0
                add.w   ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d0
                lea     ((GENERIC_LIST-$1000000)).w,a0
                move.b  (a0,d0.w),d0
                andi.w  #BYTE_MASK,d0
                rts

    ; End of function GetSelectedMember


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

sub_13478:
                
                bsr.w   sub_1354C
                move.w  membersListWindow(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                move.w  memberSummaryWindow(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                bsr.w   LoadCombatantPortrait
                moveq   #$A,d1
                rts

    ; End of function sub_13478


; =============== S U B R O U T I N E =======================================


CopyWords:
                
                move.w  (a0)+,(a1)+
                dbf     d7,CopyWords
                rts

    ; End of function CopyWords


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

sub_134A8:
                
                move.w  d0,-(sp)
                move.w  membersListWindow(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                movea.l a1,a0
                tst.b   ((word_FFAF9E-$1000000)).w
                beq.s   loc_134E0
                
                adda.w  #$74,a0 
                adda.w  #$AE,a1 
                move.w  #522,d7
                jsr     (CopyBytes).w   
                lea     layout_13EDE(pc), a0
                suba.w  #$38,a1 
                move.w  #54,d7
                jsr     (CopyBytes).w   
                bra.s   loc_13510
loc_134E0:
                
                adda.w  #$E8,a0 
                adda.w  #$AE,a1 
                move.w  #464,d7
                jsr     (CopyBytes).w   
                lea     layout_13EDE(pc), a0
                suba.w  #$38,a1 
                move.w  #54,d7
                jsr     (CopyBytes).w   
                lea     layout_13EDE(pc), a0
                adda.w  #$20A,a1
                move.w  #54,d7
                jsr     (CopyBytes).w   
loc_13510:
                
                move.w  membersListWindow(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                jsr     (WaitForVInt).w
                bsr.w   sub_1354C
                move.w  membersListWindow(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                move.w  memberSummaryWindow(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                move.w  (sp)+,d0
                bsr.w   LoadCombatantPortrait
                moveq   #$A,d1
                rts

    ; End of function sub_134A8


; =============== S U B R O U T I N E =======================================

statusEffects = -10
memberSummaryWindow = -8
portraitWindow = -6
membersListWindow = -4
selectedMember = -2

sub_1354C:
                
                move.w  ((DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY-$1000000)).w,d0
                add.w   ((DISPLAYED_MEMBERS_LIST_FIRST_ENTRY-$1000000)).w,d0
                lea     ((GENERIC_LIST-$1000000)).w,a0
                move.b  (a0,d0.w),d0
                andi.w  #ALLY_MASK_INDEX,d0
                move.w  d0,selectedMember(a6)
                move.w  membersListWindow(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.w  selectedMember(a6),d0
                bsr.w   WriteMembersListText
                move.w  memberSummaryWindow(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.w  selectedMember(a6),d0
                bsr.w   BuildMemberSummaryWindow
                move.w  portraitWindow(a6),d0
                lea     tiles_WindowBorder(pc), a0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.w  #160,d7
                jsr     (CopyBytes).w   
                rts

    ; End of function sub_1354C

