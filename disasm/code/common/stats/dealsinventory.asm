
; ASM FILE code\common\stats\dealsinventory.asm :
; 0x99DE..0x9A3C : Deals inventory management functions

; =============== S U B R O U T I N E =======================================

; In: d1.w = item index, Out: d2.b = number of item index in deals


GetDealsItemAmount:
                
                movem.l d0-d1/a0,-(sp)
                bsr.w   GetDealsItemInfo
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function GetDealsItemAmount


; =============== S U B R O U T I N E =======================================

; In: d1.w = item index


AddItemToDeals:
                
                movem.l d0-d2/a0,-(sp)
                bsr.w   GetDealsItemInfo
                cmpi.b  #DEALS_MAX_NUMBER_PER_ITEM,d2
                beq.s   @DumpItem
                add.b   d0,(a0)
@DumpItem:
                
                movem.l (sp)+,d0-d2/a0
                rts

    ; End of function AddItemToDeals


; =============== S U B R O U T I N E =======================================

; In: d1.w = item index


RemoveItemFromDeals:
                
                movem.l d0-d2/a0,-(sp)
                bsr.w   GetDealsItemInfo
                tst.b   d2
                beq.s   @Skip
                sub.b   d0,(a0)
@Skip:
                
                movem.l (sp)+,d0-d2/a0
                rts

    ; End of function RemoveItemFromDeals


; =============== S U B R O U T I N E =======================================

; In: d1.w = item index
; 
; Out: a0 = RAM address of deals slot
;      d0 = amount to add to deals slot (0x10 or 0x01)
;      d2.b = number of item index in deals


GetDealsItemInfo:
                
                andi.l  #ITEMENTRY_MASK_INDEX,d1
                lea     ((DEALS_ITEMS-$1000000)).w,a0
                divu.w  #2,d1
                adda.w  d1,a0
                move.b  (a0),d2
                btst    #DEALS_BIT_REMAINDER,d1 ; since deals are stacked 2 to a byte, this is the bit index that stores whether we are an even or odd item index
                bne.s   @OddIndex
                lsr.b   #NIBBLE_SHIFT_COUNT,d2
                moveq   #DEALS_ADD_AMOUNT_EVEN,d0
                bra.s   @Return
@OddIndex:
                
                andi.b  #DEALS_MAX_NUMBER_PER_ITEM,d2
                moveq   #DEALS_ADD_AMOUNT_ODD,d0
@Return:
                
                rts

    ; End of function GetDealsItemInfo

