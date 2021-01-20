
; ASM FILE code\common\menus\menuengine_03.asm :
; 0x11572..0x118BE : Menu engine

; =============== S U B R O U T I N E =======================================


CreateBattlefieldMiniStatusWindow:
                
                addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
                movem.l d0-a2,-(sp)
                move.w  d0,-(sp)
                move.w  #WINDOW_MINISTATUS_SIZE,d0
                move.w  #WINDOW_MINISTATUS_DEST,d1
                lea     ((MINISTATUS_WINDOW_INDEX-$1000000)).w,a2
                tst.b   ((IS_TARGETING-$1000000)).w
                beq.s   loc_11594
                addq.l  #2,a2
                addi.w  #$15,d1
loc_11594:
                
                jsr     (CreateWindow).w
                move.w  d0,(a2)
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                move.w  (sp)+,d0
                bsr.w   BuildMiniStatusWindow
                move.w  #1,d1
                move.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,d3
                move.w  #$1F,d4
                sub.w   d3,d4
                lsl.w   #8,d4
                or.w    d4,d1
                moveq   #4,d2
                tst.b   ((IS_TARGETING-$1000000)).w
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

    ; End of function CreateBattlefieldMiniStatusWindow


; =============== S U B R O U T I N E =======================================


HideMiniStatusWindow:
                
                movem.l d0-a2,-(sp)
                lea     ((MINISTATUS_WINDOW_INDEX-$1000000)).w,a2
                tst.b   ((IS_TARGETING-$1000000)).w
                beq.s   loc_115F0
                addq.l  #2,a2
loc_115F0:
                
                move.w  (a2),d0
                move.w  #WINDOW_MINISTATUS_DEST,d1
                tst.b   ((IS_TARGETING-$1000000)).w
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

    ; End of function HideMiniStatusWindow


; =============== S U B R O U T I N E =======================================


CreateBattlesceneMiniStatusWindows:
                
                jsr     (InitWindowProperties).w
                move.w  #WINDOW_MINISTATUS_SIZE,d0
                move.w  #WINDOW_MINISTATUS_DEST,d1
                jsr     (CreateWindow).w
                move.w  #WINDOW_MINISTATUS_SIZE,d0
                move.w  #WINDOW_MINISTATUS_DEST,d1
                jsr     (CreateWindow).w
                rts

    ; End of function CreateBattlesceneMiniStatusWindows


; =============== S U B R O U T I N E =======================================


sub_11638:
                
                cmpi.b  #$FF,d0
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
                bne.s   loc_11670
                move.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,d3
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
                clr.b   ((IS_TARGETING-$1000000)).w
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
                move.b  #$FF,((IS_TARGETING-$1000000)).w
                movem.w d0,-(sp)
                moveq   #1,d0
                clr.w   d1
                jsr     (GetWindowTileAddress).w
                movem.w (sp)+,d0
                bsr.w   BuildMiniStatusWindow
                move.w  (sp)+,d1
                beq.s   loc_116F2
                move.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,d3
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
                move.b  #$FF,((IS_TARGETING-$1000000)).w
                moveq   #1,d0
                move.w  #$2006,d1
                moveq   #1,d2
                jsr     (MoveWindow).l  
                movem.l (sp)+,d0-a1
                rts

    ; End of function RemoveEnemyBattlesceneWindow


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
                addi.w  #$A,d2          ; draw bar in bottom left window
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
                cmpi.l  #$FFFFFFFF,d3
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


sub_11804:
                
                movem.l d0-d2/a0-a1,-(sp)
                lea     (FF8804_LOADING_SPACE).l,a0
                moveq   #1,d2           ; HP bar VDP tile start index
                bsr.w   DmaStatBarTiles
                lea     (FF8A04_LOADING_SPACE).l,a0
                moveq   #6,d2           ; MP bar VDP tile start index
                bsr.w   DmaStatBarTiles
                movem.l (sp)+,d0-d2/a0-a1
                rts

    ; End of function sub_11804


; =============== S U B R O U T I N E =======================================


DmaStatBarTiles:
                
                tst.b   ((IS_TARGETING-$1000000)).w
                beq.s   @Continue
                addi.w  #$A,d2          ; draw bar in bottom left window
@Continue:
                
                lsl.w   #5,d2
                movea.w d2,a1
                move.w  #$50,d0 
                moveq   #2,d1
                jmp     (ApplyVIntVramDma).w

    ; End of function DmaStatBarTiles

tbl_StatBarColumns:
                
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
                
                if (BUGFIX_GARBLED_HP_BAR>=1)
                cmpi.w  #(WriteStatBarColumn-tbl_StatBarColumns-4)/4,d4
                ble.s   @Continue
                moveq   #(WriteStatBarColumn-tbl_StatBarColumns-4)/4,d4
@Continue:
                endif
                
                lsl.w   #2,d4
                move.l  tbl_StatBarColumns(pc,d4.w),d4
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
                
                cmpi.b  #$9E,(a0)
                bne.s   @Continue
                subq.w  #1,d7
@Continue:
                
                cmpi.b  #$9F,(a0)+
                bne.s   @Next
                subq.w  #1,d7
@Next:
                
                dbf     d0,@Loop
                movem.w (sp)+,d0/a0
@Return:
                
                rts

    ; End of function AdjustStringLengthForSpecialCharacters

