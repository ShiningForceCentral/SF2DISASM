
; ASM FILE code\common\menus\main\mainactions.asm :
; 0x2127E..0x21A3A : Main menu functions

; =============== S U B R O U T I N E =======================================

spellLevel = -32
spellIndex = -28
spellEntry = -26
itemTypeBitfield = -20
targetItemSlot = -14
itemSlot = -12
exchangedItemEntry = -10
itemIndex = -8
targetMember = -6
member = -4

FieldMenu:
                
                module
                movem.l d0-a5,-(sp)
                link    a6,#-32
@StartMain:
                
                moveq   #0,d0           ; initial choice : up
                moveq   #0,d1           ; animate-in from bottom
                moveq   #MENU_FIELD,d2
                lea     (InitialStack).w,a0
                jsr     j_ExecuteDiamondMenu
                cmpi.w  #-1,d0
                beq.s   @ExitMain
                bra.w   @IsMemberAction
@ExitMain:
                
                unlk    a6
                movem.l (sp)+,d0-a5
                rts
@IsMemberAction:
                
                cmpi.w  #0,d0
                bne.w   @IsMagicAction
                
                ; MEMBER action
                bsr.w   PopulateGenericListWithCurrentForceMembers
                clsTxt
@StartMember:
                
                move.b  #ITEM_SUBMENU_ACTION_USE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnMainSummaryPage
                cmpi.w  #-1,d0
                beq.w   @ExitMember
                
                jsr     j_BuildMemberScreen
                bra.s   @StartMember
@ExitMember:
                
                bra.w   @Goto_StartMain
@IsMagicAction:
                
                cmpi.w  #1,d0
                bne.w   @IsItemAction
@StartMagic:
                
                
                ; MAGIC action
                bsr.w   PopulateGenericListWithCurrentForceMembers
                move.b  #ITEM_SUBMENU_ACTION_USE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnMagicSummaryPage
                cmpi.w  #-1,d0
                beq.w   @ExitMagic
                
                move.w  d0,member(a6)
                move.w  d1,spellEntry(a6)
                move.w  d1,spellIndex(a6)
                andi.w  #SPELLENTRY_MASK_INDEX,spellIndex(a6)
                clr.l   spellLevel(a6)
                lsr.l   #SPELLENTRY_OFFSET_LV,d1
                addq.l  #1,d1
                move.l  d1,spellLevel(a6)
                cmpi.w  #SPELL_DETOX,spellIndex(a6)
                beq.w   byte_213A8      ; Cast Detox
                
                ; Cast a spell other than Detox
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  spellIndex(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                move.l  spellLevel(a6),((DIALOGUE_NUMBER-$1000000)).w
                txt     243             ; "{NAME} cast{N}{SPELL} level {#}!"
                sndCom  SFX_SPELL_CAST
                clsTxt
                cmpi.w  #SPELL_EGRESS,spellIndex(a6)
                beq.w   @IsOnOverworldMap
byte_21348:
                
                
                ; Nothing happens when casting spells other than Detox and Egress,
                ; or when casting Egress on non-overworld maps.
                txt     312             ; "But nothing happened."
                clsTxt
                bra.w   @ExitMagic
@IsOnOverworldMap:
                
                clr.w   d0
                move.b  ((CURRENT_MAP-$1000000)).w,d0
                cmpi.w  #MAP_OVERWORLD_GRANS_GRANSEAL,d0 ; HARDCODED map indexes from 66 to 78 : overworld maps
                blt.s   byte_21348      
                cmpi.w  #MAP_OVERWORLD_PACALON_2,d0
                bgt.s   byte_21348      ; nothing happens if not an overworld map
@Egress:
                
                move.b  spellEntry(a6),d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_MP_COST(a0),d1
                move.w  member(a6),d0
                jsr     j_DecreaseCurrentMp
                jsr     j_ExecuteFlashScreenScript
                getSavedByte EGRESS_MAP, d0
                jsr     (GetSavepointForMap).w
                lea     ((MAP_EVENT_TYPE-$1000000)).w,a0
                move.w  #1,(a0)+
                move.b  #0,(a0)+
                move.b  d0,(a0)+
                move.b  d1,(a0)+
                move.b  d2,(a0)+
                move.b  d3,(a0)+
                clearSavedByte PLAYER_TYPE
                bra.w   @ExitMain
byte_213A8:
                
                
                ; Cast Detox
                txt     108             ; "Use magic on whom?{D1}"
                clsTxt
                move.b  #ITEM_SUBMENU_ACTION_USE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnItemSummaryPage
                move.w  d0,targetMember(a6)
                cmpi.w  #-1,d0
                beq.w   @StartMagic
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  spellIndex(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                move.l  spellLevel(a6),((DIALOGUE_NUMBER-$1000000)).w
                txt     243             ; "{NAME} cast{N}{SPELL} level {#}!"
                clsTxt
                move.b  spellEntry(a6),d1
                jsr     j_FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_MP_COST(a0),d1
                move.w  member(a6),d0
                jsr     j_DecreaseCurrentMp
                move.w  targetMember(a6),d0
                jsr     j_GetStatusEffects
                moveq   #0,d2           ; d2.w = Detox effectivity (0 = nothing happened, -1 = cured something)
                cmpi.l  #1,spellLevel(a6)
                beq.w   @CurePoison
                cmpi.l  #2,spellLevel(a6)
                beq.w   @CureStun
                bclr    #STATUSEFFECT_BIT_CURSE,d1
                beq.s   @CureStun
                move.w  targetMember(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     303             ; "{NAME} is no longer{N}cursed."
                moveq   #-1,d2
                jsr     j_UnequipAllItemsIfNotCursed
@CureStun:
                
                bclr    #STATUSEFFECT_BIT_STUN,d1
                beq.s   @CurePoison
                move.w  targetMember(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     302             ; "{NAME} is no longer{N}stunned."
                moveq   #-1,d2
@CurePoison:
                
                bclr    #STATUSEFFECT_BIT_POISON,d1
                beq.s   @WasDetoxEffective
                move.w  targetMember(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     301             ; "{NAME} is no longer{N}poisoned."
                moveq   #-1,d2
@WasDetoxEffective:
                
                tst.w   d2
                bne.s   byte_21468
                txt     422             ; "But nothing happened.{D1}"
byte_21468:
                
                clsTxt
                jsr     j_SetStatusEffects
                jsr     j_ApplyStatusEffectsAndItemsOnStats
@ExitMagic:
                
                bra.w   @Goto_StartMain
@IsItemAction:
                
                cmpi.w  #2,d0
                bne.w   @SearchAction
@StartItemSubmenu:
                
                
                ; ITEM action
                moveq   #0,d0           ; initial choice: up
                moveq   #0,d1           ; animate-in from bottom
                moveq   #MENU_ITEM,d2
                lea     (InitialStack).w,a0
                jsr     j_ExecuteDiamondMenu
                cmpi.w  #-1,d0
                beq.w   @StartMain      
                
                ; Is Item submenu Use action?
                cmpi.w  #0,d0
                bne.w   @IsItemGiveAction
@StartItemUse:
                
                
                ; ITEM > USE action
                bsr.w   PopulateGenericListWithCurrentForceMembers
                move.b  #ITEM_SUBMENU_ACTION_GIVE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnItemSummaryPage
                move.w  d0,member(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,itemIndex(a6)
                cmpi.w  #-1,d0
                beq.w   byte_2158E      ; Exit Item Use
                
                ; Using Angel Wing?
                cmpi.w  #ITEM_ANGEL_WING,d2
                bne.w   @HandleNonAngelWingItems
                
                ; Currently on overworld map?
                clr.w   d0
                move.b  ((CURRENT_MAP-$1000000)).w,d0
                cmpi.w  #MAP_OVERWORLD_GRANS_GRANSEAL,d0 ; HARDCODED map indexes from 66 to 78 : overworld maps
                blt.w   @HandleNonAngelWingItems
                cmpi.w  #MAP_OVERWORLD_PACALON_2,d0
                bgt.w   @HandleNonAngelWingItems
                
                ; Use Angel Wing
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     73              ; "{NAME} used the{N}{ITEM}.{W2}"
                bra.w   @Egress
@HandleNonAngelWingItems:
                
                move.w  itemIndex(a6),d1
                jsr     IsItemUsableOnField
                tst.w   d2
                beq.w   @PickTarget
                
                ; Check map events
                bsr.w   GetPlayerEntityPosition ; Get first entity's X, Y and facing -> d1.l, d2.l, d3.w
                move.w  itemIndex(a6),d4
                move.w  itemSlot(a6),d5
                jsr     j_RunMapSetupItemEvent
                tst.w   d6
                bne.w   @ExitMain
                
                ; Nothing happened
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     73              ; "{NAME} used the{N}{ITEM}.{W2}"
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     422             ; "But nothing happened.{D1}"
                clsTxt
                bra.w   byte_2158E      ; Exit Item Use
@PickTarget:
                
                move.w  itemIndex(a6),d1 ; superfluous intructions
                move.w  #50,d1
                clsTxt
                move.b  #ITEM_SUBMENU_ACTION_USE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnMainSummaryPage
                cmpi.w  #-1,d0
                beq.w   @StartItemUse
                
                ; Use item
                move.w  itemIndex(a6),d1
                bsr.w   UseItemOnField  
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_RemoveItemBySlot
byte_2158E:
                
                
                ; Exit Item Use
                clsTxt
                bra.w   @Goto_StartItemSubmenu
@IsItemGiveAction:
                
                cmpi.w  #1,d0
                bne.w   @IsItemEquipAction
@StartItemGive:
                
                
                ; ITEM > GIVE action
                bsr.w   PopulateGenericListWithCurrentForceMembers
                move.b  #ITEM_SUBMENU_ACTION_GIVE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnItemSummaryPage
                cmpi.w  #-1,d0
                bne.w   @IsGivingWeapon
                bra.w   byte_2184E      ; Close textbox and restart item submenu
@IsGivingWeapon:
                
                move.w  d0,member(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,itemIndex(a6)
                move.w  itemIndex(a6),d1
                jsr     j_GetEquipmentType
                cmpi.w  #EQUIPMENTTYPE_WEAPON,d2
                bne.s   @IsGivingUnequippableItem
                
                ; Give weapon
                move.w  member(a6),d0
                jsr     j_GetEquippedWeapon
                cmpi.w  #-1,d1
                beq.w   @PickRecipient
                
                cmp.w   itemSlot(a6),d2
                bne.w   @PickRecipient
                move.w  itemIndex(a6),d1
                jsr     j_IsItemCursed
                bcc.w   @PickRecipient
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                sndCom  MUSIC_CURSED_ITEM
                txt     55              ; "{LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}"
                bsr.w   WaitForMusicResumeAndPlayerInput
                bra.s   @StartItemGive
@IsGivingUnequippableItem:
                
                cmpi.w  #EQUIPMENTTYPE_TOOL,d2
                beq.w   @PickRecipient
                
                ; Give ring
                move.w  member(a6),d0
                jsr     j_GetEquippedRing
                cmpi.w  #-1,d1
                beq.w   @PickRecipient
                
                cmp.w   itemSlot(a6),d2
                bne.w   @PickRecipient
                move.w  itemIndex(a6),d1
                jsr     j_IsItemCursed
                bcc.w   @PickRecipient
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                sndCom  MUSIC_CURSED_ITEM
                txt     55              ; "{LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}"
                bsr.w   WaitForMusicResumeAndPlayerInput
                clsTxt
                bra.w   @StartItemGive
@PickRecipient:
                
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     54              ; "Pass the {ITEM}{N}to whom?{D1}"
                clsTxt
                move.b  #ITEM_SUBMENU_ACTION_DROP,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  itemIndex(a6),((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnItemSummaryPage
                cmpi.w  #-1,d0
                bne.w   @GiveItem
                bra.w   @StartItemGive
@GiveItem:
                
                move.w  d0,targetMember(a6)
                move.w  d1,targetItemSlot(a6)
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                cmpi.w  #COMBATANT_ITEMSLOTS,d2
                beq.w   @ExchangeItems  ; exchange items if recipient's inventory is full
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  targetMember(a6),d0
                move.w  itemIndex(a6),d1
                andi.b  #ITEMENTRY_MASK_INDEX,d1
                jsr     j_AddItem
                move.w  member(a6),d0
                move.w  targetMember(a6),d1
                cmp.w   d0,d1
                bne.s   @GiveToRecipient
                
                ; Give to self
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     74              ; "{NAME} changed hands{N}to hold the {ITEM}.{W2}"
                bra.s   @ExitItemGive   
@GiveToRecipient:
                
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  targetMember(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     65              ; "The {ITEM} now{N}belongs to {NAME}.{W2}"
@ExitItemGive:
                
                bra.w   byte_2184E      ; Close textbox and restart item submenu
@ExchangeItems:
                
                move.w  targetMember(a6),d0
                move.w  targetItemSlot(a6),d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                move.w  d1,exchangedItemEntry(a6)
                jsr     j_GetEquipmentType
                cmpi.w  #EQUIPMENTTYPE_WEAPON,d2
                bne.s   @IsExchangingUnequippableItem
                
                ; Exchange weapon
                move.w  targetMember(a6),d0
                jsr     j_GetEquippedWeapon
                cmpi.w  #-1,d1
                beq.w   @StartExchange
                
                cmp.w   targetItemSlot(a6),d2
                bne.w   @StartExchange
                move.w  exchangedItemEntry(a6),d1
                jsr     j_IsItemCursed
                bcc.w   @StartExchange
                move.w  exchangedItemEntry(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                sndCom  MUSIC_CURSED_ITEM
                txt     55              ; "{LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}"
                bsr.w   WaitForMusicResumeAndPlayerInput
                clsTxt
                bra.w   @PickRecipient
@IsExchangingUnequippableItem:
                
                cmpi.w  #EQUIPMENTTYPE_TOOL,d2
                beq.w   @StartExchange
                
                ; Exchange ring
                move.w  targetMember(a6),d0
                jsr     j_GetEquippedRing
                cmpi.w  #-1,d1
                beq.w   @StartExchange
                
                cmp.w   targetItemSlot(a6),d2
                bne.w   @StartExchange
                move.w  exchangedItemEntry(a6),d1
                jsr     j_IsItemCursed
                bcc.w   @StartExchange
                move.w  exchangedItemEntry(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                sndCom  MUSIC_CURSED_ITEM
                txt     55              ; "{LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}"
                bsr.w   WaitForMusicResumeAndPlayerInput
                bra.w   @PickRecipient
@StartExchange:
                
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_UnequipItemBySlotIfNotCursed
                
                ; Are giver and recipient the same?
                move.w  targetMember(a6),d2
                cmp.w   member(a6),d2
                bne.w   @ExchangeToRecipient
                
                ; And if so, are items being exchanged also the same?
                move.w  targetItemSlot(a6),d3
                cmp.w   itemSlot(a6),d3
                beq.w   @SkipExchange
@ExchangeToRecipient:
                
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_DropItemBySlot
                move.w  exchangedItemEntry(a6),d1
                andi.b  #ITEMENTRY_MASK_INDEX,d1
                jsr     j_AddItem
                move.w  targetMember(a6),d2
                cmp.w   member(a6),d2
                bne.w   @ExchangeFromRecipient
                
                ; Exchange with self
                move.w  targetItemSlot(a6),d3
                cmp.w   itemSlot(a6),d3
                bcs.w   @ExchangeFromRecipient
                subi.w  #1,targetItemSlot(a6)
@ExchangeFromRecipient:
                
                move.w  targetMember(a6),d0
                move.w  targetItemSlot(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  itemIndex(a6),d1
                andi.b  #ITEMENTRY_MASK_INDEX,d1
                jsr     j_AddItem
@SkipExchange:
                
                move.w  member(a6),d0
                move.w  targetMember(a6),d1
                cmp.w   d0,d1
                bne.s   @ExchangedMessage
                
                ; "Changed hands" message
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     74              ; "{NAME} changed hands{N}to hold the {ITEM}.{W2}"
                bra.s   byte_2184E      ; Close textbox and restart item submenu
@ExchangedMessage:
                
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  targetMember(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                move.w  exchangedItemEntry(a6),((DIALOGUE_NAME_INDEX_3-$1000000)).w
                txt     66              ; "The {ITEM} was{N}exchanged for {NAME}'s{N}{ITEM}.{W2}"
byte_2184E:
                
                
                ; Close textbox and restart item submenu
                clsTxt
                bra.w   @Goto_StartItemSubmenu
@IsItemEquipAction:
                
                cmpi.w  #2,d0
                bne.w   @ItemDropAction
                
                ; ITEM > EQUIP action
                bsr.w   PopulateGenericListWithCurrentForceMembers
                move.b  #ITEM_SUBMENU_ACTION_EQUIP,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnItemSummaryPage
                cmpi.w  #-1,d0
                beq.w   @Goto_ExitItemEquip
                bra.w   @ExitItemEquip
@Goto_ExitItemEquip:
                
                bra.w   @ExitItemEquip
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w 
                                                        ; unreachable code
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     70              ; "{NAME} is already{N}equipped with the{N}{ITEM}.{W2}"
@ExitItemEquip:
                
                bra.w   @Goto_StartItemSubmenu
@ItemDropAction:
                
                
                ; ITEM > DROP action
                bsr.w   PopulateGenericListWithCurrentForceMembers
                move.b  #ITEM_SUBMENU_ACTION_GIVE,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_ExecuteMembersListScreenOnItemSummaryPage
                cmpi.w  #-1,d0
                bne.w   @IsItemUnsellable
                bra.w   byte_219D0      ; Close textbox and restart item submenu
@IsItemUnsellable:
                
                move.w  d0,member(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,itemIndex(a6)
                move.w  itemIndex(a6),d1
                jsr     j_GetItemDefAddress
                move.l  ITEMDEF_OFFSET_TYPE(a0),itemTypeBitfield(a6)
                move.b  itemTypeBitfield(a6),d1
                andi.b  #ITEMTYPE_UNSELLABLE,d1
                cmpi.b  #0,d1
                beq.s   @ConfirmDrop
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     62              ; "{LEADER}!  You can't{N}discard the {ITEM}!{W2}"
                bra.w   byte_219D0      ; Close textbox and restart item submenu
@ConfirmDrop:
                
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     69              ; "The {ITEM} will be{N}discarded.  OK?"
                jsr     j_alt_YesNoPrompt
                clsTxt
                cmpi.w  #0,d0
                beq.w   @IsDroppingWeapon
                bra.s   @ItemDropAction
@IsDroppingWeapon:
                
                move.w  itemIndex(a6),d1
                jsr     j_GetEquipmentType
                cmpi.w  #EQUIPMENTTYPE_WEAPON,d2
                bne.s   @IsDroppingUnequippableItem
                
                ; Drop weapon
                move.w  member(a6),d0
                jsr     j_GetEquippedWeapon
                cmpi.w  #-1,d1
                beq.w   @DropItem
                
                cmp.w   itemSlot(a6),d2
                bne.w   @DropItem
                move.w  itemIndex(a6),d1
                jsr     j_IsItemCursed
                bcc.w   @DropItem
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                sndCom  MUSIC_CURSED_ITEM
                txt     55              ; "{LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}"
                bsr.w   WaitForMusicResumeAndPlayerInput
                clsTxt
                bra.w   byte_219D0      ; Close textbox and restart item submenu
@IsDroppingUnequippableItem:
                
                cmpi.w  #EQUIPMENTTYPE_TOOL,d2
                beq.w   @DropItem
                
                ; Drop ring
                move.w  member(a6),d0
                jsr     j_GetEquippedRing
                cmpi.w  #-1,d1
                beq.w   @DropItem
                
                cmp.w   itemSlot(a6),d2
                bne.w   @DropItem
                move.w  itemIndex(a6),d1
                jsr     j_IsItemCursed
                bcc.w   @DropItem
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     55              ; "{LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}"
                bra.w   byte_219D0      ; Close textbox and restart item submenu
@DropItem:
                
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     67              ; "The {ITEM} is discarded.{W2}"
                move.b  itemTypeBitfield(a6),d1
                andi.b  #ITEMTYPE_RARE,d1
                cmpi.b  #0,d1
                beq.s   byte_219D0      ; Close textbox and restart item submenu
                move.w  itemIndex(a6),d1
                jsr     j_AddItemToDeals
byte_219D0:
                
                
                ; Close textbox and restart item submenu
                clsTxt
                bra.w   *+4
@Goto_StartItemSubmenu:
                
                bra.w   @StartItemSubmenu
@SearchAction:
                
                
                ; SEARCH action
                clr.w   d6
                jsr     j_CheckArea
                bra.w   @ExitMain
@Goto_StartMain:
                
                bra.w   @StartMain      

    ; End of function FieldMenu

                modend

; =============== S U B R O U T I N E =======================================


PopulateGenericListWithCurrentForceMembers:
                
                movem.l d7-a1,-(sp)
                jsr     j_UpdateForce
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     ((GENERIC_LIST-$1000000)).w,a1
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,((GENERIC_LIST_LENGTH-$1000000)).w
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
@Loop:
                
                move.b  (a0)+,(a1)+
                dbf     d7,@Loop
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function PopulateGenericListWithCurrentForceMembers

table_21A16:    dc.b 0                  ; unused
                dc.b 2
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 10

; =============== S U B R O U T I N E =======================================

; unused


sub_21A1C:
                
                movem.l d7-a0,-(sp)
                lea     table_21A16(pc), a0
                clr.w   d7
                move.w  (a0)+,d7
                subq.w  #1,d7
loc_21A2A:
                
                cmp.w   (a0)+,d1
                beq.w   loc_21A34
                dbf     d7,loc_21A2A
loc_21A34:
                
                movem.l (sp)+,d7-a0
                rts

    ; End of function sub_21A1C

