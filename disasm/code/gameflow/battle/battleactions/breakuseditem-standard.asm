
; ASM FILE code\gameflow\battle\battleactions\breakuseditem-standard.asm :
;

; =============== S U B R O U T I N E =======================================

; Now making use of previously unused consumable item type bit.


WriteBattlesceneScript_BreakUsedItem:
                
                tst.b   (a4)
                bpl.s   @Continue                       ; continue if user is an ally
                cmpi.w  #BATTLEACTION_USE_ITEM,(a3)
                beq.s   @Continue                       ; continue if action type is "use item"
                rts
                
@Continue:      movem.l d0-d3/a0,-(sp)
                move.w  ((BATTLESCENE_ITEM-$1000000)).w,d1
                bsr.w   GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d2      ; d2.b = item type bitfield
                btst    #ITEMTYPE_BIT_CONSUMABLE,d2
                bne.s   @ConsumeItem                    ; immediately remove if item is a consumable
                
                ; Is item breakable?
                tst.b   d2
                bpl.s   @Done                           ; done if not
                
                ; Is item broken?
                tst.w   ((BATTLESCENE_ITEM-$1000000)).w
                bmi.s   @DestroyItem                    ; destroy item if so
                
                ; Determine item breaking
                moveq   #CHANCE_TO_BREAK_USED_ITEM,d0   ; 1/4 chance to break used item
                jsr     (GenerateRandomOrDebugNumber).w
                tst.b   d0
                bne.s   @Done                           ; done if item did not break
                
                ; Display item broken message, then break item
                moveq   #0,d0
                bsr.s   GetItemBreakMessage
                displayMessage d3,d1,#0,#0 ; Message, Combatant, Item or Spell, Number
                move.b  (a4),d0
                move.w  BATTLEACTION_OFFSET_ITEM_SLOT(a3),d1
                bsr.w   BreakItemBySlot
                bra.s   @Done
                
@DestroyItem:   ; Display item destroyed message, then remove item
                moveq   #1,d0
                bsr.s   GetItemBreakMessage
                displayMessage d3,d1,#0,#0 ; Message, Combatant, Item or Spell, Number
@ConsumeItem:   move.b  (a4),d0
                move.w  BATTLEACTION_OFFSET_ITEM_SLOT(a3),d1
                bsr.w   RemoveItemBySlot
@Done:          movem.l (sp)+,d0-d3/a0
                rts

    ; End of function WriteBattlesceneScript_BreakUsedItem


; =============== S U B R O U T I N E =======================================

; In: a2 = battlescene script stack frame
;     d0.b = whether item is already damaged (0=no, 1=yes)
; 
; Out: d3.w = message index

dodge = -5

GetItemBreakMessage:
                
                move.w  d0,-(sp)
                move.l  a0,-(sp)
                tst.b   d0
                bne.s   @Destroy
                
                tst.b   dodge(a2)
                bne.s   @BreakAndMiss
                move.w  #MESSAGE_BATTLE_USED_ITEM_HIT_AND_BROKEN_START,d3 
                bra.s   @FindItem                       ; But smoke rose from{N}the {ITEM}.{D1}
@BreakAndMiss:  move.w  #MESSAGE_BATTLE_USED_ITEM_MISS_AND_BROKEN_START,d3 
                bra.s   @FindItem                       ; And smoke emerged from{N}the {ITEM}.{D1}
                
@Destroy:       tst.b   dodge(a2)
                bne.s   @DestroyAndMiss
                move.w  #MESSAGE_BATTLE_USED_ITEM_HIT_AND_DESTROYED_START,d3 
                bra.s   @FindItem                       ; But, the {ITEM}{N}burst into flames.
@DestroyAndMiss:move.w  #MESSAGE_BATTLE_USED_ITEM_MISS_AND_DESTROYED_START,d3 
                                                        ; And the {ITEM}{N}burst into flames.
                
@FindItem:      move.w  ((BATTLESCENE_ITEM-$1000000)).w,d0
                andi.w  #ITEMENTRY_MASK_INDEX,d0
                lea     tbl_ItemBreakMessages(pc), a0
                
@FindItem_Loop: cmpi.w  #CODE_TERMINATOR_WORD,(a0)
                beq.s   @Done
                cmp.b   (a0)+,d0
                beq.s   @Found
                addq.l  #1,a0
                bra.s   @FindItem_Loop
                
@Found:         clr.w   d0
                move.b  (a0),d0
                add.w   d0,d3
@Done:          movea.l (sp)+,a0
                move.w  (sp)+,d0
                rts

    ; End of function GetItemBreakMessage

