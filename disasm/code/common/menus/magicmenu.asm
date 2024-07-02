
; ASM FILE code\common\menus\magicmenu.asm :
; 0x10A4A..0x10E1C : Battlefield magic menu actions

; =============== S U B R O U T I N E =======================================

; In: A0 = special subroutine address to handle menu, default handling if not supplied
;     D0 = initial choice (00=up, 01=left, 02=right, 03=down)
;     D1 = animate-in direction (00=from bottom, other=from right)
;     D2 = menu index to use (just affects icons and text)

windowSlot = -12
animationDirection = -10
subroutineAddress = -8
menuIndex = -4

ExecuteBattlefieldMagicMenu:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                link    a6,#65524
                move.w  d2,menuIndex(a6)
                move.l  a0,subroutineAddress(a6)
                move.w  d1,animationDirection(a6)
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                move.w  #$1206,d0
                tst.w   d1
                bne.s   loc_10A70
                move.w  #$C1D,d1
                bra.s   loc_10A74
loc_10A70:
                
                move.w  #$2015,d1
loc_10A74:
                
                jsr     (CreateWindow).w
                move.w  d0,windowSlot(a6)
                bsr.w   BuildMagicMenu
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
                bsr.w   dmaSelectedIcon_Up
                bsr.w   dmaSelectedIcon_Left
                bsr.w   dmaSelectedIcon_Right
                bsr.w   dmaSelectedIcon_Down
                move.w  windowSlot(a6),d0
                move.w  #$C15,d1
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
loc_10ACC:
                
                move.l  subroutineAddress(a6),d0
                beq.s   loc_10AD6
                movea.l d0,a0
                jsr     (a0)
loc_10AD6:
                
                moveq   #$1E,d6
loc_10AD8:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10AF2
                moveq   #1,d1
                cmpi.w  #SPELL_NOTHING,((DISPLAYED_ICON_2-$1000000)).w
                beq.s   loc_10AF2
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_10B76
loc_10AF2:
                
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10B0C
                moveq   #2,d1
                cmpi.w  #SPELL_NOTHING,((DISPLAYED_ICON_3-$1000000)).w
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
                cmpi.w  #SPELL_NOTHING,((DISPLAYED_ICON_4-$1000000)).w
                beq.s   loc_10B38
                sndCom  SFX_MENU_SELECTION
                bra.w   loc_10B76
loc_10B38:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10B4E
                moveq   #-1,d1
                moveq   #-1,d0
                move.b  #-1,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bra.w   loc_10BEC
loc_10B4E:
                
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10B62
                clr.w   d1
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   loc_10BBC
loc_10B62:
                
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10BA6
                clr.w   d1
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bra.w   loc_10BBC
loc_10B76:
                
                move.w  d1,-(sp)
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                clr.w   d6
                bsr.w   DmaSelectedIcon_0
                move.w  (sp)+,d0
                move.b  d0,((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w
                bsr.w   BuildMagicMenu
                move.w  windowSlot(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                move.l  subroutineAddress(a6),d0
                beq.s   loc_10BA4
                movea.l d0,a0
                jsr     (a0)
loc_10BA4:
                
                moveq   #$1D,d6
loc_10BA6:
                
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                bsr.w   DmaSelectedIcon_0
                subq.w  #1,d6
                bne.s   loc_10BB4
                moveq   #$1E,d6
loc_10BB4:
                
                jsr     (WaitForVInt).w
                bra.w   loc_10AD8
loc_10BBC:
                
                clr.w   d0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                add.w   d0,d0
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.w  (a0,d0.w),d0
                bsr.w   SelectSpellLevel
                cmpi.w  #-1,d0
                bne.w   loc_10BEC
                
                bsr.w   BuildMagicMenu
                move.w  windowSlot(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                bra.w   loc_10ACC
loc_10BEC:
                
                movem.w d0-d1,-(sp)
                move.w  windowSlot(a6),d0
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
                move.w  windowSlot(a6),d0
                jsr     (DeleteWindow).w
                movem.w (sp)+,d0-d1
                unlk    a6
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function ExecuteBattlefieldMagicMenu


; =============== S U B R O U T I N E =======================================

windowSlot = -12
animationDirection = -10
subroutineAddress = -8
menuIndex = -4

BuildMagicMenu:
                
                lea     layout_MagicMenu(pc), a0
                move.w  windowSlot(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #MENU_MAGIC_LAYOUT_BYTESIZE,d7
                jsr     (CopyBytes).w   
                lsl.w   #1,d0
                lea     ((DISPLAYED_ICON_1-$1000000)).w,a0
                move.b  ((CURRENT_DIAMOND_MENU_CHOICE-$1000000)).w,d0
                andi.w  #3,d0
                lsl.w   #1,d0
                move.w  (a0,d0.w),d1
                move.w  d1,((TEMP_ITEM_OR_SPELL-$1000000)).w
                move.w  d1,-(sp)
                jsr     j_FindSpellName
                move.w  windowSlot(a6),d0
                move.w  #MENU_MAGIC_SPELL_NAME_COORDS,d1
                jsr     (GetWindowTileAddress).w
                moveq   #-36,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  windowSlot(a6),d0
                move.w  #MENU_MAGIC_SPELL_LEVEL_TILES_COORDS,d1
                jsr     (GetWindowTileAddress).w
                move.w  (sp)+,d1
                move.w  d1,-(sp)
                lea     layout_SpellLevelIndicator(pc), a0
                andi.w  #$C0,d1 
                move.w  d1,d2
                add.w   d1,d1
                add.w   d2,d1
                lsr.w   #NIBBLE_SHIFT_COUNT,d1
                adda.w  d1,a0
                moveq   #12,d7
                jsr     (CopyBytes).w   
            if (STANDARD_BUILD=1)
                move.w  (sp)+,d1
                jsr     GetSpellCost
                move.w  d1,d0
                moveq   #3,d7
                adda.w  #MENU_MAGIC_OFFSET_MP_COST,a1
            else
                move.w  windowSlot(a6),d0
                move.w  #MENU_MAGIC_MP_COST_COORDS,d1
                jsr     (GetWindowTileAddress).w
                move.w  (sp)+,d1
                jsr     j_GetSpellCost
                move.w  d1,d0
                moveq   #3,d7
            endif
                bsr.w   WriteTilesFromNumber
                rts

    ; End of function BuildMagicMenu


; =============== S U B R O U T I N E =======================================

; related to menu choice


DmaSelectedIcon_0:
                
                andi.w  #3,d0
                add.w   d0,d0
                move.w  rjt_DmaSelectedIconFunctions_0(pc,d0.w),d0
                jmp     rjt_DmaSelectedIconFunctions_0(pc,d0.w)

    ; End of function DmaSelectedIcon_0

rjt_DmaSelectedIconFunctions_0:
                dc.w (dmaSelectedIcon_Up-rjt_DmaSelectedIconFunctions_0) & $FFFF
                dc.w (dmaSelectedIcon_Left-rjt_DmaSelectedIconFunctions_0) & $FFFF
                dc.w (dmaSelectedIcon_Right-rjt_DmaSelectedIconFunctions_0) & $FFFF
                dc.w (dmaSelectedIcon_Down-rjt_DmaSelectedIconFunctions_0) & $FFFF

; =============== S U B R O U T I N E =======================================

; In: d0.w = displayed spell icon. Out: d0.w = selection (-1 if pressed B)


SelectSpellLevel:
                
                 
                sndCom  SFX_VALIDATION
                move.w  d0,-(sp)
                lea     tiles_TextHighlight(pc), a0
                lea     ($BC00).l,a1
                move.w  #$A0,d0 
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                move.w  (sp)+,d0
                move.w  d0,d4
                lsr.w   #SPELLENTRY_OFFSET_LV,d4
                move.w  d4,d5
                andi.w  #SPELLENTRY_MASK_INDEX,d0
                jsr     (WaitForVInt).w
loc_10CF4:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_10D0A
                subq.w  #1,d5
                cmpi.w  #-1,d5
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
                moveq   #-1,d0
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

    ; End of function SelectSpellLevel


; =============== S U B R O U T I N E =======================================

windowSlot = -12
animationDirection = -10
subroutineAddress = -8
menuIndex = -4

sub_10D56:
                
                 
                sndCom  SFX_MENU_SELECTION
                movem.w d0-d5,-(sp)
                lsl.w   #INDEX_SHIFT_COUNT,d4
                add.w   d5,d4
                lsl.w   #INDEX_SHIFT_COUNT,d4
                lea     pt_layouts_SpellLevelIndicator(pc), a0
                nop
                movea.l (a0,d4.w),a0
                move.w  d0,-(sp)
                move.w  windowSlot(a6),d0
                move.w  #MENU_MAGIC_SPELL_LEVEL_TILES_COORDS,d1
                jsr     (GetWindowTileAddress).w
                move.w  #12,d7
                jsr     (CopyBytes).w   
                move.w  (sp)+,d1
                lsl.w   #6,d5
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                or.w    d5,d1
                move.w  d1,((TEMP_ITEM_OR_SPELL-$1000000)).w
                jsr     j_GetSpellCost
                move.w  d1,d0
                moveq   #3,d7
                adda.w  #MENU_MAGIC_OFFSET_MP_COST,a1
                bsr.w   WriteTilesFromNumber
                move.l  subroutineAddress(a6),d0
                beq.s   loc_10DAE
                movea.l d0,a0
                jsr     (a0)
loc_10DAE:
                
                move.w  windowSlot(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                movem.w (sp)+,d0-d5
                moveq   #19,d6
loc_10DC0:
                
                bsr.w   LoadSpellLevelHighlightSprites
                jsr     (WaitForVInt).w
                subq.w  #1,d6
                bne.s   loc_10DCE
                moveq   #20,d6
loc_10DCE:
                
                bra.w   loc_10CF4

    ; End of function sub_10D56

sprite_SpellLevelHighlight:
                
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
                
                vdpSprite 316, V2|H4|9, 1504|PALETTE3|PRIORITY, 292
                vdpSprite 316, V2|H4|16, 1504|MIRROR|PALETTE3|PRIORITY, 316

; =============== S U B R O U T I N E =======================================

; In: d6.w = blinking frame timer


LoadSpellLevelHighlightSprites:
                
                lea     (SPRITE_BATTLE_CURSOR).l,a1
                lea     sprite_SpellLevelHighlight(pc), a0
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                cmpi.w  #10,d6
                bge.s   @loc_1
                
                move.w  #1,-16(a1)
                move.w  #1,-8(a1)
@loc_1:
                
                tst.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                beq.s   @loc_2
                
                move.w  #1,-16(a1)
                move.w  #1,-8(a1)
@loc_2:
                
                bra.w   LinkHighlightSprites

    ; End of function LoadSpellLevelHighlightSprites

