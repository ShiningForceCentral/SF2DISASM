
; ASM FILE code\common\menus\menuengine_07.asm :
; 0x15772..0x15A5A : Menu engine

; =============== S U B R O U T I N E =======================================


OpenLandEffectWindow:
                
                movem.l d0-a2,-(sp)
                move.w  #WINDOW_LANDEFFECT_SIZE,d0
                move.w  #WINDOW_LANDEFFECT_DEST,d1
                jsr     (CreateWindow).w
                addq.w  #1,d0
                move.w  d0,((LAND_EFFECT_WINDOW_INDEX-$1000000)).w
                bsr.w   WriteLandEffectWindowLayout
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$201,d1
                move.w  #4,d2
                cmpi.w  #WINDOW_MINISTATUS_MAX_WIDTH,((MINISTATUS_WINDOW_WIDTH-$1000000)).w
                blt.s   @Continue
                move.w  #$101,d1
@Continue:
                
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function OpenLandEffectWindow


; =============== S U B R O U T I N E =======================================


CloseLandEffectWindow:
                
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
                jsr     (DeleteWindow).w
                clr.w   ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w
                movem.l (sp)+,d0-a2
@Return:
                
                rts

    ; End of function CloseLandEffectWindow


; =============== S U B R O U T I N E =======================================


HideLandEffectWindow:
                
                tst.w   ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w
                beq.w   @Return
                movem.l d0-a2,-(sp)
                bsr.w   WriteLandEffectWindowLayout
                tst.b   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                bne.s   @Done
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
@Done:
                
                movem.l (sp)+,d0-a2
@Return:
                
                rts

    ; End of function HideLandEffectWindow


; =============== S U B R O U T I N E =======================================


WriteLandEffectWindowLayout:
                
                move.w  ((LAND_EFFECT_WINDOW_INDEX-$1000000)).w,d0
                subq.w  #1,d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.l  a1,d3
                move.w  #WINDOW_LANDEFFECT_SIZE,d0
                bsr.w   alt_WriteWindowTiles
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
            if (STANDARD_BUILD&ACCURATE_LAND_EFFECT_DISPLAY=1)
                jsr     GetLandEffectSetting
                move.b  table_LandEffectDisplayValues(pc,d1.w),d0
            else
                jsr     j_GetLandEffectSetting
                move.w  d1,d0
                mulu.w  #15,d0
            endif
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

    ; End of function WriteLandEffectWindowLayout

landEffectDisplayValue: macro
                ; Exit macro if parameter is a terminator word
            if (\1=TERMINATOR_WORD)
                mexit
            endif
                ; Otherwise, convert damage multiplier to reduction percent value, rounded to the nearest whole number
value:          set (256-\1)*100/256
remainder:      set (256-\1)*100%256
            if (remainder>127)
value:          set value+1
            endif
                dc.b value
        endm

table_LandEffectDisplayValues:
                
            if (STANDARD_BUILD&ACCURATE_LAND_EFFECT_DISPLAY=1)
                landEffectDisplayValue LE_DMG_MULT_0
                landEffectDisplayValue LE_DMG_MULT_1
                landEffectDisplayValue LE_DMG_MULT_2
                landEffectDisplayValue LE_DMG_MULT_3
                landEffectDisplayValue LE_DMG_MULT_4
                landEffectDisplayValue LE_DMG_MULT_5
                landEffectDisplayValue LE_DMG_MULT_6
                landEffectDisplayValue LE_DMG_MULT_7
                landEffectDisplayValue LE_DMG_MULT_8
                landEffectDisplayValue LE_DMG_MULT_9
                landEffectDisplayValue LE_DMG_MULT_10
                landEffectDisplayValue LE_DMG_MULT_11
                landEffectDisplayValue LE_DMG_MULT_12
                landEffectDisplayValue LE_DMG_MULT_13
                landEffectDisplayValue LE_DMG_MULT_14
                landEffectDisplayValue LE_DMG_MULT_15
                align
            endif
            
aLandEffect:
                
            if (STANDARD_BUILD&THREE_DIGITS_STATS=1)
                dc.b 'LE'
            else
                dc.b 'LAND',$B,'EFFECT',0
            endif

; =============== S U B R O U T I N E =======================================

; related to battlefield options

messageSpeed = -10
noBattleMessagesToggle = -8
windowSlot = -6
windowLayoutEndAddress = -4

BuildBattlefieldSettingsScreen:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                movem.l d0-a1,-(sp)
                link    a6,#-16
                getSavedByte MESSAGE_SPEED, messageSpeed(a6)
                getSavedByte NO_BATTLE_MESSAGES_TOGGLE, noBattleMessagesToggle(a6)
                move.w  #$1309,d0
                move.w  #$71C,d1
                jsr     (CreateWindow).l
                move.w  d0,windowSlot(a6)
                move.l  a1,windowLayoutEndAddress(a6)
                bsr.w   LoadBattlefieldSettingsWindowLayout
                move.w  windowSlot(a6),d0
                move.w  #$712,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                lea     tiles_AlphabetHighlight(pc), a0
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
                bsr.w   SetBattlefieldSettings
loc_158E8:
                
                btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_158F6
                subq.w  #1,d3
                bsr.w   SetBattlefieldSettings
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
                
                setSavedByte messageSpeed(a6), MESSAGE_SPEED
                setSavedByte noBattleMessagesToggle(a6), NO_BATTLE_MESSAGES_TOGGLE
loc_1594C:
                
                move.w  windowSlot(a6),d0
                move.w  #$71E,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).l
                bsr.w   MoveCursorEntityOffScreen
                jsr     (WaitForWindowMovementEnd).l
                move.w  windowSlot(a6),d0
                jsr     (DeleteWindow).l
                unlk    a6
                movem.l (sp)+,d0-a1
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function BuildBattlefieldSettingsScreen


; =============== S U B R O U T I N E =======================================

messageSpeed = -10
noBattleMessagesToggle = -8
windowSlot = -6
windowLayoutEndAddress = -4

LoadBattlefieldSettingsWindowLayout:
                
                lea     layout_BattlefieldSettingsWindow(pc), a0
                movea.l windowLayoutEndAddress(a6),a1
                move.w  #342,d7
                jmp     (CopyBytes).w   

    ; End of function LoadBattlefieldSettingsWindowLayout


; =============== S U B R O U T I N E =======================================


MoveCursorEntityOffScreen:
                
                lea     (SPRITE_BATTLE_CURSOR).l,a0
                moveq   #ENTITY_CURSOR_SPRITES_COUNTER,d7
@Loop:
                
                move.w  #1,(a0)
                addq.l  #VDP_SPRITE_ENTRY_SIZE,a0
                dbf     d7,@Loop
                rts

    ; End of function MoveCursorEntityOffScreen


; =============== S U B R O U T I N E =======================================


sub_159A0:
                
                tst.w   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                bne.s   MoveCursorEntityOffScreen
                movem.w d3-d4/d7,-(sp)
                lea     (SPRITE_BATTLE_CURSOR).l,a0
                lea     sprite_BattlefieldSettings(pc), a1
                clr.w   d3
                getSavedByte MESSAGE_SPEED, d3
                lsl.w   #NIBBLE_SHIFT_COUNT,d3
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
                getSavedByte NO_BATTLE_MESSAGES_TOGGLE, d3
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

sprite_BattlefieldSettings:
                ; Red boxes highlighting currently selected battle config options.
;
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
                
                vdpSprite 292, V2|H2|9, 1480|PALETTE3|PRIORITY, 228
                vdpSprite 324, V2|H3|10, 1472|PALETTE3|PRIORITY, 196
                vdpSprite 324, V2|H2|11, 1474|PALETTE3|PRIORITY, 220
                vdpSprite 324, V2|H3|16, 1474|PALETTE3|PRIORITY, 236

; =============== S U B R O U T I N E =======================================


sub_15A20:
                
                clr.w   d3
                tst.w   d4
                bne.s   loc_15A30
                getSavedByte MESSAGE_SPEED, d3
                andi.w  #3,d3
                bra.s   byte_15A38
loc_15A30:
                
                getSavedByte NO_BATTLE_MESSAGES_TOGGLE, d3
                andi.w  #1,d3
byte_15A38:
                
                sndCom  SFX_MENU_SELECTION
                rts

    ; End of function sub_15A20


; =============== S U B R O U T I N E =======================================


SetBattlefieldSettings:
                
                tst.w   d4
                bne.s   @ToggleBattleMessages
                
                andi.w  #3,d3
                setSavedByte d3, MESSAGE_SPEED
                bra.s   byte_15A54
@ToggleBattleMessages:
                
                andi.w  #1,d3
                setSavedByte d3, NO_BATTLE_MESSAGES_TOGGLE
byte_15A54:
                
                sndCom  SFX_MENU_SELECTION
                rts

    ; End of function SetBattlefieldSettings

