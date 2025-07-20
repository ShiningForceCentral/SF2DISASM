
; ASM FILE code\common\menus\menuenginecommon.asm :
; 0x100C8..0x101F6 : Menu engine, part 1 : Common functions

; =============== S U B R O U T I N E =======================================

; Write tiles from ASCII using the orange font

useOrangeFont = -2

WriteTilesFromAsciiWithOrangeFont:
                
                module
                link    a6,#-2
                move.w  #-1,useOrangeFont(a6) ; set to use the orange font
                bra.s   WriteTilesFromAscii

    ; End of function WriteTilesFromAsciiWithOrangeFont


; =============== S U B R O U T I N E =======================================

; write tiles from number in D0 into A1 D7 letters, window width D1

WriteLvOrExpValue:
                
            if (STANDARD_BUILD=1)
                moveq   #2,d7   ; two digits
                move.w  d1,d0
                ext.l   d0
            endif
WriteTilesFromNumber:
                
                jsr     (WriteAsciiNumber).w
                lea     ((LOADED_NUMBER-$1000000)).w,a0
                moveq   #10,d0
                sub.w   d7,d0
                adda.w  d0,a0

    ; End of function WriteTilesFromNumber


; =============== S U B R O U T I N E =======================================

; Write tiles from ASCII from A0 into A1 D7 letters, window width D1

useOrangeFont = -2

WriteTilesFromAsciiWithRegularFont:
                
                link    a6,#-2
                clr.w   useOrangeFont(a6)

    ; End of function WriteTilesFromAsciiWithRegularFont


; START OF FUNCTION CHUNK FOR WriteTilesFromAsciiWithOrangeFont

WriteTilesFromAscii:
                
                movem.l d2/a2,-(sp)
                movea.l a1,a2
                subq.w  #1,d7
@loc_1:
                
                clr.w   d0
                move.b  (a0)+,d0
                beq.w   @loc_12
                ori.w   #VDPTILE_PALETTE3|VDPTILE_PRIORITY,d0
                cmpi.b  #TEXT_CODE_MOVEDOWN,d0
                beq.s   @loc_8
                cmpi.b  #TEXT_CODE_TOGGLEFONTCOLOR,d0
                beq.s   @loc_9          
                cmpi.b  #TEXT_CODE_NEWLINE,d0
                beq.s   @loc_10
                tst.b   d0
                bpl.s   @loc_2
                subi.w  #64,d0
@loc_2:
                
                cmpi.b  #VDPTILE_CORNER,d0
                blt.s   @loc_3          
                addi.w  #32,d0
@loc_3:
                
                tst.w   useOrangeFont(a6) ; test if we're using the orange font
                beq.s   @loc_7
                cmpi.b  #VDPTILE_NUMBER_0,d0
                bcc.s   @loc_4          ; branch if number
                move.w  d1,-(sp)
                clr.w   d1
                move.b  d0,d1
                subi.b  #32,d1
                move.b  table_MainFontAlternateSymbols(pc,d1.w),d0
                move.w  (sp)+,d1
                bra.s   @loc_7
@loc_4:
                
                tst.b   d0
                bpl.s   @loc_6
                subi.w  #26,d0
                cmpi.b  #VDPTILE_V_BORDER,d0
                bhi.s   @loc_5
                subq.w  #1,d0
@loc_5:
                
                bra.s   @loc_7
@loc_6:
                
                addi.w  #130,d0
@loc_7:
                
                move.w  d0,(a1)+
                bra.s   @loc_11

; END OF FUNCTION CHUNK FOR WriteTilesFromAsciiWithOrangeFont

table_MainFontAlternateSymbols:
                dc.b VDPTILE_SPACE      ; VDP tile indexes to substitute in for symbol ASCII values when using orange font
                dc.b VDPTILE_ORANGE_EXCLAMATION_MARK
                dc.b VDPTILE_ORANGE_QUOTATION_MARK
                dc.b VDPTILE_ORANGE_NUMBER_SIGN
                dc.b VDPTILE_ORANGE_DOLLAR_SIGN
                dc.b VDPTILE_ORANGE_PERCENT_SIGN
                dc.b VDPTILE_ORANGE_AMPERSAND
                dc.b VDPTILE_ORANGE_APOSTROPHE
                dc.b VDPTILE_ORANGE_OPENING_ROUND_BRACKET
                dc.b VDPTILE_ORANGE_CLOSING_ROUND_BRACKET
                dc.b VDPTILE_ORANGE_MULTIPLICATION_SIGN
                dc.b VDPTILE_ORANGE_PLUS_SIGN
                dc.b VDPTILE_ORANGE_COMMA
                dc.b VDPTILE_ORANGE_MINUS_SIGN
                dc.b VDPTILE_ORANGE_DOT
                dc.b VDPTILE_ORANGE_SLASH

; START OF FUNCTION CHUNK FOR WriteTilesFromAsciiWithOrangeFont

@loc_8:
            if (STANDARD_BUILD&FULL_CLASS_NAMES=1)
                tst.w   d1
                bne.s   @Continue
                move.w  #VDPTILE_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d0
                bra.s   @loc_7
            endif
@Continue:
                
                lea     2(a2),a1
                suba.w  d1,a1
                movea.l a1,a2
                bra.s   @loc_11
@loc_9:
                
                eori.w  #$FFFF,useOrangeFont(a6) ; 0x5C: toggle to/from orange font
                bra.s   @loc_11
@loc_10:
                
                movea.l a2,a1
                suba.w  d1,a1
                movea.l a1,a2
@loc_11:
                
                dbf     d7,@loc_1
@loc_12:
                
                movem.l (sp)+,d2/a2
                unlk    a6
                rts

; END OF FUNCTION CHUNK FOR WriteTilesFromAsciiWithOrangeFont

                modend

; =============== S U B R O U T I N E =======================================

; Write window tiles onto layout a1, dimensions d0.w including borders (xxyy).


WriteWindowTiles:
                
                movem.l d4-d5/a1,-(sp)
                move.w  d0,d4
                lsr.w   #BYTE_SHIFT_COUNT,d4
                subq.l  #3,d4
                move.w  #VDPTILE_CORNER|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
loc_1019C:
                
                move.w  #VDPTILE_H_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                dbf     d4,loc_1019C
                move.w  #VDPTILE_CORNER|VDPTILE_MIRROR|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                move.w  d0,d5
                andi.w  #BYTE_MASK,d5
                subq.w  #3,d5
loc_101B0:
                
                move.w  d0,d4
                lsr.w   #BYTE_SHIFT_COUNT,d4
                subq.w  #3,d4
                move.w  #VDPTILE_V_BORDER|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
loc_101BA:
                
                move.w  #VDPTILE_SPACE|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                dbf     d4,loc_101BA
                move.w  #VDPTILE_V_BORDER|VDPTILE_MIRROR|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                dbf     d5,loc_101B0
                move.w  d0,d4
                lsr.w   #BYTE_SHIFT_COUNT,d4
                subq.w  #3,d4
                move.w  #VDPTILE_CORNER|VDPTILE_FLIP|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
loc_101D4:
                
                move.w  #VDPTILE_H_BORDER|VDPTILE_FLIP|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                dbf     d4,loc_101D4
                move.w  #VDPTILE_CORNER|VDPTILE_MIRROR|VDPTILE_FLIP|VDPTILE_PALETTE3|VDPTILE_PRIORITY,(a1)+
                movem.l (sp)+,d4-d5/a1
                rts

    ; End of function WriteWindowTiles


; =============== S U B R O U T I N E =======================================


LinkHighlightSprites:
                
                move.b  #8,(SPRITE_07_LINK).l
                clr.b   (SPRITE_63_LINK).l
                rts

    ; End of function LinkHighlightSprites

