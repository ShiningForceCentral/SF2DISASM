
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
                
@Continue:      andi.w  #ITEMENTRY_MASK_INDEX,d0
                cmpi.w  #ITEM_NOTHING,d0
                beq.s   LoadHighlightableNothingIcon
                
                getPointer p_ItemIcons, a0
                bra.s   LoadHighlightableIcon

    ; End of function LoadHighlightableItemIcon


; =============== S U B R O U T I N E =======================================

; Get pointer to empty item/spell slot icon.

LoadHighlightableNothingIcon:
                
                clr.w   d0
@Other:         getPointer p_OtherIcons, a0

    ; End of function LoadHighlightableNothingIcon


; =============== S U B R O U T I N E =======================================


LoadHighlightableIcon:
                
                adda.w  #ICON_TILE_BYTESIZE,a1
                mulu.w  #ICON_TILE_BYTESIZE,d0
                addIconOffset d0, a0
                move.w  #ICON_PIXELS_LONGWORD_COUNTER,d1 
                lea     tiles_IconHighlight(pc), a2
                
@Loop:          move.l  (a0)+,d0
                move.l  d0,-ICON_TILE_BYTESIZE(a1)
                and.l   (a2)+,d0
                move.l  d0,(a1)+
                dbf     d1,@Loop
                
                rts

    ; End of function LoadHighlightableIcon

                modend
