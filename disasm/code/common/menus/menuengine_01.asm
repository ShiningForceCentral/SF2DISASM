
; ASM FILE code\common\menus\menuengine_01.asm :
; 0x100C8..0x10940 : Menu engine

; =============== S U B R O U T I N E =======================================

; Write tiles from ASCII using the orange font

useOrangeFont = -2

WriteTilesFromAsciiWithOrangeFont:
                
                link    a6,#-2
                move.w  #-1,useOrangeFont(a6) ; set to use the orange font
                bra.s   WriteTilesFromAscii

    ; End of function WriteTilesFromAsciiWithOrangeFont


; =============== S U B R O U T I N E =======================================

; write tiles from number in D0 into A1 D7 letters, window width D1

WriteLvOrExpValue:
            if (STANDARD_BUILD=1)
                moveq   #2,d7   ; two digits
                move.w  d1,d0
                ext.l   d0
            endif
WriteTilesFromNumber:
                
                jsr     (WriteAsciiNumber).w
                lea     ((LOADED_NUMBER-$1000000)).w,a0
                moveq   #10,d0
                sub.w   d7,d0
                adda.w  d0,a0

    ; End of function WriteTilesFromNumber


; =============== S U B R O U T I N E =======================================

; Write tiles from ASCII from A0 into A1 D7 letters, window width D1
; 

useOrangeFont = -2

WriteTilesFromAsciiWithRegularFont:
                
                link    a6,#-2
                clr.w   useOrangeFont(a6)

    ; End of function WriteTilesFromAsciiWithRegularFont


; START OF FUNCTION CHUNK FOR WriteTilesFromAsciiWithOrangeFont

WriteTilesFromAscii:
                
                movem.l d2/a2,-(sp)
                movea.l a1,a2
                subq.w  #1,d7
loc_100F2:
                
                clr.w   d0
                move.b  (a0)+,d0
                beq.w   loc_10186
                ori.w   #VDPTILE_PALETTE3|VDPTILE_PRIORITY,d0
                cmpi.b  #TEXT_CODE_MOVEDOWN,d0
                beq.s   loc_1016A
                cmpi.b  #TEXT_CODE_TOGGLEFONTCOLOR,d0
                beq.s   loc_10174       
                cmpi.b  #TEXT_CODE_NEWLINE,d0
                beq.s   loc_1017C
                tst.b   d0
                bpl.s   loc_10118
                subi.w  #$40,d0 
loc_10118:
                
                cmpi.b  #VDPTILE_CORNER,d0
                blt.s   loc_10122       
                addi.w  #$20,d0 
loc_10122:
                
                tst.w   useOrangeFont(a6) ; test if we're using the orange font
                beq.s   loc_10156
                cmpi.b  #$30,d0 
                bcc.s   loc_10140       ; branch if number
                move.w  d1,-(sp)
                clr.w   d1
                move.b  d0,d1
                subi.b  #$20,d1 
                move.b  table_MainFontAlternateSymbols(pc,d1.w),d0
                move.w  (sp)+,d1
                bra.s   loc_10156
loc_10140:
                
                tst.b   d0
                bpl.s   loc_10152
                subi.w  #$1A,d0
                cmpi.b  #$70,d0 
                bhi.s   loc_10150
                subq.w  #1,d0
loc_10150:
                
                bra.s   loc_10156
loc_10152:
                
                addi.w  #$82,d0 
loc_10156:
                
                move.w  d0,(a1)+
                bra.s   loc_10182

; END OF FUNCTION CHUNK FOR WriteTilesFromAsciiWithOrangeFont

table_MainFontAlternateSymbols:
                dc.b VDPTILE_SPACE      ; VDP tile indexes to substitute in for symbol ASCII values when using orange font
                dc.b VDPTILE_ORANGE_EXCLAMATION_MARK
                dc.b VDPTILE_ORANGE_QUOTATION_MARK
                dc.b VDPTILE_ORANGE_NUMBER_SIGN
                dc.b VDPTILE_ORANGE_DOLLAR_SIGN
                dc.b VDPTILE_ORANGE_PERCENT_SIGN
                dc.b VDPTILE_ORANGE_AMPERSAND
                dc.b VDPTILE_ORANGE_APOSTROPHE
                dc.b VDPTILE_ORANGE_OPENING_ROUND_BRACKET
                dc.b VDPTILE_ORANGE_CLOSING_ROUND_BRACKET
                dc.b VDPTILE_ORANGE_MULTIPLICATION_SIGN
                dc.b VDPTILE_ORANGE_PLUS_SIGN
                dc.b VDPTILE_ORANGE_COMMA
                dc.b VDPTILE_ORANGE_MINUS_SIGN
                dc.b VDPTILE_ORANGE_DOT
                dc.b VDPTILE_ORANGE_SLASH

; START OF FUNCTION CHUNK FOR WriteTilesFromAsciiWithOrangeFont

loc_1016A:
            if (STANDARD_BUILD&FULL_CLASS_NAMES=1)
                tst.w   d1
                bne.s   @Continue
                move.w  #VDPTILE_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d0
                bra.s   loc_10156
@Continue:  endif
                
                lea     2(a2),a1
                suba.w  d1,a1
                movea.l a1,a2
                bra.s   loc_10182
loc_10174:
                
                eori.w  #$FFFF,useOrangeFont(a6) ; 0x5C: toggle to/from orange font
                bra.s   loc_10182
loc_1017C:
                
                movea.l a2,a1
                suba.w  d1,a1
                movea.l a1,a2
loc_10182:
                
                dbf     d7,loc_100F2
loc_10186:
                
                movem.l (sp)+,d2/a2
                unlk    a6
                rts

; END OF FUNCTION CHUNK FOR WriteTilesFromAsciiWithOrangeFont


; =============== S U B R O U T I N E =======================================

; Write window tiles onto layout a1, dimensions d0.w including borders (xxyy).


WriteWindowTiles:
                
                movem.l d4-d5/a1,-(sp)
                move.w  d0,d4
                lsr.w   #BYTE_SHIFT_COUNT,d4
                subq.l  #3,d4
                move.w  #VDPTILE_CORNER|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
loc_1019C:
                
                move.w  #VDPTILE_H_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                dbf     d4,loc_1019C
                move.w  #VDPTILE_CORNER|VDPTILE_MIRROR|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  d0,d5
                andi.w  #BYTE_MASK,d5
                subq.w  #3,d5
loc_101B0:
                
                move.w  d0,d4
                lsr.w   #BYTE_SHIFT_COUNT,d4
                subq.w  #3,d4
                move.w  #VDPTILE_V_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
loc_101BA:
                
                move.w  #VDPTILE_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                dbf     d4,loc_101BA
                move.w  #VDPTILE_V_BORDER|VDPTILE_MIRROR|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                dbf     d5,loc_101B0
                move.w  d0,d4
                lsr.w   #BYTE_SHIFT_COUNT,d4
                subq.w  #3,d4
                move.w  #VDPTILE_CORNER|VDPTILE_FLIP|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
loc_101D4:
                
                move.w  #VDPTILE_H_BORDER|VDPTILE_FLIP|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                dbf     d4,loc_101D4
                move.w  #VDPTILE_CORNER|VDPTILE_MIRROR|VDPTILE_FLIP|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                movem.l (sp)+,d4-d5/a1
                rts

    ; End of function WriteWindowTiles


; =============== S U B R O U T I N E =======================================


sub_101E6:
                
                move.b  #8,(SPRITE_07_LINK).l
                clr.b   (SPRITE_63_LINK).l
                rts

    ; End of function sub_101E6


; =============== S U B R O U T I N E =======================================

; In: a0 = special subroutine address to handle menu, default handling if not supplied (unused functionality)
;     d0.b = initial choice (0 = up, 1 = left, 2 = right, 3 = down)
;     d1.w = animate-in direction (0 = from bottom, other = from right)
;     d2.w = menu index to use (only affects icons and text)

windowSlot = -12
animationDirection = -10
subroutineAddress = -8
menuIndex = -4

ExecuteDiamondMenu:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                link    a6,#-12
                move.w  d2,menuIndex(a6)
                move.l  a0,subroutineAddress(a6)
                move.w  d1,animationDirection(a6)
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                move.w  #$1206,d0
                tst.w   d1
                bne.s   loc_1021C
                move.w  #$C1D,d1
                bra.s   loc_10220
loc_1021C:
                
                move.w  #$2015,d1
loc_10220:
                
                jsr     (CreateWindow).w
                move.w  d0,windowSlot(a6)
                bsr.w   LoadDiamondMenuWindowLayout
                move.w  menuIndex(a6),d0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                lea     pt_tiles_Menu(pc), a0
                move.l  (a0,d0.w),d0
                bclr    #31,d0
                bne.s   loc_10250
                movea.l d0,a0
                movea.l (a0),a0
                lea     (FF8804_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                bra.s   loc_1026E
loc_10250:
                
                lea     (FF8804_LOADING_SPACE).l,a1
                rol.l   #8,d0
                bsr.w   LoadMainMenuIcon
                rol.l   #8,d0
                bsr.w   LoadMainMenuIcon
                rol.l   #8,d0
                bsr.w   LoadMainMenuIcon
                rol.l   #8,d0
                bsr.w   LoadMainMenuIcon
loc_1026E:
                
                jsr     (WaitForVInt).w
                clr.w   d6
                bsr.w   dmaDiamondMenuIcon_Up
                bsr.w   dmaDiamondMenuIcon_Left
                bsr.w   dmaDiamondMenuIcon_Right
                bsr.w   dmaDiamondMenuIcon_Down
                move.w  windowSlot(a6),d0
                move.w  #$C15,d1
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.l  subroutineAddress(a6),d0
                beq.s   loc_102A2
                movea.l d0,a0
                jsr     (a0)
loc_102A2:
                
                moveq   #$1E,d6
loc_102A4:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_102B6
                moveq   #1,d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_10328
loc_102B6:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_102C8
                moveq   #2,d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_10328
loc_102C8:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_102DA
                clr.w   d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_10328
loc_102DA:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_102EC
                moveq   #3,d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_10328
loc_102EC:
                
                ; no dpad button was pressed
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10300
                moveq   #-1,d1          ; B pressed, so cancel menu
                moveq   #-1,d0
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bra.w   loc_10382
loc_10300:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10314
                clr.w   d1              ; C pressed, so confirm menu
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   loc_10382
loc_10314:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10358
                clr.w   d1              ; A pressed, so confirm menu
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   loc_10382
loc_10328:
                
                ; dpad button was pressed
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   DmaDiamondMenuIcons
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bsr.w   LoadDiamondMenuWindowLayout
                move.w  windowSlot(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                move.l  subroutineAddress(a6),d0
                beq.s   loc_10356
                movea.l d0,a0
                jsr     (a0)
loc_10356:
                
                moveq   #29,d6
loc_10358:
                
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bsr.w   DmaDiamondMenuIcons
                subq.w  #1,d6
                bne.s   loc_10366
                moveq   #30,d6
loc_10366:
                
                movem.l d6-d7,-(sp)
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                move.b  d7,((RANDOM_WAITING_FOR_INPUT-$1000000)).w
                movem.l (sp)+,d6-d7
                jsr     (WaitForVInt).w
                bra.w   loc_102A4
loc_10382:
                
                movem.w d0-d1,-(sp)
                move.w  windowSlot(a6),d0
                tst.w   d1
                beq.s   loc_10394
                move.w  #$C1D,d1
                bra.s   loc_10398
loc_10394:
                
                move.w  #$2015,d1
loc_10398:
                
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  windowSlot(a6),d0
                jsr     (DeleteWindow).w
                movem.w (sp)+,d0-d1
                unlk    a6
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function ExecuteDiamondMenu


; =============== S U B R O U T I N E =======================================

; In: -12(a6) = window slot index

windowSlot = -12
animationDirection = -10
subroutineAddress = -8
menuIndex = -4

LoadDiamondMenuWindowLayout:
                
                lea     layout_DiamondMenu(pc), a0
                move.w  windowSlot(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #216,d7
                jsr     (CopyBytes).w   
                move.w  menuIndex(a6),d0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                lea     pt_MenuOptionNames(pc), a0
                movea.l (a0,d0.w),a0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                andi.w  #3,d0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                movea.l (a0,d0.w),a0
                move.w  windowSlot(a6),d0
                move.w  #$B04,d1
                jsr     (GetWindowTileAddress).w
                moveq   #-36,d1
                moveq   #12,d7
                bra.w   WriteTilesFromAsciiWithRegularFont

    ; End of function LoadDiamondMenuWindowLayout


; =============== S U B R O U T I N E =======================================

; In: d6.w = frame counter


DmaDiamondMenuIcons:
                
                add.w   d0,d0
                move.w  rjt_DmaDiamondMenuIconFunctions(pc,d0.w),d0
                jmp     rjt_DmaDiamondMenuIconFunctions(pc,d0.w)

    ; End of function DmaDiamondMenuIcons

rjt_DmaDiamondMenuIconFunctions:
                dc.w dmaDiamondMenuIcon_Up-rjt_DmaDiamondMenuIconFunctions
                dc.w dmaDiamondMenuIcon_Left-rjt_DmaDiamondMenuIconFunctions
                dc.w dmaDiamondMenuIcon_Right-rjt_DmaDiamondMenuIconFunctions
                dc.w dmaDiamondMenuIcon_Down-rjt_DmaDiamondMenuIconFunctions

; =============== S U B R O U T I N E =======================================

; In: d6.w = frame counter


dmaDiamondMenuIcon_Up:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                cmpi.w  #15,d6
                blt.s   loc_10420
                adda.w  #$120,a0
loc_10420:
                
                lea     ($B800).l,a1
                move.w  #$90,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function dmaDiamondMenuIcon_Up


; =============== S U B R O U T I N E =======================================

; In: d6.w = frame counter


dmaDiamondMenuIcon_Left:
                
                lea     (FF8A44_LOADING_SPACE).l,a0
                cmpi.w  #15,d6
                blt.s   loc_10440
                adda.w  #$120,a0
loc_10440:
                
                lea     (FF9104_LOADING_SPACE).l,a1
                bsr.w   sub_10484
                lea     ($B920).l,a1
                move.w  #$C0,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function dmaDiamondMenuIcon_Left


; =============== S U B R O U T I N E =======================================

; In: d6.w = frame counter


dmaDiamondMenuIcon_Right:
                
                lea     (FF8C84_LOADING_SPACE).l,a0
                cmpi.w  #15,d6
                blt.s   loc_1046A
                adda.w  #$120,a0
loc_1046A:
                
                lea     (FF9284_LOADING_SPACE).l,a1
                bsr.w   sub_104E6
                lea     ($BAA0).l,a1
                move.w  #$C0,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function dmaDiamondMenuIcon_Right


; =============== S U B R O U T I N E =======================================


sub_10484:
                
                move.l  a1,-(sp)
                moveq   #3,d7
                move.l  a0,-(sp)
                lea     tiles_DiamondMenuBorder1(pc), a0
loc_1048E:
                
                move.l  $20(a0),$40(a1)
                move.l  $10(a0),$20(a1)
                move.l  (a0)+,(a1)+
                dbf     d7,loc_1048E
                movea.l (sp)+,a0
                moveq   #8,d7
loc_104A4:
                
                move.l  (a0)+,(a1)
                move.l  (a0)+,4(a1)
                move.l  (a0)+,8(a1)
                move.l  (a0)+,$C(a1)
                move.l  (a0)+,$50(a1)
                move.l  (a0)+,$54(a1)
                move.l  (a0)+,$58(a1)
                move.l  (a0)+,$5C(a1)
                adda.w  #$20,a1 
                dbf     d7,loc_104A4
                moveq   #3,d7
                lea     tiles_DiamondMenuBorder2(pc), a0
loc_104D0:
                
                move.l  $20(a0),$40(a1)
                move.l  $10(a0),$20(a1)
                move.l  (a0)+,(a1)+
                dbf     d7,loc_104D0
                movea.l (sp)+,a0
                rts

    ; End of function sub_10484


; =============== S U B R O U T I N E =======================================


sub_104E6:
                
                move.l  a1,-(sp)
                moveq   #3,d7
                move.l  a0,-(sp)
                lea     tiles_DiamondMenuBorder3(pc), a0
loc_104F0:
                
                move.l  $20(a0),$40(a1)
                move.l  $10(a0),$20(a1)
                move.l  (a0)+,(a1)+
                dbf     d7,loc_104F0
                movea.l (sp)+,a0
                moveq   #8,d7
loc_10506:
                
                move.l  (a0)+,(a1)
                move.l  (a0)+,4(a1)
                move.l  (a0)+,8(a1)
                move.l  (a0)+,$C(a1)
                move.l  (a0)+,$50(a1)
                move.l  (a0)+,$54(a1)
                move.l  (a0)+,$58(a1)
                move.l  (a0)+,$5C(a1)
                adda.w  #$20,a1 
                dbf     d7,loc_10506
                moveq   #3,d7
                lea     tiles_DiamondMenuBorder4(pc), a0
loc_10532:
                
                move.l  $20(a0),$40(a1)
                move.l  $10(a0),$20(a1)
                move.l  (a0)+,(a1)+
                dbf     d7,loc_10532
                movea.l (sp)+,a0
                rts

    ; End of function sub_104E6


; =============== S U B R O U T I N E =======================================

; In: d6.w = frame counter


dmaDiamondMenuIcon_Down:
                
                lea     (FF8EC4_LOADING_SPACE).l,a0
                cmpi.w  #15,d6
                blt.s   loc_10558
                adda.w  #$120,a0
loc_10558:
                
                lea     ($BC20).l,a1
                move.w  #$90,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function dmaDiamondMenuIcon_Down


; =============== S U B R O U T I N E =======================================

; In: d0.b = menu icon index


LoadMainMenuIcon:
                
                move.l  d0,-(sp)
                ext.w   d0
                getPointer p_tiles_MainMenu, a0
                mulu.w  #GFX_DIAMOND_MENU_ICON_PIXELS_NUMBER,d0
                adda.w  d0,a0
                move.w  #143,d0
@Loop:
                
                move.l  (a0)+,(a1)+
                dbf     d0,@Loop
                
                move.l  (sp)+,d0
                rts

    ; End of function LoadMainMenuIcon


; =============== S U B R O U T I N E =======================================

; In: A0 = special subroutine address to handle menu, default handling if not supplied
;     D0 = initial choice (00=up, 01=left, 02=right, 03=down)
;     D1 = animate-in direction (00=from bottom, other=from right)
;     D2 = menu index to use (just affects icons and text)

windowSlot = -12
animationDirection = -10
subroutineAddress = -8
menuIndex = -4

ExecuteItemMenu:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                move.w  d6,-(sp)
                link    a6,#-12
                move.w  d2,menuIndex(a6)
                move.l  a0,subroutineAddress(a6)
                move.w  d1,animationDirection(a6)
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                move.w  #$1206,d0
                tst.w   d1
                bne.s   loc_105AE
                move.w  #$C1D,d1
                bra.s   loc_105B2
loc_105AE:
                
                move.w  #$2015,d1
loc_105B2:
                
                jsr     (CreateWindow).w
                move.w  d0,windowSlot(a6)
                bsr.w   BuildItemMenu
                lea     (FF8804_LOADING_SPACE).l,a1
                move.w  ((DISPLAYED_ICON_1-$1000000)).w,d0
                bsr.w   LoadHighlightableItemIcon
                move.w  ((DISPLAYED_ICON_2-$1000000)).w,d0
                bsr.w   LoadHighlightableItemIcon
                move.w  ((DISPLAYED_ICON_3-$1000000)).w,d0
                bsr.w   LoadHighlightableItemIcon
                move.w  ((DISPLAYED_ICON_4-$1000000)).w,d0
                bsr.w   LoadHighlightableItemIcon
                clr.w   d6
                bsr.w   dmaSelectedIcon_Up
                bsr.w   dmaSelectedIcon_Left
                bsr.w   dmaSelectedIcon_Right
                bsr.w   dmaSelectedIcon_Down
                move.w  windowSlot(a6),d0
                move.w  #$C15,d1
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.l  subroutineAddress(a6),d0
                beq.s   loc_10614
                movea.l d0,a0
                jsr     (a0)
loc_10614:
                
                moveq   #$1E,d6
loc_10616:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10630
                moveq   #1,d1
            if (STANDARD_BUILD&TRADEABLE_ITEMS=1)
                checkSavedByte #NOT_CURRENTLY_IN_BATTLE, CURRENT_BATTLE
                bne.s    @SkipItemCheck1
            endif
                cmpi.w  #ICON_NOTHING,((DISPLAYED_ICON_2-$1000000)).w
                beq.s   loc_10630
@SkipItemCheck1:
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_106B4
loc_10630:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1064A
                moveq   #2,d1
            if (STANDARD_BUILD&TRADEABLE_ITEMS=1)
                checkSavedByte #NOT_CURRENTLY_IN_BATTLE, CURRENT_BATTLE
                bne.s    @SkipItemCheck2
            endif
                cmpi.w  #ICON_NOTHING,((DISPLAYED_ICON_3-$1000000)).w
                beq.s   loc_1064A
@SkipItemCheck2:
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_106B4
loc_1064A:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1065C
                clr.w   d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_106B4
loc_1065C:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10676
                moveq   #3,d1
            if (STANDARD_BUILD&TRADEABLE_ITEMS=1)
                checkSavedByte #NOT_CURRENTLY_IN_BATTLE, CURRENT_BATTLE
                bne.s    @SkipItemCheck3
            endif
                cmpi.w  #ICON_NOTHING,((DISPLAYED_ICON_4-$1000000)).w
                beq.s   loc_10676
@SkipItemCheck3:
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_106B4
loc_10676:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1068C
                moveq   #-1,d6
                moveq   #-1,d0
                move.b  #-1,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bra.w   loc_10710
loc_1068C:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_106A0
                clr.w   d6
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   loc_106FE
loc_106A0:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_106E8
                clr.w   d6
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   loc_106FE
loc_106B4:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   DmaSelectedIcon 
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bsr.w   BuildItemMenu
                move.l  subroutineAddress(a6),d0
                beq.s   loc_106D6
                movea.l d0,a0
                jsr     (a0)
loc_106D6:
                
                move.w  windowSlot(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                move.l  subroutineAddress(a6),d0
                moveq   #29,d6
loc_106E8:
                
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bsr.w   DmaSelectedIcon 
                subq.w  #1,d6
                bne.s   loc_106F6
                moveq   #30,d6
loc_106F6:
                
                jsr     (WaitForVInt).w
                bra.w   loc_10616
loc_106FE:
                
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                move.w  d0,d1
                add.w   d0,d0
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.w  (a0,d0.w),d0
loc_10710:
                
                movem.w d0-d1,-(sp)
                move.w  windowSlot(a6),d0
                tst.w   d6
                beq.s   loc_10722
                move.w  #$C1D,d1
                bra.s   loc_10726
loc_10722:
                
                move.w  #$2015,d1
loc_10726:
                
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  windowSlot(a6),d0
                jsr     (DeleteWindow).w
                movem.w (sp)+,d0-d1
                unlk    a6
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                move.w  (sp)+,d6
                rts

    ; End of function ExecuteItemMenu


; =============== S U B R O U T I N E =======================================

windowSlot = -12
animationDirection = -10
subroutineAddress = -8
menuIndex = -4

BuildItemMenu:
                
                lea     layout_ItemMenu(pc), a0
                move.w  windowSlot(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #MENU_ITEM_LAYOUT_BYTESIZE,d7
                jsr     (CopyBytes).w   
                lsl.w   #1,d0
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                andi.w  #3,d0
                lsl.w   #1,d0
                move.w  (a0,d0.w),d1
                cmpi.w  #ICON_UNARMED,d1
                bne.s   @WriteItemName
                move.w  #ITEM_NOTHING,((TEMP_ITEM_OR_SPELL-$1000000)).w
                move.w  windowSlot(a6),d0
                move.w  #MENU_ITEM_NOTHING_STRING_COORDS,d1
                jsr     (GetWindowTileAddress).w
                lea     aNothing(pc), a0
                moveq   #-36,d1
                moveq   #10,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                bra.s   @Return
@WriteItemName:
                
                move.w  d1,((TEMP_ITEM_OR_SPELL-$1000000)).w
                move.w  d1,-(sp)
                jsr     j_FindItemName
                move.w  windowSlot(a6),d0
                move.w  #MENU_ITEM_NAME_COORDS,d1
                jsr     (GetWindowTileAddress).w
                moveq   #-36,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d1
            if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   @Return
            else
                tst.b   d1
                bpl.s   @Return
            endif
                lea     aEquipped(pc), a0
                move.w  windowSlot(a6),d0
                move.w  #MENU_ITEM_EQUIPPED_STRING_COORDS,d1
                jsr     (GetWindowTileAddress).w
                moveq   #-36,d1
                moveq   #10,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
@Return:
                
                rts

    ; End of function BuildItemMenu

aEquipped:      dc.b '\Equipped',0
aNothing:       dc.b '\Nothing',0
                
                align

; =============== S U B R O U T I N E =======================================

; In: d6.w = frame counter


DmaSelectedIcon:
                
                andi.w  #3,d0
                add.w   d0,d0
                move.w  rjt_DmaSelectedIconFunctions(pc,d0.w),d0
                jmp     rjt_DmaSelectedIconFunctions(pc,d0.w)

    ; End of function DmaSelectedIcon

rjt_DmaSelectedIconFunctions:
                dc.w dmaSelectedIcon_Up-rjt_DmaSelectedIconFunctions
                dc.w dmaSelectedIcon_Left-rjt_DmaSelectedIconFunctions
                dc.w dmaSelectedIcon_Right-rjt_DmaSelectedIconFunctions
                dc.w dmaSelectedIcon_Down-rjt_DmaSelectedIconFunctions

; =============== S U B R O U T I N E =======================================

; In: d6.w = frame counter


dmaSelectedIcon_Up:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                cmpi.w  #15,d6
                blt.s   @Continue
                adda.w  #ICON_TILE_BYTESIZE,a0
@Continue:
                
                lea     ($B800).l,a1
                move.w  #96,d0
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function dmaSelectedIcon_Up


; =============== S U B R O U T I N E =======================================

; In: d6.w = frame counter


dmaSelectedIcon_Left:
                
                lea     (FF8984_LOADING_SPACE).l,a0
                cmpi.w  #15,d6
                blt.s   @Continue
                adda.w  #ICON_TILE_BYTESIZE,a0
@Continue:
                
                lea     (FF8E04_LOADING_SPACE).l,a1
                bsr.w   sub_10874
                lea     ($B8C0).l,a1
                move.w  #$80,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function dmaSelectedIcon_Left


; =============== S U B R O U T I N E =======================================

; In: d6.w = frame counter


dmaSelectedIcon_Right:
                
                lea     (FF8B04_LOADING_SPACE).l,a0
                cmpi.w  #15,d6
                blt.s   @Continue
                adda.w  #ICON_TILE_BYTESIZE,a0
@Continue:
                
                lea     (FF8F04_LOADING_SPACE).l,a1
                bsr.w   sub_108CA
                lea     ($BA80).l,a1
                move.w  #$80,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function dmaSelectedIcon_Right


; =============== S U B R O U T I N E =======================================


sub_10874:
                
                move.l  a1,-(sp)
                move.l  a0,-(sp)
                lea     tiles_DiamondMenuBorder1(pc), a0
                moveq   #3,d7
loc_1087E:
                
                move.l  $20(a0),$20(a1)
                move.l  (a0)+,(a1)+
                dbf     d7,loc_1087E
                movea.l (sp)+,a0
                moveq   #5,d7
loc_1088E:
                
                move.l  (a0)+,(a1)
                move.l  (a0)+,4(a1)
                move.l  (a0)+,8(a1)
                move.l  (a0)+,$C(a1)
                move.l  (a0)+,$30(a1)
                move.l  (a0)+,$34(a1)
                move.l  (a0)+,$38(a1)
                move.l  (a0)+,$3C(a1)
                adda.w  #$20,a1 
                dbf     d7,loc_1088E
                lea     tiles_DiamondMenuBorder2(pc), a0
                moveq   #3,d7
loc_108BA:
                
                move.l  $20(a0),$20(a1)
                move.l  (a0)+,(a1)+
                dbf     d7,loc_108BA
                movea.l (sp)+,a0
                rts

    ; End of function sub_10874


; =============== S U B R O U T I N E =======================================


sub_108CA:
                
                move.l  a1,-(sp)
                move.l  a0,-(sp)
                lea     tiles_DiamondMenuBorder3(pc), a0
                moveq   #3,d7
loc_108D4:
                
                move.l  $20(a0),$20(a1)
                move.l  (a0)+,(a1)+
                dbf     d7,loc_108D4
                movea.l (sp)+,a0
                moveq   #5,d7
loc_108E4:
                
                move.l  (a0)+,(a1)
                move.l  (a0)+,4(a1)
                move.l  (a0)+,8(a1)
                move.l  (a0)+,$C(a1)
                move.l  (a0)+,$30(a1)
                move.l  (a0)+,$34(a1)
                move.l  (a0)+,$38(a1)
                move.l  (a0)+,$3C(a1)
                adda.w  #$20,a1 
                dbf     d7,loc_108E4
                lea     tiles_DiamondMenuBorder4(pc), a0
                moveq   #3,d7
loc_10910:
                
                move.l  $20(a0),$20(a1)
                move.l  (a0)+,(a1)+
                dbf     d7,loc_10910
                movea.l (sp)+,a0
                rts

    ; End of function sub_108CA


; =============== S U B R O U T I N E =======================================

; In: d6.w = frame counter


dmaSelectedIcon_Down:
                
                lea     (FF8C84_LOADING_SPACE).l,a0
                cmpi.w  #15,d6
                blt.s   @Continue
                adda.w  #ICON_TILE_BYTESIZE,a0
@Continue:
                
                lea     ($B9C0).l,a1
                move.w  #96,d0
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function dmaSelectedIcon_Down

