
; ASM FILE code\common\menus\menuengine_01.asm :
; 0x10000..0x114BE : Menu engine

; =============== S U B R O U T I N E =======================================

j_ExecuteMenu:
                
                jmp     ExecuteMenu(pc) 

    ; End of function j_ExecuteMenu


; =============== S U B R O U T I N E =======================================

sub_10004:
                
                jmp     sub_10586(pc)

    ; End of function sub_10004


; =============== S U B R O U T I N E =======================================

sub_10008:
                
                jmp     sub_10586(pc)

    ; End of function sub_10008


; =============== S U B R O U T I N E =======================================

sub_1000C:
                
                jmp     sub_10586(pc)

    ; End of function sub_1000C


; =============== S U B R O U T I N E =======================================

sub_10010:
                
                jmp     sub_10A4A(pc)

    ; End of function sub_10010


; =============== S U B R O U T I N E =======================================

j_CreateFighterMiniStatusWindow:
                
                jmp     CreateFighterMiniStatusWindow(pc)

    ; End of function j_CreateFighterMiniStatusWindow


; =============== S U B R O U T I N E =======================================

j_HideFighterMiniStatusWindow:
                
                jmp     HideFighterMiniStatusWindow(pc)

    ; End of function j_HideFighterMiniStatusWindow


; =============== S U B R O U T I N E =======================================

sub_1001C:
                
                jmp     sub_1161A(pc)

    ; End of function sub_1001C


; =============== S U B R O U T I N E =======================================

sub_10020:
                
                jmp     sub_11638(pc)

    ; End of function sub_10020


; =============== S U B R O U T I N E =======================================

sub_10024:
                
                jmp     sub_116B8(pc)

    ; End of function sub_10024


; =============== S U B R O U T I N E =======================================

j_RemoveAllyBattlesceneWindow:
                
                jmp     RemoveAllyBattlesceneWindow(pc)

    ; End of function j_RemoveAllyBattlesceneWindow


; =============== S U B R O U T I N E =======================================

j_RemoveEnemyBattlesceneWindow:
                
                jmp     RemoveEnemyBattlesceneWindow(pc)

    ; End of function j_RemoveEnemyBattlesceneWindow


; =============== S U B R O U T I N E =======================================

j_BuildMemberStatsScreen:
                
                jmp     BuildMemberStatsScreen(pc)

    ; End of function j_BuildMemberStatsScreen


; =============== S U B R O U T I N E =======================================

sub_10034:
                
                jmp     sub_1288E(pc)

    ; End of function sub_10034


; =============== S U B R O U T I N E =======================================

j_InitPortraitWindow:
                
                jmp     InitPortraitWindow(pc)

    ; End of function j_InitPortraitWindow


; =============== S U B R O U T I N E =======================================

j_HidePortraitWindow:
                
                jmp     HidePortraitWindow(pc)

    ; End of function j_HidePortraitWindow


; =============== S U B R O U T I N E =======================================

sub_10040:
                
                jmp     sub_12FE6(pc)

    ; End of function sub_10040


; =============== S U B R O U T I N E =======================================

sub_10044:
                
                jmp     loc_13004(pc)

    ; End of function sub_10044


; =============== S U B R O U T I N E =======================================

sub_10048:
                
                jmp     loc_13030(pc)

    ; End of function sub_10048


; =============== S U B R O U T I N E =======================================

sub_1004C:
                
                jmp     sub_147FA(pc)

    ; End of function sub_1004C


; =============== S U B R O U T I N E =======================================

sub_10050:
                
                jmp     sub_12F12(pc)

    ; End of function sub_10050


; =============== S U B R O U T I N E =======================================

sub_10054:
                
                jmp     sub_12F5E(pc)

    ; End of function sub_10054


; =============== S U B R O U T I N E =======================================

sub_10058:
                
                jmp     sub_12F9A(pc)

    ; End of function sub_10058


; =============== S U B R O U T I N E =======================================

sub_1005C:
                
                jmp     sub_113C6(pc)

    ; End of function sub_1005C


; =============== S U B R O U T I N E =======================================

sub_10060:
                
                jmp     sub_11404(pc)

    ; End of function sub_10060


; =============== S U B R O U T I N E =======================================

sub_10064:
                
                jmp     sub_1141E(pc)

    ; End of function sub_10064


; =============== S U B R O U T I N E =======================================

j_CreateLandEffectWindow:
                
                jmp     CreateLandEffectWindow(pc)

    ; End of function j_CreateLandEffectWindow


; =============== S U B R O U T I N E =======================================

j_HideLandEffectWindow:
                
                jmp     HideLandEffectWindow(pc)

    ; End of function j_HideLandEffectWindow


; =============== S U B R O U T I N E =======================================

sub_10070:
                
                jmp     sub_157E8(pc)

    ; End of function sub_10070


; =============== S U B R O U T I N E =======================================

j_YesNoChoiceBox:
                
                jmp     YesNoChoiceBox(pc)

    ; End of function j_YesNoChoiceBox


; =============== S U B R O U T I N E =======================================

j_YesNoPrompt:
                
                jmp     YesNoPrompt(pc)

    ; End of function j_YesNoPrompt


; =============== S U B R O U T I N E =======================================

j_NameCharacter:
                
                jmp     NameCharacter(pc)

    ; End of function j_NameCharacter


; =============== S U B R O U T I N E =======================================

sub_10080:
                
                jmp     sub_1586E(pc)   

    ; End of function sub_10080

p_tbl_ItemNames:dc.l tbl_ItemNames
p_tbl_ClassNames:
                dc.l tbl_ClassNames
p_tbl_ItemDefs: dc.l tbl_ItemDefs       
p_tbl_SpellDefs:dc.l tbl_SpellDefs      

; =============== S U B R O U T I N E =======================================

j_NumberPrompt:
                
                jmp     NumberPrompt(pc)

    ; End of function j_NumberPrompt


; =============== S U B R O U T I N E =======================================

j_DebugFlagSetter:
                
                jmp     DebugFlagSetter(pc)

    ; End of function j_DebugFlagSetter


; =============== S U B R O U T I N E =======================================

j_SpecialBattle:
                
                jmp     DisplayTimerWindow(pc)

    ; End of function j_SpecialBattle


; =============== S U B R O U T I N E =======================================

j_DisplayTimerWindow:
                
                jmp     RemoveTimerWindow(pc)

    ; End of function j_DisplayTimerWindow


; =============== S U B R O U T I N E =======================================

j_VInt_UpdateTimerWindow:
                
                jmp     VInt_UpdateTimerWindow(pc)

    ; End of function j_VInt_UpdateTimerWindow


; =============== S U B R O U T I N E =======================================

j_WitchMainMenu:
                
                jmp     WitchMainMenu(pc)

    ; End of function j_WitchMainMenu


; =============== S U B R O U T I N E =======================================

sub_100AC:
                
                jmp     sub_169AE(pc)

    ; End of function sub_100AC


; =============== S U B R O U T I N E =======================================

sub_100B0:
                
                jmp     sub_16A30(pc)

    ; End of function sub_100B0


; =============== S U B R O U T I N E =======================================

; related to end kiss

j_EndKiss:
                
                jmp     PlayEndKiss(pc)

    ; End of function j_EndKiss


; =============== S U B R O U T I N E =======================================

j_ClosePortraitEyes:
                
                jmp     ClosePortraitEyes(pc)

    ; End of function j_ClosePortraitEyes


; =============== S U B R O U T I N E =======================================

j_LoadPortrait:
                
                jmp     LoadPortrait(pc)

    ; End of function j_LoadPortrait


; =============== S U B R O U T I N E =======================================

j_GetAllyPortrait:
                
                jmp     GetAllyPortrait(pc)

    ; End of function j_GetAllyPortrait

p_MemberStatsWindowLayout:
                dc.l MemberStatsWindowLayout

; =============== S U B R O U T I N E =======================================

; Write tiles from ASCII using the orange font

WriteTilesFromAsciiWithOrangeFont:
                
                link    a6,#-2
                move.w  #$FFFF,-2(a6)   ; set to use the orange font
                bra.s   WriteTilesFromAscii

    ; End of function WriteTilesFromAsciiWithOrangeFont


; =============== S U B R O U T I N E =======================================

; write tiles from number in D0 into A1 D7 letters, window width D1

WriteTilesFromNumber:
                
                jsr     (WriteAsciiNumber).w
                lea     ((LOADED_NUMBER-$1000000)).w,a0
                moveq   #$A,d0
                sub.w   d7,d0
                adda.w  d0,a0

    ; End of function WriteTilesFromNumber


; =============== S U B R O U T I N E =======================================

; Write tiles from ASCII from A0 into A1 D7 letters, window width D1
; 

WriteTilesFromAsciiWithRegularFont:
                
                link    a6,#-2
                clr.w   -2(a6)

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
                ori.w   #VDPTILE_PLT3|VDPTILE_PRIORITY,d0
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
                
                cmpi.b  #$60,d0 
                blt.s   loc_10122       
                addi.w  #$20,d0 
loc_10122:
                
                tst.w   -2(a6)          ; test if we're using the orange font
                beq.s   loc_10156
                cmpi.b  #$30,d0 
                bcc.s   loc_10140       ; branch if number
                move.w  d1,-(sp)
                clr.w   d1
                move.b  d0,d1
                subi.b  #$20,d1 
                move.b  tbl_MainFontAlternateSymbols(pc,d1.w),d0
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

tbl_MainFontAlternateSymbols:
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
                
                lea     2(a2),a1
                suba.w  d1,a1
                movea.l a1,a2
                bra.s   loc_10182
loc_10174:
                
                eori.w  #$FFFF,-2(a6)   ; 0x5C: toggle to/from orange font
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

; draw box tiles into A1, dimensions in D0, including borders (xxyy)

sub_1018E:
                
                movem.l d4-d5/a1,-(sp)
                move.w  d0,d4
                lsr.w   #8,d4
                subq.l  #3,d4
                move.w  #$C060,(a1)+
loc_1019C:
                
                move.w  #$C061,(a1)+
                dbf     d4,loc_1019C
                move.w  #$C860,(a1)+
                move.w  d0,d5
                andi.w  #$FF,d5
                subq.w  #3,d5
loc_101B0:
                
                move.w  d0,d4
                lsr.w   #8,d4
                subq.w  #3,d4
                move.w  #$C070,(a1)+
loc_101BA:
                
                move.w  #$C020,(a1)+
                dbf     d4,loc_101BA
                move.w  #$C870,(a1)+
                dbf     d5,loc_101B0
                move.w  d0,d4
                lsr.w   #8,d4
                subq.w  #3,d4
                move.w  #$D060,(a1)+
loc_101D4:
                
                move.w  #$D061,(a1)+
                dbf     d4,loc_101D4
                move.w  #$D860,(a1)+
                movem.l (sp)+,d4-d5/a1
                rts

    ; End of function sub_1018E


; =============== S U B R O U T I N E =======================================

sub_101E6:
                
                move.b  #8,(SPRITE_07_LINK).l
                clr.b   (SPRITE_63_LINK).l
                rts

    ; End of function sub_101E6


; =============== S U B R O U T I N E =======================================

; related to menus
; 
; In: A0 = special subroutine address to handle menu, default handling if not supplied (unused functionality)
;     D0 = initial choice (00=up, 01=left, 02=right, 03=down)
;     D1 = animate-in direction (00=from bottom, other=from right)
;     D2 = menu index to use (just affects icons and text)

ExecuteMenu:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                link    a6,#-$C
                move.w  d2,-4(a6)
                move.l  a0,-8(a6)
                move.w  d1,-$A(a6)
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                move.w  #$1206,d0
                tst.w   d1
                bne.s   loc_1021C
                move.w  #$C1D,d1
                bra.s   loc_10220
loc_1021C:
                
                move.w  #$2015,d1
loc_10220:
                
                jsr     (CreateWindow).w
                move.w  d0,-$C(a6)
                bsr.w   LoadDiamenuWindowVdpTileData
                move.w  -4(a6),d0
                lsl.w   #2,d0
                lea     pt_MenuTiles(pc), a0
                move.l  (a0,d0.w),d0
                bclr    #$1F,d0
                bne.s   loc_10250
                movea.l d0,a0
                movea.l (a0),a0
                lea     (FF8804_LOADING_SPACE).l,a1
                jsr     (LoadCompressedData).w
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
                bsr.w   LoadVdpTileListForDiamenuIcon_Top
                bsr.w   LoadVdpTileListForDiamenuIcon_Left
                bsr.w   LoadVdpTileListForDiamenuIcon_Right
                bsr.w   LoadVdpTileListForDiamenuIcon_Bottom
                move.w  -$C(a6),d0
                move.w  #$C15,d1
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.l  -8(a6),d0
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
                moveq   #$FFFFFFFF,d1   ; B pressed, so cancel menu
                moveq   #$FFFFFFFF,d0
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bra.w   loc_10382
loc_10300:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10314
                clr.w   d1              ; C pressed, so confirm menu
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_10382
loc_10314:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10358
                clr.w   d1              ; A pressed, so confirm menu
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_10382
loc_10328:
                
                ; dpad button was pressed
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   LoadVdpTileListForDiamenuIcon
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bsr.w   LoadDiamenuWindowVdpTileData
                move.w  -$C(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                move.l  -8(a6),d0
                beq.s   loc_10356
                movea.l d0,a0
                jsr     (a0)
loc_10356:
                
                moveq   #$1D,d6
loc_10358:
                
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bsr.w   LoadVdpTileListForDiamenuIcon
                subq.w  #1,d6
                bne.s   loc_10366
                moveq   #$1E,d6
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
                move.w  -$C(a6),d0
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
                move.w  -$C(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                movem.w (sp)+,d0-d1
                unlk    a6
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function ExecuteMenu


; =============== S U B R O U T I N E =======================================

; In: -$C(A6) = window slot index

LoadDiamenuWindowVdpTileData:
                
                lea     DiamondMenuLayout(pc), a0
                move.w  -$C(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #$D8,d7 
                jsr     (CopyBytes).w   
                move.w  -4(a6),d0
                lsl.w   #2,d0
                lea     pt_MenuOptions(pc), a0
                movea.l (a0,d0.w),a0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                andi.w  #3,d0
                lsl.w   #2,d0
                movea.l (a0,d0.w),a0
                move.w  -$C(a6),d0
                move.w  #$B04,d1
                jsr     (GetWindowTileAddress).w
                moveq   #$FFFFFFDC,d1
                moveq   #$C,d7
                bra.w   WriteTilesFromAsciiWithRegularFont

    ; End of function LoadDiamenuWindowVdpTileData


; =============== S U B R O U T I N E =======================================

LoadVdpTileListForDiamenuIcon:
                
                add.w   d0,d0
                move.w  rjt_DiamenuIconsLoadingFunctions(pc,d0.w),d0
                jmp     rjt_DiamenuIconsLoadingFunctions(pc,d0.w)

    ; End of function LoadVdpTileListForDiamenuIcon

rjt_DiamenuIconsLoadingFunctions:
                dc.w LoadVdpTileListForDiamenuIcon_Top-rjt_DiamenuIconsLoadingFunctions
                dc.w LoadVdpTileListForDiamenuIcon_Left-rjt_DiamenuIconsLoadingFunctions
                dc.w LoadVdpTileListForDiamenuIcon_Right-rjt_DiamenuIconsLoadingFunctions
                dc.w LoadVdpTileListForDiamenuIcon_Bottom-rjt_DiamenuIconsLoadingFunctions

; =============== S U B R O U T I N E =======================================

LoadVdpTileListForDiamenuIcon_Top:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_10420
                adda.w  #$120,a0
loc_10420:
                
                lea     ($B800).l,a1
                move.w  #$90,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function LoadVdpTileListForDiamenuIcon_Top


; =============== S U B R O U T I N E =======================================

LoadVdpTileListForDiamenuIcon_Left:
                
                lea     (byte_FF8A44).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_10440
                adda.w  #$120,a0
loc_10440:
                
                lea     (byte_FF9104).l,a1
                bsr.w   sub_10484
                lea     ($B920).l,a1
                move.w  #$C0,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function LoadVdpTileListForDiamenuIcon_Left


; =============== S U B R O U T I N E =======================================

LoadVdpTileListForDiamenuIcon_Right:
                
                lea     (byte_FF8C84).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_1046A
                adda.w  #$120,a0
loc_1046A:
                
                lea     (byte_FF9284).l,a1
                bsr.w   sub_104E6
                lea     ($BAA0).l,a1
                move.w  #$C0,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function LoadVdpTileListForDiamenuIcon_Right


; =============== S U B R O U T I N E =======================================

sub_10484:
                
                move.l  a1,-(sp)
                moveq   #3,d7
                move.l  a0,-(sp)
                lea     MenuHBarTiles(pc), a0
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
                lea     byte_11336(pc), a0
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
                lea     byte_11366(pc), a0
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
                lea     byte_11396(pc), a0
loc_10532:
                
                move.l  $20(a0),$40(a1)
                move.l  $10(a0),$20(a1)
                move.l  (a0)+,(a1)+
                dbf     d7,loc_10532
                movea.l (sp)+,a0
                rts

    ; End of function sub_104E6


; =============== S U B R O U T I N E =======================================

LoadVdpTileListForDiamenuIcon_Bottom:
                
                lea     (byte_FF8EC4).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_10558
                adda.w  #$120,a0
loc_10558:
                
                lea     ($BC20).l,a1
                move.w  #$90,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function LoadVdpTileListForDiamenuIcon_Bottom


; =============== S U B R O U T I N E =======================================

LoadMainMenuIcon:
                
                move.l  d0,-(sp)
                ext.w   d0
                movea.l (p_MainMenuTiles).l,a0
                mulu.w  #GFX_DIAMENU_ICON_PIXELS_NUMBER,d0
                adda.w  d0,a0
                move.w  #$8F,d0 
loc_1057C:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_1057C
                move.l  (sp)+,d0
                rts

    ; End of function LoadMainMenuIcon


; =============== S U B R O U T I N E =======================================

sub_10586:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                move.w  d6,-(sp)
                link    a6,#-$C
                move.w  d2,-4(a6)
                move.l  a0,-8(a6)
                move.w  d1,-$A(a6)
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                move.w  #$1206,d0
                tst.w   d1
                bne.s   loc_105AE
                move.w  #$C1D,d1
                bra.s   loc_105B2
loc_105AE:
                
                move.w  #$2015,d1
loc_105B2:
                
                jsr     (CreateWindow).w
                move.w  d0,-$C(a6)
                bsr.w   sub_10748
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
                bsr.w   sub_10800
                bsr.w   sub_10820
                bsr.w   sub_1084A
                bsr.w   sub_10920
                move.w  -$C(a6),d0
                move.w  #$C15,d1
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.l  -8(a6),d0
                beq.s   loc_10614
                movea.l d0,a0
                jsr     (a0)
loc_10614:
                
                moveq   #$1E,d6
loc_10616:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10630
                moveq   #1,d1
                cmpi.w  #$7F,((DISPLAYED_ICON_2-$1000000)).w 
                beq.s   loc_10630
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_106B4
loc_10630:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1064A
                moveq   #2,d1
                cmpi.w  #$7F,((DISPLAYED_ICON_3-$1000000)).w 
                beq.s   loc_1064A
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
                cmpi.w  #$7F,((DISPLAYED_ICON_4-$1000000)).w 
                beq.s   loc_10676
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_106B4
loc_10676:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_1068C
                moveq   #$FFFFFFFF,d6
                moveq   #$FFFFFFFF,d0
                move.b  #$FF,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bra.w   loc_10710
loc_1068C:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_106A0
                clr.w   d6
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_106FE
loc_106A0:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_106E8
                clr.w   d6
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_106FE
loc_106B4:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   sub_107EA       
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bsr.w   sub_10748
                move.l  -8(a6),d0
                beq.s   loc_106D6
                movea.l d0,a0
                jsr     (a0)
loc_106D6:
                
                move.w  -$C(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                move.l  -8(a6),d0
                moveq   #$1D,d6
loc_106E8:
                
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bsr.w   sub_107EA       
                subq.w  #1,d6
                bne.s   loc_106F6
                moveq   #$1E,d6
loc_106F6:
                
                jsr     (WaitForVInt).w
                bra.w   loc_10616
loc_106FE:
                
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                move.w  d0,d1
                add.w   d0,d0
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.w  (a0,d0.w),d0
loc_10710:
                
                movem.w d0-d1,-(sp)
                move.w  -$C(a6),d0
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
                move.w  -$C(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                movem.w (sp)+,d0-d1
                unlk    a6
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                move.w  (sp)+,d6
                rts

    ; End of function sub_10586


; =============== S U B R O U T I N E =======================================

sub_10748:
                
                lea     UnidentifiedLayout02(pc), a0
                move.w  -$C(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #$D8,d7 
                jsr     (CopyBytes).w   
                lsl.w   #1,d0
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                andi.w  #3,d0
                lsl.w   #1,d0
                move.w  (a0,d0.w),d1
                cmpi.w  #ICON_UNARMED,d1
                bne.s   loc_10798
                move.w  #ITEM_NOTHING,((word_FFB18C-$1000000)).w
                move.w  -$C(a6),d0
                move.w  #$903,d1
                jsr     (GetWindowTileAddress).w
                lea     aNothing(pc), a0
                moveq   #$FFFFFFDC,d1
                moveq   #$A,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                bra.s   return_107D4
loc_10798:
                
                move.w  d1,((word_FFB18C-$1000000)).w
                move.w  d1,-(sp)
                jsr     j_FindItemName
                move.w  -$C(a6),d0
                move.w  #$902,d1
                jsr     (GetWindowTileAddress).w
                moveq   #$FFFFFFDC,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d1
                tst.b   d1
                bpl.s   return_107D4
                lea     aEquipped(pc), a0
                move.w  -$C(a6),d0
                move.w  #$904,d1
                jsr     (GetWindowTileAddress).w
                moveq   #$FFFFFFDC,d1
                moveq   #$A,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
return_107D4:
                
                rts

    ; End of function sub_10748

aEquipped:      dc.b '\Equipped',0
aNothing:       dc.b '\Nothing',0
                dc.b $FF

; =============== S U B R O U T I N E =======================================

; related to menu choice

sub_107EA:
                
                andi.w  #3,d0
                add.w   d0,d0
                move.w  rjt_107F8(pc,d0.w),d0
                jmp     rjt_107F8(pc,d0.w)

    ; End of function sub_107EA

rjt_107F8:      dc.w sub_10800-rjt_107F8
                dc.w sub_10820-rjt_107F8
                dc.w sub_1084A-rjt_107F8
                dc.w sub_10920-rjt_107F8

; =============== S U B R O U T I N E =======================================

sub_10800:
                
                lea     (FF8804_LOADING_SPACE).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_10810
                adda.w  #$C0,a0 
loc_10810:
                
                lea     ($B800).l,a1
                move.w  #$60,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function sub_10800


; =============== S U B R O U T I N E =======================================

sub_10820:
                
                lea     (byte_FF8984).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_10830
                adda.w  #$C0,a0 
loc_10830:
                
                lea     (byte_FF8E04).l,a1
                bsr.w   sub_10874
                lea     ($B8C0).l,a1
                move.w  #$80,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function sub_10820


; =============== S U B R O U T I N E =======================================

sub_1084A:
                
                lea     (byte_FF8B04).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_1085A
                adda.w  #$C0,a0 
loc_1085A:
                
                lea     (byte_FF8F04).l,a1
                bsr.w   sub_108CA
                lea     ($BA80).l,a1
                move.w  #$80,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function sub_1084A


; =============== S U B R O U T I N E =======================================

sub_10874:
                
                move.l  a1,-(sp)
                move.l  a0,-(sp)
                lea     MenuHBarTiles(pc), a0
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
                lea     byte_11336(pc), a0
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
                lea     byte_11366(pc), a0
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
                lea     byte_11396(pc), a0
                moveq   #3,d7
loc_10910:
                
                move.l  $20(a0),$20(a1)
                move.l  (a0)+,(a1)+
                dbf     d7,loc_10910
                movea.l (sp)+,a0
                rts

    ; End of function sub_108CA


; =============== S U B R O U T I N E =======================================

sub_10920:
                
                lea     (byte_FF8C84).l,a0
                cmpi.w  #$F,d6
                blt.s   loc_10930
                adda.w  #$C0,a0 
loc_10930:
                
                lea     ($B9C0).l,a1
                move.w  #$60,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function sub_10920


; =============== S U B R O U T I N E =======================================

; Copy spell icon to RAM
; 
;       In: A1 = destination in RAM
;           D0 = spell index
; 
;       Out: A1 = end of affected section after copy

LoadHighlightableSpellIcon:
                
                andi.w  #SPELLENTRY_MASK_INDEX,d0
                cmpi.w  #SPELL_NOTHING,d0
                bne.s   loc_10950
                move.w  #ICON_NOTHING,d0
                bra.s   loc_10954
loc_10950:
                
                addi.w  #ICON_SPELLS_START,d0
loc_10954:
                
                bra.w   LoadHighlightableIcon

    ; End of function LoadHighlightableSpellIcon


; =============== S U B R O U T I N E =======================================

LoadHighlightableItemIcon:
                
                cmpi.w  #ICON_UNARMED,d0
                beq.s   LoadHighlightableIcon
                andi.w  #ITEMENTRY_MASK_INDEX,d0

    ; End of function LoadHighlightableItemIcon


; =============== S U B R O U T I N E =======================================

LoadHighlightableIcon:
                
                adda.w  #$C0,a1 
                mulu.w  #$C0,d0 
                movea.l (p_IconTiles).l,a0
                adda.w  d0,a0           ; icon offset
                move.w  #$2F,d1 
                lea     IconHighlightTiles(pc), a2
loc_1097A:
                
                move.l  (a0)+,d0
                move.l  d0,-$C0(a1)
                and.l   (a2)+,d0
                move.l  d0,(a1)+
                dbf     d1,loc_1097A
                rts

    ; End of function LoadHighlightableIcon

IconHighlightTiles:
                incbin "data/graphics/tech/iconhighlighttiles.bin"

; =============== S U B R O U T I N E =======================================

sub_10A4A:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                link    a6,#-$C
                move.w  d2,-4(a6)
                move.l  a0,-8(a6)
                move.w  d1,-$A(a6)
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                move.w  #$1206,d0
                tst.w   d1
                bne.s   loc_10A70
                move.w  #$C1D,d1
                bra.s   loc_10A74
loc_10A70:
                
                move.w  #$2015,d1
loc_10A74:
                
                jsr     (CreateWindow).w
                move.w  d0,-$C(a6)
                bsr.w   sub_10C22
                lea     (FF8804_LOADING_SPACE).l,a1
                move.w  ((DISPLAYED_ICON_1-$1000000)).w,d0
                bsr.w   LoadHighlightableSpellIcon
                move.w  ((DISPLAYED_ICON_2-$1000000)).w,d0
                bsr.w   LoadHighlightableSpellIcon
                move.w  ((DISPLAYED_ICON_3-$1000000)).w,d0
                bsr.w   LoadHighlightableSpellIcon
                move.w  ((DISPLAYED_ICON_4-$1000000)).w,d0
                bsr.w   LoadHighlightableSpellIcon
                clr.w   d6
                bsr.w   sub_10800
                bsr.w   sub_10820
                bsr.w   sub_1084A
                bsr.w   sub_10920
                move.w  -$C(a6),d0
                move.w  #$C15,d1
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
loc_10ACC:
                
                move.l  -8(a6),d0
                beq.s   loc_10AD6
                movea.l d0,a0
                jsr     (a0)
loc_10AD6:
                
                moveq   #$1E,d6
loc_10AD8:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10AF2
                moveq   #1,d1
                cmpi.w  #$3F,((DISPLAYED_ICON_2-$1000000)).w 
                beq.s   loc_10AF2
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_10B76
loc_10AF2:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10B0C
                moveq   #2,d1
                cmpi.w  #$3F,((DISPLAYED_ICON_3-$1000000)).w 
                beq.s   loc_10B0C
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_10B76
loc_10B0C:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10B1E
                clr.w   d1
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_10B76
loc_10B1E:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10B38
                moveq   #3,d1
                cmpi.w  #$3F,((DISPLAYED_ICON_4-$1000000)).w 
                beq.s   loc_10B38
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_10B76
loc_10B38:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10B4E
                moveq   #$FFFFFFFF,d1
                moveq   #$FFFFFFFF,d0
                move.b  #$FF,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bra.w   loc_10BEC
loc_10B4E:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10B62
                clr.w   d1
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_10BBC
loc_10B62:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10BA6
                clr.w   d1
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bra.w   loc_10BBC
loc_10B76:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   sub_10CB0       
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMENU_CHOICE-$1000000)).w
                bsr.w   sub_10C22
                move.w  -$C(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                move.l  -8(a6),d0
                beq.s   loc_10BA4
                movea.l d0,a0
                jsr     (a0)
loc_10BA4:
                
                moveq   #$1D,d6
loc_10BA6:
                
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                bsr.w   sub_10CB0       
                subq.w  #1,d6
                bne.s   loc_10BB4
                moveq   #$1E,d6
loc_10BB4:
                
                jsr     (WaitForVInt).w
                bra.w   loc_10AD8
loc_10BBC:
                
                clr.w   d0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                add.w   d0,d0
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.w  (a0,d0.w),d0
                bsr.w   sub_10CC6
                cmpi.w  #$FFFF,d0
                bne.w   loc_10BEC
                bsr.w   sub_10C22
                move.w  -$C(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                bra.w   loc_10ACC
loc_10BEC:
                
                movem.w d0-d1,-(sp)
                move.w  -$C(a6),d0
                tst.w   d1
                beq.s   loc_10BFE
                move.w  #$C1D,d1
                bra.s   loc_10C02
loc_10BFE:
                
                move.w  #$2015,d1
loc_10C02:
                
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  -$C(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                movem.w (sp)+,d0-d1
                unlk    a6
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function sub_10A4A


; =============== S U B R O U T I N E =======================================

sub_10C22:
                
                lea     UnidentifiedLayout01(pc), a0
                move.w  -$C(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #$D8,d7 
                jsr     (CopyBytes).w   
                lsl.w   #1,d0
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.b  ((CURRENT_DIAMENU_CHOICE-$1000000)).w,d0
                andi.w  #3,d0
                lsl.w   #1,d0
                move.w  (a0,d0.w),d1
                move.w  d1,((word_FFB18C-$1000000)).w
                move.w  d1,-(sp)
                jsr     j_FindSpellName
                move.w  -$C(a6),d0
                move.w  #$902,d1
                jsr     (GetWindowTileAddress).w
                moveq   #$FFFFFFDC,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  -$C(a6),d0
                move.w  #$903,d1
                jsr     (GetWindowTileAddress).w
                move.w  (sp)+,d1
                move.w  d1,-(sp)
                lea     SpellLevelTilesLayout1(pc), a0
                andi.w  #$C0,d1 
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsr.w   #4,d1
                adda.w  d1,a0
                moveq   #$C,d7
                jsr     (CopyBytes).w   
                move.w  -$C(a6),d0
                move.w  #$C04,d1
                jsr     (GetWindowTileAddress).w
                move.w  (sp)+,d1
                jsr     j_GetSpellCost
                move.w  d1,d0
                moveq   #3,d7
                bsr.w   WriteTilesFromNumber
                rts

    ; End of function sub_10C22


; =============== S U B R O U T I N E =======================================

; related to menu choice

sub_10CB0:
                
                andi.w  #3,d0
                add.w   d0,d0
                move.w  rjt_10CBE(pc,d0.w),d0
                jmp     rjt_10CBE(pc,d0.w)

    ; End of function sub_10CB0

rjt_10CBE:      dc.w (sub_10800-rjt_10CBE) & $FFFF
                dc.w (sub_10820-rjt_10CBE) & $FFFF
                dc.w (sub_1084A-rjt_10CBE) & $FFFF
                dc.w (sub_10920-rjt_10CBE) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_10CC6:
                
                 
                sndCom  SFX_VALIDATION
                move.w  d0,-(sp)
                lea     TextHighlightTiles(pc), a0
                lea     ($BC00).l,a1
                move.w  #$A0,d0 
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                move.w  (sp)+,d0
                move.w  d0,d4
                lsr.w   #6,d4
                move.w  d4,d5
                andi.w  #$3F,d0 
                jsr     (WaitForVInt).w
loc_10CF4:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10D0A
                subq.w  #1,d5
                cmpi.w  #$FFFF,d5
                bne.s   loc_10D06
                move.w  d4,d5
loc_10D06:
                
                bra.w   sub_10D56
loc_10D0A:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10D1E
                addq.w  #1,d5
                cmp.w   d4,d5
                ble.s   loc_10D1A
                clr.w   d5
loc_10D1A:
                
                bra.w   sub_10D56
loc_10D1E:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10D32
                moveq   #$FFFFFFFF,d0
                jsr     (WaitForVInt).w
                sndCom  SFX_VALIDATION
                rts
loc_10D32:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10D3E
                bra.w   byte_10D48
loc_10D3E:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.w   loc_10DC0
byte_10D48:
                
                sndCom  SFX_VALIDATION
                lsl.w   #6,d5
                or.w    d5,d0
                jsr     (WaitForVInt).w
                rts

    ; End of function sub_10CC6


; =============== S U B R O U T I N E =======================================

sub_10D56:
                
                 
                sndCom  SFX_MENU_SELECTION
                movem.w d0-d5,-(sp)
                lsl.w   #2,d4
                add.w   d5,d4
                lsl.w   #2,d4
                lea     pt_SpellLevelTilesLayouts(pc), a0
                nop
                movea.l (a0,d4.w),a0
                move.w  d0,-(sp)
                move.w  -$C(a6),d0
                move.w  #$903,d1
                jsr     (GetWindowTileAddress).w
                move.w  #$C,d7
                jsr     (CopyBytes).w   
                move.w  (sp)+,d1
                lsl.w   #6,d5
                andi.w  #$3F,d1 
                or.w    d5,d1
                move.w  d1,((word_FFB18C-$1000000)).w
                jsr     j_GetSpellCost
                move.w  d1,d0
                moveq   #3,d7
                adda.w  #$2A,a1 
                bsr.w   WriteTilesFromNumber
                move.l  -8(a6),d0
                beq.s   loc_10DAE
                movea.l d0,a0
                jsr     (a0)
loc_10DAE:
                
                move.w  -$C(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                movem.w (sp)+,d0-d5
                moveq   #$13,d6
loc_10DC0:
                
                bsr.w   sub_10DE2
                jsr     (WaitForVInt).w
                subq.w  #1,d6
                bne.s   loc_10DCE
                moveq   #$14,d6
loc_10DCE:
                
                bra.w   loc_10CF4

    ; End of function sub_10D56

dword_10DD2:    dc.l $13C0D09
                dc.l $C5E00124
                dc.l $13C0D10
                dc.l $CDE0013C

; =============== S U B R O U T I N E =======================================

sub_10DE2:
                
                lea     (SPRITE_08).l,a1
                lea     dword_10DD2(pc), a0
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                cmpi.w  #$A,d6
                bge.s   loc_10E06
                move.w  #1,-$10(a1)
                move.w  #1,-8(a1)
loc_10E06:
                
                tst.b   ((HIDE_WINDOWS-$1000000)).w
                beq.s   loc_10E18
                move.w  #1,-$10(a1)
                move.w  #1,-8(a1)
loc_10E18:
                
                bra.w   sub_101E6

    ; End of function sub_10DE2

DiamondMenuLayout:
                incbin "data/graphics/tech/menus/diamondmenulayout.bin" 
                                                        ; tile layout for diamond menus
UnidentifiedLayout01:
                incbin "data/graphics/tech/menus/unidentifiedlayout01.bin"
UnidentifiedLayout02:
                incbin "data/graphics/tech/menus/unidentifiedlayout02.bin"
pt_SpellLevelTilesLayouts:
                dc.l SpellLevelTilesLayout1
                dc.l SpellLevelTilesLayout1
                dc.l SpellLevelTilesLayout1
                dc.l SpellLevelTilesLayout1
                dc.l SpellLevelTilesLayout1in2
                dc.l SpellLevelTilesLayout2
                dc.l SpellLevelTilesLayout2
                dc.l SpellLevelTilesLayout2
                dc.l SpellLevelTilesLayout1in3
                dc.l SpellLevelTilesLayout2in3
                dc.l SpellLevelTilesLayout3
                dc.l SpellLevelTilesLayout3
                dc.l SpellLevelTilesLayout1in4
                dc.l SpellLevelTilesLayout2in4
                dc.l SpellLevelTilesLayout3in4
                dc.l SpellLevelTilesLayout4
SpellLevelTilesLayout1:
                
; Syntax        vdpBaseTile [VDPTILE_]index[|mirror|flip]
                
                vdpBaseTile SPELL_LV1
                vdpBaseTile SPELL_LV2
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
SpellLevelTilesLayout2:
                vdpBaseTile SPELL_LV1
                vdpBaseTile SPELL_LV3
                vdpBaseTile SPELL_LV1|MIRROR
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
SpellLevelTilesLayout3:
                vdpBaseTile SPELL_LV1
                vdpBaseTile SPELL_LV3
                vdpBaseTile SPELL_LV1|MIRROR
                vdpBaseTile SPELL_LV1
                vdpBaseTile SPELL_LV2
                vdpBaseTile SPACE
SpellLevelTilesLayout4:
                vdpBaseTile SPELL_LV1
                vdpBaseTile SPELL_LV3
                vdpBaseTile SPELL_LV1|MIRROR
                vdpBaseTile SPELL_LV1
                vdpBaseTile SPELL_LV3
                vdpBaseTile SPELL_LV1|MIRROR
SpellLevelTilesLayout1in2:
                vdpBaseTile SPELL_LV1
                vdpBaseTile SPELL_LV6
                vdpBaseTile SPELL_LV5
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
SpellLevelTilesLayout2in3:
                vdpBaseTile SPELL_LV1
                vdpBaseTile SPELL_LV3
                vdpBaseTile SPELL_LV1|MIRROR
                vdpBaseTile SPELL_LV5|MIRROR
                vdpBaseTile SPELL_LV8
                vdpBaseTile SPACE
SpellLevelTilesLayout3in4:
                vdpBaseTile SPELL_LV1
                vdpBaseTile SPELL_LV3
                vdpBaseTile SPELL_LV1|MIRROR
                vdpBaseTile SPELL_LV1
                vdpBaseTile SPELL_LV6
                vdpBaseTile SPELL_LV5
SpellLevelTilesLayout1in3:
                vdpBaseTile SPELL_LV1
                vdpBaseTile SPELL_LV6
                vdpBaseTile SPELL_LV5
                vdpBaseTile SPELL_LV5|MIRROR
                vdpBaseTile SPELL_LV8
                vdpBaseTile SPACE
SpellLevelTilesLayout2in4:
                vdpBaseTile SPELL_LV1
                vdpBaseTile SPELL_LV3
                vdpBaseTile SPELL_LV1|MIRROR
                vdpBaseTile SPELL_LV5|MIRROR
                vdpBaseTile SPELL_LV7
                vdpBaseTile SPELL_LV5
SpellLevelTilesLayout1in4:
                vdpBaseTile SPELL_LV1
                vdpBaseTile SPELL_LV6
                vdpBaseTile SPELL_LV5
                vdpBaseTile SPELL_LV5|MIRROR
                vdpBaseTile SPELL_LV7
                vdpBaseTile SPELL_LV5
pt_MenuTiles:   dc.b $85                ; starting with references to uncompressed main menu tiles
                dc.b 1
                dc.b 2
                dc.b 4
                dc.b $80
                dc.b 1
                dc.b 2
                dc.b 3
                dc.b $80
                dc.b 1
                dc.b 2
                dc.b 4
                dc.l p_MenuTiles_Item
                dc.l p_MenuTiles_BattleField
                dc.l p_Menutiles_Church
                dc.l p_MenuTiles_Shop
                dc.l p_MenuTiles_Caravan
                dc.l p_MenuTiles_Depot
pt_MenuOptions: dc.l pt_FieldMenu_Names
                dc.l pt_BattleMenu_Names
                dc.l pt_BattleMenuOverItem_Names
                dc.l pt_ItemMenu_Names
                dc.l pt_BattlefieldMenu_Names
                dc.l pt_ChurchMenu_Names
                dc.l pt_ShopMenu_Names
                dc.l pt_CaravanMenu_Names
                dc.l pt_DepotMenu_Names
pt_FieldMenu_Names:
                dc.l aMember            
                dc.l aMagic             
                dc.l aItem              
                dc.l aSearch            
aMember:        dc.b 'MEMBER',0
aMagic:         dc.b 'MAGIC',0
aItem:          dc.b 'ITEM',0
aSearch:        dc.b 'SEARCH',0
                dc.b $FF
pt_BattleMenu_Names:
                dc.l aAttack_0          
                dc.l aMagic_0           
                dc.l aItem_0            
                dc.l aStay              
aAttack_0:      dc.b 'ATTACK',0
aMagic_0:       dc.b 'MAGIC',0
aItem_0:        dc.b 'ITEM',0
aStay:          dc.b 'STAY',0
                dc.b $FF
pt_BattleMenuOverItem_Names:
                dc.l aAttack_1          
                dc.l aMagic_1           
                dc.l aItem_1            
                dc.l aSearch_0          
aAttack_1:      dc.b 'ATTACK',0
aMagic_1:       dc.b 'MAGIC',0
aItem_1:        dc.b 'ITEM',0
aSearch_0:      dc.b 'SEARCH',0
                dc.b $FF
pt_ItemMenu_Names:
                dc.l aUse               
                dc.l aGive              
                dc.l aEquip             
                dc.l aDrop              
aUse:           dc.b 'USE',0
aGive:          dc.b 'GIVE',0
aEquip:         dc.b 'EQUIP',0
aDrop:          dc.b 'DROP',0
pt_BattlefieldMenu_Names:
                dc.l aMember_0          
                dc.l aMap               
                dc.l aSpeed_0           
                dc.l aQuit              
aMember_0:      dc.b 'MEMBER',0
aMap:           dc.b 'MAP',0
aSpeed_0:       dc.b 'SPEED',0
aQuit:          dc.b 'QUIT',0
pt_ChurchMenu_Names:
                dc.l aRaise             
                dc.l aCure              
                dc.l aPromo_            
                dc.l aSave              
aRaise:         dc.b 'RAISE',0
aCure:          dc.b 'CURE',0
aPromo_:        dc.b 'PROMO.',0
aSave:          dc.b 'SAVE',0
                dc.b $FF
pt_ShopMenu_Names:
                dc.l aBuy               
                dc.l aSell              
                dc.l aRepair            
                dc.l aDeals             
aBuy:           dc.b 'BUY',0
aSell:          dc.b 'SELL',0
aRepair:        dc.b 'REPAIR',0
aDeals:         dc.b 'DEALS',0
pt_CaravanMenu_Names:
                dc.l aJoin              
                dc.l aDepot             
                dc.l aItem_2            
                dc.l aPurge             
aJoin:          dc.b 'JOIN',0
aDepot:         dc.b 'DEPOT',0
aItem_2:        dc.b 'ITEM',0
aPurge:         dc.b 'PURGE',0
pt_DepotMenu_Names:
                dc.l aLook              
                dc.l aDepos_            
                dc.l aDerive            
                dc.l aDrop_0            
aLook:          dc.b 'LOOK',0
aDepos_:        dc.b 'DEPOS.',0
aDerive:        dc.b 'DERIVE',0
aDrop_0:        dc.b 'DROP',0
MenuHBarTiles:  dc.b 2
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $2C
                dc.b $CB
                dc.b $BB
                dc.b $BB
                dc.b 2
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BC
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
byte_11336:     dc.b 2
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $2C
                dc.b $CB
                dc.b $BB
                dc.b $BB
                dc.b $22
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b 2
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
byte_11366:     dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $20
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $22
                dc.b $BB
                dc.b $BB
                dc.b $BC
                dc.b $C2
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $20
byte_11396:     dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $CB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $20
                dc.b $BB
                dc.b $BB
                dc.b $BC
                dc.b $C2
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $20

; =============== S U B R O U T I N E =======================================

sub_113C6:
                
                movem.l d0-a2,-(sp)
                move.w  #$A09,d0
                move.w  #$F612,d1
                jsr     (CreateWindow).w
                move.w  d0,((byte_FFB18E-$1000000)).w
                lea     BattleEquipWindowLayout(pc), a0
                move.w  #$B4,d7 
                jsr     (CopyBytes).w   
                bsr.w   DrawBattleEquipWindowStats
                move.w  ((byte_FFB18E-$1000000)).w,d0
                move.w  #$212,d1
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function sub_113C6


; =============== S U B R O U T I N E =======================================

sub_11404:
                
                movem.l d0-a2,-(sp)
                bsr.w   DrawBattleEquipWindowStats
                move.w  ((byte_FFB18E-$1000000)).w,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function sub_11404


; =============== S U B R O U T I N E =======================================

sub_1141E:
                
                movem.l d0-a2,-(sp)
                move.w  ((byte_FFB18E-$1000000)).w,d0
                move.w  #$F612,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  ((byte_FFB18E-$1000000)).w,d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function sub_1141E


; =============== S U B R O U T I N E =======================================

DrawBattleEquipWindowStats:
                
                link    a6,#-4
                move.w  ((byte_FFB18E-$1000000)).w,d0
                move.w  #WINDOW_BATTLEEQUIP_STATS_TILE_COORDS,d1
                jsr     (GetWindowTileAddress).w
                move.l  a1,-4(a6)
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentATT
                move.w  d1,d0
                movea.l -4(a6),a1
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentDEF
                move.w  d1,d0
                movea.l -4(a6),a1
                adda.w  #$28,a1 
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentAGI
                move.w  d1,d0
                movea.l -4(a6),a1
                adda.w  #$50,a1 
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentMOV
                move.w  d1,d0
                movea.l -4(a6),a1
                adda.w  #$78,a1 
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                unlk    a6
                rts

    ; End of function DrawBattleEquipWindowStats

