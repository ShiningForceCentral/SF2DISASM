
; ASM FILE code\common\stats\caravaninventoryfunctions-standard.asm :
;

caravanItemsToNumberOffset = CARAVAN_ITEMS_NUMBER-CARAVAN_ITEMS

    if (RELOCATED_SAVED_DATA_TO_SRAM=1)
caravanItemsNumberByteAddress = CARAVAN_ITEMS_NUMBER+2
    else
caravanItemsNumberByteAddress = CARAVAN_ITEMS_NUMBER+1
    endif

    if (FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
itemEntryMask = ITEMENTRY_MASK_INDEX_AND_BROKEN_BIT
    else
itemEntryMask = ITEMENTRY_MASK_INDEX
    endif

; =============== S U B R O U T I N E =======================================

; In: d1.w = item index (only the actual index is used, the status bits are cut out, unless FIX_CARAVAN_FREE_REPAIR_EXPLOIT is enabled)

AddItemToCaravan:
                
                movem.l d0-d1/a0,-(sp)
                loadSavedDataAddress CARAVAN_ITEMS, a0
                
                ; Caravan items number -> d0.w
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w caravanItemsToNumberOffset(a0),d0
            else
                move.w  caravanItemsToNumberOffset(a0),d0
            endif
                cmpi.w  #CARAVAN_MAX_ITEMS_NUMBER_MINUS_ONE,d0
                bhi.s   @Skip           ; skip adding item if no room
                
                ; Add item
            if (FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
                add.w   d0,d0
            endif
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   d0,d0
            endif
                adda.w  d0,a0
                andi.w  #itemEntryMask,d1
            if (FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
              if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w d1,0(a0)
              else
                move.w  d1,(a0)
              endif
            else
                move.b  d1,(a0)
            endif
                
                ; Increment items number
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                addq.b  #1,(caravanItemsNumberByteAddress).l
            else
                addq.w  #1,((CARAVAN_ITEMS_NUMBER-$1000000)).w
            endif
                
@Skip:          movem.l (sp)+,d0-d1/a0
                rts

    ; End of function AddItemToCaravan


; =============== S U B R O U T I N E =======================================

; In: d1.w = inventory slot
; Out: d1.w = item entry when FIX_CARAVAN_FREE_REPAIR_EXPLOIT is enabled


RemoveItemFromCaravan:
                
                movem.l d0/d5-a1,-(sp)
            if (FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
                move.w  #ITEM_NOTHING,d5
            endif
                moveq   #0,d0
                loadSavedDataAddress CARAVAN_ITEMS, a0
                movea.l a0,a1
                
                ; Caravan items number -> d7.w
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w caravanItemsToNumberOffset(a0),d7
            else
                move.w  caravanItemsToNumberOffset(a0),d7
            endif
                subq.w  #1,d7
                bcs.s   @Done
                
@Loop:          cmp.w   d0,d1
                bne.s   @Next
                
                ; Remove item
            if (FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
              if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w 0(a1),d5
              else
                move.w  (a1),d5
              endif
            endif
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a1
                
                ; Decrement items number
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                subq.b  #1,(caravanItemsNumberByteAddress).l
            else
                subq.w  #1,((CARAVAN_ITEMS_NUMBER-$1000000)).w
            endif
                bra.s   @Continue
@Next:
            if (FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
              if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w 0(a1),d6
                movep.w d6,0(a0)
              else
                move.w  (a1),(a0)
              endif
            else
                move.b  (a1),(a0)
            endif
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a0
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a1
                
@Continue:      addq.w  #1,d0
                dbf     d7,@Loop
                
                cmpa.l  a1,a0
                beq.s   @Done
            if (FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
              if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.w   #ITEM_NOTHING,d6
                movep.w d6,0(a0)
              else
                move.w  #ITEM_NOTHING,(a0)
              endif
            else
                move.b  #ITEM_NOTHING,(a0)
            endif
@Done:
            if (STANDARD_BUILD&FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
                move.w  d5,d1
            endif
                movem.l (sp)+,d0/d5-a1
                rts

    ; End of function RemoveItemFromCaravan

