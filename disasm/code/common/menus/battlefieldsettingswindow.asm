
; ASM FILE code\common\menus\battlefieldsettingswindow.asm :
; 0x1586E..0x15A5A : Battlefield settings window functions

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
                bsr.w   GetCurrentBattlefieldSettingValue
                moveq   #20,d6          ; blinking frame timer
loc_158D6:
                
                bsr.w   LoadBattlefieldSettingsHighlightSprites
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
                bsr.w   GetCurrentBattlefieldSettingValue
loc_15906:
                
                btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   loc_15916
                eori.w  #1,d4
                bsr.w   GetCurrentBattlefieldSettingValue
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
                moveq   #20,d6
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


LoadBattlefieldSettingsHighlightSprites:
                
                tst.w   ((HIDE_WINDOWS_TOGGLE-$1000000)).w
                bne.s   MoveCursorEntityOffScreen
                movem.w d3-d4/d7,-(sp)
                lea     (SPRITE_BATTLE_CURSOR).l,a0
                lea     sprite_BattlefieldSettings(pc), a1
                clr.w   d3
                getSavedByte MESSAGE_SPEED, d3
                lsl.w   #NIBBLE_SHIFT_COUNT,d3
                tst.w   d4
                bne.s   @loc_1
                cmpi.w  #7,d6
                bge.s   @loc_1
                move.w  #$FF00,d3
@loc_1:
                
                move.w  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.w  (a1)+,(a0)
                add.w   d3,(a0)+
                clr.w   d3
                getSavedByte NO_BATTLE_MESSAGES_TOGGLE, d3
                lsl.w   #6,d3
                tst.w   d4
                beq.s   @loc_2
                cmpi.w  #7,d6
                bge.s   @loc_2
                move.w  #$FF00,d3
@loc_2:
                
                moveq   #2,d7
@Loop:
                
                move.w  (a1)+,(a0)+
                move.l  (a1)+,(a0)+
                move.w  (a1)+,(a0)
                add.w   d3,(a0)+
                dbf     d7,@Loop
                
                bsr.w   LinkHighlightSprites
                movem.w (sp)+,d3-d4/d7
                rts

    ; End of function LoadBattlefieldSettingsHighlightSprites

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

; In: d4.w = 0 to get message speed, or 1 to get no battle messages toggle
; Out: d3.w


GetCurrentBattlefieldSettingValue:
                
                module
                clr.w   d3
                tst.w   d4
                bne.s   @GetNoBattleMessagesToggle
                getSavedByte MESSAGE_SPEED, d3
                andi.w  #3,d3
                bra.s   byte_15A38
@GetNoBattleMessagesToggle:
                
                getSavedByte NO_BATTLE_MESSAGES_TOGGLE, d3
                andi.w  #1,d3
byte_15A38:
                
                sndCom  SFX_MENU_SELECTION
                rts

    ; End of function GetCurrentBattlefieldSettingValue

                modend

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

