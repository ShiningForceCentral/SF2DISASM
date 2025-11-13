
; ASM FILE code\common\stats-standard\itemstats.asm :
; Item stats management functions

; =============== S U B R O U T I N E =======================================

; Out: a0 = pointer to definition for item d1


GetItemDefinitionAddress:
                
                move.l  d1,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                mulu.w  #ITEMDEF_SIZE,d1
                getPointer p_table_ItemDefinitions, a0
                adda.w  d1,a0
                move.l  (sp)+,d1
                rts

    ; End of function GetItemDefinitionAddress


; =============== S U B R O U T I N E =======================================

; Get equipment type for item d1.w -> d2.w (0 = none, 1 = weapon, -1 = ring)


GetEquipmentType:
                
                move.l  a0,-(sp)
                bsr.s   GetItemDefinitionAddress
                addi.w  #ITEMDEF_OFFSET_TYPE,a0
                btst    #ITEMTYPE_BIT_WEAPON,(a0)
                bne.s   @Weapon
                
                btst    #ITEMTYPE_BIT_RING,(a0)
                bne.s   @Ring
                
                clr.w   d2              ; other
                bra.s   @Done
@Ring:
                
                moveq   #EQUIPMENTTYPE_RING,d2 ; ring
                bra.s   @Done
@Weapon:
                
                moveq   #EQUIPMENTTYPE_WEAPON,d2 ; weapon
@Done:
                
                movea.l (sp)+,a0
                rts

    ; End of function GetEquipmentType


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = item slot
; Out: d1.w = item entry, d2.l = number of items held


GetItemBySlotAndHeldItemsNumber:
                
                movem.l d0/d3/a0,-(sp)
                clr.w   d2
                bsr.w   GetCombatantEntryAddress
                
                lea     COMBATANT_OFFSET_ITEMS(a0),a0
                move.l  a0,d3
                add.w   d1,d1
                addToSavedBytePointer d1, a0
                getSavedWord a0, d1 ; move item d1 word in d1
                movea.l d3,a0
                
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d3
@Loop:          getSavedWordWithPostIncrement a0, d0
                andi.w  #ITEMENTRY_MASK_INDEX,d0
                cmpi.w  #ITEM_NOTHING,d0
                beq.s   @Nothing
                
                addq.w  #1,d2
@Nothing:       dbf     d3,@Loop
                
                movem.l (sp)+,d0/d3/a0
                rts

    ; End of function GetItemBySlotAndHeldItemsNumber


; =============== S U B R O U T I N E =======================================

                module

GetEquippedWeapon:
                
                movem.l d3-d4/a0-a1,-(sp)
                move.w  #ITEMTYPE_WEAPON,d4
                bra.s   @Continue
GetEquippedRing:
                
                movem.l d3-d4/a0-a1,-(sp)
                move.w  #ITEMTYPE_RING,d4
                bra.s   @Continue

; Get equipped weapon or ring and slot indexes for combatant d0.b -> d1.w, d2.w (-1 if nothing equipped)
;
;       In: d4.w = item type
;
GetEquippedItemByType:
                
                movem.l d3-d4/a0-a1,-(sp)
@Continue:
                
                bsr.w   GetCombatantEntryAddress
                movea.l a0,a1
                clr.w   d2
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d3
@Loop:
                
                getSavedWordWithPostIncrement a1, d1, COMBATANT_OFFSET_ITEMS
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   @Next           ; item not equipped, check next item
                
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Next           ; no item in slot, check next item
                
                bsr.w   GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d1
                and.b   d4,d1
                bne.s   @Break          ; found equipped item matching the given type, break out of loop
@Next:
                
                addq.w  #1,d2           ; return item slot in d2
                dbf     d3,@Loop
                
                move.w  #-1,d1
                move.w  d1,d2
                bra.s   @Done
@Break:
                
                getSavedWord a1, d1, COMBATANT_OFFSET_ITEMS-ITEMENTRY_SIZE ; get item from previous slot
                andi.w  #ITEMENTRY_MASK_INDEX,d1
@Done:
                
                movem.l (sp)+,d3-d4/a0-a1
                rts

    ; End of function GetEquippedItemByType

                modend

; =============== S U B R O U T I N E =======================================

; Add item to inventory while integrating the FIX_ENEMY_BATTLE_EQUIP patch.
;
; In: d0.b = combatant index, d1.w = item entry
; Out: d2.w = 0 if item successfully added, 1 if no empty slot available


AddItem:
                
                move.l  d0,-(sp)
                move.l  a0,-(sp)
                tst.b   d0
                bmi.s   @Enemy ; skip masking entry if enemy
                
                andi.w  #ITEMENTRY_MASK_INDEX_AND_BROKEN_BIT,d1
@Enemy:
                
                bsr.w   GetCombatantEntryAddress
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d0
@Loop:
                
                getSavedWordWithPostIncrement a0, d2, COMBATANT_OFFSET_ITEMS
                andi.w  #ITEMENTRY_MASK_INDEX,d2
                cmpi.w  #ITEM_NOTHING,d2
                beq.s   @Break
                
                dbf     d0,@Loop        ; loop over all items to make sure there's a slot open
                
                move.w  #1,d2           ; no empty slot available
                bra.s   @Done
@Break:
                setSavedWord d1, a0, COMBATANT_OFFSET_ITEMS-ITEMENTRY_SIZE
                clr.w   d2
@Done:
                
                movea.l (sp)+,a0
                move.l  (sp)+,d0
                rts

    ; End of function AddItem


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = item slot
; Out: d2 = -1 if item slot was empty


BreakItemBySlot:
                
                move.l  d1,-(sp)
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                add.w   d1,d1
                addToSavedBytePointer d1, a0
                getSavedWord a0, d1, COMBATANT_OFFSET_ITEMS
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Nothing
                
                breakItem a0
                clr.w   d2
                bra.s   @Done
@Nothing:
                
                moveq   #-1,d2          ; code -1: nothing
@Done:
                
                movea.l (sp)+,a0
                move.l  (sp)+,d1
                rts

    ; End of function BreakItemBySlot


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = item slot
; Out: d2 = 1 if item was not broken, -1 if item slot was empty


RepairItemBySlot:
                
                move.l  d1,-(sp)
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                add.w   d1,d1
                addToSavedBytePointer d1, a0
                getSavedWord a0, d1, COMBATANT_OFFSET_ITEMS
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Nothing      
                
                repairItem a0
                beq.s   @NotBroken
                
                clr.w   d2
                bra.s   @Done
@NotBroken:
                
                moveq   #1,d2
                bra.s   @Done
@Nothing:
                
                moveq   #-1,d2           ; code 3: nothing
@Done:
                
                movea.l (sp)+,a0
                move.l  (sp)+,d1
                rts

    ; End of function RepairItemBySlot


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = item slot
; Out: d2 = 0 if equipped, 1 if not, 2 if equipped and cursed, -1 if item is nothing


EquipItemBySlot:
                
                movem.l d0-d1/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                add.w   d1,d1           ; item slot -> additional offset
                addToSavedBytePointer d1, a0
                getSavedWord a0, d1, COMBATANT_OFFSET_ITEMS ; get item entry
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1 ; test if item is "nothing"
                beq.s   @Nothing
                
                bsr.s   IsItemEquippableAndCursed
                cmpi.w  #1,d2
                beq.s   @Done           ; skip if item is not equippable
                
                equipItem a0
                bra.s   @Done
@Nothing:
                
                moveq   #-1,d2          ; code -1: item is "nothing"
@Done:
                
                movem.l (sp)+,d0-d1/a0
                bra.w   UpdateCombatantStats

    ; End of function EquipItemBySlot


; =============== S U B R O U T I N E =======================================

; Is item d1.w equippable by ally d0.b and if so, is it cursed?
; 
;   Out: d2 = 0 if equippable, 1 if not, 2 if equippable and cursed


IsItemEquippableAndCursed:
                
                movem.l d0-d1/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_CLASS(a0),d0
                addq.b  #1,d0
                bsr.w   GetItemDefinitionAddress
                
            if (EXPANDED_CLASSES=1)
                move.l  a0,-(sp)
@EquipFlag_Loop:
                move.l  (a0)+,d1         ; get class-equippable bitfield
                cmpi.b  #32,d0
                bls.s   @EquipCompare
                subi.b  #32,d0
                bra.s   @EquipFlag_Loop
@EquipCompare:
                lsr.l   d0,d1           ; push relevant class-equippable bit into carry
                movea.l (sp)+,a0
                bcc.s   @NotEquippable
            else
                move.l  (a0),d1         ; get class-equippable bitfield
                lsr.l   d0,d1           ; push relevant class-equippable bit into carry
                bcc.s   @NotEquippable
            endif
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0) 
                                                        ; test cursed bit of itemdef's misc byte
                bne.s   @EquippableAndCursed
                clr.w   d2              ; code 0: equippable
                bra.s   @Done
@EquippableAndCursed:
                
                moveq   #2,d2           ; code 2: equippable, but cursed
                bra.s   @Done
@NotEquippable:
                
                moveq   #1,d2           ; code 1: not equippable
@Done:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function IsItemEquippableAndCursed


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = item slot
; Out: d2.w = 0 if equipped, 1 if not equipped, 2 if equipped and cursed, -1 if nothing


UnequipItemBySlotIfNotCursed:
                
                movem.l d0-d1/a0,-(sp)
                bsr.s   IsItemInSlotEquippedOrCursed
                tst.w   d2
                bne.s   @Skip           ; skip if anything but equipped and not cursed
                
                unequipItem a0
@Skip:
                
                movem.l (sp)+,d0-d1/a0
                bra.w   UpdateCombatantStats

    ; End of function UnequipItemBySlotIfNotCursed


; =============== S U B R O U T I N E =======================================

; Is item in slot d1.w equipped by combatant d0.b, and if so, is it cursed?
; 
;   In: d0.b = combatant index, d1.w = item slot
; 
;   Out: a0 = pointer to item entry
;        d2 = 0 if equipped, 1 if not equipped, 2 if equipped and cursed, -1 if neither


IsItemInSlotEquippedOrCursed:
                
                bsr.w   GetCombatantEntryAddress
                add.w   d1,d1
                addToSavedBytePointer d1, a0
                getSavedWord a0, d1, COMBATANT_OFFSET_ITEMS
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @EmptySlot
                
                isItemEquipped a0
                beq.s   @NotEquipped    
                
                move.l  a0,-(sp)
                bsr.w   GetItemDefinitionAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                movea.l (sp)+,a0
                
                bne.s   @Cursed         
                clr.w   d2              ; not cursed
                bra.s   @Return
@Cursed:
                
                moveq   #2,d2           ; cursed
                bra.s   @Return
@NotEquipped:
                
                moveq   #1,d2           ; not equipped
                bra.s   @Return
@EmptySlot:
                
                moveq   #-1,d2          ; empty slot
@Return:
                
                rts

    ; End of function IsItemInSlotEquippedOrCursed


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = item slot
; Out: d2 = 0 if equipped, 1 if not equipped, 2 if equipped and cursed, -1 if nothing


UnequipItemBySlot:
                
                movem.l d0-d1/a0,-(sp)
                bsr.s   IsItemInSlotEquippedOrCursed
                unequipItem a0
                movem.l (sp)+,d0-d1/a0
                bra.w   UpdateCombatantStats

    ; End of function UnequipItemBySlot


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = item slot
; Out: d2 = 2 if not dropped, -1 if dropped or nothing


DropItemBySlot:
                
                move.l  d0,-(sp)
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.w  d1,d0
                add.w   d1,d1
                addToSavedBytePointer d1, a0
                getSavedWord a0, d1, COMBATANT_OFFSET_ITEMS
                move.w  #3,d2
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Done
                
                move.l  a0,-(sp)
                bsr.w   GetItemDefinitionAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                movea.l (sp)+,a0
                beq.s   @NotCursed
                
                move.w  #2,d2           ; item cursed
                isItemEquipped a0
                bne.s   @Done           ; item equipped and cursed, so can't drop it
@NotCursed:
                
                bsr.s   RemoveAndArrangeItems
@Done:
                
                movea.l (sp)+,a0
                move.l  (sp)+,d0
                bra.w   UpdateCombatantStats

    ; End of function DropItemBySlot


; =============== S U B R O U T I N E =======================================

; In: a0 = combatant entry address (standard build), d0.w = item slot
; Out: d2.w = 0


RemoveAndArrangeItems:
                
                moveq   #2,d2
                sub.w   d0,d2           ; subtract item slot from 2 to make loop counter
                bmi.s   @Skip           ; no items to rearrange, so skip to removal
@Loop:
                
                getSavedWord a0, d0, COMBATANT_OFFSET_ITEMS+ITEMENTRY_SIZE ; shift item -1 slots
                setSavedWord d0, a0, COMBATANT_OFFSET_ITEMS
                addq.w  #ITEMENTRY_SIZE,a0
                dbf     d2,@Loop        
@Skip:
                
                move.w  #ITEM_NOTHING,d0
                setSavedWord d0, a0, COMBATANT_OFFSET_ITEMS ; replace item with nothing
                clr.w   d2
                rts

    ; End of function RemoveAndArrangeItems


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = item slot
; Out: d2.w = -1 if nothing to remove, 0 otherwise


RemoveItemBySlot:
                
                move.l  d0,-(sp)
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.w  d1,d0
                add.w   d1,d1
                addToSavedBytePointer d1, a0
                getSavedWord a0, d1, COMBATANT_OFFSET_ITEMS
                move.w  d1,d2
                andi.w  #ITEMENTRY_MASK_INDEX,d2
                cmpi.w  #ITEM_NOTHING,d2
                beq.s   @Nothing
                
                bsr.s   RemoveAndArrangeItems
                bra.s   @Done
@Nothing:
                
                moveq   #-1,d2
@Done:
                
                movea.l (sp)+,a0
                move.l  (sp)+,d0
                bra.w   UpdateCombatantStats

    ; End of function RemoveItemBySlot


; =============== S U B R O U T I N E =======================================

; Out: d0.w = -1 if item was not found


RemoveItemFromInventory:
                
                move.l  d1,-(sp)
                move.l  d2,-(sp)
                move.w  d0,d1
                bsr.s   GetItemInventoryLocation
                tst.w   d0
                bmi.s   @Done
                
                bsr.s   RemoveItemBySlot
                moveq   #-1,d0
                tst.w   d2
                bmi.s   @Done
                
                clr.w   d0
@Done:
                
                move.l  (sp)+,d2
                move.l  (sp)+,d1
                rts

    ; End of function RemoveItemFromInventory


; =============== S U B R O U T I N E =======================================

; In: d1.w = item
; Out: d0.b = character, d1.w = item slot (-1 if item was not found)


GetItemInventoryLocation:
                
                movem.l d2-d3/d6-a0,-(sp)
                move.w  d1,d3
                bsr.w   UpdateForce     
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d6
                bra.s   @NextCharacter
@Characters_Loop:
                
                move.b  (a0)+,d0
                clr.w   d1
                bsr.w   GetItemBySlotAndHeldItemsNumber
                tst.w   d2
                beq.s   @NextCharacter
                
                move.w  d2,d7           ; number of items
                bra.s   @NextItem
@Items_Loop:
                
                move.w  d7,d1
                bsr.w   GetItemBySlotAndHeldItemsNumber
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmp.w   d3,d1
                bne.s   @NextItem
                
                move.w  d7,d1
                bra.s   @Done
@NextItem:
                
                dbf     d7,@Items_Loop
@NextCharacter:
                
                dbf     d6,@Characters_Loop
                moveq   #-1,d0
                moveq   #-1,d1
@Done:
                
                movem.l (sp)+,d2-d3/d6-a0
                rts

    ; End of function GetItemInventoryLocation


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = item index
; Out: d2.w = item slot (-1 if not found)


GetItemSlotContainingIndex:
                
                movem.l d1/d3/d7,-(sp)
                move.w  d1,d3
                andi.w  #ITEMENTRY_MASK_INDEX,d3
                
                moveq   #0,d2
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d7
@Loop:
                
                move.w  d2,d1
                move.l  d2,-(sp)
                jsr     GetItemBySlotAndHeldItemsNumber(pc)
                move.l  (sp)+,d2
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmp.b   d3,d1
                beq.s   @Done
                
                addq.w  #1,d2
                dbf     d7,@Loop
                
                moveq   #-1,d2
@Done:
                
                movem.l (sp)+,d1/d3/d7
                rts

    ; End of function GetItemSlotContainingIndex


; =============== S U B R O U T I N E =======================================


UnequipWeapon:
                
                movem.l d0-d2/a0-a1,-(sp)
                move.w  #ITEMTYPE_WEAPON,d2
                bra.s   UnequipItemByType
UnequipRing:
                
                movem.l d0-d2/a0-a1,-(sp)
                move.w  #ITEMTYPE_RING,d2
UnequipItemByType:
                
                bsr.w   GetCombatantEntryAddress
                movea.l a0,a1
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d0
@Loop:
                
                getSavedWord a1, d1, COMBATANT_OFFSET_ITEMS
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   @Next
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                bsr.w   GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d1
                and.b   d2,d1
                beq.s   @Next
                
                unequipItem a1
@Next:
                
                addq.w  #ITEMENTRY_SIZE,a1
                dbf     d0,@Loop
                
                movem.l (sp)+,d0-d2/a0-a1
                bra.w   UpdateCombatantStats

    ; End of function UnequipItemByType


; =============== S U B R O U T I N E =======================================

; Out: a0 = pointer to equippable items list
;      d1.w = equippable weapons or ring count

                module  ; Start of equippable items getter module
                
GetEquippableWeapons:
                
                movem.l d0/d2-d6/a1-a2,-(sp)
                move.w  #ITEMTYPE_WEAPON,d2
                bra.s   GetEquippableItemsByType
GetEquippableRings:
                
                movem.l d0/d2-d6/a1-a2,-(sp)
                move.w  #ITEMTYPE_RING,d2
GetEquippableItemsByType:
                
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_CLASS(a0),d0
                
            if (EXPANDED_CLASSES=1)
                clr.w   d7
@CompareClass_Loop:
                cmpi.b  #31,d0
                bls.w   @Break
                subi.b  #32,d0
                addq.w  #1,d7
                bra.s   @CompareClass_Loop
                
@Break:
            endif
                
                moveq   #1,d3
                lsl.l   d0,d3           ; place class bit in long value
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a2
                
                ; Initialize list with default values
                move.l  #(ITEM_NOTHING<<WORD_SHIFT_COUNT)|4,(a2)
                move.l  #(ITEM_NOTHING<<WORD_SHIFT_COUNT)|4,4(a2)
                move.l  #(ITEM_NOTHING<<WORD_SHIFT_COUNT)|4,8(a2)
                move.l  #(ITEM_UNARMED<<WORD_SHIFT_COUNT)|4,12(a2)
                clr.w   d0
                moveq   #0,d4
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d5
@Loop:
                
                getSavedWord a0, d1, COMBATANT_OFFSET_ITEMS
                addq.w  #ITEMENTRY_SIZE,a0
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Next           ; next if empty slot
                bsr.s   IsItemEquippable
                bcc.s   @Next           ; branch if not equippable
                move.w  d1,(a2)+        ; item index -> equippable items list
                move.w  d4,(a2)+        ; item slot -> equippable items list
                addq.w  #1,d0
@Next:
                
                addq.w  #1,d4
                dbf     d5,@Loop
                
                move.w  d0,d1
                movem.l (sp)+,d0/d2-d6/a1-a2
                lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a0
                rts

    ; End of function GetEquippableItemsByType

                modend  ; End of equippable items getter module

; =============== S U B R O U T I N E =======================================

; In: d1.w = item index
;     d2.w = item type bitmask (for ANDing the item type bitfield)
;     d3.l = class equip bitmask (for ANDing the item equip bitfield)
; 
; Out: CCR carry-bit set if true


IsItemEquippable:
                
            if (EXPANDED_CLASSES=1)
                ; In: d7.w = equip flags group 0 or 1
                movem.l d7/a0,-(sp)
                bsr.w   GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d6
                and.b   d2,d6
                beq.s   @Done           ; skip if not a weapon/ring
                
                lsl.w   #2,d7
                adda.l  d7,a0
                move.l  (a0),d6
                and.l   d3,d6
                beq.s   @Done
                
                ori     #1,ccr          ; set carry flag : Item is Equippable !
@Done:
                
                movem.l (sp)+,d7/a0
                rts
            else
                move.l  a0,-(sp)
                bsr.w   GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d6
                and.b   d2,d6
                beq.s   @Done           ; skip if not a weapon/ring
                
                move.l  (a0),d6
                and.l   d3,d6
                beq.s   @Done
                
                ori     #1,ccr          ; set carry flag : Item is Equippable !
@Done:
                
                movea.l (sp)+,a0
                rts
            endif

    ; End of function IsItemEquippable


; =============== S U B R O U T I N E =======================================

; Is weapon or ring d1.w equippable by combatant d0.w?
; Return CCR carry-bit set if true.


                module
                
IsWeaponEquippable:
                
                movem.l d0/d2-d7/a0,-(sp)
                move.w  #ITEMTYPE_WEAPON,d2
                bra.s   @Continue
IsRingEquippable:
                
                movem.l d0/d2-d7/a0,-(sp)
                move.w  #ITEMTYPE_RING,d2
                bra.s   @Continue
IsWeaponOrRingEquippable:
                
                movem.l d0/d2-d7/a0,-(sp)
                move.w  #ITEMTYPE_WEAPON|ITEMTYPE_RING,d2
@Continue:      bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_CLASS(a0),d0
                
            if (EXPANDED_CLASSES=1)
                clr.w   d7
@CompareClass_Loop:
                cmpi.b  #31,d0
                bls.w   @Break
                subi.b  #32,d0
                addq.w  #1,d7
                bra.s   @CompareClass_Loop
                
@Break:
            endif
                
                moveq   #1,d3
                lsl.l   d0,d3
                bsr.s   IsItemEquippable
                movem.l (sp)+,d0/d2-d7/a0
                rts

    ; End of function IsWeaponOrRingEquippable

                modend

; =============== S U B R O U T I N E =======================================

; In: d1.w = index of new item being equipped
; Out: d2.w, d3.w = new ATT and DEF


GetEquipNewAttAndDef:
                
                movem.l d0/d4-d6/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d2
                move.b  COMBATANT_OFFSET_ATT_CURRENT(a0),d2
                clr.w   d3
                move.b  COMBATANT_OFFSET_DEF_CURRENT(a0),d3 ; default to current ATT and DEF with currently equipped item
                
                ; Is new item equippable?
                movem.w d0/d2-d3,-(sp)
                move.w  #ITEMTYPE_WEAPON|ITEMTYPE_RING,d2
                clr.w   d0
                move.b  COMBATANT_OFFSET_CLASS(a0),d0
                
            if (EXPANDED_CLASSES=1)
                clr.w   d7
@CompareClass_Loop:
                cmpi.b  #31,d0
                bls.w   @Break
                subi.b  #32,d0
                addq.w  #1,d7
                bra.s   @CompareClass_Loop
                
@Break:
            endif
                
                moveq   #1,d3
                lsl.l   d0,d3
                bsr.w   IsItemEquippable
                movem.w (sp)+,d0/d2-d3
                bcc.w   @Skip           ; skip if item is not equippable
                
                ; Get new item type
                movem.l d1/a0,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                bsr.w   GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d2
                movem.l (sp)+,d1/a0
                
                andi.w  #ITEMTYPE_WEAPON|ITEMTYPE_RING,d2 ; get weapon/ring type
                bsr.w   GetNewAttAndDefWithItemEquipped
@Skip:
                
                movem.l (sp)+,d0/d4-d6/a0
                rts

    ; End of function GetEquipNewAttAndDef
                

; =============== S U B R O U T I N E =======================================

; In: a0 = combatant entry address
;     d1.w = new item index
;     d2.w = new item type (weapon or ring)
;
; Out: d2.w = current ATT with new item equipped
;      d3.w = current DEF with new item equipped


GetNewAttAndDefWithItemEquipped:
                
                movem.l d0-d1/d4-a0,-(sp)
                
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d7
                move.l  a0,d4                           ; d4.l = combatant entry address backup
@FindEquippedItem_Loop:
                
                ; Find currently equipped item of the same type as the new one
                getSavedWord a0, d5, COMBATANT_OFFSET_ITEMS
                btst    #ITEMENTRY_BIT_EQUIPPED,d5
                beq.s   @Next
                
                movem.l d0-d1/a0,-(sp)                  ; it's equipped
                move.w  d5,d1
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                bsr.w   GetItemDefinitionAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),d0
                and.b   d2,d0
                movem.l (sp)+,d0-d1/a0
                bne.s   @GetNewAttAndDef                ; is the item type we're looking for, so start with this one
                
@Next:          addq.w  #ITEMENTRY_SIZE,a0
                dbf     d7,@FindEquippedItem_Loop
                
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d7
                movea.l d4,a0
@FindFirstUnequippedItem_Loop:
                
                getSavedWord a0, d5, COMBATANT_OFFSET_ITEMS
                btst    #ITEMENTRY_BIT_EQUIPPED,d5
                beq.s   @GetNewAttAndDef
                addq.w  #ITEMENTRY_SIZE,a0
                dbf     d7,@FindFirstUnequippedItem_Loop
                
                movea.l d4,a0                               ; default to the first item slot
@GetNewAttAndDef:
                
                ; In: a0 = combatant entry address + item slot offset
                getSavedWord a0, d5, COMBATANT_OFFSET_ITEMS ; d5.w = old equipped item index
                
                ; Temporarily equip the new item in place of the old one
                movem.l d4-d5/a0,-(sp)
                bset    #ITEMENTRY_BIT_EQUIPPED,d1
                setSavedWord d1, a0, COMBATANT_OFFSET_ITEMS
                bsr.w   UpdateCombatantStats
                movea.l d4,a0                               ; temporarily restore combatant entry address
                clr.w   d2
                move.b  COMBATANT_OFFSET_ATT_CURRENT(a0),d2
                clr.w   d3
                move.b  COMBATANT_OFFSET_DEF_CURRENT(a0),d3
                movem.l (sp)+,d4-d5/a0
                
                movem.w d2-d3,-(sp)
                setSavedWord d5, a0, COMBATANT_OFFSET_ITEMS ; then re-equip the old one
                bsr.w   UpdateCombatantStats
                movem.w (sp)+,d2-d3
                
                movem.l (sp)+,d0-d1/d4-a0
                rts

    ; End of function GetNewAttAndDefWithItemEquipped


; =============== S U B R O U T I N E =======================================

; Is item d1.w cursed? Return CCR carry-bit set if true.


IsItemCursed:
                
                move.l  a0,-(sp)
                bsr.w   GetItemDefinitionAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   @NotCursed
                
                ori     #1,ccr          ; item is cursed
                bra.s   @Done
@NotCursed:
                
                tst.b   d0              ; clear carry flag
@Done:
                
                movea.l (sp)+,a0
                rts

    ; End of function IsItemCursed


; =============== S U B R O U T I N E =======================================

; Is item d1.w usable in battle? Return CCR carry-bit set if true.
;
; Integrates FIX_USABLE_ITEM_VALIDATION patch.

IsItemUsableInBattle:
                
                move.l  a0,-(sp)
                bsr.w   GetItemDefinitionAddress
                cmpi.b  #SPELL_NOTHING,ITEMDEF_OFFSET_USE_SPELL(a0)
                beq.s   @HasNoUse
                
                ori     #1,ccr
                bra.s   @Done
@HasNoUse:
                
                tst.b   d0
@Done:
                
                movea.l (sp)+,a0
                rts

    ; End of function IsItemUsableInBattle


; =============== S U B R O U T I N E =======================================

; Is item d1.w allowed to be used in battle by combatant d0.w?
; Return CCR carry-bit set if true.


IsItemUsableByCombatant:
                
                move.l  a0,-(sp)
                bsr.w   GetEquipmentType
                tst.w   d2
                beq.s   @Usable         ; allow usage if item is not a type of equipment
                
                bsr.w   IsWeaponOrRingEquippable
                bcc.s   @NotUsable      ; if weapon or ring is not equippable, disallow usage
                
                bsr.s   IsItemUsableInBattle
                bcc.s   @NotUsable      ; if item has no use spell, disallow usage
@Usable:
                
                ori     #1,ccr
                bra.s   @Done
@NotUsable:
                
                tst.b   d0
@Done:
                
                movea.l (sp)+,a0
                rts

    ; End of function IsItemUsableByCombatant


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index


UnequipAllItemsIfNotCursed:
                
                movem.l d0-d1/a0-a1,-(sp)
                bsr.w   GetCombatantEntryAddress
                movea.l a0,a1
                moveq   #COMBATANT_ITEMSLOTS_COUNTER,d0
@Loop:
                
                getSavedWord a1, d1, COMBATANT_OFFSET_ITEMS
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   @Next
                
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Next
                
                bsr.w   GetItemDefinitionAddress
                btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   @Next
                
                unequipItem a1
@Next:
                
                addq.w  #ITEMENTRY_SIZE,a1
                dbf     d0,@Loop
                
                movem.l (sp)+,d0-d1/a0-a1
                bra.w   UpdateCombatantStats

    ; End of function UnequipAllItemsIfNotCursed

