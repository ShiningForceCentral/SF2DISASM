
; ASM FILE code\gameflow\battle\battlefield\unusedbattlefieldfunctions_CF0E.asm :
; 0xCF0E..0xCF74 : Unused battlefield functions

; =============== S U B R O U T I N E =======================================

; unused
; 
;   In: d0.b = combatant index, d1.b = spell index
;   Out: d1.w = spell index, d2.w = slot


GetSlotContainingSpell:
                
                movem.l d0/d3-a6,-(sp)
                andi.b  #SPELLENTRY_MASK_INDEX,d1
                move.b  d1,d4
                moveq   #0,d3
loc_CF1A:
                
                move.w  d3,d1
                jsr     GetSpellAndNumberOfSpells
                move.w  d1,d2
                andi.b  #SPELLENTRY_MASK_INDEX,d2
                cmp.b   d4,d2
                beq.w   loc_CF38
                addq.w  #1,d3
                cmpi.w  #4,d3
                bcs.s   loc_CF1A
                moveq   #SPELL_NOTHING,d1
loc_CF38:
                
                move.w  d3,d2
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetSlotContainingSpell


; =============== S U B R O U T I N E =======================================

; unused
; 
;   In: d0.b = combatant index, d1.b = item index
;   Out: d1.w = item index, d2.w = slot


GetSlotContainingItem:
                
                movem.l d0/d3-a6,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                move.w  d1,d4
                moveq   #0,d3
loc_CF4C:
                
                move.w  d3,d1
                jsr     GetItemBySlotAndHeldItemsNumber
                move.w  d1,d2
                andi.w  #ITEMENTRY_MASK_INDEX,d2
                cmp.w   d4,d2
                beq.w   loc_CF6C
                addq.w  #1,d3
                cmpi.w  #4,d3
                bcs.s   loc_CF4C
                move.w  #ITEM_NOTHING,d1
loc_CF6C:
                
                move.w  d3,d2
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetSlotContainingItem

