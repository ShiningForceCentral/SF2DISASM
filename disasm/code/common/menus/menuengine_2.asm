
; ASM FILE code\common\menus\menuengine_2.asm :
; 0x1288E..0x15736 : Menu engine

; =============== S U B R O U T I N E =======================================

sub_1288E:
                
                link    a6,#-$20
                move.l  ((byte_FFAEE2-$1000000)).w,-$20(a6)
                move.l  #$70007000,((byte_FFAEE2-$1000000)).w
                move.l  #$70007000,((byte_FFAEEE-$1000000)).w
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
                move.b  #5,((FADING_PALETTE_BITMAP-$1000000)).w
                bsr.w   sub_129E8
loc_1291E:
                
                jsr     (WaitForVInt).w
                tst.b   ((FADING_SETTING-$1000000)).w
                bne.s   loc_1291E
                move.w  -$E(a6),d0
                lsl.w   #8,d0
                or.w    -$C(a6),d0
                moveq   #$1C,d1
                sub.w   -$C(a6),d1
                lsr.w   #1,d1
                ori.w   #$2000,d1
                jsr     (CreateWindow).w
                move.w  d0,-2(a6)
                move.l  a1,-6(a6)
                bsr.w   sub_12C46
                moveq   #$20,d0 
                sub.w   -$E(a6),d0
                lsr.w   #1,d0
                lsl.w   #8,d0
                moveq   #$1C,d1
                sub.w   -$C(a6),d1
                lsr.w   #1,d1
                or.w    d0,d1
                move.w  -2(a6),d0
                move.w  #6,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                bsr.w   sub_12CB0
                move.w  -$E(a6),d0
                neg.w   d0
                lsl.w   #8,d0
                moveq   #$1C,d1
                sub.w   -$C(a6),d1
                lsr.w   #1,d1
                or.w    d0,d1
                move.w  -2(a6),d0
                move.w  #6,d2
                jsr     (MoveWindowWithSfx).w
                move.b  #FLICKER_ONCE,((FADING_SETTING-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #5,((FADING_PALETTE_BITMAP-$1000000)).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  d0,-2(a6)
                jsr     (ClearWindowAndUpdateEndPointer).w
                move.b  #$F,((FADING_PALETTE_BITMAP-$1000000)).w
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                move.l  -$20(a6),((byte_FFAEE2-$1000000)).w
                move.l  -$20(a6),((byte_FFAEEE-$1000000)).w
                lea     (PALETTE_1_BASE).l,a0
                lea     (PALETTE_1_CURRENT).l,a1
                move.w  #$80,d7 
                jsr     (CopyBytes).w   
                jsr     (ApplyVIntCramDma).w
                unlk    a6
                rts

    ; End of function sub_1288E


; =============== S U B R O U T I N E =======================================

sub_129E8:
                
                move.w  ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d0
                lsr.w   #7,d0
                ext.l   d0
                divs.w  #3,d0
                move.w  d0,-$14(a6)
                move.w  ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d0
                lsr.w   #7,d0
                ext.l   d0
                divs.w  #3,d0
                move.w  d0,-$12(a6)
                move.w  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,d0
                sub.w   ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d0
                lsr.w   #7,d0
                ext.l   d0
                divs.w  #3,d0
                cmpi.w  #$2F,d0 
                ble.s   loc_12A20
                moveq   #$2F,d0 
loc_12A20:
                
                move.w  d0,-$A(a6)
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
                
                move.w  d1,-8(a6)
                move.w  -$A(a6),d0
                lsr.w   #1,d0
                addq.w  #3,d0
                move.w  d0,-$E(a6)
                move.w  -8(a6),d0
                lsr.w   #1,d0
                addq.w  #3,d0
                move.w  d0,-$C(a6)
                lea     (FF0000_RAM_START).l,a0
                lea     (FF2000_LOADING_SPACE).l,a2
                lea     (FF6802_LOADING_SPACE).l,a1
                move.w  -$A(a6),d5
                move.w  d5,d6
                add.w   d5,d5
                add.w   d6,d5
                add.w   d5,d5
                moveq   #2,d4
                move.w  -8(a6),d6
loc_12A96:
                
                move.w  -$A(a6),d7
loc_12A9A:
                
                move.w  -8(a6),d3
                sub.w   d6,d3
                move.w  -$A(a6),d2
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

sub_12BA4:
                
                movem.w d2-d3,-(sp)
                add.w   -$14(a6),d2
                add.w   -$12(a6),d3
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

sub_12C46:
                
                movea.l -6(a6),a0
                move.w  #$A5C0,d5
                move.w  -$A(a6),d7
                lsr.w   #1,d7
                move.w  #$E0F9,(a0)+
loc_12C58:
                
                move.w  #$E0FA,(a0)+
                dbf     d7,loc_12C58
                move.w  #$E8F9,(a0)+
                move.w  -8(a6),d6
                lsr.w   #1,d6
loc_12C6A:
                
                move.w  -$A(a6),d7
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
                move.w  -$A(a6),d7
                lsr.w   #1,d7
                move.w  #$F0F9,(a0)+
loc_12CA2:
                
                move.w  #$F0FA,(a0)+
                dbf     d7,loc_12CA2
                move.w  #$F8F9,(a0)+
                rts

    ; End of function sub_12C46


; =============== S U B R O U T I N E =======================================

sub_12CB0:
                
                moveq   #$14,d6
loc_12CB2:
                
                lea     ((ENTITY_DATA-$1000000)).w,a0
                move.b  ((FRAME_COUNTER-$1000000)).w,d0
                andi.w  #1,d0
                lsl.w   #4,d0
                lsl.w   #5,d0
                adda.w  d0,a0
                lea     (SPRITE_16).l,a1
                moveq   #$2F,d7 
                move.w  -$A(a6),d4
                lsr.w   #2,d4
                lsl.w   #3,d4
                move.w  #$F8,d2 
                sub.w   d4,d2
                move.w  -8(a6),d4
                lsr.w   #2,d4
                lsl.w   #3,d4
                move.w  #$E7,d3 
                sub.w   d4,d3
                tst.b   ((HIDE_WINDOWS-$1000000)).w
                beq.s   loc_12CF0
                moveq   #1,d6
loc_12CF0:
                
                move.l  a1,d0
                cmpi.w  #$DE80,d0
                beq.w   loc_12D82
                cmpi.w  #1,(a1)
                beq.s   loc_12D04
                addq.l  #8,a1
                bra.s   loc_12CF0
loc_12D04:
                
                cmpi.w  #7,d6
                blt.w   loc_12D6E
                cmpa.w  #$AEE2,a0
                bne.s   loc_12D26
                move.w  -$20(a6),d0
                cmpi.w  #$7000,d0
                beq.w   loc_12D6E
                move.w  -$1E(a6),d1
                bra.w   loc_12D34
loc_12D26:
                
                move.w  (a0),d0
                cmpi.w  #$7000,d0
                beq.w   loc_12D6E
                move.w  2(a0),d1
loc_12D34:
                
                ext.l   d0
                ext.l   d1
                divs.w  #$60,d0 
                divs.w  #$60,d1 
                add.w   d2,d0
                add.w   d3,d1
                move.w  #$E0FE,d4
                cmpi.b  #$40,$13(a0) 
                bcs.s   loc_12D5A
                cmpi.b  #$AA,$13(a0)
                bhi.s   loc_12D5A
                subq.w  #1,d4
loc_12D5A:
                
                cmpi.b  #$F0,$13(a0)
                bcs.s   loc_12D64
                subq.w  #1,d4
loc_12D64:
                
                move.w  d1,(a1)+
                clr.b   (a1)+
                tst.b   (a1)+
                move.w  d4,(a1)+
                move.w  d0,(a1)+
loc_12D6E:
                
                lea     $20(a0),a0
                move.l  a0,d0
                cmpi.w  #$AF02,d0
                bne.s   loc_12D7E
                lea     ((ENTITY_DATA-$1000000)).w,a0
loc_12D7E:
                
                dbf     d7,loc_12CF0
loc_12D82:
                
                movem.l d0-d2/d7-a0,-(sp)
                lea     (SPRITE_TABLE).l,a0
                move.w  #$38,d0 
                moveq   #$2F,d7 
                move.w  #$10,d1
loc_12D96:
                
                move.w  d1,d2
                lsl.w   #3,d2
                tst.b   2(a0,d2.w)
                bne.s   loc_12DA8
                move.b  d1,3(a0,d0.w)
                move.w  d1,d0
                lsl.w   #3,d0
loc_12DA8:
                
                addq.w  #1,d1
                dbf     d7,loc_12D96
                moveq   #$2F,d7 
                move.w  #$10,d1
loc_12DB4:
                
                move.w  d1,d2
                lsl.w   #3,d2
                tst.b   2(a0,d2.w)
                beq.s   loc_12DC6
                move.b  d1,3(a0,d0.w)
                move.w  d1,d0
                lsl.w   #3,d0
loc_12DC6:
                
                addq.w  #1,d1
                dbf     d7,loc_12DB4
                clr.b   3(a0,d0.w)
                movem.l (sp)+,d0-d2/d7-a0
                jsr     (WaitForVInt).w
                subq.w  #1,d6
                bne.s   loc_12DDE
                moveq   #$14,d6
loc_12DDE:
                
                move.b  ((P1_INPUT-$1000000)).w,d0
                andi.b  #INPUT_B|INPUT_C|INPUT_A,d0
                beq.w   loc_12CB2
                rts

    ; End of function sub_12CB0


; =============== S U B R O U T I N E =======================================

PlayEndKiss:
                
                move.b  #$FF,(DEACTIVATE_WINDOW_HIDING).l
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
                move.w  #$20,d7 
                jsr     (CopyBytes).w   
                lea     (PALETTE_3_CURRENT).l,a0
                lea     (PALETTE_3_BASE).l,a1
                move.w  #$20,d7 
                jsr     (CopyBytes).w   
                movea.l (p_plt_endKiss).l,a0
                lea     (PALETTE_2_CURRENT).l,a1
                move.w  #$20,d7 
                jsr     (CopyBytes).w   
                lea     $80(a1),a1
                jsr     (CopyBytes).w   
                jsr     (ApplyVIntCramDma).w
                lea     (PALETTE_1_CURRENT).l,a0
                lea     (PALETTE_1_BASE).l,a1
                move.w  #$80,d7 
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
                jsr     j_EndKissPictureSequence
                move.w  #$B4,d0 
                jsr     (Sleep).w       
                move.w  d4,d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function PlayEndKiss


; =============== S U B R O U T I N E =======================================

sub_12F12:
                
                tst.w   ((word_FFB086-$1000000)).w
                bne.w   return_12F5C
                movem.l d0-a1,-(sp)
                link    a6,#-$20
                move.w  #$904,d0
                move.w  #$2017,d1
                jsr     (CreateWindow).l
                addq.w  #1,d0
                move.w  d0,((word_FFB086-$1000000)).w
                move.l  a1,-$12(a6)
                bsr.w   sub_14B28       
                move.w  ((word_FFB086-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$1617,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                unlk    a6
                movem.l (sp)+,d0-a1
return_12F5C:
                
                rts

    ; End of function sub_12F12


; =============== S U B R O U T I N E =======================================

sub_12F5E:
                
                tst.w   ((word_FFB086-$1000000)).w
                beq.s   return_12F5C
                movem.l d0-a1,-(sp)
                link    a6,#-$20
                move.w  ((word_FFB086-$1000000)).w,d0
                subq.w  #1,d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.l  a1,-$12(a6)
                bsr.w   sub_14B28       
                move.w  ((word_FFB086-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                unlk    a6
                movem.l (sp)+,d0-a1
                rts

    ; End of function sub_12F5E


; =============== S U B R O U T I N E =======================================

sub_12F9A:
                
                tst.w   ((word_FFB086-$1000000)).w
                beq.s   return_12F5C
                movem.l d0-a1,-(sp)
                move.w  ((word_FFB086-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$2017,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_12FCA
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
loc_12FCA:
                
                jsr     (WaitForWindowMovementEnd).l
                move.w  ((word_FFB086-$1000000)).w,d0
                subq.w  #1,d0
                jsr     (ClearWindowAndUpdateEndPointer).l
                clr.w   ((word_FFB086-$1000000)).w
                movem.l (sp)+,d0-a1
                rts

    ; End of function sub_12F9A


; =============== S U B R O U T I N E =======================================

sub_12FE6:
                
                clr.b   ((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((word_FFB13A-$1000000)).w
                clr.b   ((word_FFAF8C-$1000000)).w
                cmpi.b  #WINDOW_MEMBERLIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERLIST_PAGE-$1000000)).w
                bne.s   loc_13000
                clr.b   ((CURRENT_MEMBERLIST_PAGE-$1000000)).w
loc_13000:
                
                bra.w   loc_1304C
loc_13004:
                
                move.b  #1,((word_FFAF8C-$1000000)).w
                move.w  ((word_FFB13A-$1000000)).w,d1
                jsr     j_GetItemType
                tst.w   d2
                beq.s   loc_13020
                move.b  #WINDOW_MEMBERLIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERLIST_PAGE-$1000000)).w
                bra.s   loc_1302C
loc_13020:
                
                cmpi.b  #WINDOW_MEMBERLIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERLIST_PAGE-$1000000)).w
                bne.s   loc_1302C
                clr.b   ((CURRENT_MEMBERLIST_PAGE-$1000000)).w
loc_1302C:
                
                bra.w   loc_1304C
loc_13030:
                
                clr.b   ((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((word_FFB13A-$1000000)).w
                move.b  #2,((word_FFAF8C-$1000000)).w
                cmpi.b  #WINDOW_MEMBERLIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERLIST_PAGE-$1000000)).w
                bne.s   loc_1304C
                clr.b   ((CURRENT_MEMBERLIST_PAGE-$1000000)).w
loc_1304C:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                move.w  ((word_FFB136-$1000000)).w,d0
                add.w   ((word_FFB138-$1000000)).w,d0
                cmp.w   ((INDEX_LIST_ENTRIES_NUMBER-$1000000)).w,d0
                blt.s   loc_13066
                clr.w   ((word_FFB136-$1000000)).w
                clr.w   ((word_FFB138-$1000000)).w
loc_13066:
                
                link    a6,#-$10
                bsr.w   GetSelectedMember
                move.w  d0,-2(a6)
                bsr.w   LoadCombatantPortrait
                move.w  #WINDOW_MEMBERLIST_SIZE,d0
                move.w  #WINDOW_MEMBERLIST_DEST,d1
                jsr     (CreateWindow).l
                move.w  d0,-4(a6)
                move.w  #$80A,d0
                move.w  #$F8F6,d1
                jsr     (CreateWindow).l
                move.w  d0,-6(a6)
                move.w  #$150D,d0
                move.w  #$20F3,d1
                jsr     (CreateWindow).l
                move.w  d0,-8(a6)
                bsr.w   sub_1354C
                move.w  -4(a6),d0
                move.w  #$20E,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  -6(a6),d0
                move.w  #$201,d1
                jsr     (MoveWindowWithSfx).l
                move.w  -8(a6),d0
                move.w  #$A01,d1
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForVInt).w
                lea     TextHighlightTiles(pc), a0
                lea     ($B800).l,a1
                move.w  #$A0,d0 
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                jsr     (WaitForWindowMovementEnd).l
                moveq   #$14,d1
loc_13100:
                
                move.w  d1,-(sp)
                move.w  ((word_FFB13A-$1000000)).w,d1
                jsr     j_GetItemType
                tst.w   d2
                beq.s   loc_13114
                moveq   #WINDOW_MEMBERLIST_PAGE_NEWATTANDDEF,d2
                bra.s   loc_13116
loc_13114:
                
                moveq   #WINDOW_MEMBERLIST_PAGE_HPMPATDFAGMV,d2
loc_13116:
                
                move.w  (sp)+,d1
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_13138
                move.b  ((CURRENT_MEMBERLIST_PAGE-$1000000)).w,d0
                addq.b  #1,d0
                sndCom  SFX_MENU_SELECTION
                cmp.b   d2,d0
                ble.s   loc_13130
                clr.b   d0
loc_13130:
                
                move.b  d0,((CURRENT_MEMBERLIST_PAGE-$1000000)).w
                bsr.w   sub_13478
loc_13138:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_13156
                move.b  ((CURRENT_MEMBERLIST_PAGE-$1000000)).w,d0
                subq.b  #1,d0
                sndCom  SFX_MENU_SELECTION
                bge.s   loc_1314E
                move.b  d2,d0
loc_1314E:
                
                move.b  d0,((CURRENT_MEMBERLIST_PAGE-$1000000)).w
                bsr.w   sub_13478
loc_13156:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1319A
                move.w  ((word_FFB138-$1000000)).w,d0
                subq.w  #1,d0
                blt.s   loc_1317A
                clr.w   d1
                bsr.w   sub_133A0
                sndCom  SFX_MENU_SELECTION
                move.w  d0,((word_FFB138-$1000000)).w
                bsr.w   sub_13478
                bra.s   loc_1319A
loc_1317A:
                
                move.w  ((word_FFB136-$1000000)).w,d0
                subq.w  #1,d0
                blt.s   loc_1319A
                clr.w   d1
                bsr.w   sub_133A0
                sndCom  SFX_MENU_SELECTION
                move.w  d0,((word_FFB136-$1000000)).w
                move.b  #1,((word_FFAF9E-$1000000)).w
                bsr.w   sub_134A8
loc_1319A:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_131F6
                move.w  ((word_FFB138-$1000000)).w,d0
                addq.w  #1,d0
                cmpi.w  #4,d0
                bgt.s   loc_131CE
                move.w  d0,d2
                add.w   ((word_FFB136-$1000000)).w,d2
                cmp.w   ((INDEX_LIST_ENTRIES_NUMBER-$1000000)).w,d2
                bge.s   loc_131CC
                clr.w   d1
                bsr.w   sub_133A0
                sndCom  SFX_MENU_SELECTION
                move.w  d0,((word_FFB138-$1000000)).w
                bsr.w   sub_13478
loc_131CC:
                
                bra.s   loc_131F6
loc_131CE:
                
                move.w  ((word_FFB136-$1000000)).w,d0
                addq.w  #1,d0
                move.w  d0,d2
                add.w   ((word_FFB138-$1000000)).w,d2
                cmp.w   ((INDEX_LIST_ENTRIES_NUMBER-$1000000)).w,d2
                bge.s   loc_131F6
                clr.w   d1
                bsr.w   sub_133A0
                sndCom  SFX_MENU_SELECTION
                move.w  d0,((word_FFB136-$1000000)).w
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
                
                move.w  ((word_FFB136-$1000000)).w,d0
                add.w   ((word_FFB138-$1000000)).w,d0
                lea     ((INDEX_LIST-$1000000)).w,a0
                move.b  (a0,d0.w),d0
                bsr.w   sub_132BC
                beq.s   loc_1323E
                sndCom  SFX_REFUSAL
                moveq   #$A,d1
                bra.s   loc_13214
loc_1323E:
                
                bsr.w   sub_13328
                cmpi.w  #$FFFF,d1
                bne.s   loc_13250
                bsr.w   sub_13478
                moveq   #$14,d1
                bra.s   loc_13214
loc_13250:
                
                bra.w   loc_13256
loc_13254:
                
                moveq   #$FFFFFFFF,d0
loc_13256:
                
                movem.w d0-d2,-(sp)
                clr.w   d1
                bsr.w   sub_133A0
                move.w  -4(a6),d0
                move.w  #$220,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  -6(a6),d0
                move.w  #$F8F6,d1
                jsr     (MoveWindowWithSfx).l
                move.w  -8(a6),d0
                move.w  #$20F3,d1
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                move.w  -4(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).l
                move.w  -6(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).l
                move.w  -8(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).l
                movem.w (sp)+,d0-d2
                unlk    a6
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function sub_12FE6


; =============== S U B R O U T I N E =======================================

sub_132BC:
                
                tst.b   ((word_FFAF8C-$1000000)).w
                bne.s   loc_132C6
                clr.w   d1
                rts
loc_132C6:
                
                cmpi.b  #1,((word_FFAF8C-$1000000)).w
                bne.w   loc_13314
                btst    #0,((byte_FFB13C-$1000000)).w
                beq.s   return_13312
                cmpi.b  #1,((byte_FFB13C-$1000000)).w
                bne.s   loc_132F6
                clr.w   d1
                jsr     j_GetItemAndNumberOfItems
                tst.w   d2
                bne.s   loc_132F0
                moveq   #$FFFFFFFF,d1
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
                moveq   #$FFFFFFFF,d1
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
                moveq   #$FFFFFFFF,d1
                bra.s   return_13326
loc_13324:
                
                clr.w   d1
return_13326:
                
                rts

    ; End of function sub_132BC


; =============== S U B R O U T I N E =======================================

sub_13328:
                
                tst.b   ((word_FFAF8C-$1000000)).w
                beq.w   return_13386
                cmpi.b  #1,((word_FFAF8C-$1000000)).w
                bne.w   loc_13388
                tst.b   ((byte_FFB13C-$1000000)).w
                beq.w   return_13386
                cmpi.b  #1,((byte_FFB13C-$1000000)).w
                bne.s   loc_13358
                moveq   #$A,d1
                bsr.w   sub_133A0
                bsr.w   sub_13F14
                bra.w   return_13386
loc_13358:
                
                cmpi.b  #2,((byte_FFB13C-$1000000)).w
                bne.s   loc_1337C
                clr.w   d1
                jsr     j_GetItemAndNumberOfItems
                cmpi.w  #4,d2
                bne.s   loc_13378
                moveq   #$A,d1
                bsr.w   sub_133A0
                bsr.w   sub_13F14
loc_13378:
                
                bra.w   return_13386
loc_1337C:
                
                moveq   #$A,d1
                bsr.w   sub_133A0
                bsr.w   sub_14108
return_13386:
                
                rts
loc_13388:
                
                moveq   #$A,d1
                bsr.w   sub_133A0
                bsr.w   sub_1445A
                rts

    ; End of function sub_13328


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index

LoadCombatantPortrait:
                
                move.w  -2(a6),d0
                bsr.w   GetCombatantPortrait
                bra.w   LoadPortrait    

    ; End of function LoadCombatantPortrait


; =============== S U B R O U T I N E =======================================

sub_133A0:
                
                tst.b   ((HIDE_WINDOWS-$1000000)).w
                beq.s   loc_133A8
                moveq   #1,d1
loc_133A8:
                
                move.w  d0,-(sp)
                lea     (SPRITE_08).l,a0
                lea     tbl_SpriteDefs_TextHighlight_MemberList(pc), a1
                cmpi.w  #7,d1
                bge.s   loc_133C0
                move.w  #$100,d0
                bra.s   loc_133C2
loc_133C0:
                
                clr.w   d0
loc_133C2:
                
                move.w  ((word_FFB138-$1000000)).w,d2
                lsl.w   #4,d2
                add.w   d2,d0
                moveq   #WINDOW_MEMBERLIST_HIGHLIGHT_SPRITES_COUNTER,d7
loc_133CC:
                
                move.w  (a1)+,(a0)
                add.w   d0,(a0)
                move.w  (a1)+,d2
                move.w  d2,2(a0)
                move.w  (a1)+,4(a0)
                move.w  (a1)+,6(a0)
                addq.l  #8,a0
                dbf     d7,loc_133CC
                move.w  #1,(a0)
                move.w  #1,6(a0)
                tst.w   ((word_FFB136-$1000000)).w
                beq.s   loc_13404
                cmpi.w  #7,d1
                blt.s   loc_13404
                move.w  #$97,6(a0) 
                move.w  #$104,(a0)
loc_13404:
                
                move.w  #SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_3_LINK,2(a0)
                move.w  #$D064,4(a0)
                addq.l  #8,a0
                move.w  #1,(a0)
                move.w  #1,6(a0)
                move.w  ((word_FFB136-$1000000)).w,d0
                addq.w  #5,d0
                cmp.w   ((INDEX_LIST_ENTRIES_NUMBER-$1000000)).w,d0
                bge.s   loc_13438
                cmpi.w  #7,d1
                blt.s   loc_13438
                move.w  #$97,6(a0) 
                move.w  #$14D,(a0)
loc_13438:
                
                move.w  #$10,2(a0)
                move.w  #$C064,4(a0)
                subq.w  #1,d1
                bne.s   loc_1344A
                moveq   #$14,d1
loc_1344A:
                
                move.w  (sp)+,d0
                bsr.w   sub_101E6
                rts

    ; End of function sub_133A0

tbl_SpriteDefs_TextHighlight_MemberList:
                dc.w SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_1_INIT_Y
                dc.b SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_1_SIZE
                dc.b SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_1_LINK
                dc.w SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_1_PROPS
                dc.w SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_1_INIT_X
                dc.w SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_2_INIT_Y
                dc.b SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_2_SIZE
                dc.b SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_2_LINK
                dc.w SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_2_PROPS
                dc.w SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_2_INIT_X

; =============== S U B R O U T I N E =======================================

;     Get index of currently selected force member (in menus).
;     Out: D0 = selected index (capped to 255)

GetSelectedMember:
                
                move.w  ((word_FFB136-$1000000)).w,d0
                add.w   ((word_FFB138-$1000000)).w,d0
                lea     ((INDEX_LIST-$1000000)).w,a0
                move.b  (a0,d0.w),d0
                andi.w  #$FF,d0
                rts

    ; End of function GetSelectedMember


; =============== S U B R O U T I N E =======================================

sub_13478:
                
                bsr.w   sub_1354C
                move.w  -4(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                move.w  -8(a6),d0
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

sub_134A8:
                
                move.w  d0,-(sp)
                move.w  -4(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                movea.l a1,a0
                tst.b   ((word_FFAF9E-$1000000)).w
                beq.s   loc_134E0
                adda.w  #$74,a0 
                adda.w  #$AE,a1 
                move.w  #$20A,d7
                jsr     (CopyBytes).w   
                lea     word_13EDE(pc), a0
                suba.w  #$38,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                bra.s   loc_13510
loc_134E0:
                
                adda.w  #$E8,a0 
                adda.w  #$AE,a1 
                move.w  #$1D0,d7
                jsr     (CopyBytes).w   
                lea     word_13EDE(pc), a0
                suba.w  #$38,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                lea     word_13EDE(pc), a0
                adda.w  #$20A,a1
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
loc_13510:
                
                move.w  -4(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                jsr     (WaitForVInt).w
                bsr.w   sub_1354C
                move.w  -4(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                move.w  -8(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                move.w  (sp)+,d0
                bsr.w   LoadCombatantPortrait
                moveq   #$A,d1
                rts

    ; End of function sub_134A8


; =============== S U B R O U T I N E =======================================

sub_1354C:
                
                move.w  ((word_FFB138-$1000000)).w,d0
                add.w   ((word_FFB136-$1000000)).w,d0
                lea     ((INDEX_LIST-$1000000)).w,a0
                move.b  (a0,d0.w),d0
                andi.w  #$1F,d0
                move.w  d0,-2(a6)
                move.w  -4(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.w  -2(a6),d0
                bsr.w   WriteMemberListText
                move.w  -8(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.w  -2(a6),d0
                bsr.w   sub_137BC
                move.w  -6(a6),d0
                lea     WindowBorderTiles(pc), a0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.w  #$A0,d7 
                jsr     (CopyBytes).w   
                rts

    ; End of function sub_1354C


; =============== S U B R O U T I N E =======================================

WriteMemberListText:
                
                link    a6,#-$10
                move.w  d0,-2(a6)
                move.l  a1,-6(a6)
                move.w  #WINDOW_MEMBERLIST_SIZE,d0
                bsr.w   CopyWindowTilesToRam
                movea.l -6(a6),a1
                move.w  #$FFC6,d1
                suba.w  d1,a1
                addq.w  #4,a1
                moveq   #WINDOW_MEMBERLIST_HEADER_LENGTH,d7
                move.b  ((CURRENT_MEMBERLIST_PAGE-$1000000)).w,d0
                bne.s   @DetermineHeader_HpMpAtDfAgMv
                lea     aNameClassLevExp(pc), a0
                bra.s   @WriteHeader
@DetermineHeader_HpMpAtDfAgMv:
                
                cmpi.b  #WINDOW_MEMBERLIST_PAGE_HPMPATDFAGMV,d0
                bne.s   @DetermineHeader_AttackDefense
                lea     aNameHpMpAtDfAgMv(pc), a0
                bra.s   @WriteHeader
@DetermineHeader_AttackDefense:
                
                lea     aNameAttackDefense(pc), a0
@WriteHeader:
                
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l -6(a6),a1
                adda.w  #WINDOW_MEMBERLIST_ENTRY_NAME_OFFSET,a1
                moveq   #WINDOW_MEMBERLIST_ENTRIES_COUNTER,d5
                move.w  ((word_FFB136-$1000000)).w,d4
@CreateEntry_Loop:
                
                lea     ((INDEX_LIST-$1000000)).w,a0
                clr.w   d0
                move.b  (a0,d4.w),d0
                move.w  d0,-$10(a6)
                move.l  a1,-(sp)
                move.w  d0,d1
                jsr     j_IsInBattleParty
                beq.s   @DetermineNameColor
                move.w  #VDPTILE_SWORD_ICON|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT,-2(a1) 
                                                        ; display sword icon to denote battle party members
@DetermineNameColor:
                
                move.l  a1,-(sp)
                move.w  -$10(a6),d0
                jsr     j_GetCurrentHP
                move.w  d1,d2
                jsr     j_GetCombatantName
                moveq   #$FFFFFFC6,d1
                moveq   #ALLYNAME_MAX_LENGTH,d7
                tst.w   d2
                bne.s   @WriteEntry_Name
                bsr.w   WriteTilesFromAsciiWithOrangeFont
                bra.s   @WriteEntry_ClassLevExp
@WriteEntry_Name:
                
                bsr.w   WriteTilesFromAsciiWithRegularFont
@WriteEntry_ClassLevExp:
                
                movea.l (sp)+,a1
                lea     WINDOW_MEMBERLIST_ENTRY_INIT_OFFSET(a1),a1
                tst.b   ((CURRENT_MEMBERLIST_PAGE-$1000000)).w
                bne.s   @WriteEntry_HpMpAtDfAgMv
                move.l  a1,-(sp)
                move.w  -$10(a6),d0
                jsr     j_GetClass
                jsr     j_GetClassName
                moveq   #$FFFFFFC6,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l (sp)+,a1
                lea     WINDOW_MEMBERLIST_ENTRY_LEVEL_OFFSET(a1),a1
                move.w  -$10(a6),d0
                jsr     j_GetCurrentLevel
                moveq   #LV_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
                addq.l  #WINDOW_MEMBERLIST_ENTRY_EXP_OFFSET,a1
                move.w  -$10(a6),d0
                jsr     j_GetCurrentEXP
                moveq   #EXP_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteEntry_HpMpAtDfAgMv:
                
                cmpi.b  #WINDOW_MEMBERLIST_PAGE_HPMPATDFAGMV,((CURRENT_MEMBERLIST_PAGE-$1000000)).w
                bne.w   @WriteEntry_Unequippable
                move.w  -$10(a6),d0
                jsr     j_GetCurrentHP
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #WINDOW_MEMBERLIST_PAGE_NEWATTANDDEF,a1
                move.w  -$10(a6),d0
                jsr     j_GetCurrentMP
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #WINDOW_MEMBERLIST_PAGE_NEWATTANDDEF,a1
                move.w  -$10(a6),d0
                jsr     j_GetCurrentATT
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #WINDOW_MEMBERLIST_PAGE_NEWATTANDDEF,a1
                move.w  -$10(a6),d0
                jsr     j_GetCurrentDEF
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #WINDOW_MEMBERLIST_PAGE_NEWATTANDDEF,a1
                move.w  -$10(a6),d0
                jsr     j_GetCurrentAGI
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #WINDOW_MEMBERLIST_PAGE_NEWATTANDDEF,a1
                move.w  -$10(a6),d0
                jsr     j_GetCurrentMOV
                moveq   #MOV_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                addq.l  #WINDOW_MEMBERLIST_PAGE_NEWATTANDDEF,a1
@WriteEntry_Unequippable:
                
                cmpi.b  #WINDOW_MEMBERLIST_PAGE_NEWATTANDDEF,((CURRENT_MEMBERLIST_PAGE-$1000000)).w
                bne.w   @NextEntry
                move.w  -$10(a6),d0
                move.w  ((word_FFB13A-$1000000)).w,d1
                jsr     j_IsWeaponOrRingEquippable
                bcs.s   @WriteEntry_NewATTandDEF
                lea     aUnequippable(pc), a0
                addq.l  #WINDOW_MEMBERLIST_ENTRY_UNEQUIPPABLE_OFFSET,a1
                moveq   #WINDOW_MEMBERLIST_ENTRY_UNEQUIPPABLE_LENGTH,d7
                moveq   #$FFFFFFC6,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                bra.s   @NextEntry
@WriteEntry_NewATTandDEF:
                
                jsr     j_GetEquipmentNewATTandDEF
                addq.l  #2,a1
                move.w  -$10(a6),d0
                jsr     j_GetCurrentATT
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                move.w  #VDPTILE_HORIZONTAL_ARROW|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT,(a1)+
                move.w  d2,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                addq.l  #WINDOW_MEMBERLIST_ENTRY_NEWDEFENSE_OFFSET,a1
                move.w  -$10(a6),d0
                jsr     j_GetCurrentDEF
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteStatValue  
                move.w  #VDPTILE_HORIZONTAL_ARROW|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT,(a1)+
                move.w  d3,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                addq.l  #2,a1
@NextEntry:
                
                movea.l (sp)+,a1
                adda.w  #WINDOW_MEMBERLIST_ENTRY_NEXT_OFFSET,a1
                addq.w  #1,d4
                cmp.w   ((INDEX_LIST_ENTRIES_NUMBER-$1000000)).w,d4
                dbeq    d5,@CreateEntry_Loop
                unlk    a6
                rts

    ; End of function WriteMemberListText


; =============== S U B R O U T I N E =======================================

sub_137AC:
                
                move.w  -8(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).l
                move.w  -2(a6),d0

    ; End of function sub_137AC


; =============== S U B R O U T I N E =======================================

sub_137BC:
                
                link    a6,#-6
                move.w  d0,-2(a6)
                move.l  a1,-6(a6)
                move.w  #$150D,d0
                bsr.w   CopyWindowTilesToRam
                move.w  -2(a6),d0
                jsr     j_GetCombatantName
                movea.l -6(a6),a1
                adda.w  #$2C,a1 
                moveq   #$FFFFFFD6,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  -2(a6),d0
                jsr     j_GetClass
                jsr     j_GetClassName
                addq.w  #2,a1
                moveq   #$FFFFFFD6,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                addq.w  #2,a1
                move.w  #$C04C,(a1)+
                move.w  -2(a6),d0
                jsr     j_GetCurrentLevel
                moveq   #2,d7
                move.w  d1,d0
                ext.l   d0
                cmpi.w  #$A,d0
                bge.s   loc_1381E
                subq.w  #1,d7
loc_1381E:
                
                bsr.w   WriteTilesFromNumber
                movea.l -6(a6),a1
                adda.w  #$4E,a1 
                move.w  -2(a6),d0
                jsr     j_GetStatus
                move.w  d1,d2
                andi.w  #4,d2
                beq.s   loc_13846
                move.l  #$C0ECC0ED,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
loc_13846:
                
                move.w  d1,d2
                andi.w  #2,d2
                beq.s   loc_13858
                move.l  #$C0E8C0E9,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
loc_13858:
                
                move.w  d1,d2
                andi.w  #$30,d2 
                beq.s   loc_1386A
                move.l  #$C0E2C0E3,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
loc_1386A:
                
                move.w  d1,d2
                andi.w  #$300,d2
                beq.s   loc_1387C
                move.l  #$C0E4C0E5,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
loc_1387C:
                
                move.w  d1,d2
                andi.w  #1,d2
                beq.s   loc_1388E
                move.l  #$C0EAC0EB,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
loc_1388E:
                
                move.w  d1,d2
                andi.w  #$C0,d2 
                beq.s   loc_138A0
                move.l  #$C0E6C0E7,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
loc_138A0:
                
                move.w  d1,d2
                andi.w  #$C000,d2
                beq.s   loc_138B2
                move.l  #$C0A1C0A2,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
loc_138B2:
                
                move.w  d1,d2
                andi.w  #$3000,d2
                beq.s   loc_138C4
                move.l  #$C0A3C0A4,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
loc_138C4:
                
                move.w  d1,d2
                andi.w  #$C00,d2
                beq.s   loc_138D6
                move.l  #$C0DDC0DF,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
loc_138D6:
                
                move.b  ((word_FFAF8C-$1000000)).w,d0
                bne.s   loc_138E2
                bsr.w   WriteMemberMiniStatus
                bra.s   loc_138FE
loc_138E2:
                
                cmpi.b  #1,d0
                bne.s   loc_138EE
                bsr.w   WriteItemsMiniStatus
                bra.s   loc_138FE
loc_138EE:
                
                cmpi.b  #2,d0
                bne.s   loc_138FA
                bsr.w   WriteMagicMiniStatus
                bra.s   loc_138FE
loc_138FA:
                
                bsr.w   WriteEquipMiniStatus
loc_138FE:
                
                unlk    a6
                rts

    ; End of function sub_137BC


; =============== S U B R O U T I N E =======================================

WriteMemberMiniStatus:
                
                movea.l -6(a6),a1
                adda.w  #$80,a1 
                lea     aMagicItem(pc), a0
                moveq   #$FFFFFFD6,d1
                moveq   #$E,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l -6(a6),a1
                adda.w  #$AC,a1 
                bsr.w   WriteMemberMagicList
                movea.l -6(a6),a1
                adda.w  #$C0,a1 
                bsr.w   WriteMemberItemsList
                rts

    ; End of function WriteMemberMiniStatus


; =============== S U B R O U T I N E =======================================

WriteItemsMiniStatus:
                
                movea.l -6(a6),a1
                adda.w  #$82,a1 
                lea     aItem_3(pc), a0 
                moveq   #$FFFFFFD6,d1
                moveq   #8,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l -6(a6),a1
                adda.w  #$C0,a1 
                bsr.w   WriteMemberItemsList
                bsr.w   DrawMemberItemsIconsCross
                rts

    ; End of function WriteItemsMiniStatus


; =============== S U B R O U T I N E =======================================

WriteMagicMiniStatus:
                
                movea.l -6(a6),a1
                adda.w  #$82,a1 
                lea     aMagic_2(pc), a0
                moveq   #$FFFFFFD6,d1
                moveq   #7,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l -6(a6),a1
                adda.w  #$C0,a1 
                bsr.w   WriteMemberMagicList
                bsr.w   DrawMemberMagicIconsCross
                rts

    ; End of function WriteMagicMiniStatus


; =============== S U B R O U T I N E =======================================

WriteEquipMiniStatus:
                
                movea.l -6(a6),a1
                adda.w  #$82,a1 
                lea     aEquipment(pc), a0
                moveq   #$FFFFFFD6,d1
                moveq   #$A,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  d5,d1
                cmpi.w  #ICON_UNARMED,d1
                beq.s   loc_139A0
                jsr     j_FindItemName
                bra.s   loc_139A6
loc_139A0:
                
                lea     aNothing_2(pc), a0
                moveq   #$A,d7
loc_139A6:
                
                moveq   #$FFFFFFD6,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l -6(a6),a1
                adda.w  #$EA,a1 
                lea     aAtt(pc), a0    
                moveq   #7,d7
                moveq   #$FFFFFFD6,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  -2(a6),d0
                jsr     j_GetCurrentATT
                move.w  d1,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                movea.l -6(a6),a1
                adda.w  #$13E,a1
                lea     aDef(pc), a0    
                moveq   #8,d7
                moveq   #$FFFFFFD6,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  -2(a6),d0
                jsr     j_GetCurrentDEF
                move.w  d1,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                movea.l -6(a6),a1
                adda.w  #$192,a1
                lea     aAgi(pc), a0    
                moveq   #6,d7
                moveq   #$FFFFFFD6,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  -2(a6),d0
                jsr     j_GetCurrentAGI
                move.w  d1,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                movea.l -6(a6),a1
                adda.w  #$1E6,a1
                lea     aMov(pc), a0    
                moveq   #8,d7
                moveq   #$FFFFFFD6,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  -2(a6),d0
                jsr     j_GetCurrentMOV
                move.w  d1,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                bra.w   loc_13C36
                rts

    ; End of function WriteEquipMiniStatus


; =============== S U B R O U T I N E =======================================

WriteMemberMagicList:
                
                move.w  -2(a6),d0
                clr.w   d1
                jsr     j_GetSpellAndNumberOfSpells
                tst.w   d2
                beq.w   loc_13AD8
                moveq   #3,d6
loc_13A66:
                
                move.w  -2(a6),d0
                moveq   #3,d1
                sub.w   d6,d1
                jsr     j_GetSpellAndNumberOfSpells
                cmpi.b  #$3F,d1 
                beq.w   return_13B46
                movem.l a0-a1,-(sp)
                movem.w d0-d1/d6-d7,-(sp)
                jsr     j_FindSpellName
                moveq   #$FFFFFFD6,d1
                move.l  a1,-(sp)
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movea.l (sp)+,a1
                movem.w (sp)+,d0-d1/d6-d7
                movem.w d6-d7,-(sp)
                lea     $2C(a1),a1
                move.w  #$C04C,(a1)+
                move.w  #$C085,(a1)+
                move.w  #$C096,(a1)+
                move.w  #$C085,(a1)+
                move.w  #$C08C,(a1)+
                move.w  #$C020,(a1)+
                lsr.w   #6,d1
                addq.w  #1,d1
                move.w  d1,d0
                ext.l   d0
                moveq   #1,d7
                bsr.w   WriteTilesFromNumber
                movem.w (sp)+,d6-d7
                movem.l (sp)+,a0-a1
                lea     $54(a1),a1
                dbf     d6,loc_13A66
                rts
loc_13AD8:
                
                move.w  d7,-(sp)
                lea     aNothing_0(pc), a0
                moveq   #$FFFFFFD6,d1
                moveq   #$A,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d7
                rts

    ; End of function WriteMemberMagicList


; =============== S U B R O U T I N E =======================================

WriteMemberItemsList:
                
                move.w  -2(a6),d0
                clr.w   d1
                jsr     j_GetItemAndNumberOfItems
                tst.w   d2
                beq.w   loc_13B48
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d6
loc_13AFE:
                
                move.w  -2(a6),d0
                moveq   #3,d1
                sub.w   d6,d1
                jsr     j_GetItemAndNumberOfItems
                cmpi.b  #ITEM_NOTHING,d1
                beq.w   return_13B46
                movem.w d0-d1/d6-d7,-(sp)
                movem.l a0-a1,-(sp)
                jsr     j_FindItemName
                moveq   #$FFFFFFD6,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movem.l (sp)+,a0-a1
                movem.w (sp)+,d0-d1/d6-d7
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.w   loc_13B3E
                move.w  #$C0B1,-2(a1)
loc_13B3E:
                
                lea     $54(a1),a1
                dbf     d6,loc_13AFE
return_13B46:
                
                rts
loc_13B48:
                
                move.w  d7,-(sp)
                lea     aNothing_1(pc), a0
                moveq   #$FFFFFFD6,d1
                moveq   #$A,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d7
                rts

    ; End of function WriteMemberItemsList


; =============== S U B R O U T I N E =======================================

LoadItemIcon:
                
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                movea.l (p_IconTiles).l,a0
                bra.w   LoadIcon

    ; End of function LoadItemIcon


; =============== S U B R O U T I N E =======================================

LoadSpellIcon:
                
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                movea.l (p_IconTiles).l,a0
                cmpi.w  #SPELL_NOTHING,d1
                bne.s   loc_13B7E
                move.w  #ICON_NOTHING,d1
                bra.s   LoadIcon
loc_13B7E:
                
                addi.w  #ICON_HEAL,d1

    ; End of function LoadSpellIcon


; START OF FUNCTION CHUNK FOR LoadItemIcon

LoadIcon:
                
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                adda.w  d1,a0           ; icon offset
                moveq   #$2F,d7 
loc_13B8E:
                
                move.l  (a0)+,(a1)+
                dbf     d7,loc_13B8E
                ori.w   #$F,-2(a1)
                ori.w   #$F000,-$24(a1)
                ori.w   #$F,-$9E(a1)
                ori.w   #$F000,-$C0(a1)
                rts

; END OF FUNCTION CHUNK FOR LoadItemIcon


; =============== S U B R O U T I N E =======================================

DrawMemberItemsIconsCross:
                
                move.w  -2(a6),d0
                lea     (FF6802_LOADING_SPACE).l,a1
                clr.w   d1
                jsr     j_GetItemAndNumberOfItems
                bsr.s   LoadItemIcon
                moveq   #1,d1
                jsr     j_GetItemAndNumberOfItems
                bsr.s   LoadItemIcon
                moveq   #2,d1
                jsr     j_GetItemAndNumberOfItems
                bsr.s   LoadItemIcon
                moveq   #3,d1
                jsr     j_GetItemAndNumberOfItems
                bsr.w   LoadItemIcon
                bra.w   loc_13C20

    ; End of function DrawMemberItemsIconsCross


; =============== S U B R O U T I N E =======================================

DrawMemberMagicIconsCross:
                
                move.w  -2(a6),d0
                lea     (FF6802_LOADING_SPACE).l,a1
                clr.w   d1
                jsr     j_GetSpellAndNumberOfSpells
                bsr.w   LoadSpellIcon
                moveq   #1,d1
                jsr     j_GetSpellAndNumberOfSpells
                bsr.w   LoadSpellIcon
                moveq   #2,d1
                jsr     j_GetSpellAndNumberOfSpells
                bsr.w   LoadSpellIcon
                moveq   #3,d1
                jsr     j_GetSpellAndNumberOfSpells
                bsr.w   LoadSpellIcon
loc_13C20:
                
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($BC00).l,a1
                move.w  #$180,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
loc_13C36:
                
                movea.l -6(a6),a1
                move.l  #$C5E0C5E1,$DC(a1)
                move.l  #$C5E2C5E3,$106(a1)
                move.l  #$C5E4C5E5,$130(a1)
                move.l  #$C5E6C5E7,$12A(a1)
                move.l  #$C5E8C5E9,$154(a1)
                move.l  #$C5EAC5EB,$17E(a1)
                move.l  #$C5ECC5ED,$136(a1)
                move.l  #$C5EEC5EF,$160(a1)
                move.l  #$C5F0C5F1,$18A(a1)
                move.l  #$C5F2C5F3,$184(a1)
                move.l  #$C5F4C5F5,$1AE(a1)
                move.l  #$C5F6C5F7,$1D8(a1)
                rts

    ; End of function DrawMemberMagicIconsCross


; =============== S U B R O U T I N E =======================================

CopyWindowTilesToRam:
                
                movem.w d0-d1/d6-d7,-(sp)
                clr.w   d1
                move.b  d0,d1
                lsr.w   #8,d0
                move.w  d0,d6
                subq.l  #3,d6
                move.w  #$C060,(a1)+
loc_13CAE:
                
                move.w  #$C061,(a1)+
                dbf     d6,loc_13CAE
                move.w  #$C860,(a1)+
                move.w  d1,d7
                subq.w  #3,d7
loc_13CBE:
                
                move.w  d0,d6
                subq.w  #3,d6
                move.w  #$C070,(a1)+
loc_13CC6:
                
                move.w  #$C020,(a1)+
                dbf     d6,loc_13CC6
                move.w  #$C870,(a1)+
                dbf     d7,loc_13CBE
                move.w  d0,d6
                subq.l  #3,d6
                move.w  #$D060,(a1)+
loc_13CDE:
                
                move.w  #$D061,(a1)+
                dbf     d6,loc_13CDE
                move.w  #$D860,(a1)+
                movem.w (sp)+,d0-d1/d6-d7
                rts

    ; End of function CopyWindowTilesToRam

aNameClassLevExp:
                dc.b 'NAME    '
aClassLevExp:   dc.b 'CLASS     LEV EXP',0
aNameHpMpAtDfAgMv:
                dc.b 'NAME    '
aHpMpAtDfAgMv:  dc.b 'HP MP AT DF AG MV',0
aNameAttackDefense:
                dc.b 'NAME    '
aAttackDefense: dc.b 'ATTACK   DEFENSE',0
aMagicItem:     dc.b 'MAGIC     ITEM'
aItem_3:        dc.b '- ITEM -',0
aMagic_2:       dc.b '- MAGIC -',0
aLevel:         dc.b 'LEVEL',0
aUnequippable:  dc.b '\unequippable',0
aEquipment:     dc.b 'Equipment ',0
aAtt:           dc.b 'ATT  ',0
aDef:           dc.b 'DEF  ',0
aMov:           dc.b 'MOV  ',0
aAgi:           dc.b 'AGI  ',0
aNothing_2:     dc.b '\Nothing',0
                
                wordAlign               ; make sure tiles data is word aligned in case patches are applied
                
TextHighlightTiles:
                incbin "data/graphics/tech/texthighlighttiles.bin"
word_13EDE:     dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020

; =============== S U B R O U T I N E =======================================

sub_13F14:
                
                movem.l d0/d3-a1,-(sp)
                sndCom  SFX_VALIDATION
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                moveq   #0,d1
                jsr     j_GetItemAndNumberOfItems
                move.w  d1,(a0)+
                moveq   #1,d1
                jsr     j_GetItemAndNumberOfItems
                move.w  d1,(a0)+
                moveq   #2,d1
                jsr     j_GetItemAndNumberOfItems
                move.w  d1,(a0)+
                moveq   #3,d1
                jsr     j_GetItemAndNumberOfItems
                move.w  d1,(a0)+
                clr.b   ((CURRENT_DIAMENU_CHOICE-$1000000)).w
                lea     (FF8804_LOADING_SPACE).l,a1
                move.w  ((DISPLAYED_ICON_1-$1000000)).w,d0
                bsr.w   LoadHighlightableItemIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_2-$1000000)).w,d0
                bsr.w   LoadHighlightableItemIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_3-$1000000)).w,d0
                bsr.w   LoadHighlightableItemIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_4-$1000000)).w,d0
                bsr.w   LoadHighlightableItemIcon
                bsr.w   CleanIconCorners
                jsr     (WaitForVInt).w
                moveq   #$1E,d6
loc_13F88:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_13FA2
                moveq   #1,d1
                cmpi.w  #$7F,((DISPLAYED_ICON_2-$1000000)).w 
                beq.s   loc_13FA2
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_1401E
loc_13FA2:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_13FBC
                moveq   #2,d1
                cmpi.w  #$7F,((DISPLAYED_ICON_3-$1000000)).w 
                beq.s   loc_13FBC
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_1401E
loc_13FBC:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_13FCE
                clr.w   d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_1401E
loc_13FCE:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_13FE8
                moveq   #3,d1
                cmpi.w  #$7F,((DISPLAYED_ICON_4-$1000000)).w 
                beq.s   loc_13FE8
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_1401E
loc_13FE8:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_13FFA
                move.b  #$FF,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bra.w   loc_14052
loc_13FFA:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1400C
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_14052
loc_1400C:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14034
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_14052
loc_1401E:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   sub_14074       
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                moveq   #$1D,d6
loc_14034:
                
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bsr.w   sub_14074       
                moveq   #$14,d1
                bsr.w   sub_146AE
                subq.w  #1,d6
                bne.s   loc_1404A
                moveq   #$1E,d6
loc_1404A:
                
                jsr     (WaitForVInt).w
                bra.w   loc_13F88
loc_14052:
                
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d1
                ext.w   d1
                bpl.s   loc_14062
                sndCom  SFX_VALIDATION
                moveq   #$FFFFFFFF,d1
                bra.s   loc_1406E
loc_14062:
                
                move.w  d1,d2
                add.w   d2,d2
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.w  (a0,d2.w),d2
loc_1406E:
                
                movem.l (sp)+,d0/d3-a1
                rts

    ; End of function sub_13F14


; =============== S U B R O U T I N E =======================================

; related to menu choice

sub_14074:
                
                moveq   #$7F,d7 
                add.w   d0,d0           ; d0 is current diamond-menu choice
                move.w  rjt_14080(pc,d0.w),d0
                jmp     rjt_14080(pc,d0.w)

    ; End of function sub_14074

rjt_14080:      dc.w DmaIcon1-rjt_14080
                dc.w DmaIcon2-rjt_14080
                dc.w DmaIcon3-rjt_14080
                dc.w DmaIcon4-rjt_14080

; =============== S U B R O U T I N E =======================================

DmaIcon1:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_14098
                adda.w  #$C0,a0 
loc_14098:
                
                lea     ($BC00).l,a1
                move.w  #$60,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function DmaIcon1


; =============== S U B R O U T I N E =======================================

DmaIcon2:
                
                lea     (byte_FF8984).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_140B8
                adda.w  #$C0,a0 
loc_140B8:
                
                lea     ($BCC0).l,a1
                move.w  #$60,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function DmaIcon2


; =============== S U B R O U T I N E =======================================

DmaIcon3:
                
                lea     (byte_FF8B04).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_140D8
                adda.w  #$C0,a0 
loc_140D8:
                
                lea     ($BD80).l,a1
                move.w  #$60,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function DmaIcon3


; =============== S U B R O U T I N E =======================================

DmaIcon4:
                
                lea     (byte_FF8C84).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_140F8
                adda.w  #$C0,a0 
loc_140F8:
                
                lea     ($BE40).l,a1
                move.w  #$60,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function DmaIcon4


; =============== S U B R O U T I N E =======================================

sub_14108:
                
                movem.l d0/d3-a2,-(sp)
loc_1410C:
                
                jsr     j_GetEquippableWeapons
                tst.w   d1
                beq.w   loc_14162
                movea.l a0,a2
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a1
                move.w  (a0),(a1)+
                move.w  4(a0),(a1)+
                move.w  8(a0),(a1)+
                move.w  $C(a0),(a1)+
                move.w  d1,d3
                jsr     j_GetEquippedWeapon
                bsr.w   sub_141CE
                tst.w   d1
                bpl.s   loc_1414A
                moveq   #1,d7
                bsr.w   sub_143E0
                jsr     (WaitForWindowMovementEnd).w
                bra.w   loc_141C8
loc_1414A:
                
                lsl.w   #2,d1
                move.w  (a2,d1.w),d2
                move.w  2(a2,d1.w),d1
                move.w  d2,d5
                move.w  d1,d4
                jsr     j_GetEquippedWeapon
                bsr.w   sub_1477E       
loc_14162:
                
                jsr     j_GetEquippableRings
                tst.w   d1
                beq.w   loc_141C8
                movea.l a0,a2
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a1
                move.w  (a0),(a1)+
                move.w  4(a0),(a1)+
                move.w  8(a0),(a1)+
                move.w  $C(a0),(a1)+
                move.w  d1,d3
                jsr     j_GetEquippedRing
                bsr.w   sub_141CE
                tst.w   d1
                bpl.s   loc_141B0
                jsr     j_GetEquippableWeapons
                tst.w   d1
                bne.s   loc_141AC
                moveq   #1,d7
                bsr.w   sub_143E0
                jsr     (WaitForWindowMovementEnd).w
                moveq   #$FFFFFFFF,d1
                bra.w   loc_141C8
loc_141AC:
                
                bra.w   loc_1410C
loc_141B0:
                
                lsl.w   #2,d1
                move.w  (a2,d1.w),d2
                move.w  2(a2,d1.w),d1
                move.w  d2,d5
                move.w  d1,d4
                jsr     j_GetEquippedRing
                bsr.w   sub_1477E       
loc_141C8:
                
                movem.l (sp)+,d0/d3-a2
                rts

    ; End of function sub_14108


; =============== S U B R O U T I N E =======================================

sub_141CE:
                
                movem.l d0/d2-a2,-(sp)
                tst.w   d1
                bpl.s   loc_141EA
                cmpi.w  #4,d3
                bne.s   loc_141E6
                clr.w   d1
                jsr     j_EquipItem
                bra.s   loc_141E8
loc_141E6:
                
                moveq   #3,d1
loc_141E8:
                
                bra.s   loc_141FE
loc_141EA:
                
                move.l  a0,-(sp)
                moveq   #3,d7
                moveq   #$FFFFFFFF,d1
loc_141F0:
                
                addq.w  #1,d1
                addq.l  #2,a0
                move.w  (a0)+,d4
                cmp.w   d2,d4
                dbeq    d7,loc_141F0
                movea.l (sp)+,a0
loc_141FE:
                
                move.b  d1,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                move.w  d1,-(sp)
                moveq   #3,d7
                bsr.w   sub_143E0
                jsr     j_GetStatus
                move.w  d1,-$A(a6)
                lea     (FF8804_LOADING_SPACE).l,a1
                move.w  ((DISPLAYED_ICON_1-$1000000)).w,d0
                bsr.w   LoadHighlightableIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_2-$1000000)).w,d0
                bsr.w   LoadHighlightableIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_3-$1000000)).w,d0
                bsr.w   LoadHighlightableIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_4-$1000000)).w,d0
                bsr.w   LoadHighlightableIcon
                bsr.w   CleanIconCorners
                clr.w   d6
                moveq   #$1F,d7
                bsr.w   DmaIcon1
                bsr.w   DmaIcon2
                bsr.w   DmaIcon3
                bsr.w   DmaIcon4
                jsr     (WaitForWindowMovementEnd).w
                moveq   #$1E,d6
loc_14264:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1427E
                moveq   #1,d1
                cmpi.w  #$7F,((DISPLAYED_ICON_2-$1000000)).w 
                beq.s   loc_1427E
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_142FA
loc_1427E:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14298
                moveq   #2,d1
                cmpi.w  #$7F,((DISPLAYED_ICON_3-$1000000)).w 
                beq.s   loc_14298
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_142FA
loc_14298:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_142AA
                clr.w   d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_142FA
loc_142AA:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_142C4
                moveq   #3,d1
                cmpi.w  #$7F,((DISPLAYED_ICON_4-$1000000)).w 
                beq.s   loc_142C4
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_142FA
loc_142C4:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_142D6
                move.b  #$FF,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bra.w   loc_1438C
loc_142D6:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_142E8
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_1438C
loc_142E8:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14366
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_1438C
loc_142FA:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   sub_14074       
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                move.w  d0,d2
                move.w  -2(a6),d0
                lsl.w   #2,d2
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a2
                move.w  (a2,d2.w),d5
                move.w  2(a2,d2.w),d6
                move.w  (a2),d1
                jsr     j_GetItemType
                tst.w   d2
                blt.s   loc_14336
                jsr     j_UnequipWeapon
                bra.s   loc_1433C
loc_14336:
                
                jsr     j_UnequipRing
loc_1433C:
                
                move.w  d6,d1
                cmpi.w  #4,d1
                bge.s   loc_1434A
                jsr     j_EquipItem
loc_1434A:
                
                move.w  -$A(a6),d1
                jsr     j_SetStatus
                bsr.w   sub_137AC
                move.w  -8(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                moveq   #$1D,d6
loc_14366:
                
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bsr.w   sub_14074       
                moveq   #$14,d1
                bsr.w   sub_146AE
                move.b  #$10,(SPRITE_09_LINK).l
                subq.w  #1,d6
                bne.s   loc_14384
                moveq   #$1E,d6
loc_14384:
                
                jsr     (WaitForVInt).w
                bra.w   loc_14264
loc_1438C:
                
                move.w  -2(a6),d0
                move.w  ((EQUIPPABLE_ITEMS-$1000000)).w,d1
                jsr     j_GetItemType
                tst.w   d2
                blt.s   loc_143A6
                jsr     j_UnequipWeapon
                bra.s   loc_143AC
loc_143A6:
                
                jsr     j_UnequipRing
loc_143AC:
                
                move.w  (sp)+,d1
                lsl.w   #2,d1
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a0
                move.w  2(a0,d1.w),d1
                cmpi.w  #COMBATANT_ITEMSLOTS,d1
                bge.s   loc_143C4
                jsr     j_EquipItem
loc_143C4:
                
                move.w  -$A(a6),d1
                jsr     j_SetStatus
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d1
                ext.w   d1
                movem.l (sp)+,d0/d2-a2
                move.b  #1,((word_FFAF8C-$1000000)).w
                rts

    ; End of function sub_141CE


; =============== S U B R O U T I N E =======================================

sub_143E0:
                
                movem.w d0-d7,-(sp)
                move.w  -8(a6),d0
                move.w  #$2001,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.b  d7,((word_FFAF8C-$1000000)).w
                clr.w   d5
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d5
                lsl.w   #1,d5
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.w  (a0,d5.w),d5
                bsr.w   sub_137AC
                move.w  -8(a6),d0
                move.w  #$A01,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                movem.w (sp)+,d0-d7
                rts

    ; End of function sub_143E0


; =============== S U B R O U T I N E =======================================

sub_14422:
                
                movem.w d0-d2/d7,-(sp)
                move.w  -4(a6),d0
                move.w  #$21C,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.w (sp)+,d0-d2/d7
                rts

    ; End of function sub_14422


; =============== S U B R O U T I N E =======================================

sub_1443E:
                
                movem.w d0-d2/d7,-(sp)
                move.w  -4(a6),d0
                move.w  #$20E,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.w (sp)+,d0-d2/d7
                rts

    ; End of function sub_1443E


; =============== S U B R O U T I N E =======================================

sub_1445A:
                
                movem.l d0/d3-a1,-(sp)
                sndCom  SFX_VALIDATION
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                moveq   #0,d1
                jsr     j_GetSpellAndNumberOfSpells
                andi.w  #$7F,d1 
                move.w  d1,(a0)+
                moveq   #1,d1
                jsr     j_GetSpellAndNumberOfSpells
                andi.w  #$7F,d1 
                move.w  d1,(a0)+
                moveq   #2,d1
                jsr     j_GetSpellAndNumberOfSpells
                andi.w  #$7F,d1 
                move.w  d1,(a0)+
                moveq   #3,d1
                jsr     j_GetSpellAndNumberOfSpells
                andi.w  #$7F,d1 
                move.w  d1,(a0)+
                clr.b   ((CURRENT_DIAMENU_CHOICE-$1000000)).w
                lea     (FF8804_LOADING_SPACE).l,a1
                move.w  ((DISPLAYED_ICON_1-$1000000)).w,d0
                bsr.w   LoadHighlightableSpellIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_2-$1000000)).w,d0
                bsr.w   LoadHighlightableSpellIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_3-$1000000)).w,d0
                bsr.w   LoadHighlightableSpellIcon
                bsr.w   CleanIconCorners
                move.w  ((DISPLAYED_ICON_4-$1000000)).w,d0
                bsr.w   LoadHighlightableSpellIcon
                bsr.w   CleanIconCorners
loc_144D8:
                
                jsr     (WaitForVInt).w
                moveq   #$1E,d6
loc_144DE:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_144F8
                moveq   #1,d1
                cmpi.w  #$3F,((DISPLAYED_ICON_2-$1000000)).w 
                beq.s   loc_144F8
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_14574
loc_144F8:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14512
                moveq   #2,d1
                cmpi.w  #$3F,((DISPLAYED_ICON_3-$1000000)).w 
                beq.s   loc_14512
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_14574
loc_14512:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14524
                clr.w   d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_14574
loc_14524:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1453E
                moveq   #3,d1
                cmpi.w  #$3F,((DISPLAYED_ICON_4-$1000000)).w 
                beq.s   loc_1453E
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_14574
loc_1453E:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14550
                move.b  #$FF,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bra.w   byte_145A8
loc_14550:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14562
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   byte_145A8
loc_14562:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1458A
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   byte_145A8
loc_14574:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   sub_14074       
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                moveq   #$1D,d6
loc_1458A:
                
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bsr.w   sub_14074       
                moveq   #$14,d1
                bsr.w   sub_146AE
                subq.w  #1,d6
                bne.s   loc_145A0
                moveq   #$1E,d6
loc_145A0:
                
                jsr     (WaitForVInt).w
                bra.w   loc_144DE
byte_145A8:
                
                sndCom  SFX_VALIDATION
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d1
                ext.w   d1
                bpl.s   loc_145BC
                moveq   #$FFFFFFFF,d1
                movem.l (sp)+,d0/d3-a1
                rts
loc_145BC:
                
                move.w  d1,d2
                add.w   d2,d2
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.w  (a0,d2.w),d2
                move.w  d2,-(sp)
                moveq   #$1E,d6
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bsr.w   sub_14074       
                move.w  (sp)+,d2
                move.w  d2,d4
                lsr.w   #6,d4
                move.w  d4,d3
                moveq   #$13,d1
                bsr.w   sub_146AE
                jsr     (WaitForVInt).w
                moveq   #$14,d1
loc_145EA:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14600
                tst.w   d3
                ble.s   loc_14600
                subq.w  #1,d3
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_1463E
loc_14600:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14616
                cmp.w   d4,d3
                bge.s   loc_14616
                addq.w  #1,d3
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_1463E
loc_14616:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14626
                move.b  #$FF,d3
                bra.w   loc_14654
loc_14626:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14632
                bra.w   loc_14654
loc_14632:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14644
                bra.w   loc_14654
loc_1463E:
                
                bsr.w   sub_1474C
                moveq   #$13,d1
loc_14644:
                
                bsr.w   sub_146AE
                subq.w  #1,d1
                bne.s   loc_1464E
                moveq   #$14,d1
loc_1464E:
                
                jsr     (WaitForVInt).w
                bra.s   loc_145EA
loc_14654:
                
                moveq   #$13,d1
                bsr.w   sub_146AE
                tst.b   d3
                bpl.s   loc_1466C
                sndCom  SFX_VALIDATION
                move.w  d4,d3
                bsr.w   sub_1474C
                bra.w   loc_144D8
loc_1466C:
                
                move.w  d2,d1
                andi.w  #$3F,d1 
                lsl.w   #6,d3
                or.w    d3,d1
                movem.l (sp)+,d0/d3-a1  ;     fixSelectionRectCorners
                                        ;     Remove white pixels from corners of spell/item selection rect.
                                        ;     In: A1 = end of selection rect section in RAM
                rts

    ; End of function sub_1445A


; =============== S U B R O U T I N E =======================================

CleanIconCorners:
                
                ori.w   #$F,-2(a1)
                ori.w   #$F000,-$24(a1)
                ori.w   #$F,-$9E(a1)
                ori.w   #$F000,-$C0(a1)
                ori.w   #$F,-$C2(a1)
                ori.w   #$F000,-$E4(a1)
                ori.w   #$F,-$15E(a1)
                ori.w   #$F000,-$180(a1)
                rts

    ; End of function CleanIconCorners


; =============== S U B R O U T I N E =======================================

sub_146AE:
                
                movem.w d0/d2,-(sp)
                lea     (SPRITE_08).l,a0
                lea     tbl_SpriteDefs_TextHighlight_ItemList(pc), a1
                move.w  ((word_FFB138-$1000000)).w,d0
                lsl.w   #4,d0
                tst.b   ((HIDE_WINDOWS-$1000000)).w
                beq.s   loc_146CE
                moveq   #1,d1
                move.w  #$100,d0
loc_146CE:
                
                moveq   #WINDOW_MEMBERLIST_HIGHLIGHT_SPRITES_COUNTER,d7
loc_146D0:
                
                move.w  (a1)+,(a0)
                add.w   d0,(a0)
                move.w  (a1)+,d2
                move.w  d2,2(a0)
                move.w  (a1)+,4(a0)
                move.w  (a1)+,6(a0)
                addq.l  #8,a0
                dbf     d7,loc_146D0
                cmpi.w  #7,d1
                bge.s   loc_146F4
                move.w  #$100,d0
                bra.s   loc_146F6
loc_146F4:
                
                clr.w   d0
loc_146F6:
                
                clr.w   d2
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d2
                lsl.w   #4,d2
                add.w   d2,d0
                moveq   #2,d7
loc_14702:
                
                move.w  (a1)+,(a0)
                add.w   d0,(a0)
                move.w  (a1)+,d2
                move.w  d2,2(a0)
                move.w  (a1)+,4(a0)
                move.w  (a1)+,6(a0)
                addq.l  #8,a0
                dbf     d7,loc_14702
                bsr.w   sub_101E6
                movem.w (sp)+,d0/d2
                rts

    ; End of function sub_146AE

tbl_SpriteDefs_TextHighlight_ItemList:
                dc.w SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_1_INIT_Y
                dc.b SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_1_SIZE
                dc.b SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_1_LINK
                dc.w SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_1_PROPS
                dc.w SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_1_INIT_X
                dc.w SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_2_INIT_Y
                dc.b SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_2_SIZE
                dc.b SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_2_LINK
                dc.w SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_2_PROPS
                dc.w SPRITEDEF_TEXTHIGHLIGHT_MEMBERLIST_2_INIT_X
                dc.w SPRITEDEF_TEXTHIGHLIGHT_ITEMLIST_1_INIT_Y
                dc.b SPRITEDEF_TEXTHIGHLIGHT_ITEMLIST_1_SIZE
                dc.b SPRITEDEF_TEXTHIGHLIGHT_ITEMLIST_1_LINK
                dc.w SPRITEDEF_TEXTHIGHLIGHT_ITEMLIST_1_PROPS
                dc.w SPRITEDEF_TEXTHIGHLIGHT_ITEMLIST_1_INIT_X
                dc.w SPRITEDEF_TEXTHIGHLIGHT_ITEMLIST_2_INIT_Y
                dc.b SPRITEDEF_TEXTHIGHLIGHT_ITEMLIST_2_SIZE
                dc.b SPRITEDEF_TEXTHIGHLIGHT_ITEMLIST_2_LINK
                dc.w SPRITEDEF_TEXTHIGHLIGHT_ITEMLIST_2_PROPS
                dc.w SPRITEDEF_TEXTHIGHLIGHT_ITEMLIST_2_INIT_X
                dc.w SPRITEDEF_TEXTHIGHLIGHT_ITEMLIST_3_INIT_Y
                dc.b SPRITEDEF_TEXTHIGHLIGHT_ITEMLIST_3_SIZE
                dc.b SPRITEDEF_TEXTHIGHLIGHT_ITEMLIST_3_LINK
                dc.w SPRITEDEF_TEXTHIGHLIGHT_ITEMLIST_3_PROPS
                dc.w SPRITEDEF_TEXTHIGHLIGHT_ITEMLIST_3_INIT_X

; =============== S U B R O U T I N E =======================================

sub_1474C:
                
                move.w  -8(a6),d0
                clr.w   d1
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d1
                add.w   d1,d1
                addq.w  #5,d1
                ori.w   #$1300,d1
                jsr     (GetWindowTileAddress).w
                clr.w   d1
                move.w  d3,d0
                addq.w  #1,d0
                ext.l   d0
                moveq   #1,d7
                bsr.w   WriteTilesFromNumber
                move.w  -8(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                rts

    ; End of function sub_1474C


; =============== S U B R O U T I N E =======================================

; related to item unequip and cursed items

sub_1477E:
                
                cmpi.w  #$FFFF,d1
                beq.w   loc_147B8
                move.w  d2,d1
                jsr     j_UnequipItemIfNotCursed
                cmpi.w  #2,d2
                bne.w   loc_147B8
                cmp.w   d4,d1
                beq.w   return_147E6
                jsr     sub_14422(pc)
                sndCom  MUSIC_CURSED_ITEM
                txt     $2B             ; "Gosh!  The curse prohibits{N}you from exchanging{N}equipment!{W2}"
                bsr.w   WaitForMusicResumeAndPlayerInput_0
                clsTxt
                jsr     sub_1443E(pc)
                bra.w   return_147E6
loc_147B8:
                
                move.w  d4,d1
                jsr     j_EquipItem
                cmpi.w  #2,d2
                bne.w   return_147E6
                move.w  d0,(TEXT_NAME_INDEX_1).l
                jsr     sub_14422(pc)
                sndCom  MUSIC_CURSED_ITEM
                txt     $22             ; "Gosh!  {NAME} is{N}cursed!{W2}"
                bsr.w   WaitForMusicResumeAndPlayerInput_0
                clsTxt
                jsr     sub_1443E(pc)
return_147E6:
                
                rts

    ; End of function sub_1477E


; =============== S U B R O U T I N E =======================================

WaitForMusicResumeAndPlayerInput_0:
                
                move.w  d0,-(sp)
                move.w  #$FB,d0 
                jsr     (PlayMusicAfterCurrentOne).w
                jsr     (WaitForPlayerInput).w
                move.w  (sp)+,d0
                rts

    ; End of function WaitForMusicResumeAndPlayerInput_0


; =============== S U B R O U T I N E =======================================

sub_147FA:
                
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d0
                mulu.w  #6,d0
                add.w   ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d0
                cmp.w   ((INDEX_LIST_ENTRIES_NUMBER-$1000000)).w,d0
                blt.s   loc_14814
                clr.w   ((CURRENT_ITEMLIST_PAGE-$1000000)).w
                clr.w   ((CURRENT_ITEMLIST_SELECTION-$1000000)).w
loc_14814:
                
                link    a6,#-$F0
                move.w  #$1B06,d0
                move.w  #$2F7,d1
                jsr     (CreateWindow).l
                move.w  d0,-2(a6)
                move.l  a1,-6(a6)
                bsr.w   sub_14BB0       
                move.w  #$A05,d0
                move.w  #$F606,d1
                jsr     (CreateWindow).l
                move.w  d0,-8(a6)
                move.l  a1,-$C(a6)
                bsr.w   sub_14B68
                move.w  #$904,d0
                move.w  #$2017,d1
                jsr     (CreateWindow).l
                move.w  d0,-$E(a6)
                move.l  a1,-$12(a6)
                bsr.w   sub_14B28       
                move.w  -2(a6),d0
                move.w  #$201,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  -8(a6),d0
                move.w  #$106,d1
                move.w  ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d2
                lsl.w   #2,d2
                lsl.w   #8,d2
                add.w   d2,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  -$E(a6),d0
                move.w  #$1617,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                lea     ShopInventoryItemHighlightTiles(pc), a0
                lea     ($FE00).l,a1
                move.w  #$100,d0
                jsr     (ApplyVIntVramDmaOnCompressedTiles).w
                jsr     (WaitForWindowMovementEnd).l
                bsr.w   sub_14EDE
loc_148BC:
                
                move.w  ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d0
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_14906
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d2
                mulu.w  #6,d2
                add.w   d0,d2
                addq.w  #1,d2
                cmp.w   ((INDEX_LIST_ENTRIES_NUMBER-$1000000)).w,d2
                bge.s   loc_14906
                addq.w  #1,d0
                sndCom  SFX_MENU_SELECTION
                cmp.w   ((word_FFB134-$1000000)).w,d0
                blt.s   loc_148FA
                addq.w  #1,((CURRENT_ITEMLIST_PAGE-$1000000)).w
                clr.w   ((CURRENT_ITEMLIST_SELECTION-$1000000)).w
                clr.b   ((word_FFAF9E-$1000000)).w
                bsr.w   sub_14E62
                bra.w   loc_149E0
loc_148FA:
                
                move.w  d0,((CURRENT_ITEMLIST_SELECTION-$1000000)).w
                bsr.w   sub_14EC0
                bra.w   loc_149E0
loc_14906:
                
                move.w  ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d0
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1494A
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d2
                mulu.w  #6,d2
                add.w   d0,d2
                ble.s   loc_1494A
                subq.w  #1,d0
                sndCom  SFX_MENU_SELECTION
                bge.s   loc_1493E
                subq.w  #1,((CURRENT_ITEMLIST_PAGE-$1000000)).w
                move.w  #5,((CURRENT_ITEMLIST_SELECTION-$1000000)).w
                move.b  #1,((word_FFAF9E-$1000000)).w
                bsr.w   sub_14E62
                bra.w   loc_149E0
loc_1493E:
                
                move.w  d0,((CURRENT_ITEMLIST_SELECTION-$1000000)).w
                bsr.w   sub_14EC0
                bra.w   loc_149E0
loc_1494A:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1496A
                tst.w   ((CURRENT_ITEMLIST_PAGE-$1000000)).w
                beq.s   loc_1496A
                subq.w  #1,((CURRENT_ITEMLIST_PAGE-$1000000)).w
                sndCom  SFX_MENU_SELECTION
                move.b  #1,((word_FFAF9E-$1000000)).w
                bsr.w   sub_14E62
loc_1496A:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_149C2
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d2
                addq.w  #1,d2
                mulu.w  #6,d2
                cmp.w   ((INDEX_LIST_ENTRIES_NUMBER-$1000000)).w,d2
                bge.s   loc_149C2
                addq.w  #1,((CURRENT_ITEMLIST_PAGE-$1000000)).w
                sndCom  SFX_MENU_SELECTION
                move.w  ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d0
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d2
                move.w  d2,d1
                add.w   d2,d2
                add.w   d1,d2
                add.w   d2,d2
                move.w  ((INDEX_LIST_ENTRIES_NUMBER-$1000000)).w,d1
                sub.w   d2,d1
                cmpi.w  #6,d1
                ble.s   loc_149A8
                moveq   #6,d1
loc_149A8:
                
                move.w  d1,((word_FFB134-$1000000)).w
loc_149AC:
                
                cmp.w   d1,d0
                blt.w   loc_149B6
                subq.w  #1,d0
                bne.s   loc_149AC
loc_149B6:
                
                move.w  d0,((CURRENT_ITEMLIST_SELECTION-$1000000)).w
                clr.b   ((word_FFAF9E-$1000000)).w
                bsr.w   sub_14E62
loc_149C2:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_149EC
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_149F2
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_149F2
loc_149E0:
                
                bsr.w   sub_14A82
                jsr     (WaitForVInt).w
                bra.w   loc_148BC
loc_149EC:
                
                moveq   #$FFFFFFFF,d0
                bra.w   loc_14A0A
loc_149F2:
                
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d1
                mulu.w  #6,d1
                add.w   ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d1
                lea     ((INDEX_LIST-$1000000)).w,a0
                move.b  (a0,d1.w),d0
                andi.w  #$FF,d0
loc_14A0A:
                
                movem.w d0-d1,-(sp)
                clr.w   d1
                bsr.s   sub_14A82
                move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_14A26
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindow).l  
loc_14A26:
                
                move.w  -2(a6),d0
                move.w  #$2F7,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  -8(a6),d0
                move.w  #$F606,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                move.w  -$E(a6),d0
                move.w  #$2017,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                jsr     (WaitForWindowMovementEnd).l
                move.w  -$E(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).l
                move.w  -8(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).l
                move.w  -2(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).l
                movem.w (sp)+,d0-d1
                unlk    a6
                rts

    ; End of function sub_147FA


; =============== S U B R O U T I N E =======================================

sub_14A82:
                
                lea     (SPRITE_08).l,a0
                cmpi.w  #7,d1
                bge.s   loc_14A9A
                move.w  #1,(a0)
                move.w  #1,6(a0)
                bra.s   loc_14AAC
loc_14A9A:
                
                move.w  ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d0
                lsl.w   #5,d0
                addi.w  #$9C,d0 
                move.w  d0,6(a0)
                move.w  #$91,(a0) 
loc_14AAC:
                
                move.w  #$F09,2(a0)
                move.w  #$C7F0,4(a0)
                addq.l  #8,a0
                move.w  #1,(a0)
                move.w  #1,6(a0)
                tst.w   ((CURRENT_ITEMLIST_PAGE-$1000000)).w
                beq.s   loc_14AE6
                cmpi.w  #7,d1
                blt.s   loc_14ADA
                move.w  #$98,6(a0) 
                move.w  #$90,(a0) 
loc_14ADA:
                
                move.w  #$A,2(a0)
                move.w  #$D064,4(a0)
loc_14AE6:
                
                addq.l  #8,a0
                move.w  #1,(a0)
                move.w  #1,6(a0)
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d0
                addq.w  #1,d0
                mulu.w  #6,d0
                cmp.w   ((INDEX_LIST_ENTRIES_NUMBER-$1000000)).w,d0
                bge.s   loc_14B1E
                cmpi.w  #7,d1
                blt.s   loc_14B12
                move.w  #$158,6(a0)
                move.w  #$A8,(a0) 
loc_14B12:
                
                move.w  #$10,2(a0)
                move.w  #$C064,4(a0)
loc_14B1E:
                
                subq.w  #1,d1
                bne.s   loc_14B24
                moveq   #$14,d1
loc_14B24:
                
                bra.w   sub_101E6

    ; End of function sub_14A82


; =============== S U B R O U T I N E =======================================

; related to gold display

sub_14B28:
                
                move.w  #$904,d0
                movea.l -$12(a6),a1
                bsr.w   sub_1018E       
                lea     aGold(pc), a0   
                movea.l -$12(a6),a1
                adda.w  #$14,a1
                moveq   #$FFFFFFEE,d1
                moveq   #$A,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                jsr     j_GetGold
                move.l  d1,d0
                movea.l -$12(a6),a1
                adda.w  #$26,a1 
                moveq   #7,d7
                jsr     WriteTilesFromNumber
                rts

    ; End of function sub_14B28

aGold:          dc.b 'GOLD',0
                dc.b 0

; =============== S U B R O U T I N E =======================================

sub_14B68:
                
                move.w  #$A05,d0
                movea.l -$C(a6),a1
                bsr.w   sub_1018E       
                bsr.w   GetSelectedItem 
                move.w  d0,d1
                move.w  d1,-(sp)
                jsr     j_FindItemName
                movea.l -$C(a6),a1
                adda.w  #$16,a1
                moveq   #$FFFFFFEC,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d1
                jsr     j_GetItemDefAddress
                clr.l   d0
                move.w  ITEMDEF_OFFSET_PRICE(a0),d0
                movea.l -$C(a6),a1
                adda.w  #$44,a1 
                moveq   #5,d7
                jsr     WriteTilesFromNumber
                rts

    ; End of function sub_14B68


; =============== S U B R O U T I N E =======================================

; copy item icon tiles into RAM based on index list at RAM:b0ae

sub_14BB0:
                
                movea.l -6(a6),a1
                lea     word_1505C(pc), a0
                move.w  #$144,d7
                jsr     (CopyBytes).w   
                bsr.w   *+4
                lea     (byte_FF6942).l,a0
                move.w  #$63F,d7
loc_14BCE:
                
                move.l  #$FFFFFFFF,(a0)+
                dbf     d7,loc_14BCE
                lea     ((INDEX_LIST-$1000000)).w,a1
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d0
                move.w  d0,d1
                add.w   d0,d0
                add.w   d1,d0
                add.w   d0,d0
                adda.w  d0,a1
                move.w  ((INDEX_LIST_ENTRIES_NUMBER-$1000000)).w,d1
                sub.w   d0,d1
                cmpi.w  #6,d1
                ble.s   loc_14BF8
                moveq   #6,d1
loc_14BF8:
                
                move.w  d1,((word_FFB134-$1000000)).w
                move.w  d1,d7
                subq.w  #1,d7
                lea     (FF6802_LOADING_SPACE).l,a0
                movea.l -6(a6),a2
                adda.w  #$3C,a2 
loc_14C0E:
                
                clr.w   d0
                move.b  (a1)+,d0
                move.w  d7,-(sp)
                bsr.w   CopyIconPixels  
                move.l  a0,-(sp)
                move.w  d0,d1
                jsr     j_GetItemDefAddress
                clr.l   d0
                move.w  ITEMDEF_OFFSET_PRICE(a0),d0
                movea.l (sp)+,a0
                bsr.w   sub_14C56       
                move.w  #$C0FC,(a2)
                addq.l  #8,a2
                move.w  (sp)+,d7
                dbf     d7,loc_14C0E
                lea     (FF6802_LOADING_SPACE).l,a0
                lea     ($B800).l,a1
                move.w  #$3C0,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                rts

    ; End of function sub_14BB0


; =============== S U B R O U T I N E =======================================

; copy shop price tag pixels to A0 in RAM

sub_14C56:
                
                movem.l a1-a2,-(sp)
                andi.l  #$FFFF,d0
                move.l  a0,-(sp)
                lea     ShopPriceTagTiles_Blank(pc), a1
                moveq   #$1F,d7
loc_14C68:
                
                move.l  (a1)+,(a0)+
                dbf     d7,loc_14C68
                movea.l (sp)+,a0
                adda.w  #$14,a0
                jsr     (WriteAsciiNumber).w
                lea     ((byte_FFDE85-$1000000)).w,a2
                moveq   #4,d7
loc_14C7E:
                
                clr.w   d0
                move.b  (a2)+,d0
                cmpi.w  #$20,d0 
                beq.s   loc_14CA2
                subi.w  #$30,d0 
                mulu.w  #$14,d0
                lea     ShopPriceTagTiles_Numbers(pc), a1
                adda.w  d0,a1
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                bra.s   loc_14CA6
loc_14CA2:
                
                adda.w  #$14,a0
loc_14CA6:
                
                dbf     d7,loc_14C7E
                addq.w  #8,a0
                movem.l (sp)+,a1-a2
                rts

    ; End of function sub_14C56


; =============== S U B R O U T I N E =======================================

; Copy item D1 icon pixels to A0 in RAM

CopyIconPixels:
                
                move.l  a1,-(sp)
                move.w  d0,-(sp)
                movea.l (p_IconTiles).l,a1
                move.w  d0,d1
                add.w   d0,d0
                add.w   d1,d0
                lsl.w   #6,d0
                adda.w  d0,a1
                moveq   #$2F,d7 
loc_14CC8:
                
                move.l  (a1)+,(a0)+
                dbf     d7,loc_14CC8
                ori.w   #$F,-2(a0)
                ori.w   #$F000,-$24(a0)
                ori.w   #$F,-$9E(a0)
                ori.w   #$F000,-$C0(a0)
                move.w  (sp)+,d0
                movea.l (sp)+,a1
                rts

    ; End of function CopyIconPixels


; =============== S U B R O U T I N E =======================================

; Get index of currently selected item in shop/caravan (from index list) -> D0

GetSelectedItem:
                
                move.w  ((CURRENT_ITEMLIST_PAGE-$1000000)).w,d0
                move.w  d0,d1
                add.w   d0,d0
                add.w   d1,d0
                add.w   d0,d0           ; index effectively multiplied by 6 (i.e. number of items per page)
                move.w  ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d1
                add.w   d1,d0
                lea     ((INDEX_LIST-$1000000)).w,a0
                move.b  (a0,d0.w),d0
                andi.w  #$FF,d0
                rts

    ; End of function GetSelectedItem


; =============== S U B R O U T I N E =======================================

sub_14D0C:
                
                bsr.w   *+4
                movea.l -6(a6),a0
                movea.l a0,a1
                adda.w  #$A2,a0 
                adda.w  #$36,a1 
                move.w  #$6C,d7 
                jsr     (CopyBytes).w   
                lea     word_151A0(pc), a0
                movea.l -6(a6),a1
                adda.w  #$A2,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                lea     word_151A0(pc), a0
                movea.l -6(a6),a1
                adda.w  #$D8,a1 
                jsr     (CopyBytes).w   
loc_14D4A:
                
                move.w  -2(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                move.w  -8(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).l
                jmp     (WaitForVInt).w

    ; End of function sub_14D0C


; =============== S U B R O U T I N E =======================================

sub_14D6A:
                
                lea     word_151A0(pc), a0
                movea.l -6(a6),a1
                adda.w  #$36,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                lea     word_151A0(pc), a0
                movea.l -6(a6),a1
                adda.w  #$6C,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                lea     -$F0(a6),a0
                movea.l -6(a6),a1
                adda.w  #$A2,a1 
                move.w  #$6C,d7 
                jsr     (CopyBytes).w   
                bsr.w   sub_14DBE
                lea     -$F0(a6),a0
                movea.l -6(a6),a1
                adda.w  #$36,a1 
                move.w  #$D8,d7 
                jsr     (CopyBytes).w   

    ; End of function sub_14D6A


; =============== S U B R O U T I N E =======================================

sub_14DBE:
                
                bra.s   loc_14D4A

    ; End of function sub_14DBE


; =============== S U B R O U T I N E =======================================

sub_14DC0:
                
                bsr.w   *+4
                movea.l -6(a6),a0
                movea.l a0,a1
                adda.w  #$36,a0 
                adda.w  #$A2,a1 
                move.w  #$6C,d7 
                jsr     (CopyBytes).w   
                lea     word_151A0(pc), a0
                movea.l -6(a6),a1
                adda.w  #$36,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                lea     word_151A0(pc), a0
                movea.l -6(a6),a1
                adda.w  #$6C,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                bra.w   loc_14D4A

    ; End of function sub_14DC0


; =============== S U B R O U T I N E =======================================

sub_14E06:
                
                lea     word_151A0(pc), a0
                movea.l -6(a6),a1
                adda.w  #$A2,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                lea     word_151A0(pc), a0
                movea.l -6(a6),a1
                adda.w  #$D8,a1 
                move.w  #$36,d7 
                jsr     (CopyBytes).w   
                lea     -$F0(a6),a0
                movea.l -6(a6),a1
                adda.w  #$6C,a0 
                adda.w  #$36,a1 
                move.w  #$6C,d7 
                jsr     (CopyBytes).w   
                bsr.w   sub_14E5E
                lea     -$F0(a6),a0
                movea.l -6(a6),a1
                adda.w  #$36,a1 
                move.w  #$D8,d7 
                jsr     (CopyBytes).w   

    ; End of function sub_14E06


; =============== S U B R O U T I N E =======================================

sub_14E5E:
                
                bra.w   loc_14D4A

    ; End of function sub_14E5E


; =============== S U B R O U T I N E =======================================

sub_14E62:
                
                movea.l -6(a6),a0
                adda.w  #$36,a0 
                lea     -$F0(a6),a1
                move.w  #$D8,d7 
                jsr     (CopyBytes).w   
                tst.b   ((word_FFAF9E-$1000000)).w
                bne.s   loc_14E82
                bsr.w   sub_14D0C
                bra.s   loc_14E86
loc_14E82:
                
                bsr.w   sub_14DC0
loc_14E86:
                
                bsr.w   sub_14BB0       
                movea.l -6(a6),a0
                adda.w  #$36,a0 
                lea     -$F0(a6),a1
                move.w  #$D8,d7 
                jsr     (CopyBytes).w   
                tst.b   ((word_FFAF9E-$1000000)).w
                bne.s   loc_14EAA
                bsr.w   sub_14D6A
                bra.s   loc_14EAE
loc_14EAA:
                
                bsr.w   sub_14E06
loc_14EAE:
                
                move.w  -2(a6),d0
                move.w  #$201,d1
                moveq   #4,d2
                jsr     (MoveWindow).l  
                bra.s   sub_14EDE

    ; End of function sub_14E62


; =============== S U B R O U T I N E =======================================

sub_14EC0:
                
                move.w  -8(a6),d0
                move.w  #$2000,d1
                jsr     (SetWindowDestination).l
                move.w  -2(a6),d0
                move.w  #$201,d1
                moveq   #4,d2
                jsr     (MoveWindow).l  

    ; End of function sub_14EC0


; =============== S U B R O U T I N E =======================================

sub_14EDE:
                
                bsr.w   sub_14B68
                move.w  -8(a6),d0
                move.w  ((CURRENT_ITEMLIST_SELECTION-$1000000)).w,d1
                ror.w   #6,d1
                ori.w   #$106,d1
                moveq   #4,d2
                jsr     (MoveWindow).l  
                moveq   #$A,d1
                rts

    ; End of function sub_14EDE

ShopPriceTagTiles_Blank:
                incbin "data/graphics/tech/shoppricetagtiles-blank.bin"
ShopPriceTagTiles_Numbers:
                incbin "data/graphics/tech/shoppricetagtiles-numbers.bin"
word_1505C:     
                ; 1st line
                dc.w VDPTILE_WINDOW_CORNER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT 
                                                        ; shop inventory window layout ?
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_CORNER|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                
                ; 2nd line
                dc.w VDPTILE_WINDOW_VERTICAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_DOLLAR_SIGN|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5C6|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5D0|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5DA|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5E4|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5EE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5F8|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_VERTICAL_BORDER|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                
                ; 3rd line
                dc.w VDPTILE_WINDOW_VERTICAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5C0|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5C1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5C7|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5CA|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5CB|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5D1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5D4|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5D5|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5DB|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5DE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5DF|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5E5|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5E8|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5E9|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5EF|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5F2|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5F3|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5F9|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_VERTICAL_BORDER|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                
                ; 4th line
                dc.w VDPTILE_WINDOW_VERTICAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5C2|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5C3|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5C8|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5CC|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5CD|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5D2|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5D6|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5D7|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5DC|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5E0|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5E1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5E6|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5EA|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5EB|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5F0|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5F4|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5F5|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5FA|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_VERTICAL_BORDER|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                
                ; 5th line
                dc.w VDPTILE_WINDOW_VERTICAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5C4|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5C5|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5C9|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5CE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5CF|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5D3|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5D8|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5D9|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5DD|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5E2|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5E3|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5E7|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5EC|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5ED|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5F1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5F6|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5F7|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w $5FB|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_VERTICAL_BORDER|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                
                ; 6th line
                dc.w VDPTILE_WINDOW_CORNER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_HORIZONTAL_BORDER|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_CORNER|VDPTILE_MIRRORED_BIT|VDPTILE_FLIPPED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
word_151A0:     dc.w VDPTILE_WINDOW_VERTICAL_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT 
                                                        ; unknown tile layout
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_WINDOW_VERTICAL_BORDER|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
ShopInventoryItemHighlightTiles:
                incbin "data/graphics/tech/shopinventoryitemhighlighttiles.bin"

; =============== S U B R O U T I N E =======================================

sub_15268:
                
                lea     (byte_FFCC86).l,a0
                move.l  #$C020C020,-$50(a0)
                moveq   #$C,d7
loc_15278:
                
                move.l  #$C020C020,(a0)+
                dbf     d7,loc_15278
                rts

    ; End of function sub_15268


; =============== S U B R O U T I N E =======================================

YesNoPrompt:
                
                clr.w   d0
                move.b  ((P1_INPUT-$1000000)).w,d0
                bra.s   loc_1528E

    ; End of function YesNoPrompt


; =============== S U B R O U T I N E =======================================

YesNoChoiceBox:
                
                clr.w   d0

    ; End of function YesNoChoiceBox


; START OF FUNCTION CHUNK FOR YesNoPrompt

loc_1528E:
                
                movem.l d1-a1,-(sp)
                link    a6,#-6
                move.w  d0,-(sp)
                move.w  #$E03,d0
                move.w  #$2011,d1
                jsr     (CreateWindow).w
                move.w  d0,-2(a6)
                move.l  a1,-6(a6)
                movea.l (p_MenuTiles_YesNo).l,a0
                lea     (FF8804_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
                clr.b   ((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bsr.w   CopyYesNoIconsToRam
                clr.w   d6
                bsr.w   sub_1542A
                bsr.w   sub_1544A
                move.w  -2(a6),d0
                move.w  #$C11,d1
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_152F0
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_152F0:
                
                move.w  ((word_FFB086-$1000000)).w,d0
                beq.s   loc_15302
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_15302:
                
                jsr     (WaitForWindowMovementEnd).w
                move.w  (sp)+,d0
                beq.w   loc_15312
loc_1530C:
                
                tst.b   ((P1_INPUT-$1000000)).w
                bne.s   loc_1530C
loc_15312:
                
                moveq   #$F,d6
loc_15314:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_15328
                clr.w   d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_15378
loc_15328:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_1533C
                moveq   #$FFFFFFFF,d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_15378
loc_1533C:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_15350
                moveq   #$FFFFFFFF,d0
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bra.w   loc_153D6
loc_15350:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_15364
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_153D6
loc_15364:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_153C0
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_153D6
loc_15378:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   sub_15422       
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bsr.w   CopyYesNoIconsToRam
                move.w  -2(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_153AC
                subq.w  #1,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
loc_153AC:
                
                move.w  ((word_FFB086-$1000000)).w,d0
                beq.s   loc_153BE
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_153BE:
                
                moveq   #$13,d6
loc_153C0:
                
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bsr.w   sub_15422       
                subq.w  #1,d6
                bne.s   loc_153CE
                moveq   #$14,d6
loc_153CE:
                
                jsr     (WaitForVInt).w
                bra.w   loc_15314
loc_153D6:
                
                move.w  -2(a6),d0
                move.w  #$F011,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
                beq.s   loc_153F6
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_153F6:
                
                move.w  ((word_FFB086-$1000000)).w,d0
                beq.s   loc_15408
                subq.w  #1,d0
                move.w  #$8080,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
loc_15408:
                
                jsr     (WaitForWindowMovementEnd).w
                move.w  -2(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                unlk    a6
                movem.l (sp)+,d1-a1
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                ext.w   d0
                rts

; END OF FUNCTION CHUNK FOR YesNoPrompt


; =============== S U B R O U T I N E =======================================

; d0 = FFAFE7, related to DMA

sub_15422:
                
                andi.w  #1,d0
                bne.w   sub_1544A

    ; End of function sub_15422


; =============== S U B R O U T I N E =======================================

sub_1542A:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                cmpi.w  #$A,d6
                blt.s   loc_1543A
                adda.w  #$120,a0
loc_1543A:
                
                lea     ($B800).l,a1
                move.w  #$90,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function sub_1542A


; =============== S U B R O U T I N E =======================================

sub_1544A:
                
                lea     (byte_FF8A44).l,a0
                cmpi.w  #$A,d6
                blt.s   loc_1545A
                adda.w  #$120,a0
loc_1545A:
                
                lea     ($B920).l,a1
                move.w  #$90,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function sub_1544A


; =============== S U B R O U T I N E =======================================

CopyYesNoIconsToRam:
                
                movea.l -6(a6),a1
                lea     byte_154A2(pc), a0
                move.w  #$54,d7 
                jsr     (CopyBytes).w   
                tst.b   ((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bne.s   loc_15486
                lea     s_Yes(pc), a0   
                bra.s   loc_1548A
loc_15486:
                
                lea     s_No(pc), a0    
loc_1548A:
                
                movea.l -6(a6),a1
                adda.w  #$30,a1 
                moveq   #$FFFFFFE4,d1
                moveq   #3,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                rts

    ; End of function CopyYesNoIconsToRam

s_Yes:          dc.b 'Yes'
s_No:           dc.b 'No '
byte_154A2:     dc.b $C5
                dc.b $C0
                dc.b $C5
                dc.b $C1
                dc.b $C5
                dc.b $C2
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $C5
                dc.b $C9
                dc.b $C5
                dc.b $CA
                dc.b $C5
                dc.b $CB
                dc.b 0
                dc.b 0
                dc.b $C0
                dc.b $60
                dc.b $C0
                dc.b $61
                dc.b $C0
                dc.b $61
                dc.b $C0
                dc.b $61
                dc.b $C8
                dc.b $60
                dc.b $C5
                dc.b $C3
                dc.b $C5
                dc.b $C4
                dc.b $C5
                dc.b $C5
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $C5
                dc.b $CC
                dc.b $C5
                dc.b $CD
                dc.b $C5
                dc.b $CE
                dc.b 0
                dc.b 0
                dc.b $C0
                dc.b $70
                dc.b $C0
                dc.b $20
                dc.b $C0
                dc.b $20
                dc.b $C0
                dc.b $20
                dc.b $C8
                dc.b $70
                dc.b $C5
                dc.b $C6
                dc.b $C5
                dc.b $C7
                dc.b $C5
                dc.b $C8
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $C5
                dc.b $CF
                dc.b $C5
                dc.b $D0
                dc.b $C5
                dc.b $D1
                dc.b 0
                dc.b 0
                dc.b $D0
                dc.b $60
                dc.b $D0
                dc.b $61
                dc.b $D0
                dc.b $61
                dc.b $D0
                dc.b $61
                dc.b $D8
                dc.b $60

; =============== S U B R O U T I N E =======================================

; Close princess Elis's eyes when unconscious

ClosePortraitEyes:
                
                clr.b   ((byte_FFB082-$1000000)).w
                jsr     (WaitForVInt).w
                move.w  d0,-(sp)
                btst    #0,d0
                bne.s   loc_1550A
                clr.w   d1
                bra.s   loc_1550C
loc_1550A:
                
                moveq   #1,d1
loc_1550C:
                
                lea     ((BLINK_DATA-$1000000)).w,a2
                move.w  ((BLINK_TILE_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
                move.w  (sp)+,d0
                btst    #1,d0
                bne.s   loc_15524
                clr.w   d1
                bra.s   loc_15526
loc_15524:
                
                moveq   #1,d1
loc_15526:
                
                lea     ((MOUTH_DATA-$1000000)).w,a2
                move.w  ((MOUTH_TILE_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
                rts

    ; End of function ClosePortraitEyes


; =============== S U B R O U T I N E =======================================

VInt_HandlePortraitBlinking:
                
                tst.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                beq.w   return_155C2
                tst.b   ((byte_FFB082-$1000000)).w
                beq.w   return_155C2
                lea     ((BLINK_COUNTER-$1000000)).w,a0
                subq.w  #1,(a0)
                cmpi.w  #3,(a0)
                bne.s   loc_1555E
                moveq   #1,d1
                lea     ((BLINK_DATA-$1000000)).w,a2
                move.w  ((BLINK_TILE_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
loc_1555E:
                
                tst.w   (a0)
                bne.s   loc_1557C
                clr.w   d1
                lea     ((BLINK_DATA-$1000000)).w,a2
                move.w  ((BLINK_TILE_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
                moveq   #$78,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$1E,d7
                move.w  d7,(a0)
loc_1557C:
                
                lea     ((word_FFB07C-$1000000)).w,a0
                tst.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
                bne.s   loc_1558E
                cmpi.w  #5,(a0)
                ble.s   loc_155A8
                bra.s   return_155C2
loc_1558E:
                
                subq.w  #1,(a0)
                cmpi.w  #5,(a0)
                bne.s   loc_155A4
                moveq   #1,d1
                lea     ((MOUTH_DATA-$1000000)).w,a2
                move.w  ((MOUTH_TILE_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
loc_155A4:
                
                tst.w   (a0)
                bne.s   return_155C2
loc_155A8:
                
                clr.w   d1
                lea     ((MOUTH_DATA-$1000000)).w,a2
                move.w  ((MOUTH_TILE_NUMBER-$1000000)).w,d7
                bsr.w   UpdatePortrait  
                moveq   #5,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$A,d7
                move.w  d7,(a0)
return_155C2:
                
                rts

    ; End of function VInt_HandlePortraitBlinking


; =============== S U B R O U T I N E =======================================

; d1 = alternate/original, d7 = tile number

UpdatePortrait:
                
                bne.s   loc_155C8
                rts
loc_155C8:
                
                move.w  d1,-(sp)
                move.w  ((PORTRAIT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$101,d1
                jsr     (GetWindowTileAddress).w
                move.w  (sp)+,d1
                subq.w  #1,d7
loc_155DC:
                
                move.w  d7,-(sp)
                clr.w   d0
                clr.w   d5
                clr.w   d6
                move.b  (a2)+,d5
                move.b  (a2)+,d6
                lsl.w   #3,d6
                add.w   d5,d6
                move.b  (a2)+,d5
                move.b  (a2)+,d0
                lsl.w   #3,d0
                add.w   d5,d0
                tst.w   d1
                bne.s   loc_155FA
                move.w  d6,d0
loc_155FA:
                
                or.w    ((word_FFB07E-$1000000)).w,d0
                tst.b   ((PORTRAIT_IS_FLIPPED-$1000000)).w
                beq.s   loc_1560E
                eori.w  #7,d6
                subq.l  #2,d6
                ori.w   #$800,d0
loc_1560E:
                
                add.w   d6,d6
                move.w  d0,(a1,d6.w)
                move.w  (sp)+,d7
                dbf     d7,loc_155DC
                move.w  ((PORTRAIT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                rts

    ; End of function UpdatePortrait


; =============== S U B R O U T I N E =======================================

; In: D0 = portrait index

LoadPortrait:
                
                movem.l d0-a3,-(sp)
                movea.l (p_pt_Portraits).l,a0
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                move.w  (a0)+,d0
                move.w  d0,((BLINK_TILE_NUMBER-$1000000)).w
                beq.s   loc_1564E
                subq.w  #1,d0
                lea     ((BLINK_DATA-$1000000)).w,a1
loc_15648:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_15648
loc_1564E:
                
                move.w  (a0)+,d0
                move.w  d0,((MOUTH_TILE_NUMBER-$1000000)).w
                beq.s   loc_15662
                subq.w  #1,d0
                lea     ((MOUTH_DATA-$1000000)).w,a1
loc_1565C:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_1565C
loc_15662:
                
                lea     (PALETTE_2_CURRENT).l,a1
                lea     (PALLETE_2_BASE).l,a2
                lea     ((PALETTE_2_BACKUP-$1000000)).w,a3
                moveq   #7,d7
loc_15674:
                
                move.l  (a0),(a1)+
                move.l  (a0),(a2)+
                move.l  (a0)+,(a3)+
                dbf     d7,loc_15674
                lea     (FF8804_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
                addq.b  #6,((INPUT_REPEAT_DELAYER-$1000000)).w ; Allow hold input to be applied directly. ... why ?
                movea.l a1,a0
                lea     ($F800).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (ApplyVIntCramDma).w
                movem.l (sp)+,d0-a3
                rts

    ; End of function LoadPortrait


; =============== S U B R O U T I N E =======================================

sub_156A8:
                
                movem.w d0,-(sp)
                bsr.s   sub_156CE
                move.l  #$F80B010B,d1
                jsr     (MoveWindowWithSfx).w
                move.w  (sp)+,d0
                rts

    ; End of function sub_156A8


; =============== S U B R O U T I N E =======================================

sub_156BC:
                
                move.w  d0,-(sp)
                bsr.s   sub_156CE
                move.l  #$10BF80B,d1
                jsr     (MoveWindowWithSfx).w
                move.w  (sp)+,d0
                rts

    ; End of function sub_156BC


; =============== S U B R O U T I N E =======================================

sub_156CE:
                
                movem.l d7-a1,-(sp)
                lea     MenuLayout_15706(pc), a0
                lea     ((WINDOW_TILE_LAYOUTS-$1000000)).w,a1
                move.w  #$30,d7 
                jsr     (CopyBytes).w   
                movem.l (sp)+,d7-a1
                jsr     j_GetCombatantName
                move.w  d1,d7
                lea     ((byte_FFB812-$1000000)).w,a1
                moveq   #$FFFFFFF0,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                lea     ((WINDOW_TILE_LAYOUTS-$1000000)).w,a0
                move.w  #$803,d0
                move.w  #4,d2
                rts

    ; End of function sub_156CE

MenuLayout_15706:
                dc.w $C080
                dc.w $C081
                dc.w $C081
                dc.w $C081
                dc.w $C081
                dc.w $C081
                dc.w $C081
                dc.w $C880
                dc.w $C090
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C890
                dc.w $D080
                dc.w $D081
                dc.w $D081
                dc.w $D081
                dc.w $D081
                dc.w $D081
                dc.w $D081
                dc.w $D880
