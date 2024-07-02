
; ASM FILE code\common\menus\shop\shopactions.asm :
; 0x20064..0x20878 : Shop functions

; =============== S U B R O U T I N E =======================================

rareItemFlag = -22
itemTypeBitfield = -20
itemSlot = -14
selectedItem = -12
member = -10
currentGold = -8
itemPrice = -4

ShopMenu:
                
                module  ; Start of shop menu module
                movem.l d0-a5,-(sp)
                link    a6,#-22
                moveq   #0,d1
                move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
                blt.s   byte_2007A      
                jsr     j_OpenPortraitWindow
byte_2007A:
                
                txt     158             ; "What's up, boy!{N}We guarantee all items to{N}be in good condition!{D3}"
                clsTxt
                jsr     j_ClosePortraitWindow
loc_20088:
                
                moveq   #0,d0           ; initial choice : up
                moveq   #0,d1           ; animate-in direction : bottom
                moveq   #MENU_SHOP,d2
                lea     (InitialStack).w,a0
                jsr     j_ExecuteDiamondMenu
                cmpi.w  #-1,d0
                beq.s   @ExitShop
                bra.w   @CheckChoice_Buy
@ExitShop:
                
                moveq   #0,d1
                move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
                blt.s   byte_200B0      
                jsr     j_OpenPortraitWindow
byte_200B0:
                
                txt     161             ; "{CLEAR}Thank you!  Come again!{W1}"
                clsTxt
                jsr     j_ClosePortraitWindow
                unlk    a6
                movem.l (sp)+,d0-a5
                rts
@CheckChoice_Buy:
                
                cmpi.w  #0,d0
                bne.w   @CheckChoice_Sell
byte_200CE:
                
                txt     162             ; "What do you want to buy?"
                jsr     PopulateShopInventoryList(pc)
                nop
                jsr     j_ExecuteShopScreen
                cmpi.w  #-1,d0
                beq.w   byte_207CC
                
                move.w  d0,selectedItem(a6)
                move.w  d0,d1
                jsr     j_GetItemDefAddress
                move.w  ITEMDEF_OFFSET_PRICE(a0),itemPrice(a6)
                move.w  selectedItem(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                clr.l   ((DIALOGUE_NUMBER-$1000000)).w
                move.w  itemPrice(a6),((CURRENT_ITEM_PRICE-$1000000)).w
                txt     163             ; "The {ITEM} costs{N}{#} gold coins.{N}OK?"
                jsr     j_alt_YesNoPrompt
                cmpi.w  #0,d0
                beq.s   loc_20120
byte_20118:
                
                txt     164             ; "{CLEAR}Oh...shucks!{W2}"
                bra.w   byte_202C2
loc_20120:
                
                jsr     j_GetGold
                move.l  d1,currentGold(a6)
                clr.l   d0
                move.w  itemPrice(a6),d0
                cmp.l   d0,d1
                bcc.s   byte_2013C      ; @SelectRecipient_Buy
                txt     165             ; "You need more money to buy{N}it.{W2}"
                bra.w   byte_202C2
byte_2013C:
                
                @SelectRecipient_Buy:
                txt     166             ; "Who gets it?{W2}"
                clsTxt
                jsr     j_UpdateForce
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,((GENERIC_LIST_LENGTH-$1000000)).w
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     ((GENERIC_LIST-$1000000)).w,a1
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.b  #1,d7
loc_2015E:
                
                move.b  (a0)+,(a1)+
                dbf     d7,loc_2015E
                clsTxt
                move.w  selectedItem(a6),((SELECTED_ITEM_INDEX-$1000000)).w
                move.b  #ITEM_SUBMENU_ACTION_USE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnItemSummaryPage
                cmpi.w  #-1,d0
                beq.s   byte_20118      
                move.w  d0,member(a6)
                moveq   #0,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                cmpi.w  #COMBATANT_ITEMSLOTS,d2
                bcs.s   loc_201AC
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     168             ; "Oops!  {NAME}'s hands{N}are full!  To anybody else?"
                jsr     j_alt_YesNoPrompt
                cmpi.w  #0,d0
                beq.s   byte_2013C      ; @SelectRecipient_Buy
                bra.w   byte_20118      
loc_201AC:
                
                move.w  selectedItem(a6),d1
                jsr     j_GetEquipmentType
                cmpi.w  #EQUIPMENTTYPE_WEAPON,d2
                bne.s   loc_201E4
                move.w  selectedItem(a6),d1
                move.w  member(a6),d0
                jsr     j_IsWeaponOrRingEquippable
                bcs.s   loc_201E4
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     167             ; "{NAME} can't be{N}equipped with it.  OK?"
                jsr     j_alt_YesNoPrompt
                cmpi.w  #0,d0
                bne.w   byte_2013C      ; @SelectRecipient_Buy
loc_201E4:
                
                moveq   #0,d1
                move.w  itemPrice(a6),d1
                jsr     j_DecreaseGold
                move.w  member(a6),d0
                move.w  selectedItem(a6),d1
                jsr     j_AddItem
                move.w  selectedItem(a6),d1
                move.w  member(a6),d0
                jsr     j_IsWeaponOrRingEquippable
                bcc.w   byte_202BE      
                txt     173             ; "{CLEAR}Equip it now?"
                jsr     j_alt_YesNoPrompt
                cmpi.w  #0,d0
                bne.w   byte_202BE      
                move.w  selectedItem(a6),d1
                jsr     j_GetEquipmentType
                cmpi.w  #EQUIPMENTTYPE_WEAPON,d2
                bne.s   loc_2025E
                move.w  member(a6),d0
                jsr     j_GetEquippedWeapon
                cmpi.w  #-1,d1
                beq.s   loc_2028A
                
                move.w  d2,d1
                jsr     j_UnequipItemBySlotIfNotCursed
                cmpi.w  #2,d2
                bne.w   loc_2028A
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     176             ; "{NAME} can't remove{N}the cursed equipment.{W2}"
                bra.s   byte_202BE      
loc_2025E:
                
                move.w  member(a6),d0
                jsr     j_GetEquippedRing
                cmpi.w  #-1,d1
                beq.s   loc_2028A
                
                move.w  d2,d1
                jsr     j_UnequipItemBySlotIfNotCursed
                cmpi.w  #2,d2
                bne.w   loc_2028A
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     176             ; "{NAME} can't remove{N}the cursed equipment.{W2}"
                bra.s   byte_202BE      
loc_2028A:
                
                moveq   #0,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d2,d1
                subq.w  #1,d1
                jsr     j_EquipItemBySlot
                cmpi.w  #2,d2
                bne.s   byte_202B8      
                sndCom  MUSIC_CURSED_ITEM
                jsr     WaitForMusicResumeAndPlayerInput_Shop(pc)
                nop
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     175             ; "Gee, {NAME} gets{N}cursed.{W2}"
                bra.s   loc_202BC
byte_202B8:
                
                txt     174             ; "Ah, it suits you!{W2}"
loc_202BC:
                
                bra.s   byte_202C2
byte_202BE:
                
                txt     169             ; "{CLEAR}Here ya go!{N}Use it wisely!{W2}"
byte_202C2:
                
                clsTxt
                bra.w   byte_200CE      
@CheckChoice_Sell:
                
                cmpi.w  #1,d0
                bne.w   @CheckChoice_Repair
byte_202D2:
                
                txt     177             ; "Whose and which item do{N}you want to sell?{D3}"
                clsTxt
                jsr     j_UpdateForce
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,((GENERIC_LIST_LENGTH-$1000000)).w
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     ((GENERIC_LIST-$1000000)).w,a1
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.b  #1,d7
loc_202F4:
                
                move.b  (a0)+,(a1)+
                dbf     d7,loc_202F4
                clsTxt
                move.b  #ITEM_SUBMENU_ACTION_GIVE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnItemSummaryPage
                cmpi.w  #-1,d0
                beq.w   byte_207CC
                clr.w   rareItemFlag(a6)
                move.w  d0,member(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,selectedItem(a6)
                move.w  selectedItem(a6),d1
                jsr     j_GetItemDefAddress
                move.w  ITEMDEF_OFFSET_PRICE(a0),itemPrice(a6)
                move.l  ITEMDEF_OFFSET_TYPE(a0),itemTypeBitfield(a6)
                clr.l   d0
                move.w  itemPrice(a6),d0
                mulu.w  #ITEMSELLPRICE_MULTIPLIER,d0
                lsr.l   #ITEMSELLPRICE_BITSHIFTRIGHT,d0
                move.l  d0,currentGold(a6)
                move.b  itemTypeBitfield(a6),d1
                andi.b  #ITEMTYPE_UNSELLABLE,d1
                cmpi.b  #0,d1
                beq.s   @NotKeyItem
                txt     180             ; "{CLEAR}Sorry, I can't buy that....{W2}"
                bra.w   byte_2043A
@NotKeyItem:
                
                move.l  currentGold(a6),((DIALOGUE_NUMBER-$1000000)).w
                move.b  itemTypeBitfield(a6),d1
                andi.b  #ITEMTYPE_RARE,d1
                cmpi.b  #0,d1
                beq.s   byte_20384      ; @NotRareItem
                move.w  #1,rareItemFlag(a6)
                txt     183             ; "Wow, it's a rare bird.{N}I'll pay {#} gold coins{N}for it. OK?"
                bra.s   @ConfirmSale
byte_20384:
                
                @NotRareItem:
                txt     178             ; "I'll pay {#} gold coins{N}for it, OK?"
@ConfirmSale:
                
                jsr     j_alt_YesNoPrompt
                cmpi.w  #0,d0
                beq.s   loc_2039C
                txt     179             ; "{CLEAR}Too bad.{W2}"
                bra.w   byte_2043A
loc_2039C:
                
                move.w  selectedItem(a6),d1
                jsr     j_GetEquipmentType
                cmpi.w  #EQUIPMENTTYPE_WEAPON,d2
                bne.s   loc_203DC
                move.w  member(a6),d0
                jsr     j_GetEquippedWeapon
                cmpi.w  #-1,d1
                beq.w   loc_2040C
                
                cmp.w   itemSlot(a6),d2
                bne.w   loc_2040C
                move.w  selectedItem(a6),d1
                jsr     j_IsItemCursed
                bcc.w   loc_2040C
                txt     184             ; "OK, pass it to me...{D1}{N}{D1}Hey, it's cursed, isn't it?{W2}{N}I'm not such an easy mark!{W2}"
                bra.w   byte_2043A
loc_203DC:
                
                move.w  member(a6),d0
                jsr     j_GetEquippedRing
                cmpi.w  #-1,d1
                beq.w   loc_2040C
                
                cmp.w   itemSlot(a6),d2
                bne.w   loc_2040C
                move.w  selectedItem(a6),d1
                jsr     j_IsItemCursed
                bcc.w   loc_2040C
                txt     184             ; "OK, pass it to me...{D1}{N}{D1}Hey, it's cursed, isn't it?{W2}{N}I'm not such an easy mark!{W2}"
                bra.w   byte_2043A
loc_2040C:
                
                move.l  currentGold(a6),d1
                jsr     j_IncreaseGold
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_DropItemBySlot
                cmpi.w  #0,rareItemFlag(a6)
                beq.s   byte_20436      ; @NotDealsItem
                move.w  selectedItem(a6),d1
                jsr     j_AddItemToDeals
byte_20436:
                
                @NotDealsItem:
                txt     181             ; "{CLEAR}Yeah, I got it.{W2}"
byte_2043A:
                
                clsTxt
                bra.w   byte_202D2      
@CheckChoice_Repair:
                
                cmpi.w  #2,d0
                bne.w   @CheckChoice_Deals
byte_2044A:
                
                txt     186             ; "Whose and which item{N}should I repair?{D1}"
                clsTxt
                jsr     j_UpdateForce
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,((GENERIC_LIST_LENGTH-$1000000)).w
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     ((GENERIC_LIST-$1000000)).w,a1
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.b  #1,d7
loc_2046C:
                
                move.b  (a0)+,(a1)+
                dbf     d7,loc_2046C
                clsTxt
                move.b  #ITEM_SUBMENU_ACTION_GIVE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnItemSummaryPage
                cmpi.w  #-1,d0
                beq.w   byte_207CC
                move.w  d0,member(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,selectedItem(a6)
                move.w  selectedItem(a6),d1
                jsr     j_GetItemDefAddress
                move.w  ITEMDEF_OFFSET_PRICE(a0),itemPrice(a6)
                move.w  itemPrice(a6),d0
                lsr.w   #2,d0           ; repair is 25% item price
                move.w  d0,itemPrice(a6)
                move.w  member(a6),d0
                jsr     j_GetCombatantEntryAddress
                move.w  itemSlot(a6),d1
                add.w   d1,d1
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   d1,d1
                adda.w  d1,a0
                movep.w COMBATANT_OFFSET_ITEMS(a0),d2
            else
                lea     COMBATANT_OFFSET_ITEMS(a0,d1.w),a0
                move.w  (a0),d2
            endif
                btst    #ITEMENTRY_BIT_BROKEN,d2
                bne.w   loc_204DC
                txt     188             ; "It's not damaged.{W2}"
                bra.w   byte_205AC
loc_204DC:
                
                clr.l   ((DIALOGUE_NUMBER-$1000000)).w
                move.w  itemPrice(a6),((CURRENT_ITEM_PRICE-$1000000)).w
                txt     187             ; "{CLEAR}Will you pay {#} gold{N}coins to repair it?"
                jsr     j_alt_YesNoPrompt
                cmpi.w  #0,d0
                beq.s   loc_204FE
                txt     179             ; "{CLEAR}Too bad.{W2}"
                bra.w   byte_205AC
loc_204FE:
                
                jsr     j_GetGold
                move.l  d1,currentGold(a6)
                clr.l   d0
                move.w  itemPrice(a6),d0
                cmp.l   d0,d1
                bcc.s   loc_2051A
                txt     189             ; "You don't have enough{N}money...{W2}"
                bra.w   byte_205AC
loc_2051A:
                
                move.w  selectedItem(a6),d1
                jsr     j_GetEquipmentType
                cmpi.w  #ITEMTYPE_BIT_WEAPON,d2
                bne.s   loc_2055A
                move.w  member(a6),d0
                jsr     j_GetEquippedWeapon
                cmpi.w  #-1,d1
                beq.w   loc_2058A
                
                cmp.w   itemSlot(a6),d2
                bne.w   loc_2058A
                move.w  selectedItem(a6),d1
                jsr     j_IsItemCursed
                bcc.w   loc_2058A
                txt     190             ; "Sorry, I don't repair cursed{N}items.{N}Let sleeping devils lie.{W2}"
                bra.w   byte_205AC
loc_2055A:
                
                move.w  member(a6),d0
                jsr     j_GetEquippedRing
                cmpi.w  #-1,d1
                beq.w   loc_2058A
                
                cmp.w   itemSlot(a6),d2
                bne.w   loc_2058A
                move.w  selectedItem(a6),d1
                jsr     j_IsItemCursed
                bcc.w   loc_2058A
                txt     190             ; "Sorry, I don't repair cursed{N}items.{N}Let sleeping devils lie.{W2}"
                bra.w   byte_205AC
loc_2058A:
                
                moveq   #0,d1
                move.w  itemPrice(a6),d1
                jsr     j_DecreaseGold
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_RepairItemBySlot
                txt     191             ; "{CLEAR}OK, one moment please!{W2}"
                txt     192             ; "{CLEAR}Here you go!{N}Beautiful, huh?{W2}"
byte_205AC:
                
                clsTxt
                bra.w   byte_2044A      
@CheckChoice_Deals:
                
                jsr     DetermineDealsItemsNotInCurrentShop(pc)
                nop
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                bne.s   byte_205C8      
                txt     172             ; "I'm very sorry!{N}I'm out of stock!{W2}"
                bra.w   byte_207CC
byte_205C8:
                
                txt     171             ; "You must be surprised!{D1}{N}What would you like?"
                jsr     j_ExecuteShopScreen
                cmpi.w  #-1,d0
                beq.w   byte_207CC
                
                move.w  d0,selectedItem(a6)
                move.w  d0,d1
                jsr     j_GetItemDefAddress
                move.w  ITEMDEF_OFFSET_PRICE(a0),itemPrice(a6)
                move.w  selectedItem(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                clr.l   ((DIALOGUE_NUMBER-$1000000)).w
                move.w  itemPrice(a6),((CURRENT_ITEM_PRICE-$1000000)).w
                txt     163             ; "The {ITEM} costs{N}{#} gold coins.{N}OK?"
                jsr     j_alt_YesNoPrompt
                cmpi.w  #0,d0
                beq.s   loc_20614
byte_2060C:
                
                txt     164             ; "{CLEAR}Oh...shucks!{W2}"
                bra.w   byte_207C4
loc_20614:
                
                jsr     j_GetGold
                move.l  d1,currentGold(a6)
                clr.l   d0
                move.w  itemPrice(a6),d0
                cmp.l   d0,d1
                bcc.s   byte_20630      
                txt     165             ; "You need more money to buy{N}it.{W2}"
                bra.w   byte_207C4
byte_20630:
                
                txt     166             ; "Who gets it?{W2}"
                clsTxt
                jsr     j_UpdateForce
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,((GENERIC_LIST_LENGTH-$1000000)).w
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     ((GENERIC_LIST-$1000000)).w,a1
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.b  #1,d7
loc_20652:
                
                move.b  (a0)+,(a1)+
                dbf     d7,loc_20652
                clsTxt
                move.w  selectedItem(a6),((SELECTED_ITEM_INDEX-$1000000)).w
                move.b  #ITEM_SUBMENU_ACTION_USE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnItemSummaryPage
                cmpi.w  #-1,d0
                beq.s   byte_2060C      
                move.w  d0,member(a6)
                moveq   #0,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                cmpi.w  #COMBATANT_ITEMSLOTS,d2
                bcs.s   loc_206A0
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     168             ; "Oops!  {NAME}'s hands{N}are full!  To anybody else?"
                jsr     j_alt_YesNoPrompt
                cmpi.w  #0,d0
                beq.s   byte_20630      
                bra.w   byte_2060C      
loc_206A0:
                
                move.w  selectedItem(a6),d1
                jsr     j_GetEquipmentType
                cmpi.w  #EQUIPMENTTYPE_WEAPON,d2
                bne.s   loc_206D8
                move.w  selectedItem(a6),d1
                move.w  member(a6),d0
                jsr     j_IsWeaponOrRingEquippable
                bcs.s   loc_206D8
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     167             ; "{NAME} can't be{N}equipped with it.  OK?"
                jsr     j_alt_YesNoPrompt
                cmpi.w  #0,d0
                bne.w   byte_20630      
loc_206D8:
                
                moveq   #0,d1
                move.w  itemPrice(a6),d1
                jsr     j_DecreaseGold
                move.w  member(a6),d0
                move.w  selectedItem(a6),d1
                jsr     j_AddItem
                move.w  selectedItem(a6),d1
                jsr     j_RemoveItemFromDeals
                move.w  selectedItem(a6),d1
                move.w  member(a6),d0
                jsr     j_IsWeaponOrRingEquippable
                bcc.w   byte_207C0      
                txt     173             ; "{CLEAR}Equip it now?"
                jsr     j_alt_YesNoPrompt
                cmpi.w  #0,d0
                bne.w   byte_207C0      
                move.w  selectedItem(a6),d1
                jsr     j_GetEquipmentType
                cmpi.w  #EQUIPMENTTYPE_WEAPON,d2
                bne.s   loc_2075C
                move.w  member(a6),d0
                jsr     j_GetEquippedWeapon
                cmpi.w  #-1,d1
                beq.s   loc_20788
                
                move.w  d2,d1
                jsr     j_UnequipItemBySlotIfNotCursed
                cmpi.w  #2,d2
                bne.w   loc_20788
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     176             ; "{NAME} can't remove{N}the cursed equipment.{W2}"
                bra.s   byte_207C0      
loc_2075C:
                
                move.w  member(a6),d0
                jsr     j_GetEquippedRing
                cmpi.w  #-1,d1
                beq.s   loc_20788
                
                move.w  d2,d1
                jsr     j_UnequipItemBySlotIfNotCursed
                cmpi.w  #2,d2
                bne.w   loc_20788
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     176             ; "{NAME} can't remove{N}the cursed equipment.{W2}"
                bra.s   byte_207C0      
loc_20788:
                
                moveq   #0,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d2,d1
                subq.w  #1,d1
                jsr     j_EquipItemBySlot
                cmpi.w  #2,d2
                bne.s   byte_207BA      
                sndCom  MUSIC_CURSED_ITEM
                jsr     WaitForMusicResumeAndPlayerInput_Shop(pc)
                nop
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     175             ; "Gee, {NAME} gets{N}cursed.{W2}"
                clsTxt
                bra.s   loc_207BE
byte_207BA:
                
                txt     174             ; "Ah, it suits you!{W2}"
loc_207BE:
                
                bra.s   byte_207C4
byte_207C0:
                
                txt     169             ; "{CLEAR}Here ya go!{N}Use it wisely!{W2}"
byte_207C4:
                
                clsTxt
                bra.w   @CheckChoice_Deals
byte_207CC:
                
                clsTxt
                bra.w   loc_20088       

    ; End of function ShopMenu

                modend  ; End of shop menu module

; =============== S U B R O U T I N E =======================================


WaitForMusicResumeAndPlayerInput_Shop:
                
                move.w  d0,-(sp)
                move.w  #SOUND_COMMAND_PLAY_PREVIOUS_MUSIC,d0
                jsr     (PlayMusicAfterCurrentOne).w
                jsr     (WaitForPlayerInput).w
                move.w  (sp)+,d0
                rts

    ; End of function WaitForMusicResumeAndPlayerInput_Shop


; =============== S U B R O U T I N E =======================================


PopulateShopInventoryList:
                
                lea     ((GENERIC_LIST-$1000000)).w,a1
                bsr.s   GetShopInventoryAddress
                clr.w   d7
                move.b  (a0)+,d7
                move.w  d7,((GENERIC_LIST_LENGTH-$1000000)).w
                subq.b  #1,d7
@Loop:
                
                move.b  (a0)+,(a1)+
                dbf     d7,@Loop
                rts

    ; End of function PopulateShopInventoryList


; =============== S U B R O U T I N E =======================================

; Create list of deals items not normally sold in current shop


DetermineDealsItemsNotInCurrentShop:
                
                movem.l d1-d2/d7-a0,-(sp)
                lea     ((GENERIC_LIST-$1000000)).w,a0
                clr.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                clr.w   d1
            if (DEALS_ITEMS_COUNTER>127)
                move.w  #DEALS_ITEMS_COUNTER,d7
            else
                moveq   #DEALS_ITEMS_COUNTER,d7
            endif
@Loop:
                
                jsr     j_GetDealsItemAmount
                tst.b   d2
                beq.w   @Next
                bsr.w   DoesCurrentShopContainItem
                beq.w   @Next
                move.b  d1,(a0)+
                addq.w  #1,((GENERIC_LIST_LENGTH-$1000000)).w
@Next:
                
                addq.w  #1,d1
                dbf     d7,@Loop
                movem.l (sp)+,d1-d2/d7-a0
                rts

    ; End of function DetermineDealsItemsNotInCurrentShop


; =============== S U B R O U T I N E =======================================

; In: D1 = item index
; 
; Out: Zero-bit clear = yes, set = no


DoesCurrentShopContainItem:
                
                movem.l d7-a0,-(sp)
                bsr.w   GetShopInventoryAddress
                clr.w   d7
                move.b  (a0)+,d7
                subq.b  #1,d7
@Loop:
                
                cmp.b   (a0)+,d1
                beq.w   @Done
                dbf     d7,@Loop
@Done:
                
                movem.l (sp)+,d7-a0
                rts

    ; End of function DoesCurrentShopContainItem


; =============== S U B R O U T I N E =======================================

; Get shop inventory address -> A0


GetShopInventoryAddress:
                
                movem.l d0/d7,-(sp)
                lea     list_ShopInventories(pc), a0
                clr.w   d7
                move.b  (CURRENT_SHOP_INDEX).l,d7
                subq.b  #1,d7
                bcs.w   @Done           ; if current shop index = 0, we're done
                clr.w   d0
@Loop:
                
                move.b  (a0)+,d0
                adda.w  d0,a0
                dbf     d7,@Loop
@Done:
                
                movem.l (sp)+,d0/d7
                rts

    ; End of function GetShopInventoryAddress

