
; ASM FILE code\common\stats-standard\findname.asm :
; Find an item, spell, or class name

; =============== S U B R O U T I N E =======================================

; In: D1 = item entry
; Out: A0 = address of name
;      D7 = length of name


GetItemName:
                
                move.w  d1,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                getPointer p_table_ItemNames, a0
                bsr.s   FindName        
                move.w  (sp)+,d1
                rts

    ; End of function GetItemName


; =============== S U B R O U T I N E =======================================

; In: D1 = spell index
; 
; Out: A0 = address of name
;      D7 = length of name


GetSpellName:
                
                move.w  d1,-(sp)
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                getPointer p_table_SpellNames, a0
                bsr.s   FindName        
                move.w  (sp)+,d1
                rts

    ; End of function GetSpellName


; =============== S U B R O U T I N E =======================================


GetClassName:
                
                getPointer p_table_ClassNames, a0
                bra.s   FindName
GetFullClassName:
                
                getPointer p_table_FullClassNames, a0

    ; End of function GetClassName


; =============== S U B R O U T I N E =======================================

; In: a0 = names list pointer, d1.w = name index
; Out: a0 = pointer to name entry, d7.w = name length


FindName:
                
                move.w  d0,-(sp)
                clr.w   d0     
                bra.s   @Find           ; done if name index = 0
                
@Find_Loop:     move.b  (a0)+,d0
                adda.w  d0,a0
@Find:          dbf     d1,@Find_Loop

@Done:          clr.w   d7
                move.b  (a0)+,d7
                move.w  (sp)+,d0
                rts

    ; End of function FindName

