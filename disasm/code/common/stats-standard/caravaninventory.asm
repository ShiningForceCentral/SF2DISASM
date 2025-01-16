
; ASM FILE code\common\stats-standard\caravaninventory.asm :
; Caravan inventory management functions

; =============== S U B R O U T I N E =======================================

; In: d1.w = item index (only the actual index is used, the status bits are cut out, unless FIX_CARAVAN_FREE_REPAIR_EXPLOIT is enabled)

AddItemToCaravan:
                
                movem.l d0-d1/a0-a1,-(sp)
                loadSavedDataAddress CARAVAN_ITEMS, a0
                loadSavedDataAddress CARAVAN_ITEMS_NUMBER, a1
                
                ; Caravan items number -> d0.w
                getSavedWord a1, d0
                cmpi.w  #CARAVAN_MAX_ITEMS_NUMBER,d0
                bhs.s   @Skip           ; skip adding item if no room
                
                ; Add item
                add.w   d0,d0
                addToSavedBytePointer d0, a0
            if (FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
                andi.w  #ITEMENTRY_MASK_INDEX_AND_BROKEN_BIT,d1
            else
                andi.w  #ITEMENTRY_MASK_INDEX,d1 ; reproduce the exploit if the patch is disabled
            endif
                setSavedWord d1, a0
                
                ; Increment items number
                getSavedWord a1, d0
                addq.w  #1,d0
                setSavedWord d0, a1
                
@Skip:          movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function AddItemToCaravan


; =============== S U B R O U T I N E =======================================

; In: d1.w = inventory slot
; Out: d1.w = item entry


RemoveItemFromCaravan:
                
                movem.l d0/d5-a2,-(sp)
                move.w  #ITEM_NOTHING,d5
                moveq   #0,d0
                loadSavedDataAddress CARAVAN_ITEMS, a0
                loadSavedDataAddress CARAVAN_ITEMS_NUMBER, a2
                movea.l a0,a1
                
                ; Caravan items number -> d7.w
                getSavedWord a2, d7
                subq.w  #1,d7
                blo.s   @Done
                
@Loop:          cmp.w   d0,d1
                bne.s   @Next
                
                ; Remove item
                getSavedWord a1, d5
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a1
                
                ; Decrement items number
                getSavedWord a2, d6
                subq.w  #1,d6
                setSavedWord d6, a2
                bra.s   @Continue
                
@Next:          getSavedWord a1, d6
                setSavedWord d6, a0
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a0
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a1
                
@Continue:      addq.w  #1,d0
                dbf     d7,@Loop
                
                cmpa.l  a1,a0
                beq.s   @Done
                
                move.w   #ITEM_NOTHING,d6
                setSavedWord d6, a0
                
@Done:          move.w  d5,d1
                movem.l (sp)+,d0/d5-a2
                rts

    ; End of function RemoveItemFromCaravan

