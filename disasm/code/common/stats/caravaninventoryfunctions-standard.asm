
; ASM FILE code\common\stats\caravaninventoryfunctions-standard.asm :
;

caravanItemsToNumberOffset = CARAVAN_ITEMS_NUMBER-CARAVAN_ITEMS
caravanItemsNumberByteAddress = CARAVAN_ITEMS_NUMBER+1
itemEntryMask = ITEMENTRY_MASK_INDEX

; =============== S U B R O U T I N E =======================================

; In: d1.w = item index (only the actual index is used, the status bits are cut out, unless FIX_CARAVAN_FREE_REPAIR_EXPLOIT is enabled)

AddItemToCaravan:
                
                movem.l d0-d1/a0,-(sp)
                loadSavedDataAddress CARAVAN_ITEMS, a0
                
                ; Caravan items number -> d0.w
                move.w  caravanItemsToNumberOffset(a0),d0
                cmpi.w  #CARAVAN_MAX_ITEMS_NUMBER_MINUS_ONE,d0
                bhi.s   @Skip           ; skip adding item if no room
                
                ; Add item
                add.w   d0,d0
                adda.w  d0,a0
                andi.w  #itemEntryMask,d1
                move.b  d1,(a0)
                
                ; Increment items number
                addq.w  #1,((CARAVAN_ITEMS_NUMBER-$1000000)).w
                
@Skip:          movem.l (sp)+,d0-d1/a0
                rts

    ; End of function AddItemToCaravan


; =============== S U B R O U T I N E =======================================

; In: d1.w = inventory slot
; Out: d1.w = item entry when FIX_CARAVAN_FREE_REPAIR_EXPLOIT is enabled


RemoveItemFromCaravan:
                
                movem.l d0/d5-a1,-(sp)
                moveq   #0,d0
                loadSavedDataAddress CARAVAN_ITEMS, a0
                movea.l a0,a1
                
                ; Caravan items number -> d7.w
                move.w  caravanItemsToNumberOffset(a0),d7
                subq.w  #1,d7
                bcs.s   @Done
                
@Loop:          cmp.w   d0,d1
                bne.s   @Next
                
                ; Remove item
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a1
                
                ; Decrement items number
                subq.w  #1,((CARAVAN_ITEMS_NUMBER-$1000000)).w
                bra.s   @Continue
@Next:
                move.b  (a1),(a0)
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a0
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a1
                
@Continue:      addq.w  #1,d0
                dbf     d7,@Loop
                
                cmpa.l  a1,a0
                beq.s   @Done
                move.b  #ITEM_NOTHING,(a0)
@Done:
                movem.l (sp)+,d0/d5-a1
                rts

    ; End of function RemoveItemFromCaravan

