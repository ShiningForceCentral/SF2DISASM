
; ASM FILE code\common\menus\menuengine_08.asm :
; 0x15772..0x15A5A : Menu engine

; =============== S U B R O U T I N E =======================================


CreateLandEffectWindow:
                
                movem.l d0-a2,-(sp)
                move.w  #WINDOW_LANDEFFECT_SIZE,d0
                move.w  #WINDOW_LANDEFFECT_DEST,d1
                jsr     (CreateWindow).w
                addq.w  #1,d0
                move.w  d0,((LAND_EFFECT_WINDOW_INDEX-$1000000)).w
                bsr.w   DrawLandEffectWindow
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$201,d1
                move.w  #4,d2
                cmpi.w  #WINDOW_MINISTATUS_MAX_WIDTH,((MINISTATUS_WINDOW_WIDTH-$1000000)).w
                blt.s   loc_157A6
                move.w  #$101,d1
loc_157A6:
                
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function CreateLandEffectWindow


; =============== S U B R O U T I N E =======================================


HideLandEffectWindow:
                
                tst.w   ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w
                beq.w   @Return
                movem.l d0-a2,-(sp)
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #WINDOW_LANDEFFECT_DEST,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                clr.w   ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w
                movem.l (sp)+,d0-a2
@Return:
                
                rts

    ; End of function HideLandEffectWindow


; =============== S U B R O U T I N E =======================================


sub_157E8:
                
                tst.w   ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w
                beq.w   @Return
                movem.l d0-a2,-(sp)
                bsr.w   DrawLandEffectWindow
                tst.b   ((HIDE_WINDOWS-$1000000)).w
                bne.s   @Done
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
@Done:
                
                movem.l (sp)+,d0-a2
@Return:
                
                rts

    ; End of function sub_157E8


; =============== S U B R O U T I N E =======================================


DrawLandEffectWindow:
                
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.l  a1,d3
                move.w  #WINDOW_LANDEFFECT_SIZE,d0
                bsr.w   CopyWindowTilesToRam
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetLandEffectSetting
                move.w  d1,d0
                mulu.w  #15,d0
                moveq   #-16,d1
                moveq   #2,d7
                movea.l d3,a1
                adda.w  #WINDOW_LANDEFFECT_TEXT_VALUE_OFFSET,a1
                bsr.w   WriteTilesFromNumber
                move.b  #VDPTILE_PERCENT_SIGN,1(a1)
                moveq   #-16,d1
                moveq   #WINDOW_LANDEFFECT_TEXT_HEADER_LENGTH,d7
                movea.l d3,a1
                adda.w  #WINDOW_LANDEFFECT_TEXT_HEADER_OFFSET,a1
                lea     aLandEffect(pc), a0
                nop
                bsr.w   WriteTilesFromAsciiWithRegularFont
                rts

    ; End of function DrawLandEffectWindow

aLandEffect:    if (THREE_DIGITS_STATS=0)
                dc.b 'LAND',$B,'EFFECT',0
                else
                dc.b 'LE'
                endif

; =============== S U B R O U T I N E =======================================

; related to battlefield options

displayBattleMessage = -10
messageSpeed = -8
windowSlot = -6
windowTilesEnd = -4

sub_1586E:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                movem.l d0-a1,-(sp)
                link    a6,#-16
                move.b  ((MESSAGE_SPEED-$1000000)).w,displayBattleMessage(a6)
                move.b  ((DISPLAY_BATTLE_MESSAGES-$1000000)).w,messageSpeed(a6)
                move.w  #$1309,d0
                move.w  #$71C,d1
                jsr     (CreateWindow).l
                move.w  d0,windowSlot(a6)
                move.l  a1,windowTilesEnd(a6)
                bsr.w   CopyBattlefieldOptionsMenuLayout
                move.w  windowSlot(a6),d0
                move.w  #$712,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                lea     AlphabetHighlightTiles(pc), a0
                lea     ($B800).l,a1
                move.w  #$C0,d0 
                moveq   #2,d1
                jsr     (ApplyVIntVramDmaOnCompressedTiles).w
                jsr     (EnableDmaQueueProcessing).w
                jsr     (WaitForWindowMovementEnd).l
                clr.w   d4
                bsr.w   sub_15A20
                moveq   #$14,d6
loc_158D6:
                
                bsr.w   sub_159A0
                btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_158E8
                addq.w  #1,d3
                bsr.w   sub_15A3E
loc_158E8:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_158F6
                subq.w  #1,d3
                bsr.w   sub_15A3E
loc_158F6:
                
                btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_15906
                eori.w  #1,d4
                bsr.w   sub_15A20
loc_15906:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_15916
                eori.w  #1,d4
                bsr.w   sub_15A20
loc_15916:
                
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_15940
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_1594C
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.w   loc_1594C
                jsr     (WaitForVInt).w
                subq.w  #1,d6
                bne.s   loc_1593E
                moveq   #$14,d6
loc_1593E:
                
                bra.s   loc_158D6
loc_15940:
                
                move.b  displayBattleMessage(a6),((MESSAGE_SPEED-$1000000)).w
                move.b  messageSpeed(a6),((DISPLAY_BATTLE_MESSAGES-$1000000)).w
loc_1594C:
                
                move.w  windowSlot(a6),d0
                move.w  #$71E,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                bsr.w   sub_1598C
                jsr     (WaitForWindowMovementEnd).l
                move.w  windowSlot(a6),d0
                jsr     (ClearWindowAndUpdateEndPointer).l
                unlk    a6
                movem.l (sp)+,d0-a1
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function sub_1586E


; =============== S U B R O U T I N E =======================================

displayBattleMessage = -10
messageSpeed = -8
windowSlot = -6
windowTilesEnd = -4

CopyBattlefieldOptionsMenuLayout:
                
                lea     BattleConfigWindowLayout(pc), a0
                movea.l windowTilesEnd(a6),a1
                move.w  #$156,d7
                jmp     (CopyBytes).w   

    ; End of function CopyBattlefieldOptionsMenuLayout


; =============== S U B R O U T I N E =======================================


sub_1598C:
                
                lea     (SPRITE_08).l,a0
                moveq   #3,d7
loc_15994:
                
                move.w  #1,(a0)
                addq.l  #8,a0
                dbf     d7,loc_15994
                rts

    ; End of function sub_1598C


; =============== S U B R O U T I N E =======================================


sub_159A0:
                
                tst.w   ((HIDE_WINDOWS-$1000000)).w
                bne.s   sub_1598C
                movem.w d3-d4/d7,-(sp)
                lea     (SPRITE_08).l,a0
                lea     spr_BattleConfig(pc), a1
                clr.w   d3
                move.b  ((MESSAGE_SPEED-$1000000)).w,d3
                lsl.w   #4,d3
                tst.w   d4
                bne.s   loc_159CA
                cmpi.w  #7,d6
                bge.s   loc_159CA
                move.w  #$FF00,d3
loc_159CA:
                
                move.w  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.w  (a1)+,(a0)
                add.w   d3,(a0)+
                clr.w   d3
                move.b  ((DISPLAY_BATTLE_MESSAGES-$1000000)).w,d3
                lsl.w   #6,d3
                tst.w   d4
                beq.s   loc_159E8
                cmpi.w  #7,d6
                bge.s   loc_159E8
                move.w  #$FF00,d3
loc_159E8:
                
                moveq   #2,d7
loc_159EA:
                
                move.w  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.w  (a1)+,(a0)
                add.w   d3,(a0)+
                dbf     d7,loc_159EA
                bsr.w   sub_101E6
                movem.w (sp)+,d3-d4/d7
                rts

    ; End of function sub_159A0

spr_BattleConfig:
                ; Red boxes highlighting currently selected battle config options
                
; Syntax        vdpSprite Y, [VDPSPRITESIZE_]bitfield, [VDPTILE_]bitfield, X
                
                vdpSprite 292, V2|H2|9, 1480|PALETTE3|PRIORITY, 228
                vdpSprite 324, V2|H3|10, 1472|PALETTE3|PRIORITY, 196
                vdpSprite 324, V2|H2|11, 1474|PALETTE3|PRIORITY, 220
                vdpSprite 324, V2|H3|16, 1474|PALETTE3|PRIORITY, 236

; =============== S U B R O U T I N E =======================================


sub_15A20:
                
                clr.w   d3
                tst.w   d4
                bne.s   loc_15A30
                move.b  ((MESSAGE_SPEED-$1000000)).w,d3
                andi.w  #3,d3
                bra.s   byte_15A38
loc_15A30:
                
                move.b  ((DISPLAY_BATTLE_MESSAGES-$1000000)).w,d3
                andi.w  #1,d3
byte_15A38:
                
                sndCom  SFX_MENU_SELECTION
                rts

    ; End of function sub_15A20


; =============== S U B R O U T I N E =======================================


sub_15A3E:
                
                tst.w   d4
                bne.s   loc_15A4C
                andi.w  #3,d3
                move.b  d3,((MESSAGE_SPEED-$1000000)).w
                bra.s   byte_15A54
loc_15A4C:
                
                andi.w  #1,d3
                move.b  d3,((DISPLAY_BATTLE_MESSAGES-$1000000)).w
byte_15A54:
                
                sndCom  SFX_MENU_SELECTION
                rts

    ; End of function sub_15A3E

