
; ASM FILE code\common\menus\loadicon-standard.asm :
;

; =============== S U B R O U T I N E =======================================


;LoadItemIcon:
                
                module
                
                move.w  d1,d0           ; save item entry
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   LoadNothingIcon
                
                getPointer p_ItemIcons, a0
                bra.s   LoadIcon

    ; End of function LoadItemIcon


; =============== S U B R O U T I N E =======================================


LoadSpellIcon:
                
                clr.w   d0
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                cmpi.w  #SPELL_NOTHING,d1
                beq.s   LoadNothingIcon
                
                getPointer p_SpellIcons, a0
                bra.s   LoadIcon

    ; End of function LoadSpellIcon


; =============== S U B R O U T I N E =======================================


LoadNothingIcon:
                
                clr.w   d0
                clr.w   d1
                getPointer p_OtherIcons, a0

    ; End of function LoadNothingIcon


; =============== S U B R O U T I N E =======================================

; In: a1 = loading space address, d1.w = item or spell index

LoadIcon:
                
                movea.l a1,a2           ; save starting cursor position in window layout
                
                ; Multiply index by icon size (192)
                move.w  d1,d2           ; save item or spell index
                moveq   #0,d1
                move.w  d2,d1
                add.w   d1,d1
                add.w   d2,d1
                lsl.w   #6,d1
                addIconOffset d1, a0
                moveq   #ICON_PIXELS_LONGWORD_COUNTER,d7
                
@Loop:          move.l  (a0)+,(a1)+
                dbf     d7,@Loop
                
            if (DRAW_CRACKS_OVERLAY_IN_ITEM_MENU=1)
                ; Draw cracks over icon if item is broken
                btst    #ITEMENTRY_BIT_BROKEN,d0
                beq.s   @CleanIconCorners
                
                exg     a1,a2           ; exchange cursor positions (a1 = starting, a2 = ending)
                getPointer p_OtherIcons, a0
                lea     ICONS_OFFSET_CRACKS(a0),a0
                move.w  #ICON_PIXELS_BYTE_COUNTER,d7
                
@DrawCracks_Loop:
                move.b  (a0)+,d1
                beq.s   @NextCrack
                
                andi.w  #$F0,d1
                beq.s   @Continue1
                
                andi.b  #$F,(a1)
@Continue1:     move.b  -1(a0),d1
                andi.w  #$F,d1
                beq.s   @Continue2
                
                andi.b  #$F0,(a1)
@Continue2:     move.b  -1(a0),d1
                or.b    d1,(a1)
@NextCrack:     addq.w  #1,a1
                dbf     d7,@DrawCracks_Loop
                
                movea.l a2,a1       ; restore ending cursor position in window layout
            endif
                
@CleanIconCorners:
                
                ; Clean corners
                ori.w   #$F,-2(a1)
                ori.w   #$F000,-36(a1)
                ori.w   #$F,-158(a1)
                ori.w   #$F000,-192(a1)
                rts

    ; End of function LoadIcon

                modend

