
; ASM FILE code\common\menus\loadhighlightableicon-standard.asm :
;

; =============== S U B R O U T I N E =======================================

; Load spell icon with red border overlay.
;
;       In: a1 = destination in RAM
;           d0.w = spell index
;
;       Out: a1 = end of affected section after copy

LoadHighlightableSpellIcon:
                
                module
                
                clr.w   d6
                andi.w  #SPELLENTRY_MASK_INDEX,d0
                cmpi.w  #SPELL_NOTHING,d0
                beq.s   LoadHighlightableNothingIcon
                
                getPointer p_SpellIcons, a0
                bra.s   LoadHighlightableIcon

    ; End of function LoadHighlightableSpellIcon


; =============== S U B R O U T I N E =======================================

; Same as above, but for items.

LoadHighlightableItemIcon:
                
                cmpi.w  #ITEM_UNARMED,d0
                bne.s   @Continue
                
                ; Get pointer to unarmed icon
                moveq   #ICON_UNARMED,d0
                bra.s   @Other
                
@Continue:      move.w  d0,d6           ; save item entry
                andi.w  #ITEMENTRY_MASK_INDEX,d0
                cmpi.w  #ITEM_NOTHING,d0
                beq.s   LoadHighlightableNothingIcon
                
                getPointer p_ItemIcons, a0
                bra.s   LoadHighlightableIcon

    ; End of function LoadHighlightableItemIcon


; =============== S U B R O U T I N E =======================================

; Get pointer to empty item/spell slot icon.

LoadHighlightableNothingIcon:
                
                clr.w   d0
@Other:         clr.w   d6
                getPointer p_OtherIcons, a0

    ; End of function LoadHighlightableNothingIcon


; =============== S U B R O U T I N E =======================================


LoadHighlightableIcon:
                
                movea.l a1,a3           ; save starting cursor position in window layout for non-highlighted icon
                adda.w  #ICON_TILE_BYTESIZE,a1
                movea.l a1,a4           ; save starting cursor position in window layout for highlighted icon
                
                mulu.w  #ICON_TILE_BYTESIZE,d0
                addIconOffset d0, a0
                move.w  #ICON_PIXELS_LONGWORD_COUNTER,d1 
                lea     tiles_IconHighlight(pc), a2
                
@Loop:          move.l  (a0)+,d0
                move.l  d0,-ICON_TILE_BYTESIZE(a1)
                and.l   (a2)+,d0
                move.l  d0,(a1)+
                dbf     d1,@Loop
                
            if (DRAW_CRACKS_OVERLAY_IN_ITEM_MENU=1)
                ; Draw cracks over icon if item is broken
                btst    #ITEMENTRY_BIT_BROKEN,d6
                beq.s   @CleanIconCorners
                
                movea.l a1,a2           ; save ending cursor position in window layout
                movea.l a3,a1           ; restore ending cursor position in window layout for non-highlighted icon
                bsr.s   @DrawCracks
                movea.l a1,a2           ; save ending cursor position in window layout
                movea.l a4,a1           ; restore ending cursor position in window layout for highlighted icon
                
@DrawCracks:    getPointer p_OtherIcons, a0
                lea     ICONS_OFFSET_CRACKS(a0),a0
                move.w  #ICON_PIXELS_BYTE_COUNTER,d1
                
@DrawCracks_Loop:
                move.b  (a0)+,d0
                beq.s   @NextCrack
                
                andi.w  #$F0,d0
                beq.s   @Continue1
                
                andi.b  #$F,(a1)
@Continue1:     move.b  -1(a0),d0
                andi.w  #$F,d0
                beq.s   @Continue2
                
                andi.b  #$F0,(a1)
@Continue2:     move.b  -1(a0),d0
                or.b    d0,(a1)
@NextCrack:     addq.w  #1,a1
                dbf     d1,@DrawCracks_Loop
                
                movea.l a2,a1           ; restore ending cursor position in window layout
            endif
                
@CleanIconCorners:
                
                ori.w   #$F,-2(a1)
                ori.w   #$F000,-36(a1)
                ori.w   #$F,-158(a1)
                ori.w   #$F000,-192(a1)
                ori.w   #$F,-194(a1)
                ori.w   #$F000,-228(a1)
                ori.w   #$F,-350(a1)
                ori.w   #$F000,-384(a1)
                rts


    ; End of function LoadHighlightableIcon

                modend
