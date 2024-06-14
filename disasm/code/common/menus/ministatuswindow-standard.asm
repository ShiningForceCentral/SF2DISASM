
; ASM FILE code\common\menus\ministatuswindow-standard.asm :
; 

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

; Move window offscreen, then clear it from memory.


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
                move.w  #$1F,d1
                sub.w   d3,d1
                lsl.w   #BYTE_SHIFT_COUNT,d1
                bra.s   @loc_2
@loc_1:
                
                move.w  #$100,d1
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
                move.w  #$1F,d1
                sub.w   d3,d1
                lsl.w   #BYTE_SHIFT_COUNT,d1
                bra.s   @loc_4
@loc_3:
                
                move.w  #$100,d1
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
                clr.w   d7
                
                ; Draw an empty column
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
                
                lea     $20(a0),a0      ; advance 8 columns
                move.l  8(a0),d3        ; get 3rd column in current tile -> D3
                cmpi.l  #-1,d3
                beq.w   @Done           ; if 3rd column in current tile is empty, we're done
                cmp.l   d3,d6
                bne.s   @NextTile       ; if 3rd columns in previous and current tiles are not the same, start drawing next VDP tile
                
                ; Shift remaining columns to current position
                moveq   #95,d3
                movem.l a0-a1,-(sp)
                movea.l a0,a1
                lea     $20(a1),a1
@ShiftColumns_Loop:
                
                move.l  (a1)+,(a0)+
                dbf     d3,@ShiftColumns_Loop
                
                movem.l (sp)+,a0-a1
                lea     -$20(a0),a0
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

; Check ASCII name at A0 for two special characters


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

BuildMiniStatusWindow:
                
windowTilesAddress = -8
combatant = -2
                
                link    a6,#-8
                move.l  a1,windowTilesAddress(a6)
                
                ; Clear window tiles
                move.w d7,-(sp)
                move.w  #WINDOW_MINISTATUS_LONGWORD_COUNTER,d7
                
@Clear_Loop:
                clr.l   (a1)+
                dbf     d7,@Clear_Loop
                move.w (sp)+,d7
                
                ; Get highest of HP or MP stat bar length -> D6
                ext.w   d0
                move.w  d0,combatant(a6)
                jsr     GetCurrentMP
                move.w  d1,d2
                jsr     GetMaxMP
                move.w  d1,d3
                jsr     GetCurrentHP
                move.w  d1,d4
                jsr     GetMaxHP
                move.w  d4,d0
                move.w  d1,d6
                cmp.w   d1,d3               ; keep highest of HP or MP
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
                jsr     GetCombatantName
                bsr.w   AdjustStringLengthForSpecialCharacters
                move.w  d7,d4
                addq.w  #2,d4                   ; add 2 to account for window borders
                tst.b   d0
                bmi.s   @DetermineWindowWidth   ; skip if enemy
                jsr     GetClassAndName
                bsr.w   AdjustStringLengthForSpecialCharacters
                add.w   d7,d4
                addq.w  #2,d4                   ; add 2 to account for space + single level digit
                jsr     GetCurrentLevel
                cmpi.w  #10,d1
                blt.s   @DetermineWindowWidth
                addq.w  #1,d4                   ; add 1 if level 10 or greater
                
@DetermineWindowWidth:
                movem.w (sp)+,d0-d1/d7
                
                ; Keep widest of stat bar or header lines
                cmp.w   d4,d6
                bge.s   @CopyTileColumns
                move.w  d4,d6
                
@CopyTileColumns:
                move.w  d6,((MINISTATUS_WINDOW_WIDTH-$1000000)).w
                lea     layout_MiniStatusWindow(pc), a0
                movea.l windowTilesAddress(a6),a1
                
                ; Copy leftmost columns
                bsr.w   CopyMinistatusWindowTileColumn
                bsr.w   CopyMinistatusWindowTileColumn
                bsr.w   CopyMinistatusWindowTileColumn
                move.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,d7
                subi.w  #WINDOW_MINISTATUS_SIDECOLUMNS_NUMBER_PLUS_ONE,d7
                
@CopyMiddleColumns_Loop:
                lea     layout_MiniStatusWindowBody(pc), a0
                bsr.w   CopyMinistatusWindowTileColumn
                dbf     d7,@CopyMiddleColumns_Loop
                
                ; Copy rightmost columns
                bsr.w   CopyMinistatusWindowTileColumn
                bsr.w   CopyMinistatusWindowTileColumn
                bsr.w   CopyMinistatusWindowTileColumn
            if (THREE_DIGITS_STATS=1)
                suba.w  #10,a0
                bsr.w   CopyMinistatusWindowTileColumn
            endif
                bsr.w   CopyMinistatusWindowTileColumn
                bsr.w   CopyMinistatusWindowTileColumn
                
                ; Write name, class, level
                movem.w d0-d3,-(sp)
                move.w  combatant(a6),d0
                jsr     GetCombatantName
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_LINE,a1
                addq.l  #2,a1
                moveq   #-WINDOW_MINISTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                addq.w  #2,a1
                move.w  combatant(a6),d0
                blt.s   @DrawStatBars   ; skip if enemy
                jsr     GetClassAndName
                moveq   #-WINDOW_MINISTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  combatant(a6),d0
                jsr     GetCurrentLevel
                move.w  d1,d0
                ext.l   d0
                moveq   #2,d7
                cmpi.w  #10,d0
                bge.s   @WriteLevel
                subq.w  #1,d7
                
@WriteLevel:
                bsr.w   WriteTilesFromNumber
                
@DrawStatBars:
                movem.w (sp)+,d0-d3
                
                ; Draw HP bar
                movem.w d0-d3,-(sp)
                movem.w d2-d3,-(sp)     ; -> stash current/max MP values
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_TWO_LINES,a1
                addq.w  #WINDOW_MINISTATUS_OFFSET_STATBARS_START,a1
                move.l  a1,-(sp)        ; -> stash stat bars start address
                lea     (FF8804_LOADING_SPACE).l,a0
                moveq   #1,d2           ; HP bar VDP tile start index
                bsr.w   DrawColoredStatBar
                
                ; Draw MP bar
                movea.l (sp)+,a1        ; A1 <- pop stat bars start address
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_LINE,a1
                movem.w (sp)+,d0-d1     ; D0, D1 <- pop current/max MP values
                tst.w   d1
                beq.s   @WriteStatValues ; skip if 0 max MP
                lea     (FF8A04_LOADING_SPACE).l,a0
                moveq   #6,d2           ; MP bar VDP tile start index
                bsr.w   DrawColoredStatBar
                
@WriteStatValues:
                movem.w (sp)+,d0-d3
                
                ; Write current HP
                movea.l windowTilesAddress(a6),a1
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_TWO_LINES,a1
                adda.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,a1
                adda.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,a1
                suba.w  #WINDOW_MINISTATUS_OFFSET_STAT_VALUES,a1
                move.l  a1,-(sp)
                bsr.s   WriteStatValueD0
                
                ; Write max HP
                addq.w  #2,a1
                bsr.s   WriteStatValue
                
                ; Write current MP
                movea.l (sp)+,a1
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_LINE,a1
                move.w  d2,d0
                bsr.s   WriteStatValueD0
                
                ; Write max MP
                addq.w  #2,a1
                move.w  d3,d0
                bsr.s   WriteStatValueD0
                
                unlk    a6
                rts

    ; End of function BuildMiniStatusWindow


; =============== S U B R O U T I N E =======================================

; Write stat value d1.w or "??" if above 99 (or '???' if above 399 with THREE_DIGITS_STATS patch)


WriteStatValue:
                
                move.w  d1,d0
WriteStatValueD0:
                
                moveq   #STATS_DIGITS_NUMBER,d7
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d0
                bge.s   @UnknownValueString
                ext.l   d0
                bra.w   WriteTilesFromNumber
                
@UnknownValueString:
                lea     aUnknownValue(pc), a0
                bra.w   WriteTilesFromAsciiWithRegularFont

    ; End of function WriteStatValue

aUnknownValue:  
            if (THREE_DIGITS_STATS=1)
                dc.b '???',0
            else
                dc.b '??'
            endif

; =============== S U B R O U T I N E =======================================

; draw tiles from a0 into a1 (one column)

CopyMinistatusWindowTileColumn:
                
                move.w  (a0)+,(a1)
                move.w  (a0)+,WINDOW_MINISTATUS_OFFSET_NEXT_LINE(a1)
                move.w  (a0)+,WINDOW_MINISTATUS_OFFSET_NEXT_LINE*2(a1)
                move.w  (a0)+,WINDOW_MINISTATUS_OFFSET_NEXT_LINE*3(a1)
                move.w  (a0)+,WINDOW_MINISTATUS_OFFSET_NEXT_LINE*4(a1)
                addq.w  #2,a1
                rts

    ; End of function CopyMinistatusWindowTileColumn

