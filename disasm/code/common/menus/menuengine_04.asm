
; ASM FILE code\common\menus\menuengine_04.asm :
; 0x11B46..0x11FF0 : Menu engine

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
                
                if (FORCE_MEMBERS_EXPANSION=0)
                bsr.w   GetAllyPortrait 
                endif
                
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

; Create and display member screen
; 
;       In: D0 = member index

portraitIndex = -12
goldWindowSlot = -10
kdWindowSlot = -8
portraitWindowSlot = -6
statusWindowSlot = -4
member = -2

BuildMemberScreen:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                movem.l d0-a2,-(sp)
                link    a6,#-16
                move.w  d0,member(a6)
                clr.b   ((PORTRAIT_IS_FLIPPED-$1000000)).w
                clr.b   ((PORTRAIT_IS_ON_RIGHT-$1000000)).w
                move.w  #WINDOW_MEMBERSTATUS_SIZE,d0
                move.w  #WINDOW_MEMBERSTATUS_DEST,d1
                jsr     (CreateWindow).w ; stats window, on the right
                move.w  d0,statusWindowSlot(a6)
                move.w  #WINDOW_MEMBER_PORTRAIT_SIZE,d0
                move.w  #WINDOW_MEMBER_PORTRAIT_DEST,d1
                jsr     (CreateWindow).w ; portrait, upper left
                move.w  d0,portraitWindowSlot(a6)
                addq.w  #1,d0
                move.w  d0,((PORTRAIT_WINDOW_INDEX-$1000000)).w
                move.w  #WINDOW_MEMBER_KD_SIZE,d0
                move.w  #WINDOW_MEMBER_KD_DEST,d1
                jsr     (CreateWindow).w ; kills/defeat, middle left
                move.w  d0,kdWindowSlot(a6)
                move.w  #WINDOW_MEMBER_GOLD_SIZE,d0
                move.w  #WINDOW_MEMBER_GOLD_DEST,d1
                jsr     (CreateWindow).w ; gold, bottom left
                move.w  d0,goldWindowSlot(a6)
                move.w  member(a6),d0
                bsr.w   GetCombatantPortrait
                move.w  d0,portraitIndex(a6)
                bsr.w   LoadTileDataForMemberScreen
                move.w  portraitIndex(a6),d0
                blt.s   loc_11CA6
                
                if (FORCE_MEMBERS_EXPANSION=0)
                bsr.w   GetAllyPortrait 
                endif
                
                bsr.w   LoadPortrait    
loc_11CA6:
                
                move.w  statusWindowSlot(a6),d0
                move.w  #WINDOW_MEMBERSTATUS_POSITION,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  kdWindowSlot(a6),d0
                move.w  #WINDOW_MEMBER_KD_POSITION,d1
                jsr     (MoveWindowWithSfx).w
                move.w  portraitIndex(a6),d0
                blt.s   loc_11CD2
                move.w  portraitWindowSlot(a6),d0
                move.w  #WINDOW_MEMBER_PORTRAIT_POSITION,d1
                jsr     (MoveWindowWithSfx).w
loc_11CD2:
                
                move.w  member(a6),d0
                tst.b   d0
                blt.s   loc_11CE6
                move.w  goldWindowSlot(a6),d0
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
                
                move.w  member(a6),d0
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
                move.w  member(a6),d0
                jsr     j_GetAllyMapSprite
                clr.w   d0
                moveq   #3,d1
                moveq   #$FFFFFFFF,d2
                move.w  d4,d3
                jsr     (UpdateEntityProperties).w
                bra.s   loc_11DDC
loc_11DBC:
                
                move.w  member(a6),d0
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
                move.w  statusWindowSlot(a6),d0
                move.w  #$2001,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                move.w  kdWindowSlot(a6),d0
                move.w  #$F80B,d1
                jsr     (MoveWindowWithSfx).w
                move.w  portraitIndex(a6),d0
                blt.s   loc_11E40
                move.w  portraitWindowSlot(a6),d0
                move.w  #$F8F6,d1
                jsr     (MoveWindowWithSfx).w
loc_11E40:
                
                move.w  member(a6),d0
                tst.b   d0
                blt.s   loc_11E54
                move.w  goldWindowSlot(a6),d0
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
                
                move.w  member(a6),d0
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
                move.w  goldWindowSlot(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                move.w  kdWindowSlot(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                move.w  portraitWindowSlot(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                move.w  statusWindowSlot(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                unlk    a6
                movem.l (sp)+,d0-a2
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function BuildMemberScreen


; =============== S U B R O U T I N E =======================================

; In: A1 = address of VDP tile order in RAM

windowTilesAddress = -6
member = -2

AddStatusEffectTileIndexesToVdpTileOrder:
                
                move.l  d0,(a1)
                subq.l  #4,a1
                cmpi.w  #VDPTILE_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)
                beq.s   @Return
                
                if (THREE_DIGITS_STATS|FULL_CLASS_NAMES=0)
                movea.l windowTilesAddress(a6),a1
                adda.w  #$78,a1
                else
                addi.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,d3
                movea.l d3,a1
                endif
                
@Return:
                
                rts

    ; End of function AddStatusEffectTileIndexesToVdpTileOrder


; =============== S U B R O U T I N E =======================================

portraitIndex = -12
goldWindowSlot = -10
kdWindowSlot = -8
portraitWindowSlot = -6
statusWindowSlot = -4
member = -2

LoadTileDataForMemberScreen:
                
                move.w  statusWindowSlot(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  member(a6),d0
                bsr.w   BuildMemberStatusWindow
                move.w  kdWindowSlot(a6),d0
                lea     AllyKillDefeatWindowLayout(pc), a0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #WINDOW_MEMBER_KD_VDPTILEORDER_BYTESIZE,d7
                jsr     (CopyBytes).w   
                
                if (ALTERNATE_JEWEL_ICONS_DISPLAY=1)
                ; Display small jewel icons next to Bowie's mapsprite
                tst.w   -2(a6)
                bne.s   @SkipJewels         ; skip if anyone other than Bowie
                move.l  a1,-(sp)
                adda.w  #26,a1              ; offset into window layout
                chkFlg  $180            ; Set after Bowie obtains the jewel of light/evil... whichever it is
                beq.s   @CheckJewelOfEvil
                move.w  #VDPTILE_JEWEL_OF_LIGHT|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)
@CheckJewelOfEvil:
                
                chkFlg  $181            ; Set after Bowie obtains King Galam's jewel
                beq.s   @SkipJewelOfEvil
                adda.w  #2,a1
                move.w  #VDPTILE_JEWEL_OF_EVIL|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)
@SkipJewelOfEvil:
                
                movea.l (sp)+,a1
@SkipJewels:
                endif
                
                adda.w  #WINDOW_MEMBER_KD_TEXT_KILLS_OFFSET,a1
                move.w  member(a6),d0
                tst.b   d0
                blt.s   @CheckDebugMode ; character index is negative (an enemy), so do not display kills
                
                ; Write kills and defeats
                jsr     j_GetKills
                move.w  d1,d0
                ext.l   d0
                moveq   #WINDOW_MEMBER_KD_TEXT_KILLS_LENGTH,d7
                bsr.w   WriteTilesFromNumber
                adda.w  #WINDOW_MEMBER_KD_TEXT_DEFEATS_OFFSET,a1
                move.w  member(a6),d0
                jsr     j_GetDefeats
                move.w  d1,d0
                ext.l   d0
                moveq   #WINDOW_MEMBER_KD_TEXT_DEFEATS_LENGTH,d7
                bsr.w   WriteTilesFromNumber
@CheckDebugMode:
                
                tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
                beq.s   @CheckPortrait
                
                ; Write combatant index inside kills/defeat window in debug mode
                move.w  kdWindowSlot(a6),d0
                lea     AllyKillDefeatWindowLayout(pc), a0
                move.w  #$101,d1
                jsr     (GetWindowTileAddress).w
                move.w  member(a6),d0   ; get character index from stack
                lsr.w   #4,d0
                andi.w  #$F,d0
                cmpi.w  #10,d0
                blt.s   @Continue1
                addi.w  #-$3FC9,d0
                bra.s   @WriteIndexFirstDigit
@Continue1:
                
                addi.w  #-$3FD0,d0
@WriteIndexFirstDigit:
                
                move.w  d0,(a1)+
                move.w  member(a6),d0
                andi.w  #$F,d0
                cmpi.w  #10,d0
                blt.s   @Continue2
                addi.w  #-$3FC9,d0
                bra.s   @WriteIndexSecondDigit
@Continue2:
                
                addi.w  #-$3FD0,d0
@WriteIndexSecondDigit:
                
                move.w  d0,(a1)+
@CheckPortrait:
                
                move.w  portraitIndex(a6),d0
                blt.s   @Return         ; return if no portrait to display (and assume that it's an enemy, so skip drawing gold window as well)
                
                move.w  portraitWindowSlot(a6),d0
                lea     WindowBorderTiles(pc), a0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #$A0,d7 
                jsr     (CopyBytes).w   
                lea     GoldWindowLayout(pc), a0
                move.w  goldWindowSlot(a6),d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  #$40,d7 
                jsr     (CopyBytes).w   
                adda.w  #$22,a1 
                jsr     j_GetGold
                move.l  d1,d0
                moveq   #6,d7
                bsr.w   WriteTilesFromNumber
@Return:
                
                rts

    ; End of function LoadTileDataForMemberScreen

aNA:            dc.b 'N/A',0
