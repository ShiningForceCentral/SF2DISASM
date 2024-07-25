
; ASM FILE code\common\stats\caravaninventoryfunctions-standard.asm :
;

caravanItemsToNumberOffset = CARAVAN_ITEMS_NUMBER-CARAVAN_ITEMS
caravanItemsNumberByteAddress = CARAVAN_ITEMS_NUMBER+1

    if (RELOCATED_SAVED_DATA_TO_SRAM=1)
caravanItemsNumberByteAddress = CARAVAN_ITEMS_NUMBER+2
    endif

; =============== S U B R O U T I N E =======================================

; In: d1.w = item index (only the actual index is used, the status bits are cut out, unless FIX_CARAVAN_FREE_REPAIR_EXPLOIT is enabled)

AddItemToCaravan:
                
                movem.l d0-d1/a0,-(sp)
                loadSavedDataAddress CARAVAN_ITEMS, a0
                
                ; Caravan items number -> d0.w
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w caravanItemsToNumberOffset(a0),d0
                cmpi.w  #CARAVAN_MAX_ITEMS_NUMBER_MINUS_ONE,d0
                bhi.s   @Skip           ; skip adding item if no room
                
                ; Add item
                add.w   d0,d0
                add.w   d0,d0
                adda.w  d0,a0
              if (FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
                andi.w  #ITEMENTRY_MASK_INDEX_AND_BROKEN_BIT,d1
              else
                andi.w  #ITEMENTRY_MASK_INDEX,d1 ; reproduce the exploit if the patch is disabled
              endif
                movep.w d1,0(a0)
                
                ; Increment items number
                addq.b  #1,(caravanItemsNumberByteAddress).l
            else
                move.w  caravanItemsToNumberOffset(a0),d0
                cmpi.w  #CARAVAN_MAX_ITEMS_NUMBER_MINUS_ONE,d0
                bhi.s   @Skip           ; skip adding item if no room
                
                ; Add item
                add.w   d0,d0
                adda.w  d0,a0
              if (FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
                andi.w  #ITEMENTRY_MASK_INDEX_AND_BROKEN_BIT,d1
              else
                andi.w  #ITEMENTRY_MASK_INDEX,d1 ; reproduce the exploit if the patch is disabled
              endif
                move.w  d1,(a0)
                
                ; Increment items number
                addq.w  #1,((CARAVAN_ITEMS_NUMBER-$1000000)).w
            endif
                
@Skip:          movem.l (sp)+,d0-d1/a0
                rts

    ; End of function AddItemToCaravan


; =============== S U B R O U T I N E =======================================

; In: d1.w = inventory slot
; Out: d1.w = item entry


RemoveItemFromCaravan:
                
                movem.l d0/d5-a1,-(sp)
                move.w  #ITEM_NOTHING,d5
                moveq   #0,d0
                loadSavedDataAddress CARAVAN_ITEMS, a0
                movea.l a0,a1
                
                ; Caravan items number -> d7.w
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w caravanItemsToNumberOffset(a0),d7
                subq.w  #1,d7
                bcs.s   @Done
                
@Loop:          cmp.w   d0,d1
                bne.s   @Next
                
                ; Remove item
                movep.w 0(a1),d5
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a1
                
                ; Decrement items number
                subq.b  #1,(caravanItemsNumberByteAddress).l
                bra.s   @Continue
                
@Next:          movep.w 0(a1),d6
                movep.w d6,0(a0)
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a0
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a1
                
@Continue:      addq.w  #1,d0
                dbf     d7,@Loop
                
                cmpa.l  a1,a0
                beq.s   @Done
                move.w   #ITEM_NOTHING,d6
                movep.w d6,0(a0)
            else
                move.w  caravanItemsToNumberOffset(a0),d7
                subq.w  #1,d7
                bcs.s   @Done
                
@Loop:          cmp.w   d0,d1
                bne.s   @Next
                
                ; Remove item
                move.w  (a1),d5
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a1
                
                ; Decrement items number
                subq.w  #1,((CARAVAN_ITEMS_NUMBER-$1000000)).w
                bra.s   @Continue
                
@Next:          move.w  (a1),(a0)
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a0
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a1
                
@Continue:      addq.w  #1,d0
                dbf     d7,@Loop
                
                cmpa.l  a1,a0
                beq.s   @Done
                move.w  #ITEM_NOTHING,(a0)
            endif
                
@Done:          move.w  d5,d1
                movem.l (sp)+,d0/d5-a1
                rts

    ; End of function RemoveItemFromCaravan

