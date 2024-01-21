
; ASM FILE code\common\menus\loadhighlightableicon.asm :
; 0x10940..0x10A4A : Load highlightable icon function

; =============== S U B R O U T I N E =======================================

; Copy spell icon to RAM
; 
;       In: A1 = destination in RAM
;           D0 = spell index
; 
;       Out: A1 = end of affected section after copy


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


LoadHighlightableItemIcon:
                
                cmpi.w  #ICON_UNARMED,d0
                beq.s   LoadHighlightableIcon
                andi.w  #ITEMENTRY_MASK_INDEX,d0
            if (STANDARD_BUILD=1)
                cmpi.w  #ITEM_NOTHING,d0
                bne.s   LoadHighlightableIcon
                move.w  #ICON_NOTHING,d0
            endif

    ; End of function LoadHighlightableItemIcon


; =============== S U B R O U T I N E =======================================


LoadHighlightableIcon:
                
                adda.w  #ICON_TILE_BYTESIZE,a1
                mulu.w  #ICON_TILE_BYTESIZE,d0
                getPointer p_Icons, a0
                addIconOffset d0, a0
                move.w  #$2F,d1 
                lea     tiles_IconHighlight(pc), a2
@Loop:
                
                move.l  (a0)+,d0
                move.l  d0,-ICON_TILE_BYTESIZE(a1)
                and.l   (a2)+,d0
                move.l  d0,(a1)+
                dbf     d1,@Loop
                
                rts

    ; End of function LoadHighlightableIcon

tiles_IconHighlight:
                incbin "data/graphics/tech/iconhighlighttiles.bin"
