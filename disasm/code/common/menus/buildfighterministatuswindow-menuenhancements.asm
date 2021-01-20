
; ASM FILE code\common\menus\buildfighterministatuswindow-menuenhancements.asm :
; 

; =============== S U B R O U T I N E =======================================

; In: A1 = window tiles address
;     D0 = combatant index

BuildMiniStatusWindow:
                
window_tiles_address = -8
combatant_index = -2
                
                link    a6,#-8
                move.l  a1,window_tiles_address(a6)
                
                ; Clear window tiles
                move.w d7,-(sp)
                move.w  #WINDOW_MINISTATUS_LONGWORD_COUNTER,d7
                
@Clear_Loop:
                clr.l   (a1)+
                dbf     d7,@Clear_Loop
                move.w (sp)+,d7
                
                ; Get highest of HP or MP stat bar length -> D6
                ext.w   d0
                move.w  d0,combatant_index(a6)
                jsr     GetCurrentHP
                move.w  d1,d2
                jsr     GetMaxHP
                move.w  d1,d3
                movem.w d2-d3,-(sp)     ; -> stash current/max HP values
                jsr     GetCurrentMP
                move.w  d1,d2
                jsr     GetMaxMP
                move.w  d1,d3
                movem.w (sp)+,d0-d1     ; D0, D1 <- pop current/max HP values
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
                move.w  combatant_index(a6),d0
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
                lea     MiniStatusWindowLayout(pc), a0
                movea.l window_tiles_address(a6),a1
                
                ; Copy leftmost columns
                bsr.w   CopyMinistatusWindowTileColumn
                bsr.w   CopyMinistatusWindowTileColumn
                bsr.w   CopyMinistatusWindowTileColumn
                move.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,d7
                subi.w  #WINDOW_MINISTATUS_SIDECOLUMNS_NUMBER_PLUS_ONE,d7
                
@CopyMiddleColumns_Loop:
                lea     MiniStatusWindowLayout_Body(pc), a0
                bsr.w   CopyMinistatusWindowTileColumn
                dbf     d7,@CopyMiddleColumns_Loop
                
                ; Copy rightmost columns
                bsr.w   CopyMinistatusWindowTileColumn
                bsr.w   CopyMinistatusWindowTileColumn
                bsr.w   CopyMinistatusWindowTileColumn
                
                if (THREE_DIGITS_STATS>=1)
                suba.w  #10,a0
                bsr.w   CopyMinistatusWindowTileColumn
                endif
                
                bsr.w   CopyMinistatusWindowTileColumn
                bsr.w   CopyMinistatusWindowTileColumn
                
                ; Write name, class, level
                movem.w d0-d3,-(sp)
                move.w  combatant_index(a6),d0
                jsr     GetCombatantName
                movea.l window_tiles_address(a6),a1
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_LINE,a1
                addq.l  #2,a1
                moveq   #-WINDOW_MINISTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                addq.w  #2,a1
                move.w  combatant_index(a6),d0
                blt.s   @DrawStatBars   ; skip if enemy
                jsr     GetClassAndName
                moveq   #-WINDOW_MINISTATUS_OFFSET_NEXT_LINE,d1
                bsr.w   WriteTilesFromAsciiWithRegularFont
                move.w  combatant_index(a6),d0
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
                movea.l window_tiles_address(a6),a1
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
                movea.l window_tiles_address(a6),a1
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_TWO_LINES,a1
                adda.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,a1
                adda.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,a1
                suba.w  #WINDOW_MINISTATUS_OFFSET_STAT_VALUES,a1
                move.l  a1,-(sp)
                bsr.s   WriteThreeDigitsStatValue
                
                ; Write max HP
                addq.w  #2,a1
                move.w  d1,d0
                bsr.s   WriteThreeDigitsStatValue
                
                ; Write current MP
                movea.l (sp)+,a1
                adda.w  #WINDOW_MINISTATUS_OFFSET_NEXT_LINE,a1
                move.w  d2,d0
                bsr.s   WriteThreeDigitsStatValue
                
                ; Write max MP
                addq.w  #2,a1
                move.w  d3,d0
                bsr.s   WriteThreeDigitsStatValue
                
                unlk    a6
                rts

    ; End of function BuildMiniStatusWindow


; In: D0 = character index, D1 = stat value
WriteThreeDigitsStatValue_MemberStats:
                
                if (FULL_CLASS_NAMES>=1)
                tst.b   d0
                bmi.s   WriteThreeDigitsStatValue_MemberList
                adda.w  #WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE,a1 ; write stat on next line if ally
                endif
                
WriteThreeDigitsStatValue_MemberList:
                move.w  d1,d0
                
WriteThreeDigitsStatValue:
                moveq   #STATS_DIGITS_NUMBER,d7


; =============== S U B R O U T I N E =======================================

; Write stat value D0 or "??" if above 99 (or '???' if above 399 with THREE_DIGITS_STATS patch)

WriteStatValue:
                
                cmpi.w  #UNKNOWN_STAT_VALUE_THRESHOLD,d0
                bge.s   @UnknownValueString
                ext.l   d0
                bra.w   WriteTilesFromNumber
                
@UnknownValueString:
                lea     aUnknownValue(pc), a0
                bra.w   WriteTilesFromAsciiWithRegularFont

    ; End of function WriteStatValue

aUnknownValue:  if (THREE_DIGITS_STATS=0)
                dc.b '??'
                else
                dc.b '???',0
                endif

; =============== S U B R O U T I N E =======================================

; draw tiles from A0 into A1 (one column)

CopyMinistatusWindowTileColumn:
                
                move.w  (a0)+,(a1)
                move.w  (a0)+,WINDOW_MINISTATUS_OFFSET_NEXT_LINE(a1)
                move.w  (a0)+,WINDOW_MINISTATUS_OFFSET_NEXT_LINE*2(a1)
                move.w  (a0)+,WINDOW_MINISTATUS_OFFSET_NEXT_LINE*3(a1)
                move.w  (a0)+,WINDOW_MINISTATUS_OFFSET_NEXT_LINE*4(a1)
                addq.w  #2,a1
                rts

    ; End of function CopyMinistatusWindowTileColumn

