
; ASM FILE code\common\menus\ministatuswindow.asm :
; 0x11572..0x11AEC : Menu engine, part 3 : Mini status window functions

; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index


OpenBattlefieldMiniStatusWindow:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                movem.l d0-a2,-(sp)
                move.w  d0,-(sp)
                move.w  #WINDOW_MINISTATUS_SIZE,d0
                move.w  #WINDOW_MINISTATUS_DEST,d1
                lea     ((MINISTATUS_WINDOW_INDEX-$1000000)).w,a2
                tst.b   ((IS_TARGETING-$1000000)).w
                beq.s   @CreateWindow
                addq.l  #2,a2
                addi.w  #21,d1
@CreateWindow:
                
                jsr     (CreateWindow).w
                move.w  d0,(a2)
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  (sp)+,d0
                bsr.w   BuildMiniStatusWindow
                move.w  #1,d1
                move.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,d3
                move.w  #31,d4
                sub.w   d3,d4
                lsl.w   #BYTE_SHIFT_COUNT,d4
                or.w    d4,d1
                moveq   #4,d2
                tst.b   ((IS_TARGETING-$1000000)).w
                beq.s   @MoveWindow
                addi.w  #21,d1
@MoveWindow:
                
                move.w  (a2),d0
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForVInt).w
                bsr.w   DmaHpAndMpBarTiles
                jsr     (WaitForWindowMovementEnd).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function OpenBattlefieldMiniStatusWindow


; =============== S U B R O U T I N E =======================================

; Move window off screen, then clear it from memory.


CloseBattlefieldMiniStatusWindow:
                
                movem.l d0-a2,-(sp)
                lea     ((MINISTATUS_WINDOW_INDEX-$1000000)).w,a2
                tst.b   ((IS_TARGETING-$1000000)).w
                beq.s   @Continue
                addq.l  #2,a2
@Continue:
                
                move.w  (a2),d0
                move.w  #WINDOW_MINISTATUS_DEST,d1
                tst.b   ((IS_TARGETING-$1000000)).w
                beq.s   @MoveWindow
                addi.w  #21,d1
@MoveWindow:
                
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  (a2),d0
                jsr     (DeleteWindow).w
                movem.l (sp)+,d0-a2
                subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                rts

    ; End of function CloseBattlefieldMiniStatusWindow


; =============== S U B R O U T I N E =======================================


CreateBattlesceneMiniStatusWindows:
                
                jsr     (InitializeWindowProperties).w
                move.w  #WINDOW_MINISTATUS_SIZE,d0
                move.w  #WINDOW_MINISTATUS_DEST,d1
                jsr     (CreateWindow).w
                move.w  #WINDOW_MINISTATUS_SIZE,d0
                move.w  #WINDOW_MINISTATUS_DEST,d1
                jsr     (CreateWindow).w
                rts

    ; End of function CreateBattlesceneMiniStatusWindows


; =============== S U B R O U T I N E =======================================

; In: d0.b = ally index
;     d1.w = ?


OpenAllyBattlesceneMiniStatusWindow:
                
                module
                cmpi.b  #-1,d0
                beq.w   return_11714
                
                movem.l d0-a1,-(sp)
                move.w  d1,-(sp)
                clr.b   ((IS_TARGETING-$1000000)).w
                movem.w d0,-(sp)
                clr.w   d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                movem.w (sp)+,d0
                bsr.w   BuildMiniStatusWindow
                move.w  (sp)+,d1
                bne.s   @loc_1
                move.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,d3
                move.w  #31,d1
                sub.w   d3,d1
                lsl.w   #BYTE_SHIFT_COUNT,d1
                bra.s   @loc_2
@loc_1:
                
                move.w  #256,d1
@loc_2:
                
                ori.w   #1,d1
                clr.w   d0
                moveq   #1,d2
                jsr     (MoveWindow).l  
                jsr     (WaitForVInt).w
                bsr.w   DmaHpAndMpBarTiles
                jsr     (WaitForWindowMovementEnd).w
                movem.l (sp)+,d0-a1
                rts

    ; End of function OpenAllyBattlesceneMiniStatusWindow


; =============== S U B R O U T I N E =======================================


CloseAllyBattlesceneMiniStatusWindow:
                
                cmpi.b  #-1,d0
                beq.w   return_11714
                
                movem.l d0-a1,-(sp)
                clr.b   ((IS_TARGETING-$1000000)).w
                clr.w   d0
                move.w  #$2006,d1
                moveq   #1,d2
                jsr     (MoveWindow).l  
                movem.l (sp)+,d0-a1
                rts

    ; End of function CloseAllyBattlesceneMiniStatusWindow


; =============== S U B R O U T I N E =======================================

; In: d0.b = enemy index
;     d1.w = ?


OpenEnemyBattlesceneMiniStatusWindow:
                
                cmpi.b  #-1,d0
                beq.w   return_11714
                
                movem.l d0-a1,-(sp)
                move.w  d1,-(sp)
                move.b  #-1,((IS_TARGETING-$1000000)).w
                movem.w d0,-(sp)
                moveq   #1,d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                movem.w (sp)+,d0
                bsr.w   BuildMiniStatusWindow
                move.w  (sp)+,d1
                beq.s   @loc_3
                move.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,d3
                move.w  #31,d1
                sub.w   d3,d1
                lsl.w   #BYTE_SHIFT_COUNT,d1
                bra.s   @loc_4
@loc_3:
                
                move.w  #256,d1
@loc_4:
                
                ori.w   #$14,d1
                moveq   #1,d0
                moveq   #1,d2
                jsr     (MoveWindow).l  
                jsr     (WaitForVInt).w
                bsr.w   DmaHpAndMpBarTiles
                jsr     (WaitForWindowMovementEnd).w
                movem.l (sp)+,d0-a1
return_11714:
                
                rts

    ; End of function OpenEnemyBattlesceneMiniStatusWindow


; =============== S U B R O U T I N E =======================================


CloseEnemyBattlesceneMiniStatusWindow:
                
                cmpi.b  #-1,d0
                beq.s   return_11714
                
                movem.l d0-a1,-(sp)
                move.b  #-1,((IS_TARGETING-$1000000)).w
                moveq   #1,d0
                move.w  #$2006,d1
                moveq   #1,d2
                jsr     (MoveWindow).l  
                movem.l (sp)+,d0-a1
                rts

    ; End of function CloseEnemyBattlesceneMiniStatusWindow

                modend

; =============== S U B R O U T I N E =======================================

; Draw colored stat bars into ministatus window layout at A1
; 
; In: A0 = loading space address
;     D0 = current HP/MP value
;     D1 = max HP/MP value
;     D2 = VDP tile index


DrawColoredStatBar:
                
                movem.l d0-a1,-(sp)
                tst.b   ((IS_TARGETING-$1000000)).w
                beq.s   @InitVdpTileEntry
                addi.w  #10,d2          ; draw bar in bottom left window
@InitVdpTileEntry:
                
                ori.w   #VDPTILE_PALETTE3|VDPTILE_PRIORITY,d2
                cmp.w   d0,d1
                bge.s   @ClearLoadingSpace ; keep highest of current or max stat value
                move.w  d0,d1
@ClearLoadingSpace:
                
                move.l  a0,-(sp)
                moveq   #111,d7
@ClearLoadingSpace_Loop:
                
                clr.l   (a0)+
                dbf     d7,@ClearLoadingSpace_Loop
                movea.l (sp)+,a0
                
                ; Draw an empty column
                clr.w   d7
                moveq   #1,d4
                bsr.w   WriteStatBarColumn
                
                ; Draw left border
                clr.w   d4
                bsr.w   WriteStatBarColumn
                ext.l   d0
                divs.w  #100,d0
                move.w  d0,d4
                addq.w  #3,d4           ; stat bar color index -> D4
                clr.w   d6
                swap    d0              ; D0 = remainder of current value / 100
                cmpi.w  #100,d1
                ble.s   @DrawStatBarContent ; stat bar content capped at 100 columns
                moveq   #99,d3
                bra.s   @DrawStatBarContent_Loop
@DrawStatBarContent:
                
                move.w  d1,d3
                subq.w  #1,d3
                bmi.w   @DrawRightBorder
@DrawStatBarContent_Loop:
                
                cmp.w   d0,d6
                blt.s   @Continue
                subq.w  #1,d4           ; when done drawing remainder of current value, start drawing underlying color
                move.w  #999,d0
@Continue:
                
                bsr.w   WriteStatBarColumn
                addq.w  #1,d6
                dbf     d3,@DrawStatBarContent_Loop
@DrawRightBorder:
                
                clr.w   d4
                bsr.w   WriteStatBarColumn
                moveq   #1,d4
                moveq   #15,d3
@DrawEmptyColumns_Loop:
                
                bsr.w   WriteStatBarColumn
                dbf     d3,@DrawEmptyColumns_Loop
                
                ; Copy VDP tiles into window layout
                movem.l d2/a0,-(sp)
                moveq   #11,d7
                move.l  8(a0),d6        ; get 3rd column in 1st tile -> D6
                move.w  d2,(a1)+
@CopyTiles_Loop:
                
                lea     32(a0),a0       ; advance 8 columns
                move.l  8(a0),d3        ; get 3rd column in current tile -> D3
                cmpi.l  #-1,d3
                beq.w   @Done           ; if 3rd column in current tile is empty, we're done
                cmp.l   d3,d6
                bne.s   @NextTile       ; if 3rd columns in previous and current tiles are not the same, start drawing next VDP tile
                
                ; Shift remaining columns to current position
                moveq   #95,d3
                movem.l a0-a1,-(sp)
                movea.l a0,a1
                lea     32(a1),a1
@ShiftColumns_Loop:
                
                move.l  (a1)+,(a0)+
                dbf     d3,@ShiftColumns_Loop
                
                movem.l (sp)+,a0-a1
                lea     -32(a0),a0
                bra.s   @CopyTile
@NextTile:
                
                move.l  d3,d6
                addq.w  #1,d2           ; increment VDP tile index
@CopyTile:
                
                move.w  d2,(a1)+
                dbf     d7,@CopyTiles_Loop
@Done:
                
                movem.l (sp)+,d2/a0
                movem.l (sp)+,d0-a1
                rts

    ; End of function DrawColoredStatBar


; =============== S U B R O U T I N E =======================================


DmaHpAndMpBarTiles:
                
                movem.l d0-d2/a0-a1,-(sp)
                lea     (FF8804_LOADING_SPACE).l,a0
                moveq   #1,d2           ; HP bar VDP tile start index
                bsr.w   DmaStatBarTiles
                lea     (FF8A04_LOADING_SPACE).l,a0
                moveq   #6,d2           ; MP bar VDP tile start index
                bsr.w   DmaStatBarTiles
                movem.l (sp)+,d0-d2/a0-a1
                rts

    ; End of function DmaHpAndMpBarTiles


; =============== S U B R O U T I N E =======================================


DmaStatBarTiles:
                
                tst.b   ((IS_TARGETING-$1000000)).w
                beq.s   @Continue
                addi.w  #10,d2          ; draw bar in bottom left window
@Continue:
                
                lsl.w   #5,d2
                movea.w d2,a1
                move.w  #80,d0
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function DmaStatBarTiles

table_StatBarColumns:
                
; Colors that stay consistant in battlescenes:
; 
;     0 = clear
;     1 = white
;     2 = black
;     5 = green
;     6 = blue
;     7 = orange
;     $A = red
;     $B = yellow
;     $C = brown
;     $F = dark blue (window background)
                
                dc.l $F11111FF          ; white border
                dc.l $FFFFFFFF          ; empty column
                dc.l $1AAAAA1F          ; red
                dc.l $1BBBBB1F          ; yellow
                dc.l $1555551F          ; green
                dc.l $1666661F          ; blue
                dc.l $1222221F          ; black
                dc.l $1222221F          ; black
                dc.l $1222221F          ; black

; =============== S U B R O U T I N E =======================================

; Write one column of HP/MP bar pixels into A0
; 
;     In: D4 = stat bar column index
;         D7 = drawn columns count


WriteStatBarColumn:
                
                movem.l d3-a0,-(sp)
                moveq   #7,d3
                move.w  d7,d6
                andi.w  #7,d6
                lsl.w   #2,d6
                lsr.w   #3,d7
                lsl.w   #5,d7
            if (STANDARD_BUILD&FIX_GARBLED_HP_BAR=1)
                cmpi.w  #(WriteStatBarColumn-table_StatBarColumns-4)/4,d4
                ble.s   @Continue
                moveq   #(WriteStatBarColumn-table_StatBarColumns-4)/4,d4
            endif
@Continue:
                
                lsl.w   #INDEX_SHIFT_COUNT,d4
                move.l  table_StatBarColumns(pc,d4.w),d4
@Loop:
                
                move.l  d4,d5
                andi.l  #$F0000000,d5
                lsr.l   d6,d5
                or.l    d5,(a0,d7.w)
                rol.l   #4,d4
                addq.l  #4,a0
                dbf     d3,@Loop
                
                movem.l (sp)+,d3-a0
                addq.w  #1,d7
                rts

    ; End of function WriteStatBarColumn


; =============== S U B R O U T I N E =======================================

; ; Check ASCII name at a0 for two special characters.


AdjustStringLengthForSpecialCharacters:
                
                movem.w d0/a0,-(sp)
                move.w  d7,d0
                subq.w  #1,d0
                bmi.w   @Return
@Loop:
                
                cmpi.b  #VDPTILE_ORANGE_DOLLAR_SIGN,(a0)
                bne.s   @Continue
                subq.w  #1,d7
@Continue:
                
                cmpi.b  #VDPTILE_ORANGE_PERCENT_SIGN,(a0)+
                bne.s   @Next
                subq.w  #1,d7
@Next:
                
                dbf     d0,@Loop
                movem.w (sp)+,d0/a0
@Return:
                
                rts

    ; End of function AdjustStringLengthForSpecialCharacters


; =============== S U B R O U T I N E =======================================

; In: a1 = window tiles address, d0.w = combatant index

windowLayoutStartAddress = -8
combatant = -2

BuildMiniStatusWindow:
                
                link    a6,#-8
                move.l  a1,windowLayoutStartAddress(a6)
                
                ; Clear window tiles
                movem.l d7/a1,-(sp)
                move.w  #WINDOW_MINISTATUS_LONGWORD_COUNTER,d7
@Clear_Loop:
                
                clr.l   (a1)+
                dbf     d7,@Clear_Loop
                movem.l (sp)+,d7/a1
                
                ; Get highest of HP or MP stat bar length -> D6
                ext.w   d0
                move.w  d0,combatant(a6)
                jsr     j_GetCurrentHp
                move.w  d1,d2
                jsr     j_GetMaxHp
                move.w  d1,d3
                movem.w d2-d3,-(sp)     ; -> push current/max HP values
                jsr     j_GetCurrentMp
                move.w  d1,d2
                jsr     j_GetMaxMp
                move.w  d1,d3
                movem.w (sp)+,d0-d1     ; D0, D1 <- pull current/max HP values
                move.w  d1,d6
                cmp.w   d1,d3           ; keep highest of HP or MP
                ble.s   @CapStatBarLength
                move.w  d3,d6
@CapStatBarLength:
                
                cmpi.w  #WINDOW_MINISTATUS_MAX_STATBAR_LENGTH,d6
                ble.s   @CalculateStatBarLinesWidth
                moveq   #WINDOW_MINISTATUS_MAX_STATBAR_LENGTH,d6
@CalculateStatBarLinesWidth:
                
                addq.w  #3,d6
                lsr.w   #3,d6
                addi.w  #WINDOW_MINISTATUS_MIN_WIDTH,d6
                
                ; Calculate header line width (name, class, level) -> D4
                movem.w d0-d1/d7,-(sp)
                move.w  combatant(a6),d0
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
                cmpi.w  #10,d1
                blt.s   @Continue
                addq.w  #1,d4
@Continue:
                
                bra.s   @DetermineWindowWidth
@EnemyName:
                
                jsr     j_GetCombatantName
                bsr.w   AdjustStringLengthForSpecialCharacters
                move.w  d7,d4
                addq.w  #2,d4
@DetermineWindowWidth:
                
                movem.w (sp)+,d0-d1/d7
                
                ; Keep widest of stat bar or header lines
                cmp.w   d4,d6
                bge.s   @CopyTileColumns
                move.w  d4,d6
@CopyTileColumns:
                
                move.w  d6,((MINISTATUS_WINDOW_WIDTH-$1000000)).w
                lea     layout_MiniStatusWindow(pc), a0
                movea.l windowLayoutStartAddress(a6),a1
                
                ; Copy leftmost columns
                bsr.w   WriteOneMiniStatusWindowTileColumn
                bsr.w   WriteOneMiniStatusWindowTileColumn
                bsr.w   WriteOneMiniStatusWindowTileColumn
                move.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,d7
                subi.w  #WINDOW_MINISTATUS_SIDECOLUMNS_NUMBER_PLUS_ONE,d7
@CopyMiddleColumns_Loop:
                
                lea     layout_MiniStatusWindowBody(pc), a0
                nop
                bsr.w   WriteOneMiniStatusWindowTileColumn
                dbf     d7,@CopyMiddleColumns_Loop
                
                ; Copy rightmost columns
                lea     layout_MiniStatusWindowTail(pc), a0
                nop
                bsr.w   WriteOneMiniStatusWindowTileColumn
                bsr.w   WriteOneMiniStatusWindowTileColumn
                bsr.w   WriteOneMiniStatusWindowTileColumn
                bsr.w   WriteOneMiniStatusWindowTileColumn
                bsr.w   WriteOneMiniStatusWindowTileColumn
                
                ; Write name, class, level
                movem.w d0-d3,-(sp)
                move.w  combatant(a6),d0
                jsr     j_GetCombatantName
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_LINE,a1
                addq.l  #2,a1
                moveq   #-44,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                addq.w  #2,a1
                move.w  combatant(a6),d0
                blt.s   @DrawStatBars   ; skip if enemy
                jsr     j_GetClass
                jsr     j_GetClassName
                move.w  #-44,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  combatant(a6),d0
                jsr     j_GetCurrentLevel
                move.w  d1,d0
                ext.l   d0
                moveq   #LV_DIGITS_NUMBER,d7
                cmpi.w  #10,d0
                bge.s   @WriteLevel
                subq.w  #1,d7
@WriteLevel:
                
                bsr.w   WriteTilesFromNumber
@DrawStatBars:
                
                movem.w (sp)+,d0-d3
                
                ; Draw HP bar
                movem.w d0-d3,-(sp)
                movem.w d2-d3,-(sp)     ; -> push current/max MP values
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_TWO_LINES,a1
                addq.w  #WINDOW_MINISTATUS_OFFSET_STATBARS_START,a1
                move.l  a1,-(sp)        ; -> push stat bars start address
                lea     (FF8804_LOADING_SPACE).l,a0
                moveq   #1,d2           ; HP bar VDP tile start index
                bsr.w   DrawColoredStatBar
                
                ; Draw MP bar
                movea.l (sp)+,a1        ; A1 <- pull stat bars start address
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_LINE,a1
                movem.w (sp)+,d0-d1     ; D0, D1 <- pull current/max MP values
                tst.w   d1
                beq.s   @WriteStatValues ; skip if 0 max MP
                lea     (FF8A04_LOADING_SPACE).l,a0
                moveq   #6,d2           ; MP bar VDP tile start index
                bsr.w   DrawColoredStatBar
@WriteStatValues:
                
                movem.w (sp)+,d0-d3
                
                ; Write current HP
                ext.l   d0
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_TWO_LINES,a1
                move.l  a1,-(sp)
                adda.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,a1
                adda.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,a1
                suba.w  #WINDOW_MINISTATUS_OFFSET_STAT_VALUES,a1
                move.l  a1,-(sp)
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                
                ; Write max HP
                movea.l (sp)+,a1
                addq.l  #WINDOW_MINISTATUS_OFFSET_MAX_HP,a1
                move.w  d1,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                
                ; Write current MP
                movea.l (sp)+,a1
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_LINE,a1
                adda.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,a1
                adda.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,a1
                suba.w  #WINDOW_MINISTATUS_OFFSET_STAT_VALUES,a1
                move.l  a1,-(sp)
                move.w  d2,d0
                ext.l   d0
                movea.l (sp)+,a1
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                
                ; Write max MP
                addq.l  #2,a1
                move.w  d3,d0
                ext.l   d0
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                
                unlk    a6
                rts

    ; End of function BuildMiniStatusWindow


; =============== S U B R O U T I N E =======================================

; Write stat value d0.w or '??' if above 99


WriteStatValue:
                
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d0
                bge.s   @WriteUnknownValueString
                ext.l   d0
                bra.w   WriteTilesFromNumber
                bra.s   aUnknownValue   ; bad instruction
@WriteUnknownValueString:
                
                lea     aUnknownValue(pc), a0
                bra.w   WriteTilesFromAsciiWithRegularFont

    ; End of function WriteStatValue

aUnknownValue:  dc.b '??'

; =============== S U B R O U T I N E =======================================

; Draw tiles from a0 into a1 (one column)


WriteOneMiniStatusWindowTileColumn:
                
                movem.l a1,-(sp)
                move.w  (a0)+,(a1)
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_LINE,a1
                move.w  (a0)+,(a1)
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_LINE,a1
                move.w  (a0)+,(a1)
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_LINE,a1
                move.w  (a0)+,(a1)
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_LINE,a1
                move.w  (a0)+,(a1)
                movem.l (sp)+,a1
                addq.w  #2,a1
                rts

    ; End of function WriteOneMiniStatusWindowTileColumn

