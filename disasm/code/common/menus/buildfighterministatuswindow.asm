
; ASM FILE code\common\menus\buildfighterministatuswindow.asm :
; 0x118BE..0x11AEC : Build fighter mini status window function

; =============== S U B R O U T I N E =======================================

; In: A1 = window tiles address
;     D0 = combatant index

windowTilesAddress = -8
combatant = -2

BuildMiniStatusWindow:
                
                link    a6,#-8
                move.l  a1,windowTilesAddress(a6)
                
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
                jsr     j_GetCurrentHP
                move.w  d1,d2
                jsr     j_GetMaxHP
                move.w  d1,d3
                movem.w d2-d3,-(sp)     ; -> push current/max HP values
                jsr     j_GetCurrentMP
                move.w  d1,d2
                jsr     j_GetMaxMP
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
                lea     MiniStatusWindowLayout(pc), a0
                movea.l windowTilesAddress(a6),a1
                
                ; Copy leftmost columns
                bsr.w   CopyMiniStatusWindowTileColumn
                bsr.w   CopyMiniStatusWindowTileColumn
                bsr.w   CopyMiniStatusWindowTileColumn
                move.w  ((MINISTATUS_WINDOW_WIDTH-$1000000)).w,d7
                subi.w  #WINDOW_MINISTATUS_SIDECOLUMNS_NUMBER_PLUS_ONE,d7
@CopyMiddleColumns_Loop:
                
                lea     MiniStatusWindowLayout_Body(pc), a0
                nop
                bsr.w   CopyMiniStatusWindowTileColumn
                dbf     d7,@CopyMiddleColumns_Loop
                
                ; Copy rightmost columns
                lea     MiniStatusWindowLayout_Tail(pc), a0
                nop
                bsr.w   CopyMiniStatusWindowTileColumn
                bsr.w   CopyMiniStatusWindowTileColumn
                bsr.w   CopyMiniStatusWindowTileColumn
                bsr.w   CopyMiniStatusWindowTileColumn
                bsr.w   CopyMiniStatusWindowTileColumn
                
                ; Write name, class, level
                movem.w d0-d3,-(sp)
                move.w  combatant(a6),d0
                jsr     j_GetCombatantName
                movea.l windowTilesAddress(a6),a1
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
                movea.l windowTilesAddress(a6),a1
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
                movea.l windowTilesAddress(a6),a1
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

; Write stat value D0 or '??' if above 99


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

; Draw tiles from A0 into A1 (one column)


CopyMiniStatusWindowTileColumn:
                
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

    ; End of function CopyMiniStatusWindowTileColumn

