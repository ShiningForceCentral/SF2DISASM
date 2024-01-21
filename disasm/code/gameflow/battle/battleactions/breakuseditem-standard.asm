
; ASM FILE code\gameflow\battle\battleactions\breakuseditem-standard.asm :
;

; =============== S U B R O U T I N E =======================================

; Now making use of previously unused consumable item type bit.


battlesceneScript_BreakUsedItem:
                
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                bne.s   @Return                         ; return if not using an item
                
                movem.l d0-d3/a0,-(sp)
                move.w  ((BATTLESCENE_ITEM-$1000000)).w,d1  ; d1.w = item entry
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d2      ; d2.b = item type bitfield
                btst    #ITEMTYPE_BIT_CONSUMABLE,d2
                beq.s   @Continue                       ; continue if item is not a consumable
                
                ; Consume item
                move.b  (a4),d0
                move.w  BATTLEACTION_OFFSET_ITEM_SLOT(a3),d1
                bra.s   @RemoveItem
                
@Continue:      ; Check if item is allowed to break
                tst.b   d2
                bpl.s   @Done                           ; done if item cannot break
                tst.b   (a4)
                bmi.s   @Done                           ; done if user is an enemy           
                
                ; Is item already broken?
                tst.w   d1
                bmi.s   @DestroyItem                    ; destroy item if so
                
                ; Determine item breaking
                moveq   #CHANCE_TO_BREAK_USED_ITEM,d0   ; 1/4 chance to break used item
                jsr     (GenerateRandomOrDebugNumber).w
                tst.b   d0
                bne.s   @Done                           ; done if item did not break
                
                ; Display item broken message, then break item
                moveq   #0,d0
                bsr.s   DisplayItemBreakMessage
                bsr.w   BreakItemBySlot
                bra.s   @Done
                
@DestroyItem:   ; Display item destroyed message, then remove item
                moveq   #1,d0
                bsr.s   DisplayItemBreakMessage
@RemoveItem:    bsr.w   RemoveItemBySlot
            if (SEND_DESTROYED_ITEMS_TO_DEALS=1)
                ; Add destroyed item to deals if rare and if not a consumable
                btst    #ITEMTYPE_BIT_CONSUMABLE,d2
                bne.s   @Done
                btst    #ITEMTYPE_BIT_RARE,d2
                beq.s   @Done
                move.w  ((BATTLESCENE_ITEM-$1000000)).w,d1
                bsr.w   AddItemToDeals
            endif
@Done:          movem.l (sp)+,d0-d3/a0
@Return:        rts

    ; End of function battlesceneScript_BreakUsedItem


; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     d0.b = whether item is already damaged (0=no, 1=yes)
;     d1.w = item entry
; 
; Out: d0.b = user combatant index
;      d1.w = item slot

dodge = -5

DisplayItemBreakMessage:
                
                tst.b   d0
                bne.s   @Destroy
                
                ; Broken messages
                tst.b   dodge(a2)
                bne.s   @BreakAndMiss
                move.w  #MESSAGE_BATTLE_USED_ITEM_HIT_AND_BROKEN_START,d3 
                bra.s   @FindItem                       ; But smoke rose from{N}the {ITEM}.{D1}
@BreakAndMiss:  move.w  #MESSAGE_BATTLE_USED_ITEM_MISS_AND_BROKEN_START,d3 
                bra.s   @FindItem                       ; And smoke emerged from{N}the {ITEM}.{D1}
                
                ; Destroyed messages
@Destroy:       tst.b   dodge(a2)
                bne.s   @DestroyAndMiss
                move.w  #MESSAGE_BATTLE_USED_ITEM_HIT_AND_DESTROYED_START,d3 
                bra.s   @FindItem                       ; But, the {ITEM}{N}burst into flames.
@DestroyAndMiss:move.w  #MESSAGE_BATTLE_USED_ITEM_MISS_AND_DESTROYED_START,d3 
                                                        ; And the {ITEM}{N}burst into flames.
                
@FindItem:      andi.w  #ITEMENTRY_MASK_INDEX,d1
                lea     table_ItemBreakMessages(pc), a0
                
@FindItem_Loop: cmpi.w  #TERMINATOR_WORD,(a0)
                beq.s   @Break
                cmp.b   (a0)+,d1
                beq.s   @Found
                addq.l  #1,a0
                bra.s   @FindItem_Loop
                
@Found:         move.b  (a0),d0
                add.w   d0,d3
                
@Break:         ; Display battle message and return user combatant index and item slot
                displayMessage d3,d1,#0,#0 ; Message, Combatant, Item or Spell, Number
                move.b  (a4),d0
                move.w  BATTLEACTION_OFFSET_ITEM_SLOT(a3),d1
                rts

    ; End of function DisplayItemBreakMessage

