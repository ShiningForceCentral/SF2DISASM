
; ASM FILE code\common\stats\items\itemfunctions_s7_0.asm :
; 0x4F48A..0x4F6E2 : Unidentified item functions

; =============== S U B R O U T I N E =======================================

; In: d0.w = item index
;     d1.w = whether an item must be discarded if inventory is full (0 if false)
; 
; Out: d0.w = 0 if item was received, 1 if there was no room, or 2 if another item was discarded


ReceiveMandatoryItem:
                
                movem.l d1-d5/a0,-(sp)
                move.w  d0,d4
                move.w  d1,d5
                jsr     j_UpdateForce
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d3
                subq.w  #1,d3
@FindEmptyItemSlot_Loop:
                
                clr.w   d0
                move.b  (a0)+,d0
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                cmpi.w  #COMBATANT_ITEMSLOTS,d2
                bcs.w   @ReceiveItem
                dbf     d3,@FindEmptyItemSlot_Loop
                
                moveq   #1,d0
                tst.w   d5
                beq.w   @Done
                move.w  d4,(DIALOGUE_NAME_INDEX_1).l
                txt     214             ; "Found the {ITEM}, but{N}can't carry it.{N}You must discard something.{W1}"
                clsTxt
                movem.w d4,-(sp)
                bsr.w   DiscardItem     
                movem.w (sp)+,d1
                move.w  d0,(DIALOGUE_NAME_INDEX_1).l
                move.w  d2,(DIALOGUE_NAME_INDEX_2).l
                jsr     j_AddItem
                move.w  d1,(DIALOGUE_NAME_INDEX_3).l
                sndCom  MUSIC_ITEM
                txt     215             ; "{NAME} discarded{N}the {ITEM} and{N}picked up the {ITEM}."
                jsr     j_FadeOut_WaitForP1Input
                jsr     (WaitForPlayerInput).w
                clsTxt
                moveq   #2,d0
                bra.w   @Done
@ReceiveItem:
                
                move.w  d4,d1
                jsr     j_AddItem
                move.w  d0,(DIALOGUE_NAME_INDEX_1).l
                move.w  d1,(DIALOGUE_NAME_INDEX_2).l
                sndCom  MUSIC_ITEM
                txt     213             ; "{NAME} received the{N}{ITEM}."
                jsr     j_FadeOut_WaitForP1Input
                jsr     (WaitForPlayerInput).w
                clsTxt
                clr.w   d0
@Done:
                
                movem.l (sp)+,d1-d5/a0
                rts

    ; End of function ReceiveMandatoryItem


; =============== S U B R O U T I N E =======================================


RemoveItemFromInventory:
                
                movem.w d1-d2,-(sp)
                move.w  d0,d1
                jsr     j_GetItemInventoryLocation
                cmpi.w  #-1,d0
                beq.w   @Done
                jsr     j_RemoveItemBySlot
                move.w  #-1,d0
                cmpi.w  #3,d2
                beq.w   @Done
                clr.w   d0
@Done:
                
                movem.w (sp)+,d1-d2
                rts

    ; End of function RemoveItemFromInventory


; =============== S U B R O U T I N E =======================================

; In: D1 = item slot
;     D2 = item index

itemTypeBitfield = -10
itemSlot = -6
itemEntry = -4
member = -2

DiscardItem:
                
                movem.l d7-a1,-(sp)
                link    a6,#-12
                jsr     j_UpdateForce
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     (GENERIC_LIST).l,a1
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,(GENERIC_LIST_LENGTH).l
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
loc_4F596:
                
                move.b  (a0)+,(a1)+
                dbf     d7,loc_4F596
loc_4F59C:
                
                move.b  #ITEM_SUBMENU_ACTION_GIVE,(CURRENT_ITEM_SUBMENU_ACTION).l
                jsr     j_ExecuteMembersListScreenOnItemSummaryPage
                cmpi.w  #-1,d0
                bne.w   loc_4F5B6
                bra.w   loc_4F6CA
loc_4F5B6:
                
                move.w  d0,member(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,itemEntry(a6)
                move.w  itemEntry(a6),d1
                jsr     j_GetItemDefAddress
                move.l  ITEMDEF_OFFSET_TYPE(a0),itemTypeBitfield(a6)
                move.b  itemTypeBitfield(a6),d1
                andi.b  #ITEMTYPE_UNSELLABLE,d1
                cmpi.b  #0,d1
                beq.s   loc_4F5F0
                move.w  itemEntry(a6),(DIALOGUE_NAME_INDEX_1).l
                txt     37              ; "{LEADER}!  You can't{N}discard the {ITEM}!{W2}"
                bra.w   loc_4F6CA
loc_4F5F0:
                
                move.w  itemEntry(a6),(DIALOGUE_NAME_INDEX_1).l
                txt     44              ; "The {ITEM} will be{N}discarded.  Are you sure?"
                jsr     j_alt_YesNoPrompt
                clsTxt
                cmpi.w  #0,d0
                beq.w   loc_4F610
                bra.s   loc_4F59C
loc_4F610:
                
                move.w  itemEntry(a6),d1
                jsr     j_GetEquipmentType
                cmpi.w  #EQUIPMENTTYPE_WEAPON,d2
                bne.s   loc_4F65C
                move.w  member(a6),d0
                jsr     j_GetEquippedWeapon
                cmpi.w  #-1,d1
                beq.w   loc_4F69C
                
                cmp.w   itemSlot(a6),d2
                bne.w   loc_4F69C
                move.w  itemEntry(a6),d1
                jsr     j_IsItemCursed
                bcc.w   loc_4F69C
                move.w  itemEntry(a6),(DIALOGUE_NAME_INDEX_1).l
                txt     30              ; "{LEADER}!  You can't{N}remove the {ITEM}!{N}It's cursed!{W2}"
                clsTxt
                bra.w   loc_4F6CA
loc_4F65C:
                
                cmpi.w  #0,d2
                beq.w   loc_4F69C
                move.w  member(a6),d0
                jsr     j_GetEquippedRing
                cmpi.w  #-1,d1
                beq.w   loc_4F69C
                
                cmp.w   itemSlot(a6),d2
                bne.w   loc_4F69C
                move.w  itemEntry(a6),d1
                jsr     j_IsItemCursed
                bcc.w   loc_4F69C
                move.w  itemEntry(a6),(DIALOGUE_NAME_INDEX_1).l
                txt     30              ; "{LEADER}!  You can't{N}remove the {ITEM}!{N}It's cursed!{W2}"
                bra.w   loc_4F6CA
loc_4F69C:
                
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  itemEntry(a6),(DIALOGUE_NAME_INDEX_1).l
                move.b  itemTypeBitfield(a6),d1
                andi.b  #ITEMTYPE_RARE,d1
                cmpi.b  #0,d1
                beq.s   loc_4F6CE
                move.w  itemEntry(a6),d1
                jsr     j_AddItemToDeals
loc_4F6CA:
                
                bra.w   loc_4F59C
loc_4F6CE:
                
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                move.w  itemEntry(a6),d2
                unlk    a6
                movem.l (sp)+,d7-a1
                rts

    ; End of function DiscardItem

