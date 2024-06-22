
; ASM FILE code\common\stats\getnewattanddefwithitemequipped-standard.asm :
;

; =============== S U B R O U T I N E =======================================

; In: a0 = combatant entry address
;     d1.w = new item index
;     d2.w = new item type (weapon or ring)
;
; Out: d2.w = current ATT with new item equipped
;      d3.w = current DEF with new item equipped


;GetNewAttAndDefWithItemEquipped:
                
                movem.l d0-d1/d4-a0,-(sp)
                
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d7
                move.l  a0,d4                           ; d4.l = combatant entry address backup
@FindEquippedItem_Loop:
                
                ; Find currently equipped item of the same type as the new one
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w COMBATANT_OFFSET_ITEMS(a0),d5
            else
                move.w  COMBATANT_OFFSET_ITEMS(a0),d5
            endif
                btst    #ITEMENTRY_BIT_EQUIPPED,d5
                beq.s   @Next
                
                movem.l d0-d1/a0,-(sp)                  ; it's equipped
                move.w  d5,d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d0
                and.b   d2,d0
                movem.l (sp)+,d0-d1/a0
                bne.w   @GetNewAttAndDef                ; is the item type we're looking for, so start with this one
                
@Next:          addq.w  #ITEMENTRY_SIZE,a0
                dbf     d7,@FindEquippedItem_Loop
                
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d7
                movea.l d4,a0
@FindFirstUnequippedItem_Loop:
                
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w COMBATANT_OFFSET_ITEMS(a0),d5
            else
                move.w  COMBATANT_OFFSET_ITEMS(a0),d5
            endif
                btst    #ITEMENTRY_BIT_EQUIPPED,d5
                beq.w   @GetNewAttAndDef
                addq.w  #ITEMENTRY_SIZE,a0
                dbf     d7,@FindFirstUnequippedItem_Loop
                
                movea.l d4,a0                               ; default to the first item slot
@GetNewAttAndDef:
                
                ; In: a0 = combatant entry address + item slot offset
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w COMBATANT_OFFSET_ITEMS(a0),d5       ; d5.w = old equipped item index
            else
                move.w  COMBATANT_OFFSET_ITEMS(a0),d5
            endif
                
                ; Temporarily equip the new item in place of the old one
                movem.l d4-d5/a0,-(sp)
                bset    #ITEMENTRY_BIT_EQUIPPED,d1
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w d1,COMBATANT_OFFSET_ITEMS(a0)
            else
                move.w  d1,COMBATANT_OFFSET_ITEMS(a0)
            endif
                bsr.w   ApplyStatusEffectsAndItemsOnStats
                movea.l d4,a0                               ; temporarily restore combatant entry address
                clr.w   d2
                move.b  COMBATANT_OFFSET_ATT_CURRENT(a0),d2
                clr.w   d3
                move.b  COMBATANT_OFFSET_DEF_CURRENT(a0),d3
                movem.l (sp)+,d4-d5/a0
                
                movem.w d2-d3,-(sp)
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w d5,COMBATANT_OFFSET_ITEMS(a0)       ; then re-equip the old one
            else
                move.w  d5,COMBATANT_OFFSET_ITEMS(a0)
            endif
                bsr.w   ApplyStatusEffectsAndItemsOnStats
                movem.w (sp)+,d2-d3
                
                movem.l (sp)+,d0-d1/d4-a0
                rts

    ; End of function GetNewAttAndDefWithItemEquipped
