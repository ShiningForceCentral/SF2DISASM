
; ASM FILE code\common\menus\loadicon-standard.asm :
;

; =============== S U B R O U T I N E =======================================


;LoadItemIcon:
                
                module
                
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   LoadNothingIcon
                
                getPointer p_ItemIcons, a0
                bra.s   LoadIcon

    ; End of function LoadItemIcon


; =============== S U B R O U T I N E =======================================


LoadSpellIcon:
                
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                cmpi.w  #SPELL_NOTHING,d1
                beq.s   LoadNothingIcon
                
                getPointer p_SpellIcons, a0
                bra.s   LoadIcon

    ; End of function LoadSpellIcon


; =============== S U B R O U T I N E =======================================


LoadNothingIcon:
                
                clr.w   d1
                getPointer p_OtherIcons, a0

    ; End of function LoadNothingIcon


; =============== S U B R O U T I N E =======================================


LoadIcon:
                
                move.w  d1,d2           ; multiply by icon size (192)
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                addIconOffset d1, a0
                moveq   #ICON_PIXELS_LONGWORD_COUNTER,d7
                
@Loop:          move.l  (a0)+,(a1)+
                dbf     d7,@Loop
                
                ; Clean corners
                ori.w   #$F,-2(a1)
                ori.w   #$F000,-36(a1)
                ori.w   #$F,-158(a1)
                ori.w   #$F000,-192(a1)
                rts

    ; End of function LoadIcon

                modend

