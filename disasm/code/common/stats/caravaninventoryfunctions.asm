
; ASM FILE code\common\stats\caravaninventoryfunctions.asm :
; 0x9A3C..0x9A9A : Caravan inventory management functions

; =============== S U B R O U T I N E =======================================

; In: d1.w = item index (only the actual index is used, the status bits are cut out)


AddItemToCaravan:
                
                movem.l d0-d1/a0,-(sp)
                moveq   #CARAVAN_MAX_ITEMS_NUMBER_MINUS_ONE,d0
                cmp.w   ((CARAVAN_ITEMS_NUMBER-$1000000)).w,d0
                bcs.s   @Skip           ; skip adding item if no room
                lea     ((CARAVAN_ITEMS-$1000000)).w,a0
                move.w  ((CARAVAN_ITEMS_NUMBER-$1000000)).w,d0
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                move.b  d1,(a0,d0.w)
                addq.w  #1,((CARAVAN_ITEMS_NUMBER-$1000000)).w
@Skip:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function AddItemToCaravan


; =============== S U B R O U T I N E =======================================

; In: d1.w = inventory slot


RemoveItemFromCaravan:
                
                movem.l d0/d7-a1,-(sp)
                moveq   #0,d0
                lea     ((CARAVAN_ITEMS-$1000000)).w,a0
                movea.l a0,a1
                move.w  ((CARAVAN_ITEMS_NUMBER-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   @Done
@Loop:
                
                cmp.w   d0,d1
                bne.s   @Next
                
                ; Remove item
                addq.l  #CARAVAN_ITEM_ENTRY_SIZE,a1
                subq.w  #1,((CARAVAN_ITEMS_NUMBER-$1000000)).w
                bra.s   @Continue
@Next:
                
                move.b  (a1)+,(a0)+
@Continue:
                
                addq.w  #1,d0
                dbf     d7,@Loop
                
                cmpa.l  a1,a0
                beq.s   @Done
                move.b  #ITEM_NOTHING,(a0)
@Done:
                
                movem.l (sp)+,d0/d7-a1
                rts

    ; End of function RemoveItemFromCaravan

