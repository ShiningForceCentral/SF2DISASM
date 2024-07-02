
; ASM FILE code\common\menus\itemmenu.asm :
; 0x10586..0x10940 : Battlefield item menu functions

; =============== S U B R O U T I N E =======================================

; In: A0 = special subroutine address to handle menu, default handling if not supplied
;     D0 = initial choice (00=up, 01=left, 02=right, 03=down)
;     D1 = animate-in direction (00=from bottom, other=from right)
;     D2 = menu index to use (just affects icons and text)

windowSlot = -12
animationDirection = -10
subroutineAddress = -8
menuIndex = -4

ExecuteBattlefieldItemMenu:
                
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

    ; End of function ExecuteBattlefieldItemMenu


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

