
; ASM FILE code\common\menus\menuengine_1.asm :
; 0x10000..0x1263A : Menu engine

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

p_ItemNames:    dc.l ItemNames
p_ClassNames:   dc.l ClassNames
p_ItemDefs:     dc.l ItemDefs           
p_SpellDefs:    dc.l SpellDefs          

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

p_WindowLayout_MemberStats:
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
                ori.w   #VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT,d0
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
                bcc.s   loc_10140
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
                dc.b VDPTILE_ASCII_SPACE ; VDP tile indexes to substitute in for symbol ASCII values when using orange font
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
                
                addi.w  #ICON_HEAL,d0
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
                lea     word_110E4(pc), a0
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
                lea     pt_SpellLevelBarTiles(pc), a0
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
pt_SpellLevelBarTiles:
                dc.l word_110E4
                dc.l word_110E4
                dc.l word_110E4
                dc.l word_110E4
                dc.l word_11114
                dc.l word_110F0
                dc.l word_110F0
                dc.l word_110F0
                dc.l word_11138
                dc.l word_11120
                dc.l word_110FC
                dc.l word_110FC
                dc.l word_11150
                dc.l word_11144
                dc.l word_1112C
                dc.l word_11108
word_110E4:     dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR2|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
word_110F0:     dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR3|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
word_110FC:     dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR3|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR2|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
word_11108:     dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR3|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR3|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
word_11114:     dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR6|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR5|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
word_11120:     dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR3|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR5|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR8|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
word_1112C:     dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR3|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR6|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR5|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
word_11138:     dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR6|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR5|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR5|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR8|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
word_11144:     dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR3|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR5|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR7|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR5|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
word_11150:     dc.w VDPTILE_SPELL_LEVEL_BAR1|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR6|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR5|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR5|VDPTILE_MIRRORED_BIT|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR7|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
                dc.w VDPTILE_SPELL_LEVEL_BAR5|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT
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

BattleEquipWindowLayout:
                incbin "data/graphics/tech/windowlayouts/battleequipwindowlayout.bin"

; =============== S U B R O U T I N E =======================================

CreateFighterMiniStatusWindow:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                movem.l d0-a2,-(sp)
                move.w  d0,-(sp)
                move.w  #WINDOW_FIGHTERMINISTATUS_SIZE,d0
                move.w  #WINDOW_FIGHTERMINISTATUS_DEST,d1
                lea     ((FIGHTER_MINISTATUS_WINDOW_INDEX-$1000000)).w,a2
                tst.b   ((FIGHTER_IS_TARGETTING-$1000000)).w
                beq.s   loc_11594
                addq.l  #2,a2
                addi.w  #$15,d1
loc_11594:
                
                jsr     (CreateWindow).w
                move.w  d0,(a2)
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  (sp)+,d0
                bsr.w   sub_118BE
                move.w  #1,d1
                move.w  ((FIGHTER_MINISTATUS_WINDOW_WIDTH-$1000000)).w,d3
                move.w  #$1F,d4
                sub.w   d3,d4
                lsl.w   #8,d4
                or.w    d4,d1
                moveq   #4,d2
                tst.b   ((FIGHTER_IS_TARGETTING-$1000000)).w
                beq.s   loc_115C4
                addi.w  #$15,d1
loc_115C4:
                
                move.w  (a2),d0
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForVInt).w
                bsr.w   sub_11804
                jsr     (WaitForWindowMovementEnd).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function CreateFighterMiniStatusWindow


; =============== S U B R O U T I N E =======================================

HideFighterMiniStatusWindow:
                
                movem.l d0-a2,-(sp)
                lea     ((FIGHTER_MINISTATUS_WINDOW_INDEX-$1000000)).w,a2
                tst.b   ((FIGHTER_IS_TARGETTING-$1000000)).w
                beq.s   loc_115F0
                addq.l  #2,a2
loc_115F0:
                
                move.w  (a2),d0
                move.w  #WINDOW_FIGHTERMINISTATUS_DEST,d1
                tst.b   ((FIGHTER_IS_TARGETTING-$1000000)).w
                beq.s   loc_11600
                addi.w  #$15,d1
loc_11600:
                
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  (a2),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                movem.l (sp)+,d0-a2
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function HideFighterMiniStatusWindow


; =============== S U B R O U T I N E =======================================

sub_1161A:
                
                jsr     (InitWindowProperties).w
                move.w  #WINDOW_FIGHTERMINISTATUS_SIZE,d0
                move.w  #WINDOW_FIGHTERMINISTATUS_DEST,d1
                jsr     (CreateWindow).w
                move.w  #WINDOW_FIGHTERMINISTATUS_SIZE,d0
                move.w  #WINDOW_FIGHTERMINISTATUS_DEST,d1
                jsr     (CreateWindow).w
                rts

    ; End of function sub_1161A


; =============== S U B R O U T I N E =======================================

sub_11638:
                
                cmpi.b  #$FF,d0
                beq.w   return_11714
                movem.l d0-a1,-(sp)
                move.w  d1,-(sp)
                clr.b   ((FIGHTER_IS_TARGETTING-$1000000)).w
                movem.w d0,-(sp)
                clr.w   d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                movem.w (sp)+,d0
                bsr.w   sub_118BE
                move.w  (sp)+,d1
                bne.s   loc_11670
                move.w  ((FIGHTER_MINISTATUS_WINDOW_WIDTH-$1000000)).w,d3
                move.w  #$1F,d1
                sub.w   d3,d1
                lsl.w   #8,d1
                bra.s   loc_11674
loc_11670:
                
                move.w  #$100,d1
loc_11674:
                
                ori.w   #1,d1
                clr.w   d0
                moveq   #1,d2
                jsr     (MoveWindow).l  
                jsr     (WaitForVInt).w
                bsr.w   sub_11804
                jsr     (WaitForWindowMovementEnd).w
                movem.l (sp)+,d0-a1
                rts

    ; End of function sub_11638


; =============== S U B R O U T I N E =======================================

RemoveAllyBattlesceneWindow:
                
                cmpi.b  #$FF,d0
                beq.w   return_11714
                movem.l d0-a1,-(sp)
                clr.b   ((FIGHTER_IS_TARGETTING-$1000000)).w
                clr.w   d0
                move.w  #$2006,d1
                moveq   #1,d2
                jsr     (MoveWindow).l  
                movem.l (sp)+,d0-a1
                rts

    ; End of function RemoveAllyBattlesceneWindow


; =============== S U B R O U T I N E =======================================

sub_116B8:
                
                cmpi.b  #$FF,d0
                beq.w   return_11714
                movem.l d0-a1,-(sp)
                move.w  d1,-(sp)
                move.b  #$FF,((FIGHTER_IS_TARGETTING-$1000000)).w
                movem.w d0,-(sp)
                moveq   #1,d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                movem.w (sp)+,d0
                bsr.w   sub_118BE
                move.w  (sp)+,d1
                beq.s   loc_116F2
                move.w  ((FIGHTER_MINISTATUS_WINDOW_WIDTH-$1000000)).w,d3
                move.w  #$1F,d1
                sub.w   d3,d1
                lsl.w   #8,d1
                bra.s   loc_116F6
loc_116F2:
                
                move.w  #$100,d1
loc_116F6:
                
                ori.w   #$14,d1
                moveq   #1,d0
                moveq   #1,d2
                jsr     (MoveWindow).l  
                jsr     (WaitForVInt).w
                bsr.w   sub_11804
                jsr     (WaitForWindowMovementEnd).w
                movem.l (sp)+,d0-a1
return_11714:
                
                rts

    ; End of function sub_116B8


; =============== S U B R O U T I N E =======================================

RemoveEnemyBattlesceneWindow:
                
                cmpi.b  #$FF,d0
                beq.s   return_11714
                movem.l d0-a1,-(sp)
                move.b  #$FF,((FIGHTER_IS_TARGETTING-$1000000)).w
                moveq   #1,d0
                move.w  #$2006,d1
                moveq   #1,d2
                jsr     (MoveWindow).l  
                movem.l (sp)+,d0-a1
                rts

    ; End of function RemoveEnemyBattlesceneWindow


; =============== S U B R O U T I N E =======================================

DrawColoredStatBar:
                
                movem.l d0-a1,-(sp)
                tst.b   ((FIGHTER_IS_TARGETTING-$1000000)).w
                beq.s   loc_11748
                addi.w  #$A,d2
loc_11748:
                
                ori.w   #VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT,d2
                cmp.w   d0,d1
                bge.s   loc_11752
                move.w  d0,d1
loc_11752:
                
                move.l  a0,-(sp)
                moveq   #$6F,d7 
loc_11756:
                
                clr.l   (a0)+
                dbf     d7,loc_11756
                movea.l (sp)+,a0
                clr.w   d7
                moveq   #1,d4
                bsr.w   sub_11862       
                clr.w   d4
                bsr.w   sub_11862       
                ext.l   d0
                divs.w  #$64,d0 
                move.w  d0,d4
                addq.w  #3,d4
                clr.w   d6
                swap    d0
                cmpi.w  #$64,d1 
                ble.s   loc_11784
                moveq   #$63,d3 
                bra.s   loc_1178C
loc_11784:
                
                move.w  d1,d3
                subq.w  #1,d3
                bmi.w   loc_117A0
loc_1178C:
                
                cmp.w   d0,d6
                blt.s   loc_11796
                subq.w  #1,d4
                move.w  #$3E7,d0
loc_11796:
                
                bsr.w   sub_11862       
                addq.w  #1,d6
                dbf     d3,loc_1178C
loc_117A0:
                
                clr.w   d4
                bsr.w   sub_11862       
                moveq   #1,d4
                moveq   #$F,d3
loc_117AA:
                
                bsr.w   sub_11862       
                dbf     d3,loc_117AA
                movem.l d2/a0,-(sp)
                moveq   #$B,d7
                move.l  8(a0),d6
                move.w  d2,(a1)+
loc_117BE:
                
                lea     $20(a0),a0
                move.l  8(a0),d3
                cmpi.l  #$FFFFFFFF,d3
                beq.w   loc_117FA
                cmp.l   d3,d6
                bne.s   loc_117F0
                moveq   #$5F,d3 
                movem.l a0-a1,-(sp)
                movea.l a0,a1
                lea     $20(a1),a1
loc_117E0:
                
                move.l  (a1)+,(a0)+
                dbf     d3,loc_117E0
                movem.l (sp)+,a0-a1
                lea     -$20(a0),a0
                bra.s   loc_117F4
loc_117F0:
                
                move.l  d3,d6
                addq.w  #1,d2
loc_117F4:
                
                move.w  d2,(a1)+
                dbf     d7,loc_117BE
loc_117FA:
                
                movem.l (sp)+,d2/a0
                movem.l (sp)+,d0-a1
                rts

    ; End of function DrawColoredStatBar


; =============== S U B R O U T I N E =======================================

sub_11804:
                
                movem.l d0-d2/a0-a1,-(sp)
                lea     (FF8804_LOADING_SPACE).l,a0
                moveq   #1,d2
                bsr.w   sub_11826
                lea     (byte_FF8A04).l,a0
                moveq   #6,d2
                bsr.w   sub_11826
                movem.l (sp)+,d0-d2/a0-a1
                rts

    ; End of function sub_11804


; =============== S U B R O U T I N E =======================================

sub_11826:
                
                tst.b   ((FIGHTER_IS_TARGETTING-$1000000)).w
                beq.s   loc_11830
                addi.w  #$A,d2
loc_11830:
                
                lsl.w   #5,d2
                movea.w d2,a1
                move.w  #$50,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function sub_11826

dword_1183E:    dc.l $F11111FF
                dc.l $FFFFFFFF
                dc.l $1AAAAA1F
                dc.l $1BBBBB1F
                dc.l $1555551F
                dc.l $1666661F
                dc.l $1222221F
                dc.l $1222221F
                dc.l $1222221F

; =============== S U B R O U T I N E =======================================

; write one column of HP/MP bar pixels into A1

sub_11862:
                
                movem.l d3-a0,-(sp)
                moveq   #7,d3
                move.w  d7,d6
                andi.w  #7,d6
                lsl.w   #2,d6
                lsr.w   #3,d7
                lsl.w   #5,d7
                lsl.w   #2,d4
                move.l  dword_1183E(pc,d4.w),d4
loc_1187A:
                
                move.l  d4,d5
                andi.l  #$F0000000,d5
                lsr.l   d6,d5
                or.l    d5,(a0,d7.w)
                rol.l   #4,d4
                addq.l  #4,a0
                dbf     d3,loc_1187A
                movem.l (sp)+,d3-a0
                addq.w  #1,d7
                rts

    ; End of function sub_11862


; =============== S U B R O U T I N E =======================================

; check ASCII name at A0 for two special characters ???
; 

AdjustStringLengthForSpecialCharacters:
                
                movem.w d0/a0,-(sp)
                move.w  d7,d0
                subq.w  #1,d0
                bmi.w   return_118BC
loc_118A4:
                
                cmpi.b  #$9E,(a0)
                bne.s   loc_118AC
                subq.w  #1,d7
loc_118AC:
                
                cmpi.b  #$9F,(a0)+
                bne.s   loc_118B4
                subq.w  #1,d7
loc_118B4:
                
                dbf     d0,loc_118A4
                movem.w (sp)+,d0/a0
return_118BC:
                
                rts

    ; End of function AdjustStringLengthForSpecialCharacters


; =============== S U B R O U T I N E =======================================

sub_118BE:
                
                link    a6,#-8
                move.l  a1,-8(a6)
                movem.l d7/a1,-(sp)
                move.w  #WINDOW_FIGHTERMINISTATUS_COUNTER,d7
@Clear_Loop:
                
                clr.l   (a1)+
                dbf     d7,@Clear_Loop
                movem.l (sp)+,d7/a1
                ext.w   d0
                move.w  d0,-2(a6)
                jsr     j_GetCurrentHP
                move.w  d1,d2
                jsr     j_GetMaxHP
                move.w  d1,d3
                movem.w d2-d3,-(sp)
                jsr     j_GetCurrentMP
                move.w  d1,d2
                jsr     j_GetMaxMP
                move.w  d1,d3
                movem.w (sp)+,d0-d1
                move.w  d1,d6
                cmp.w   d1,d3           ; keep highest of max HP or MP
                ble.s   @CapStatBarLength
                move.w  d3,d6
@CapStatBarLength:
                
                cmpi.w  #WINDOW_FIGHTERMINISTATUS_MAX_BAR_LENGTH,d6
                ble.s   @CalculateStatBarWidth
                moveq   #WINDOW_FIGHTERMINISTATUS_MAX_BAR_LENGTH,d6
@CalculateStatBarWidth:
                
                addq.w  #3,d6
                lsr.w   #3,d6
                addi.w  #WINDOW_FIGHTERMINISTATUS_MIN_WIDTH,d6
                movem.w d0-d1/d7,-(sp)
                move.w  -2(a6),d0
                blt.s   @EnemyName
                jsr     j_GetCombatantName
                bsr.w   AdjustStringLengthForSpecialCharacters
                move.w  d7,d4
                jsr     j_GetClass
                jsr     j_GetClassName
                bsr.w   AdjustStringLengthForSpecialCharacters
                add.w   d7,d4
                addq.w  #4,d4
                jsr     j_GetCurrentLevel
                cmpi.w  #$A,d1
                blt.s   @_
                addq.w  #1,d4
@_:
                
                bra.s   @DetermineWidth
@EnemyName:
                
                jsr     j_GetCombatantName
                bsr.w   AdjustStringLengthForSpecialCharacters
                move.w  d7,d4
                addq.w  #2,d4
@DetermineWidth:
                
                movem.w (sp)+,d0-d1/d7
                cmp.w   d4,d6
                bge.s   @CopyTileColumns
                move.w  d4,d6
@CopyTileColumns:
                
                move.w  d6,((FIGHTER_MINISTATUS_WINDOW_WIDTH-$1000000)).w
                lea     wl_FighterMiniStatus(pc), a0
                movea.l -8(a6),a1
                bsr.w   CopyFighterMinistatusWindowTileColumn
                bsr.w   CopyFighterMinistatusWindowTileColumn
                bsr.w   CopyFighterMinistatusWindowTileColumn
                move.w  ((FIGHTER_MINISTATUS_WINDOW_WIDTH-$1000000)).w,d7
                subi.w  #WINDOW_FIGHTERMINISTATUS_WIDTH_COUNTER,d7
@Copy_Loop:
                
                lea     word_11B0A(pc), a0
                nop
                bsr.w   CopyFighterMinistatusWindowTileColumn
                dbf     d7,@Copy_Loop
                lea     word_11B14(pc), a0
                nop
                bsr.w   CopyFighterMinistatusWindowTileColumn
                bsr.w   CopyFighterMinistatusWindowTileColumn
                bsr.w   CopyFighterMinistatusWindowTileColumn
                bsr.w   CopyFighterMinistatusWindowTileColumn
                bsr.w   CopyFighterMinistatusWindowTileColumn
                movem.w d0-d3,-(sp)
                move.w  -2(a6),d0
                jsr     j_GetCombatantName
                movea.l -8(a6),a1
                adda.w  #WINDOW_FIGHTERMINISTATUS_NEXT_LINE_OFFSET,a1
                addq.l  #2,a1
                moveq   #$FFFFFFD4,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                addq.w  #2,a1
                move.w  -2(a6),d0
                blt.s   @DrawStatBar
                jsr     j_GetClass
                jsr     j_GetClassName
                move.w  #$FFD4,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  -2(a6),d0
                jsr     j_GetCurrentLevel
                move.w  d1,d0
                ext.l   d0
                moveq   #2,d7
                cmpi.w  #$A,d0
                bge.s   @WriteLevel
                subq.w  #1,d7
@WriteLevel:
                
                bsr.w   WriteTilesFromNumber
@DrawStatBar:
                
                movem.w (sp)+,d0-d3
                movem.w d0-d3,-(sp)
                movem.w d2-d3,-(sp)
                movea.l -8(a6),a1
                adda.w  #WINDOW_FIGHTERMINISTATUS_TWO_LINES_OFFSET,a1
                addq.w  #6,a1
                move.l  a1,-(sp)
                lea     (FF8804_LOADING_SPACE).l,a0
                moveq   #1,d2
                bsr.w   DrawColoredStatBar
                movea.l (sp)+,a1
                adda.w  #WINDOW_FIGHTERMINISTATUS_NEXT_LINE_OFFSET,a1
                movem.w (sp)+,d0-d1
                tst.w   d1
                beq.s   @WriteStats
                lea     (byte_FF8A04).l,a0
                moveq   #6,d2
                bsr.w   DrawColoredStatBar
@WriteStats:
                
                movem.w (sp)+,d0-d3
                ext.l   d0
                movea.l -8(a6),a1
                adda.w  #WINDOW_FIGHTERMINISTATUS_TWO_LINES_OFFSET,a1
                move.l  a1,-(sp)
                adda.w  ((FIGHTER_MINISTATUS_WINDOW_WIDTH-$1000000)).w,a1
                adda.w  ((FIGHTER_MINISTATUS_WINDOW_WIDTH-$1000000)).w,a1
                suba.w  #WINDOW_FIGHTERMINISTATUS_STAT_VALUES_OFFSET,a1
                move.l  a1,-(sp)
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                movea.l (sp)+,a1
                addq.l  #WINDOW_FIGHTERMINISTATUS_MAX_HP_OFFSET,a1
                move.w  d1,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                movea.l (sp)+,a1
                adda.w  #WINDOW_FIGHTERMINISTATUS_NEXT_LINE_OFFSET,a1
                adda.w  ((FIGHTER_MINISTATUS_WINDOW_WIDTH-$1000000)).w,a1
                adda.w  ((FIGHTER_MINISTATUS_WINDOW_WIDTH-$1000000)).w,a1
                suba.w  #WINDOW_FIGHTERMINISTATUS_STAT_VALUES_OFFSET,a1
                move.l  a1,-(sp)
                move.w  d2,d0
                ext.l   d0
                movea.l (sp)+,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                addq.l  #2,a1
                move.w  d3,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                unlk    a6
                rts

    ; End of function sub_118BE


; =============== S U B R O U T I N E =======================================

; display d0 stat value or "??" if above 99

WriteStatValue:
                
                cmpi.w  #STATS_UNKNOWN_VALUE_THRESHOLD,d0
                bge.s   @WriteUnknownValue
                ext.l   d0
                bra.w   WriteTilesFromNumber
                bra.s   UnknownValue    ; bad instruction
@WriteUnknownValue:
                
                lea     UnknownValue(pc), a0
                bra.w   WriteTilesFromAsciiWithRegularFont

    ; End of function WriteStatValue

UnknownValue:   dc.b '??'

; =============== S U B R O U T I N E =======================================

; draw tiles from A0 into A1 (one column)

CopyFighterMinistatusWindowTileColumn:
                
                movem.l a1,-(sp)
                move.w  (a0)+,(a1)
                adda.w  #WINDOW_FIGHTERMINISTATUS_NEXT_LINE_OFFSET,a1
                move.w  (a0)+,(a1)
                adda.w  #WINDOW_FIGHTERMINISTATUS_NEXT_LINE_OFFSET,a1
                move.w  (a0)+,(a1)
                adda.w  #WINDOW_FIGHTERMINISTATUS_NEXT_LINE_OFFSET,a1
                move.w  (a0)+,(a1)
                adda.w  #WINDOW_FIGHTERMINISTATUS_NEXT_LINE_OFFSET,a1
                move.w  (a0)+,(a1)
                movem.l (sp)+,a1
                addq.w  #2,a1
                rts

    ; End of function CopyFighterMinistatusWindowTileColumn

wl_FighterMiniStatus:
                dc.w $C060
                dc.w $C070
                dc.w $C070
                dc.w $C070
                dc.w $D060
                dc.w $C061
                dc.w $C020
                dc.w $C048
                dc.w $C04D
                dc.w $D061
                dc.w $C061
                dc.w $C020
                dc.w $C050
                dc.w $C050
                dc.w $D061
word_11B0A:     dc.w $C061
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $D061
word_11B14:     dc.w $C061
                dc.w $C020
                dc.w $C030
                dc.w $C030
                dc.w $D061
                dc.w $C061
                dc.w $C020
                dc.w $C02F
                dc.w $C02F
                dc.w $D061
                dc.w $C061
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $D061
                dc.w $C061
                dc.w $C020
                dc.w $C030
                dc.w $C030
                dc.w $D061
                dc.w $C860
                dc.w $C870
                dc.w $C870
                dc.w $C870
                dc.w $D860

; =============== S U B R O U T I N E =======================================

InitPortraitWindow:
                
                tst.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                bne.w   return_11BE0
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                movem.l d0-a1,-(sp)
                move.w  d0,-(sp)
                move.b  d2,((PORTRAIT_IS_FLIPPED-$1000000)).w
                move.b  d1,((PORTRAIT_IS_ON_RIGHT-$1000000)).w
                move.w  #$A7C0,((word_FFB07E-$1000000)).w
                move.w  #$14,((BLINK_COUNTER-$1000000)).w
                move.w  #6,((word_FFB07C-$1000000)).w
                move.w  #$80A,d0
                move.w  #$2F6,d1
                tst.b   ((PORTRAIT_IS_ON_RIGHT-$1000000)).w
                beq.s   loc_11B84
                addi.w  #$1500,d1
loc_11B84:
                
                jsr     (CreateWindow).w
                addq.w  #1,d0
                move.w  d0,((PORTRAIT_WINDOW_INDEX-$1000000)).w
                tst.b   ((PORTRAIT_IS_FLIPPED-$1000000)).w
                bne.s   loc_11B9A
                lea     WindowBorderTiles(pc), a0
                bra.s   loc_11B9E
loc_11B9A:
                
                lea     PortraitWindowLayout(pc), a0
loc_11B9E:
                
                move.w  #$A0,d7 
                jsr     (CopyBytes).w   
                move.w  (sp)+,d0
                bsr.w   GetAllyPortrait 
                bsr.w   LoadPortrait    
                move.w  ((PORTRAIT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$201,d1
                tst.b   ((PORTRAIT_IS_ON_RIGHT-$1000000)).w
                beq.s   loc_11BC4
                addi.w  #$1500,d1
loc_11BC4:
                
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_HandlePortraitBlinking
                move.b  #$FF,((byte_FFB082-$1000000)).w
                movem.l (sp)+,d0-a1
return_11BE0:
                
                rts

    ; End of function InitPortraitWindow


; =============== S U B R O U T I N E =======================================

HidePortraitWindow:
                
                tst.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                beq.s   return_11BE0
                movem.l d0-a1,-(sp)
                trap    #VINT_FUNCTIONS
                dc.w VINTS_REMOVE
                dc.l VInt_HandlePortraitBlinking
                move.w  ((PORTRAIT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$2F6,d1
                tst.b   ((PORTRAIT_IS_ON_RIGHT-$1000000)).w
                beq.s   loc_11C08
                addi.w  #$1500,d1
loc_11C08:
                
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  ((PORTRAIT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                clr.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                movem.l (sp)+,d0-a1
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function HidePortraitWindow


; =============== S U B R O U T I N E =======================================

; Create and display member stats screen
; 
;       In: D0 = character index

BuildMemberStatsScreen:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                movem.l d0-a2,-(sp)
                link    a6,#-$10
                move.w  d0,-2(a6)
                clr.b   ((PORTRAIT_IS_FLIPPED-$1000000)).w
                clr.b   ((PORTRAIT_IS_ON_RIGHT-$1000000)).w
                move.w  #WINDOW_MEMBER_STATS_SIZE,d0
                move.w  #WINDOW_MEMBER_STATS_DEST,d1
                jsr     (CreateWindow).w ; stats window, on the right
                move.w  d0,-4(a6)
                move.w  #$80A,d0
                move.w  #WINDOW_MEMBER_PORTRAIT_DEST,d1
                jsr     (CreateWindow).w ; portrait, upper left
                move.w  d0,-6(a6)
                addq.w  #1,d0
                move.w  d0,((PORTRAIT_WINDOW_INDEX-$1000000)).w
                move.w  #WINDOW_MEMBER_KD_SIZE,d0
                move.w  #WINDOW_MEMBER_KD_DEST,d1
                jsr     (CreateWindow).w ; kills/defeat, middle left
                move.w  d0,-8(a6)
                move.w  #WINDOW_MEMBER_GOLD_SIZE,d0
                move.w  #WINDOW_MEMBER_GOLD_DEST,d1
                jsr     (CreateWindow).w ; gold, bottom left
                move.w  d0,-$A(a6)
                move.w  -2(a6),d0
                bsr.w   GetCombatantPortrait
                move.w  d0,-$C(a6)
                bsr.w   LoadTileDataForMemberScreen
                move.w  -$C(a6),d0
                blt.s   loc_11CA6
                bsr.w   GetAllyPortrait 
                bsr.w   LoadPortrait    
loc_11CA6:
                
                move.w  -4(a6),d0
                move.w  #WINDOW_MEMBER_STATS_POSITION,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  -8(a6),d0
                move.w  #WINDOW_MEMBER_KD_POSITION,d1
                jsr     (MoveWindowWithSfx).w
                move.w  -$C(a6),d0
                blt.s   loc_11CD2
                move.w  -6(a6),d0
                move.w  #WINDOW_MEMBER_PORTRAIT_POSITION,d1
                jsr     (MoveWindowWithSfx).w
loc_11CD2:
                
                move.w  -2(a6),d0
                tst.b   d0
                blt.s   loc_11CE6
                move.w  -$A(a6),d0
                move.w  #WINDOW_MEMBER_GOLD_POSITION,d1
                jsr     (MoveWindowWithSfx).w
loc_11CE6:
                
                jsr     (WaitForWindowMovementEnd).w
                move.w  #$A7C0,((word_FFB07E-$1000000)).w
                move.w  #$14,((BLINK_COUNTER-$1000000)).w
                move.w  #6,((word_FFB07C-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_HandlePortraitBlinking
                move.b  #$FF,((byte_FFB082-$1000000)).w
                lea     ((ENTITY_DATA-$1000000)).w,a0
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w
                bne.s   loc_11D1A
                clr.w   d0
                bra.s   loc_11D32
loc_11D1A:
                
                move.w  -2(a6),d0
                jsr     j_GetCurrentHP
                tst.w   d1
                bne.s   loc_11D2C
                clr.w   d0
                bra.s   loc_11D32
loc_11D2C:
                
                jsr     j_GetEntityIndex
loc_11D32:
                
                move.l  a1,-(sp)
                move.w  d0,d1
                addi.w  #$10,d1
                lea     ((byte_FFAFA0-$1000000)).w,a1
                adda.w  d1,a1
                move.b  (a1),d1
                move.w  d1,-(sp)
                move.b  #1,(a1)
                lsl.w   #5,d0
                adda.w  d0,a0
                move.w  #$240,d0
                move.w  #$740,d1
                tst.b   ((MAP_AREA_LAYER_TYPE-$1000000)).w
                bne.s   loc_11D64
                add.w   ((VIEW_PLANE_B_PIXEL_X-$1000000)).w,d0
                add.w   ((VIEW_PLANE_B_PIXEL_Y-$1000000)).w,d1
                bra.s   loc_11D6C
loc_11D64:
                
                add.w   ((VIEW_PLANE_A_PIXEL_X-$1000000)).w,d0
                add.w   ((VIEW_PLANE_A_PIXEL_Y-$1000000)).w,d1
loc_11D6C:
                
                move.b  $11(a0),d7
                move.w  d7,-(sp)
                move.w  $C(a0),-(sp)
                move.w  $E(a0),-(sp)
                move.w  $10(a0),-(sp)
                move.w  d0,(a0)
                move.w  d1,2(a0)
                move.w  d0,$C(a0)
                move.w  d1,$E(a0)
                move.b  #$40,$11(a0) 
                andi.b  #$7F,$1D(a0) 
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w
                bne.s   loc_11DBC
                clr.b   ((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                move.w  -2(a6),d0
                jsr     j_GetAllyMapSprite
                clr.w   d0
                moveq   #3,d1
                moveq   #$FFFFFFFF,d2
                move.w  d4,d3
                jsr     (UpdateEntityProperties).w
                bra.s   loc_11DDC
loc_11DBC:
                
                move.w  -2(a6),d0
                jsr     j_GetCurrentHP
                tst.w   d1
                bne.s   loc_11DDC
                clr.b   ((SPRITES_TO_LOAD_NUMBER-$1000000)).w
                clr.w   d0
                moveq   #3,d1
                moveq   #$FFFFFFFF,d2
                move.w  #$AB,d3 
                jsr     (UpdateEntityProperties).w
loc_11DDC:
                
                move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d0
                andi.b  #INPUT_B|INPUT_C|INPUT_A,d0
                beq.s   loc_11DDC
                move.w  (sp)+,$10(a0)
                move.w  (sp)+,d1
                move.w  (sp)+,d0
                move.w  d0,(a0)
                move.w  d1,2(a0)
                move.w  d0,$C(a0)
                move.w  d1,$E(a0)
                move.w  (sp)+,d7
                move.b  d7,$11(a0)
                move.w  (sp)+,d0
                move.b  d0,(a1)
                movea.l (sp)+,a1
                clr.b   ((byte_FFB082-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_REMOVE
                dc.l VInt_HandlePortraitBlinking
                move.w  -4(a6),d0
                move.w  #$2001,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  -8(a6),d0
                move.w  #$F80B,d1
                jsr     (MoveWindowWithSfx).w
                move.w  -$C(a6),d0
                blt.s   loc_11E40
                move.w  -6(a6),d0
                move.w  #$F8F6,d1
                jsr     (MoveWindowWithSfx).w
loc_11E40:
                
                move.w  -2(a6),d0
                tst.b   d0
                blt.s   loc_11E54
                move.w  -$A(a6),d0
                move.w  #$F81C,d1
                jsr     (MoveWindowWithSfx).w
loc_11E54:
                
                clr.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
                jsr     (WaitForVInt).w
                cmpi.b  #NOT_CURRENTLY_IN_BATTLE,((CURRENT_BATTLE-$1000000)).w
                bne.s   loc_11E94
                clr.w   d0
                tst.b   ((PLAYER_TYPE-$1000000)).w
                bne.s   loc_11E74
                jsr     j_GetAllyMapSprite
                bra.s   loc_11E82
loc_11E74:
                
                cmpi.b  #1,((PLAYER_TYPE-$1000000)).w
                bne.s   loc_11E80
                moveq   #$3E,d4 
                bra.s   loc_11E82
loc_11E80:
                
                moveq   #$3D,d4 
loc_11E82:
                
                clr.w   d0
                clr.w   d1
                move.b  $10(a0),d1
                moveq   #$FFFFFFFF,d2
                move.w  d4,d3
                jsr     (UpdateEntityProperties).w
                bra.s   loc_11EBA
loc_11E94:
                
                move.w  -2(a6),d0
                jsr     j_GetCurrentHP
                tst.w   d1
                bne.s   loc_11EBA
                clr.w   d0
                jsr     j_GetAllyMapSprite
                clr.w   d0
                clr.w   d1
                move.b  $10(a0),d1
                moveq   #$FFFFFFFF,d2
                move.w  d4,d3
                jsr     (UpdateEntityProperties).w
loc_11EBA:
                
                jsr     (WaitForWindowMovementEnd).w
                move.w  -$A(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                move.w  -8(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                move.w  -6(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                move.w  -4(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                unlk    a6
                movem.l (sp)+,d0-a2
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function BuildMemberStatsScreen


; =============== S U B R O U T I N E =======================================

; In: A1 = address of VDP tile order in RAM

AddStatusEffectTileIndexesToVdpTileOrder:
                
                move.l  d0,(a1)
                subq.l  #4,a1
                cmpi.w  #VDPTILE_ASCII_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT,(a1)
                beq.s   @Return
                movea.l -6(a6),a1
                adda.w  #$78,a1 
@Return:
                
                rts

    ; End of function AddStatusEffectTileIndexesToVdpTileOrder


; =============== S U B R O U T I N E =======================================

LoadTileDataForMemberScreen:
                
                move.w  -4(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  -2(a6),d0
                bsr.w   BuildMemberStatsWindow
                move.w  -8(a6),d0
                lea     AllyKillDefeatWindowLayout(pc), a0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #WINDOW_MEMBER_KD_VDPTILEORDER_BYTESIZE,d7
                jsr     (CopyBytes).w   
                adda.w  #WINDOW_MEMBER_KD_TEXT_KILLS_OFFSET,a1
                move.w  -2(a6),d0
                tst.b   d0
                blt.s   loc_11F5A       ; character index is negative (an enemy), so do not display kills
                jsr     j_GetKills
                move.w  d1,d0
                ext.l   d0
                moveq   #WINDOW_MEMBER_KD_TEXT_KILLS_LENGTH,d7
                bsr.w   WriteTilesFromNumber
                adda.w  #WINDOW_MEMBER_KD_TEXT_DEFEATS_OFFSET,a1
                move.w  -2(a6),d0
                jsr     j_GetDefeats
                move.w  d1,d0
                ext.l   d0
                moveq   #WINDOW_MEMBER_KD_TEXT_DEFEATS_LENGTH,d7
                bsr.w   WriteTilesFromNumber
loc_11F5A:
                
                tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
                beq.s   loc_11FA6
                move.w  -8(a6),d0
                lea     AllyKillDefeatWindowLayout(pc), a0
                move.w  #$101,d1
                jsr     (GetWindowTileAddress).w
                move.w  -2(a6),d0       ; get character index from stack
                lsr.w   #4,d0
                andi.w  #$F,d0
                cmpi.w  #$A,d0
                blt.s   loc_11F86
                addi.w  #-$3FC9,d0
                bra.s   loc_11F8A
loc_11F86:
                
                addi.w  #-$3FD0,d0
loc_11F8A:
                
                move.w  d0,(a1)+
                move.w  -2(a6),d0
                andi.w  #$F,d0
                cmpi.w  #$A,d0
                blt.s   loc_11FA0
                addi.w  #-$3FC9,d0
                bra.s   loc_11FA4
loc_11FA0:
                
                addi.w  #-$3FD0,d0
loc_11FA4:
                
                move.w  d0,(a1)+
loc_11FA6:
                
                move.w  -$C(a6),d0
                blt.s   return_11FEA
                move.w  -6(a6),d0
                lea     WindowBorderTiles(pc), a0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #$A0,d7 
                jsr     (CopyBytes).w   
                lea     GoldWindowLayout(pc), a0
                move.w  -$A(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #$40,d7 
                jsr     (CopyBytes).w   
                adda.w  #$22,a1 
                jsr     j_GetGold
                move.l  d1,d0
                moveq   #6,d7
                bsr.w   WriteTilesFromNumber
return_11FEA:
                
                rts

    ; End of function LoadTileDataForMemberScreen

aNA:            dc.b 'N/A',0

; =============== S U B R O U T I N E =======================================

BuildMemberStatsWindow:
                
                link    a6,#-6
                move.w  d0,-2(a6)
                move.l  a1,-6(a6)
                movea.l (p_WindowLayout_MemberStats).l,a0
                move.w  #WINDOW_MEMBER_STATS_VDPTILEORDER_BYTESIZE,d7
                jsr     (CopyBytes).w   
                move.w  -2(a6),d0
                movea.l -6(a6),a1
                adda.w  #WINDOW_MEMBER_STATS_TEXT_CLASS_OFFSET,a1
                tst.b   d0
                blt.s   @WriteMemberName
                jsr     j_GetClass
                jsr     j_GetClassName
                moveq   #$FFFFFFD6,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                addq.w  #2,a1
@WriteMemberName:
                
                move.w  -2(a6),d0
                jsr     j_GetCombatantName
                moveq   #$FFFFFFD6,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
@AddStatusEffectTiles:
                
                movea.l -6(a6),a1
                adda.w  #WINDOW_MEMBER_STATS_STATUSEFFECT_TILES_OFFSET,a1
                lea     ((byte_FFB852-$1000000)).w,a0 ; unused (?)
                move.w  -2(a6),d0
                jsr     j_GetStatus
                move.w  d1,d2
                andi.w  #STATUSEFFECTS_MASK_CURSE,d2
                beq.s   @AddTiles_Poison
                move.l  #VDPTILES_STATUSEFFECT_CURSE,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@AddTiles_Poison:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECTS_MASK_POISON,d2
                beq.s   @AddTiles_Muddle
                move.l  #VDPTILES_STATUSEFFECT_POISON,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@AddTiles_Muddle:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECTS_MASK_MUDDLE1,d2
                beq.s   @AddTiles_Silence
                move.l  #VDPTILES_STATUSEFFECT_MUDDLE,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@AddTiles_Silence:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECTS_MASK_SILENCE,d2
                beq.s   @AddTiles_Stun
                move.l  #VDPTILES_STATUSEFFECT_SILENCE,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@AddTiles_Stun:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECTS_MASK_STUN,d2
                beq.s   @AddTiles_Sleep
                move.l  #VDPTILES_STATUSEFFECT_STUN,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@AddTiles_Sleep:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECTS_MASK_SLEEP,d2
                beq.s   @AddTiles_Attack
                move.l  #VDPTILES_STATUSEFFECT_SLEEP,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@AddTiles_Attack:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECTS_MASK_ATTACK,d2
                beq.s   @AddTiles_Boost
                move.l  #VDPTILES_STATUSEFFECT_ATTACK,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@AddTiles_Boost:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECTS_MASK_BOOST,d2
                beq.s   @AddTiles_Slow
                move.l  #VDPTILES_STATUSEFFECT_BOOST,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@AddTiles_Slow:
                
                move.w  d1,d2
                andi.w  #STATUSEFFECTS_MASK_SLOW,d2
                beq.s   @WriteCurrentHP
                move.l  #VDPTILES_STATUSEFFECT_SLOW,d0
                bsr.w   AddStatusEffectTileIndexesToVdpTileOrder
@WriteCurrentHP:
                
                move.w  -2(a6),d0
                jsr     j_GetCurrentHP
                cmpi.w  #STATS_UNKNOWN_VALUE_THRESHOLD,d1
                bge.s   @WriteMaxHP
                movea.l -6(a6),a1
                adda.w  #WINDOW_MEMBER_STATS_CURRENT_HP_OFFSET,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteMaxHP:
                
                move.w  -2(a6),d0
                jsr     j_GetMaxHP
                cmpi.w  #STATS_UNKNOWN_VALUE_THRESHOLD,d1
                bge.s   @WriteCurrentMP
                movea.l -6(a6),a1
                adda.w  #WINDOW_MEMBER_STATS_MAX_HP_OFFSET,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteCurrentMP:
                
                move.w  -2(a6),d0
                jsr     j_GetCurrentMP
                cmpi.w  #STATS_UNKNOWN_VALUE_THRESHOLD,d1
                bge.s   @WriteMaxMP
                movea.l -6(a6),a1
                adda.w  #WINDOW_MEMBER_STATS_CURRENT_MP_OFFSET,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteMaxMP:
                
                move.w  -2(a6),d0
                jsr     j_GetMaxMP
                cmpi.w  #STATS_UNKNOWN_VALUE_THRESHOLD,d1
                bge.s   @WriteLevelAndEXP
                movea.l -6(a6),a1
                adda.w  #WINDOW_MEMBER_STATS_MAX_MP_OFFSET,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteLevelAndEXP:
                
                move.w  -2(a6),d0
                tst.b   d0
                blt.s   @NotAvailable
                jsr     j_GetCurrentLevel
                movea.l -6(a6),a1
                adda.w  #WINDOW_MEMBER_STATS_LEVEL_OFFSET,a1
                moveq   #LV_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
                move.w  -2(a6),d0
                jsr     j_GetCurrentEXP
                movea.l -6(a6),a1
                adda.w  #WINDOW_MEMBER_STATS_EXP_OFFSET,a1
                moveq   #EXP_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
                bra.s   @WriteCurrentATT
@NotAvailable:
                
                lea     aNA(pc), a0     
                movea.l -6(a6),a1
                adda.w  #WINDOW_MEMBER_STATS_ENEMY_LEVEL_OFFSET,a1
                moveq   #WINDOW_MEMBER_STATS_NA_LENGTH,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                lea     aNA(pc), a0     
                movea.l -6(a6),a1
                adda.w  #WINDOW_MEMBER_STATS_ENEMY_EXP_OFFSET,a1
                moveq   #WINDOW_MEMBER_STATS_NA_LENGTH,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
@WriteCurrentATT:
                
                move.w  -2(a6),d0
                jsr     j_GetCurrentATT
                cmpi.w  #STATS_UNKNOWN_VALUE_THRESHOLD,d1
                bge.s   @WriteCurrentDEF
                movea.l -6(a6),a1
                adda.w  #WINDOW_MEMBER_STATS_ATT_OFFSET,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteCurrentDEF:
                
                move.w  -2(a6),d0
                jsr     j_GetCurrentDEF
                cmpi.w  #STATS_UNKNOWN_VALUE_THRESHOLD,d1
                bge.s   @WriteCurrentAGI
                movea.l -6(a6),a1
                adda.w  #WINDOW_MEMBER_STATS_DEF_OFFSET,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteCurrentAGI:
                
                move.w  -2(a6),d0
                jsr     j_GetCurrentAGI
                andi.w  #DISPLAYED_AGI_VALUE_MASK,d1
                cmpi.w  #STATS_UNKNOWN_VALUE_THRESHOLD,d1
                bge.s   @WriteCurrentMOV
                movea.l -6(a6),a1
                adda.w  #WINDOW_MEMBER_STATS_AGI_OFFSET,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteCurrentMOV:
                
                move.w  -2(a6),d0
                jsr     j_GetCurrentMOV
                cmpi.w  #STATS_UNKNOWN_VALUE_THRESHOLD,d1
                bge.s   @WriteSpellNames
                movea.l -6(a6),a1
                adda.w  #WINDOW_MEMBER_STATS_MOV_OFFSET,a1
                moveq   #MOV_DIGITS_NUMBER,d7
                move.w  d1,d0
                ext.l   d0
                bsr.w   WriteTilesFromNumber
@WriteSpellNames:
                
                move.w  #$C6D0,d7
                move.w  -2(a6),d0
                clr.w   d1
                jsr     j_GetSpellAndNumberOfSpells
                movea.l -6(a6),a1
                adda.w  #$224,a1
                move.l  a1,-(sp)
                moveq   #3,d6
@SpellNames_Loop:
                
                move.w  -2(a6),d0
                move.w  #3,d1
                sub.w   d6,d1
                jsr     j_GetSpellAndNumberOfSpells
                cmpi.b  #$3F,d1 
                beq.w   @Loop_Done
                movem.l d1/a0,-(sp)
                jsr     j_GetSpellDefAddress
                btst    #SPELLPROPS_BIT_AFFECTEDBYSILENCE,SPELLDEF_OFFSET_PROPS(a0)
                movem.l (sp)+,d1/a0
                beq.w   @SpellNames_Skip
                bsr.w   CopyMemberScreenIconsToVdpTileOrder
                movem.w d0-d1/d6-d7,-(sp)
                movem.l a0-a1,-(sp)
                jsr     j_FindSpellName
                addq.w  #4,a1
                moveq   #$FFFFFFD6,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movem.l (sp)+,a0-a1
                movem.w (sp)+,d0-d1/d6-d7
                movem.w d6-d7,-(sp)
                movem.l a0-a1,-(sp)
                lea     word_110E4(pc), a0
                andi.w  #$C0,d1 
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsr.w   #4,d1
                adda.w  d1,a0
                adda.w  #$58,a1 
                moveq   #$C,d7
                jsr     (CopyBytes).w   
                movem.l (sp)+,a0-a1
                movem.w (sp)+,d6-d7
                adda.w  #$7E,a1 
@SpellNames_Skip:
                
                dbf     d6,@SpellNames_Loop
@Loop_Done:
                
                movea.l (sp)+,a0
                cmpa.l  a0,a1
                bne.w   @WriteItemNames
                move.w  d7,-(sp)
                lea     aNothing_0(pc), a0
                movea.l -6(a6),a1
                adda.w  #$250,a1
                moveq   #$FFFFFFD6,d1
                moveq   #$A,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d7
@WriteItemNames:
                
                move.w  -2(a6),d0
                clr.w   d1
                jsr     j_GetItemAndNumberOfItems
                tst.w   d2
                beq.w   Write_Nothing
                movea.l -6(a6),a1
                adda.w  #$236,a1
                moveq   #3,d6
@ItemNames_Loop:
                
                move.w  -2(a6),d0
                move.w  #3,d1
                sub.w   d6,d1
                jsr     j_GetItemAndNumberOfItems
                cmpi.b  #ITEM_NOTHING,d1
                beq.w   CopyJewelIcons
                bsr.w   CopyMemberScreenIconsToVdpTileOrder
                movem.w d0-d1/d6-d7,-(sp)
                movem.l a0-a1,-(sp)
                jsr     j_FindItemName
                addq.w  #4,a1
                moveq   #$FFFFFFD6,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movem.l (sp)+,a0-a1
                movem.w (sp)+,d0-d1/d6-d7
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.w   @Next
                movem.w d6-d7,-(sp)
                movem.l a0-a1,-(sp)
                lea     aEquipped_0(pc), a0
                adda.w  #$58,a1 
                moveq   #$FFFFFFD6,d1
                moveq   #$A,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                movem.l (sp)+,a0-a1
                movem.w (sp)+,d6-d7
@Next:
                
                adda.w  #$7E,a1 
                dbf     d6,@ItemNames_Loop
                bra.w   CopyJewelIcons
aNothing_0:
                
                dc.b '\Nothing',0
aEquipped_0:
                
                dc.b '\Equipped',0
aNothing_1:
                
                dc.b '\Nothing',0
aJewel:
                
                dc.b 'JEWEL',0
Write_Nothing:
                
                move.w  d7,-(sp)
                lea     aNothing_1(pc), a0
                movea.l -6(a6),a1
                adda.w  #$262,a1
                moveq   #$FFFFFFD6,d1
                moveq   #$A,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d7
CopyJewelIcons:
                
                move.w  -2(a6),d0
                bne.s   @DrawSpellIcons
                chkFlg  $180            ; Set after Bowie obtains the jewel of light/evil... whichever it is
                beq.s   @DrawSpellIcons
                move.w  d7,-(sp)
                lea     aJewel(pc), a0  
                movea.l -6(a6),a1
                adda.w  #$374,a1
                moveq   #$FFFFFFD6,d1
                moveq   #8,d7
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  (sp)+,d7
                movea.l -6(a6),a1
                adda.w  #$39E,a1
                move.w  #$92,d1 
                bsr.w   CopyMemberScreenIconsToVdpTileOrder
                chkFlg  $181            ; Set after Bowie obtains King Galam's jewel
                beq.s   @DrawSpellIcons
                movea.l -6(a6),a1
                adda.w  #$3A2,a1
                move.w  #$92,d1 
                bsr.w   CopyMemberScreenIconsToVdpTileOrder
                movea.l -6(a6),a1
                move.w  #VDPTILE_ASCII_UPPERCASE_S|VDPTILE_PALETTE3|VDPTILE_PRIORITY_BIT,$37E(a1)
@DrawSpellIcons:
                
                lea     (byte_FF9004).l,a1
                moveq   #3,d6
@SpellIcons_Loop:
                
                moveq   #3,d1
                sub.w   d6,d1
                move.w  -2(a6),d0
                jsr     j_GetSpellAndNumberOfSpells
                cmpi.b  #SPELL_NOTHING,d1
                beq.w   @DrawItemIcons
                movem.l d1/a0,-(sp)
                jsr     j_GetSpellDefAddress
                btst    #SPELLPROPS_BIT_AFFECTEDBYSILENCE,SPELLDEF_OFFSET_PROPS(a0)
                movem.l (sp)+,d1/a0
                beq.s   @SpellIcons_Skip
                move.l  a0,-(sp)
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                addi.w  #ICON_HEAL,d1
                movea.l (p_IconTiles).l,a0
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                adda.w  d1,a0
                move.w  #$C0,d7 
                jsr     (CopyBytes).w   
                ori.b   #$F0,(a1)
                ori.b   #$F,$23(a1)
                ori.b   #$F0,$9C(a1)
                ori.b   #$F,$BF(a1)
                movea.l (sp)+,a0
                adda.w  #$C0,a1 
@SpellIcons_Skip:
                
                dbf     d6,@SpellIcons_Loop
@DrawItemIcons:
                
                moveq   #3,d6
@ItemIcons_Loop:
                
                moveq   #3,d1
                sub.w   d6,d1
                move.w  -2(a6),d0
                jsr     j_GetItemAndNumberOfItems
                cmpi.b  #ITEM_NOTHING,d1
                beq.w   @DrawJewelIcons
                move.l  a0,-(sp)
                move.w  d1,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                movea.l (p_IconTiles).l,a0
                mulu.w  #$C0,d1 
                adda.w  d1,a0
                move.w  #$C0,d7 
                jsr     (CopyBytes).w   
                move.w  (sp)+,d1
                btst    #ITEMENTRY_BIT_BROKEN,d1
                beq.s   @CleanIconCorners
                movem.l d2-d3/a0-a1,-(sp)
                movea.l (p_IconTiles).l,a0
                lea     ICON_OFFSET_CRACKS(a0),a0
                move.w  #$BF,d2 
@DrawCracks_Loop:
                
                move.b  (a0)+,d3
                beq.s   @DrawCracks_Skip
                andi.w  #$F0,d3 
                beq.s   @_1
                andi.b  #$F,(a1)
@_1:
                
                move.b  -1(a0),d3
                andi.w  #$F,d3
                beq.s   @_2
                andi.b  #$F0,(a1)
@_2:
                
                move.b  -1(a0),d3
                or.b    d3,(a1)
@DrawCracks_Skip:
                
                addq.l  #1,a1
                dbf     d2,@DrawCracks_Loop
                movem.l (sp)+,d2-d3/a0-a1
@CleanIconCorners:
                
                ori.b   #$F0,(a1)
                ori.b   #$F,$23(a1)
                ori.b   #$F0,$9C(a1)
                ori.b   #$F,$BF(a1)
                movea.l (sp)+,a0
                adda.w  #$C0,a1 
                dbf     d6,@ItemIcons_Loop
@DrawJewelIcons:
                
                move.w  #ICON_JEWEL_OF_LIGHT,d1
                movea.l (p_IconTiles).l,a0
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                adda.w  d1,a0
                move.w  #$C0,d7 
                jsr     (CopyBytes).w   
                ori.b   #$F0,(a1)
                ori.b   #$F,$23(a1)
                ori.b   #$F0,$9C(a1)
                ori.b   #$F,$BF(a1)
                adda.w  #$C0,a1 
                move.w  #ICON_JEWEL_OF_EVIL,d1
                movea.l (p_IconTiles).l,a0
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                adda.w  d1,a0
                move.w  #$C0,d7 
                jsr     (CopyBytes).w   
                ori.b   #$F0,(a1)
                ori.b   #$F,$23(a1)
                ori.b   #$F0,$9C(a1)
                ori.b   #$F,$BF(a1)
                adda.w  #$C0,a1 
                lea     (byte_FF9004).l,a0
                lea     ($DA00).l,a1
                move.w  #$300,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                unlk    a6
                rts

    ; End of function BuildMemberStatsWindow

                dc.w $FFFF              ; useless padding bytes

; =============== S U B R O U T I N E =======================================

CopyMemberScreenIconsToVdpTileOrder:
                
                move.w  d7,(a1)
                addq.w  #1,d7
                move.w  d7,2(a1)
                addq.w  #1,d7
                move.w  d7,$2A(a1)
                addq.w  #1,d7
                move.w  d7,$2C(a1)
                addq.w  #1,d7
                move.w  d7,$54(a1)
                addq.w  #1,d7
                move.w  d7,$56(a1)
                addq.w  #1,d7
                rts

    ; End of function CopyMemberScreenIconsToVdpTileOrder


; =============== S U B R O U T I N E =======================================

sub_12606:
                
                lea     (PLANE_B_LAYOUT).l,a0
                move.w  #$97F,d0
loc_12610:
                
                move.w  (a0)+,d1
                andi.w  #$6000,d1
                bne.s   loc_1261C
                clr.w   -2(a0)
loc_1261C:
                
                dbf     d0,loc_12610
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$800,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jmp     (WaitForDmaQueueProcessing).w

    ; End of function sub_12606

