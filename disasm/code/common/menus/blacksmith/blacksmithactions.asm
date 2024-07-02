
; ASM FILE code\common\menus\blacksmith\blacksmithactions.asm :
; 0x21A3A..0x21EB6 : Blacksmith functions

; =============== S U B R O U T I N E =======================================

clientClass = -24
ordersCounter = -22
fulfillOrdersFlag = -20
readyToFulfillOrdersNumber = -18
fulfilledOrdersNumber = -16
pendingOrdersNumber = -14
itemSlot = -12
itemIndex = -10
targetMember = -8
clientMember = -6
currentGold = -4

BlacksmithMenu:
                
                movem.l d0-a5,-(sp)
                link    a6,#-24
                moveq   #0,d1
                move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
                blt.s   byte_21A50      
                jsr     j_OpenPortraitWindow
byte_21A50:
                
                txt     194             ; "Welcome to the Dwarf{N}Craftsman!{D3}"
                jsr     j_ClosePortraitWindow
                clr.w   readyToFulfillOrdersNumber(a6)
                clr.w   pendingOrdersNumber(a6)
                clr.w   fulfilledOrdersNumber(a6)
                clr.w   fulfillOrdersFlag(a6)
                bsr.w   ProcessBlacksmithOrders
                moveq   #0,d1
                move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
                blt.s   byte_21A7C      
                jsr     j_OpenPortraitWindow
byte_21A7C:
                
                txt     198             ; "{CLEAR}Thank you very much!{W1}"
                clsTxt
                jsr     j_ClosePortraitWindow
                unlk    a6
                movem.l (sp)+,d0-a5
                rts

    ; End of function BlacksmithMenu


; =============== S U B R O U T I N E =======================================

clientClass = -24
ordersCounter = -22
fulfillOrdersFlag = -20
readyToFulfillOrdersNumber = -18
fulfilledOrdersNumber = -16
pendingOrdersNumber = -14
itemSlot = -12
itemIndex = -10
targetMember = -8
clientMember = -6
currentGold = -4

ProcessBlacksmithOrders:
                
                module
                jsr     j_UpdateForce
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,((GENERIC_LIST_LENGTH-$1000000)).w
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     ((GENERIC_LIST-$1000000)).w,a1
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.b  #1,d7
@CopyForceMembersList_Loop:
                
                move.b  (a0)+,(a1)+
                dbf     d7,@CopyForceMembersList_Loop
                
                ; Ready to fulfill orders?
                bsr.w   CountPendingAndReadyToFulfillOrders
                cmpi.w  #1,fulfillOrdersFlag(a6)
                bne.w   @CheckReadyToFulfillOrders
                
                ; Fulfill orders
                move.w  #BLACKSMITH_MAX_ORDERS_NUMBER,d7
                subq.w  #1,d7
                loadSavedDataAddress MITHRIL_WEAPONS_ON_ORDER, a0
@FulfillOrders_Loop:
                
                getSavedMithrilWeaponOrder a0, itemIndex(a6)
                beq.s   @Next
                move.w  d7,ordersCounter(a6)
                addi.w  #1,ordersCounter(a6)
                bsr.w   BlacksmithAction_FulfillOrder
@Next:
                
                dbf     d7,@FulfillOrders_Loop
@CheckReadyToFulfillOrders:
                
                cmpi.w  #0,readyToFulfillOrdersNumber(a6)
                beq.w   @CheckPendingOrders
                
                move.w  readyToFulfillOrdersNumber(a6),d0
                add.w   pendingOrdersNumber(a6),d0
                sub.w   fulfilledOrdersNumber(a6),d0
                cmpi.w  #BLACKSMITH_MAX_ORDERS_NUMBER,d0
                beq.w   @Return
                txt     196             ; "{CLEAR}Anything else?"
                bra.w   @Call_PlaceOrder
@CheckPendingOrders:
                
                cmpi.w  #0,pendingOrdersNumber(a6)
                beq.w   byte_21B38      ; @StartOrder
                
                txt     206             ; "Oops...{N}I needs some more time.{W1}"
                move.w  readyToFulfillOrdersNumber(a6),d0
                add.w   pendingOrdersNumber(a6),d0
                sub.w   fulfilledOrdersNumber(a6),d0
                cmpi.w  #BLACKSMITH_MAX_ORDERS_NUMBER,d0
                beq.w   @Return
                txt     196             ; "{CLEAR}Anything else?"
                bra.w   @Call_PlaceOrder
byte_21B38:
                
                @StartOrder:
                txt     195             ; "We can create a great and{N}special weapon for you if you{N}have some special material.{W1}"
@Call_PlaceOrder:
                
                bsr.w   BlacksmithAction_PlaceOrder
@Return:
                
                rts

    ; End of function ProcessBlacksmithOrders

                modend

; =============== S U B R O U T I N E =======================================

clientClass = -24
ordersCounter = -22
fulfillOrdersFlag = -20
readyToFulfillOrdersNumber = -18
fulfilledOrdersNumber = -16
pendingOrdersNumber = -14
itemSlot = -12
itemIndex = -10
targetMember = -8
clientMember = -6
currentGold = -4

BlacksmithAction_FulfillOrder:
                
                module
                movem.l d0-a1,-(sp)
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     207             ; "{CLEAR}I've been waiting!{N}This {ITEM} is for{N}you.  Isn't it great?!{W1}"
                txt     166             ; "Who gets it?{W2}"
                clsTxt
byte_21B58:
                
                clsTxt
                move.w  itemIndex(a6),((SELECTED_ITEM_INDEX-$1000000)).w
                move.b  #ITEM_SUBMENU_ACTION_USE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnItemSummaryPage
                cmpi.w  #-1,d0
                bne.s   @IsMemberInventoryFull
                txt     197             ; "{CLEAR}What a pity!{W2}"
                bra.w   @Done
@IsMemberInventoryFull:
                
                move.w  d0,clientMember(a6)
                moveq   #0,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                cmpi.w  #COMBATANT_ITEMSLOTS,d2
                bcs.s   @CheckEquipmentType
                
                ; Inventory if full
                move.w  clientMember(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     208             ; "{NAME}'s hands are are{N}full.  May I pass it to{N}somebody else?"
                jsr     j_alt_YesNoPrompt
                cmpi.w  #0,d0
                beq.s   byte_21B58
                txt     197             ; "{CLEAR}What a pity!{W2}"
                bra.w   @Done
@CheckEquipmentType:
                
                move.w  itemIndex(a6),d1
                jsr     j_GetEquipmentType
                cmpi.w  #EQUIPMENTTYPE_TOOL,d2
                beq.s   @AddItem
                
                ; Is item equippable?
                move.w  itemIndex(a6),d1
                move.w  clientMember(a6),d0
                jsr     j_IsWeaponOrRingEquippable
                bcs.s   @AddItem
                
                ; Not equippable
                move.w  clientMember(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     167             ; "{NAME} can't be{N}equipped with it.  OK?"
                jsr     j_alt_YesNoPrompt
                cmpi.w  #0,d0
                bne.w   byte_21B58
@AddItem:
                
                move.w  clientMember(a6),d0
                move.w  itemIndex(a6),d1
                jsr     j_AddItem
                move.w  #BLACKSMITH_MAX_ORDERS_NUMBER,d6
                sub.w   ordersCounter(a6),d6
                loadSavedDataAddress MITHRIL_WEAPONS_ON_ORDER, a1
                clearMithrilWeaponOrder d6, a1
                addi.w  #1,fulfilledOrdersNumber(a6)
                move.w  itemIndex(a6),d1
                move.w  clientMember(a6),d0
                jsr     j_IsWeaponOrRingEquippable
                bcc.w   byte_21CD0      ; @DoNotEquipNewItem
                txt     173             ; "{CLEAR}Equip it now?"
                jsr     j_alt_YesNoPrompt
                cmpi.w  #0,d0
                bne.w   byte_21CD0      ; @DoNotEquipNewItem
                
                ; Is weapon?
                move.w  itemIndex(a6),d1
                jsr     j_GetEquipmentType
                cmpi.w  #EQUIPMENTTYPE_WEAPON,d2
                bne.s   @HasRingEquipped
                
                ; Has weapon equipped?
                move.w  clientMember(a6),d0
                jsr     j_GetEquippedWeapon
                cmpi.w  #-1,d1
                beq.s   @EquipNewItem
                
                ; Unequip current weapon
                move.w  d2,d1
                jsr     j_UnequipItemBySlotIfNotCursed
                cmpi.w  #2,d2
                bne.w   @EquipNewItem
                
                ; Currently equipped weapon is cursed
                move.w  clientMember(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     176             ; "{NAME} can't remove{N}the cursed equipment.{W2}"
                bra.s   byte_21CD0      ; @DoNotEquipNewItem
@HasRingEquipped:
                
                move.w  clientMember(a6),d0
                jsr     j_GetEquippedRing
                cmpi.w  #-1,d1
                beq.s   @EquipNewItem
                
                ; Unequip current ring
                move.w  d2,d1
                jsr     j_UnequipItemBySlotIfNotCursed
                cmpi.w  #2,d2
                bne.w   @EquipNewItem
                
                ; Currently equipped ring is cursed
                move.w  clientMember(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     176             ; "{NAME} can't remove{N}the cursed equipment.{W2}"
                bra.s   byte_21CD0      ; @DoNotEquipNewItem
@EquipNewItem:
                
                moveq   #0,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d2,d1
                subq.w  #1,d1
                jsr     j_EquipItemBySlot
                cmpi.w  #2,d2
                bne.s   byte_21CC8      ; @NotCursed
                
                ; Newly equipped item is cursed
                sndCom  MUSIC_CURSED_ITEM
                bsr.w   WaitForMusicResumeAndPlayerInput_Blacksmith
                move.w  clientMember(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     175             ; "Gee, {NAME} gets{N}cursed.{W2}"
                bra.w   @Done
byte_21CC8:
                
                @NotCursed:
                txt     174             ; "Ah, it suits you!{W2}"
                bra.w   @Done
byte_21CD0:
                
                @DoNotEquipNewItem:
                txt     209             ; "{CLEAR}Here you go!{N}It's a great weapon!{W2}"
@Done:
                
                movem.l (sp)+,d0-a1
                rts

    ; End of function BlacksmithAction_FulfillOrder

                modend

; =============== S U B R O U T I N E =======================================

clientClass = -24
ordersCounter = -22
fulfillOrdersFlag = -20
readyToFulfillOrdersNumber = -18
fulfilledOrdersNumber = -16
pendingOrdersNumber = -14
itemSlot = -12
itemIndex = -10
targetMember = -8
clientMember = -6
currentGold = -4

BlacksmithAction_PlaceOrder:
                
                module
                movem.l d0-d2,-(sp)
byte_21CDE:
                
                @StartNewOrder:
                txt     199             ; "What kind of material do you{N}have?{D1}"
                clsTxt
                move.b  #ITEM_SUBMENU_ACTION_GIVE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnItemSummaryPage
                cmpi.w  #-1,d0
                beq.w   @Done
                
                move.w  d0,clientMember(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,itemIndex(a6)
                cmpi.w  #ITEM_MITHRIL,d2 ; HARDCODED mithril item index
                beq.w   byte_21D1A      ; @ProcessOrder
                txt     200             ; "Sorry, I've never worked{N}with that before....{W1}"
                bra.s   byte_21CDE      ; @StartNewOrder
byte_21D1A:
                
                @ProcessOrder:
                ; Pick customer
                txt     201             ; "{CLEAR}Whose weapon should I{N}make?{D1}"
                clsTxt
                move.b  #ITEM_SUBMENU_ACTION_USE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnItemSummaryPage
                cmpi.w  #-1,d0
                beq.s   byte_21CDE      ; @StartNewOrder
                
                ; Is customer promoted?
                move.w  d0,targetMember(a6)
                jsr     j_GetClass
                move.w  d1,clientClass(a6)
                cmpi.w  #CHAR_CLASS_FIRSTPROMOTED,d1
                bcc.w   @IsCustomerClassEligible
                
                ; Not promoted
                move.w  targetMember(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     211             ; "{NAME} has to be promoted{N}first.{W1}"
                bra.s   byte_21D1A      ; @ProcessOrder
@IsCustomerClassEligible:
                
                bsr.w   IsClassBlacksmithEligible
                cmpi.w  #0,d0
                beq.w   @ConfirmOrder
                
                ; Not eligible
                move.w  targetMember(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     212             ; "Sorry, I can't create a{N}weapon for {NAME}.{W1}"
                bra.s   byte_21D1A      ; @ProcessOrder
@ConfirmOrder:
                
                move.w  targetMember(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.l  #BLACKSMITH_ORDER_COST,((DIALOGUE_NUMBER-$1000000)).w
                txt     202             ; "For {NAME}!  It will cost{N}{#} gold coins.  OK?"
                jsr     j_OpenGoldWindow
                jsr     j_alt_YesNoPrompt
                jsr     j_CloseGoldWindow
                cmpi.w  #0,d0
                beq.s   @CheckGold
                
                ; Canceling order
                txt     197             ; "{CLEAR}What a pity!{W2}"
                bra.w   byte_21D1A      ; @ProcessOrder
@CheckGold:
                
                jsr     j_GetGold
                move.l  d1,currentGold(a6)
                cmpi.l  #BLACKSMITH_ORDER_COST,d1
                bcc.w   @PlaceOrder
                
                ; Not enough gold
                txt     203             ; "You have to bring more{N}money.{W2}"
                bra.w   @Done
@PlaceOrder:
                
                move.l  #BLACKSMITH_ORDER_COST,d1
                jsr     j_DecreaseGold
                addi.w  #1,pendingOrdersNumber(a6)
                move.w  clientMember(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_DropItemBySlot
                bsr.w   PickMithrilWeapon
                move.w  #80,d1
                jsr     j_ClearFlag
                txt     204             ; "{CLEAR}Great!{W2}"
                txt     205             ; "Please stop by shortly.{N}I'll surprise you!{W1}"
                move.w  pendingOrdersNumber(a6),d0
                move.w  readyToFulfillOrdersNumber(a6),d1
                move.w  fulfilledOrdersNumber(a6),d2
                add.w   d1,d0
                sub.w   d2,d0
                cmpi.w  #BLACKSMITH_MAX_ORDERS_NUMBER,d0
                bne.s   byte_21E16      ; @InquireAboutNewOrder
                txt     210             ; "Sorry, that's all for today.{W1}"
                bra.w   @Done
byte_21E16:
                
                @InquireAboutNewOrder:
                txt     196             ; "{CLEAR}Anything else?"
                jsr     j_alt_YesNoPrompt
                cmpi.w  #0,d0
                beq.w   byte_21CDE      ; @StartNewOrder
                txt     197             ; "{CLEAR}What a pity!{W2}"
                clsTxt
@Done:
                
                movem.l (sp)+,d0-d2
                rts

    ; End of function BlacksmithAction_PlaceOrder

                modend

; =============== S U B R O U T I N E =======================================


WaitForMusicResumeAndPlayerInput_Blacksmith:
                
                move.w  d0,-(sp)
                move.w  #SOUND_COMMAND_PLAY_PREVIOUS_MUSIC,d0
                jsr     (PlayMusicAfterCurrentOne).w
                jsr     (WaitForPlayerInput).w
                move.w  (sp)+,d0
                rts

    ; End of function WaitForMusicResumeAndPlayerInput_Blacksmith


; =============== S U B R O U T I N E =======================================

; Determine whether blacksmith is ready to fulfill orders,
;  and count existing orders as either "ready" or "pending" accordingly.

clientClass = -24
ordersCounter = -22
fulfillOrdersFlag = -20
readyToFulfillOrdersNumber = -18
fulfilledOrdersNumber = -16
pendingOrdersNumber = -14
itemSlot = -12
itemIndex = -10
targetMember = -8
clientMember = -6
currentGold = -4

CountPendingAndReadyToFulfillOrders:
                
                move.w  #80,d1
                jsr     j_CheckFlag
                beq.w   @Continue
                move.w  #1,fulfillOrdersFlag(a6) ; set to fulfill orders if talking to blacksmith for the first time since loading the map
@Continue:
                
            if (STANDARD_BUILD=1)
                moveq   #BLACKSMITH_ORDERS_COUNTER,d7
            else
                move.w  #BLACKSMITH_MAX_ORDERS_NUMBER,d7
                subq.w  #1,d7
            endif
                loadSavedDataAddress MITHRIL_WEAPONS_ON_ORDER, a0
@Loop:
                
                getSavedMithrilWeaponOrder a0, d1
                beq.w   @Next
                cmpi.w  #1,fulfillOrdersFlag(a6)
                bne.s   @IncrementPlacedOrders
                addi.w  #1,readyToFulfillOrdersNumber(a6)
                bra.w   @Next
@IncrementPlacedOrders:
                
                addi.w  #1,pendingOrdersNumber(a6)
@Next:
                
                dbf     d7,@Loop
                rts

    ; End of function CountPendingAndReadyToFulfillOrders


; =============== S U B R O U T I N E =======================================

; Is character belonging to class d1.w eligible to place a blacksmith order?
; Return d0.w = 0 if true.

clientClass = -24
ordersCounter = -22
fulfillOrdersFlag = -20
readyToFulfillOrdersNumber = -18
fulfilledOrdersNumber = -16
pendingOrdersNumber = -14
itemSlot = -12
itemIndex = -10
targetMember = -8
clientMember = -6
currentGold = -4

IsClassBlacksmithEligible:
                
                movem.l d1-d2/d7-a0,-(sp)
                clr.w   d0
                lea     list_BlacksmithEligibleClasses(pc), a0
                move.w  (a0)+,d7
                subq.w  #1,d7
@Loop:
                
                move.w  (a0)+,d1
                move.w  clientClass(a6),d2
                cmp.w   d1,d2
                beq.w   @Done
                dbf     d7,@Loop
                
                move.w  #1,d0
@Done:
                
                movem.l (sp)+,d1-d2/d7-a0
                rts

    ; End of function IsClassBlacksmithEligible

