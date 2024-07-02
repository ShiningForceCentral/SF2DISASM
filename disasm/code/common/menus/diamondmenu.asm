
; ASM FILE code\common\menus\diamondmenu.asm :
; 0x101F6..0x10586 : Diamond menu actions

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
                
                module
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                link    a6,#-12
                move.w  d2,menuIndex(a6)
                move.l  a0,subroutineAddress(a6)
                move.w  d1,animationDirection(a6)
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                move.w  #$1206,d0
                tst.w   d1
                bne.s   @loc_1
                
                move.w  #$C1D,d1
                bra.s   @loc_2
@loc_1:
                
                move.w  #$2015,d1
@loc_2:
                
                jsr     (CreateWindow).w
                move.w  d0,windowSlot(a6)
                bsr.w   LoadDiamondMenuWindowLayout
                move.w  menuIndex(a6),d0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                lea     pt_tiles_Menu(pc), a0
                move.l  (a0,d0.w),d0
                bclr    #31,d0
                bne.s   @loc_3
                movea.l d0,a0
                movea.l (a0),a0
                lea     (FF8804_LOADING_SPACE).l,a1
                jsr     (LoadStackCompressedData).w
                bra.s   @loc_4
@loc_3:
                
                lea     (FF8804_LOADING_SPACE).l,a1
                rol.l   #8,d0
                bsr.w   LoadMainMenuIcon
                rol.l   #8,d0
                bsr.w   LoadMainMenuIcon
                rol.l   #8,d0
                bsr.w   LoadMainMenuIcon
                rol.l   #8,d0
                bsr.w   LoadMainMenuIcon
@loc_4:
                
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
                beq.s   @loc_5
                movea.l d0,a0
                jsr     (a0)
@loc_5:
                
                moveq   #$1E,d6
@loc_6:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loc_7
                moveq   #1,d1
                sndCom  SFX_MENU_SELECTION
                bra.w   @loc_13
@loc_7:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loc_8
                moveq   #2,d1
                sndCom  SFX_MENU_SELECTION
                bra.w   @loc_13
@loc_8:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loc_9
                clr.w   d1
                sndCom  SFX_MENU_SELECTION
                bra.w   @loc_13
@loc_9:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loc_10
                moveq   #3,d1
                sndCom  SFX_MENU_SELECTION
                bra.w   @loc_13
@loc_10:
                
                ; no dpad button was pressed
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loc_11
                moveq   #-1,d1          ; B pressed, so cancel menu
                moveq   #-1,d0
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bra.w   @loc_17
@loc_11:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loc_12
                clr.w   d1              ; C pressed, so confirm menu
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   @loc_17
@loc_12:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loc_15
                clr.w   d1              ; A pressed, so confirm menu
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   @loc_17
@loc_13:
                
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
                beq.s   @loc_14
                movea.l d0,a0
                jsr     (a0)
@loc_14:
                
                moveq   #29,d6
@loc_15:
                
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bsr.w   DmaDiamondMenuIcons
                subq.w  #1,d6
                bne.s   @loc_16
                moveq   #30,d6
@loc_16:
                
                movem.l d6-d7,-(sp)
                move.w  #$100,d6
                jsr     (GenerateRandomNumber).w
                move.b  d7,((RANDOM_WAITING_FOR_INPUT-$1000000)).w
                movem.l (sp)+,d6-d7
                jsr     (WaitForVInt).w
                bra.w   @loc_6
@loc_17:
                
                movem.w d0-d1,-(sp)
                move.w  windowSlot(a6),d0
                tst.w   d1
                beq.s   @loc_18
                move.w  #$C1D,d1
                bra.s   @loc_19
@loc_18:
                
                move.w  #$2015,d1
@loc_19:
                
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

                modend

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

