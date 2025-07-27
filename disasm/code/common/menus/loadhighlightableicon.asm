
; ASM FILE code\common\menus\loadhighlightableicon.asm :
; 0x10940..0x1098A : Load highlightable icon function

; =============== S U B R O U T I N E =======================================

; Load spell icon with red border overlay.
; 
;       In: a1 = destination in RAM
;           d0.w = spell index
; 
;       Out: a1 = end of affected section after copy


LoadHighlightableSpellIcon:
                
                andi.w  #SPELLENTRY_MASK_INDEX,d0
                cmpi.w  #SPELL_NOTHING,d0
                bne.s   @GetSpellIcon
                move.w  #ICON_NOTHING,d0
                bra.s   @Continue
@GetSpellIcon:
                
                addi.w  #ICON_SPELLS_START,d0
@Continue:
                
                bra.w   LoadHighlightableIcon

    ; End of function LoadHighlightableSpellIcon


; =============== S U B R O U T I N E =======================================

; Same as above, but for items.


LoadHighlightableItemIcon:
                
                cmpi.w  #ITEM_UNARMED,d0
                beq.s   LoadHighlightableIcon
                andi.w  #ITEMENTRY_MASK_INDEX,d0

    ; End of function LoadHighlightableItemIcon


; =============== S U B R O U T I N E =======================================


LoadHighlightableIcon:
                
                adda.w  #ICON_TILE_BYTESIZE,a1
                mulu.w  #ICON_TILE_BYTESIZE,d0
                movea.l (p_Icons).l,a0
                adda.w  d0,a0           ; icon offset
                move.w  #ICON_PIXELS_LONGWORD_COUNTER,d1
                lea     tiles_IconHighlight(pc), a2
@Loop:
                
                move.l  (a0)+,d0
                move.l  d0,-ICON_TILE_BYTESIZE(a1)
                and.l   (a2)+,d0
                move.l  d0,(a1)+
                dbf     d1,@Loop
                
                rts

    ; End of function LoadHighlightableIcon

