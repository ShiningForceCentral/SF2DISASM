
; ASM FILE code\common\stats-standard\iteminventory.asm :
; 0x4F48A..0x4F6E2 : Item inventory management functions

; =============== S U B R O U T I N E =======================================

; In: d0.w = item index
;     d1.w = whether an item must be discarded if inventory is full (0 if false)
; 
; Out: d0.w = 0 if item was received, 1 if there was no room, or 2 if another item was discarded


ReceiveMandatoryItem:
                
                movem.l d1-d5/a0,-(sp)
                move.w  d0,d4
                move.w  d1,d5
                bsr.w   UpdateForce
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d3
                bra.s   @FindEmptyItemSlot
@FindEmptyItemSlot_Loop:
                
                clr.w   d0
                move.b  (a0)+,d0
                clr.w   d1
                bsr.w   GetItemBySlotAndHeldItemsNumber
                cmpi.w  #COMBATANT_ITEMSLOTS,d2
                bcs.s   @ReceiveItem
@FindEmptyItemSlot:
                
                dbf     d3,@FindEmptyItemSlot_Loop
                
                moveq   #1,d0
                tst.w   d5
                beq.s   @Done
                
                move.w  d4,(DIALOGUE_NAME_INDEX_1).l
                txt     214             ; "Found the {ITEM}, but{N}can't carry it.{N}You must discard something.{W1}"
                clsTxt
                
                move.w  d4,-(sp)
                bsr.s   DiscardItem     
                move.w  (sp)+,d1
                
                move.w  d0,(DIALOGUE_NAME_INDEX_1).l
                move.w  d2,(DIALOGUE_NAME_INDEX_2).l
                bsr.w   AddItem
                move.w  d1,(DIALOGUE_NAME_INDEX_3).l
                sndCom  MUSIC_ITEM
                txt     215             ; "{NAME} discarded{N}the {ITEM} and{N}picked up the {ITEM}."
                jsr     FadeOut_WaitForP1Input
                jsr     (WaitForPlayerInput).w
                clsTxt
                moveq   #2,d0
                bra.s   @Done
@ReceiveItem:
                
                move.w  d4,d1
                bsr.w   AddItem
                move.w  d0,(DIALOGUE_NAME_INDEX_1).l
                move.w  d1,(DIALOGUE_NAME_INDEX_2).l
                sndCom  MUSIC_ITEM
                txt     213             ; "{NAME} received the{N}{ITEM}."
                jsr     FadeOut_WaitForP1Input
                jsr     (WaitForPlayerInput).w
                clsTxt
                clr.w   d0
@Done:
                
                movem.l (sp)+,d1-d5/a0
                rts

    ; End of function ReceiveMandatoryItem


; =============== S U B R O U T I N E =======================================

; In: d1.w = item slot, d2.w = item index

itemTypeBitfield = -10
itemSlot = -6
itemEntry = -4
member = -2

DiscardItem:
                
                movem.l d7-a1,-(sp)
                link    a6,#-10
                bsr.w   UpdateForce
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     (GENERIC_LIST).l,a1
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,(GENERIC_LIST_LENGTH).l
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                bra.s   @Copy
                
@Copy_Loop:     move.b  (a0)+,(a1)+
@Copy:          dbf     d7,@Copy_Loop

@loc_2:         move.b  #ITEM_SUBMENU_ACTION_GIVE,(CURRENT_ITEM_SUBMENU_ACTION).l
                jsr     ExecuteMembersListScreenOnItemSummaryPage
                tst.w   d0
                beq.s   @loc_2
                
                move.w  d0,member(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,itemEntry(a6)
                move.w  itemEntry(a6),d1
                bsr.w   GetItemDefinitionAddress
                move.l  ITEMDEF_OFFSET_TYPE(a0),itemTypeBitfield(a6)
                move.b  itemTypeBitfield(a6),d1
                andi.b  #ITEMTYPE_UNSELLABLE,d1
                beq.s   @loc_4
                
                move.w  itemEntry(a6),(DIALOGUE_NAME_INDEX_1).l
                txt     37              ; "{LEADER}!  You can't{N}discard the {ITEM}!{W2}"
                bra.s   @loc_2
@loc_4:
                
                move.w  itemEntry(a6),(DIALOGUE_NAME_INDEX_1).l
                txt     44              ; "The {ITEM} will be{N}discarded.  Are you sure?"
                jsr     alt_YesNoPrompt
                clsTxt
                tst.w   d0
                bne.s   @loc_2
                
                move.w  itemEntry(a6),d1
                bsr.w   GetEquipmentType
                tst.w   d2
                beq.s   @loc_7  ;  0 = tool
                bmi.s   @loc_6  ; -1 = ring
                                ;  1 = weapon
                
                move.w  member(a6),d0
                bsr.w   GetEquippedWeapon
                tst.w   d1
                bmi.s   @loc_7
                
                cmp.w   itemSlot(a6),d2
                bne.s   @loc_7
                
                move.w  itemEntry(a6),d1
                bsr.w   IsItemCursed
                bcc.s   @loc_7
                
                move.w  itemEntry(a6),(DIALOGUE_NAME_INDEX_1).l
                txt     30              ; "{LEADER}!  You can't{N}remove the {ITEM}!{N}It's cursed!{W2}"
                clsTxt
                bra.w   @loc_2
@loc_6:
                
                move.w  member(a6),d0
                bsr.w   GetEquippedRing
                tst.w   d1
                bmi.s   @loc_7
                
                cmp.w   itemSlot(a6),d2
                bne.s   @loc_7
                
                move.w  itemEntry(a6),d1
                bsr.w   IsItemCursed
                bcc.s   @loc_7
                
                move.w  itemEntry(a6),(DIALOGUE_NAME_INDEX_1).l
                txt     30              ; "{LEADER}!  You can't{N}remove the {ITEM}!{N}It's cursed!{W2}"
                bra.w   @loc_2
@loc_7:
                
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                bsr.w   RemoveItemBySlot
                move.w  itemEntry(a6),(DIALOGUE_NAME_INDEX_1).l
                move.b  itemTypeBitfield(a6),d1
                andi.b  #ITEMTYPE_RARE,d1
                beq.s   @loc_9
                
                move.w  itemEntry(a6),d1
                bsr.w   AddItemToDeals
                bra.w   @loc_2
@loc_9:
                
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                move.w  itemEntry(a6),d2
                unlk    a6
                movem.l (sp)+,d7-a1
                rts

    ; End of function DiscardItem

