
; ASM FILE code\common\menus\main\mainactions-standard.asm :
; Standard reimplementation of main menu functions.

; =============== S U B R O U T I N E =======================================

spellLevel = -22
spellIndex = -18
spellEntry = -16
itemTypeBitfield = -14
targetItemSlot = -12
itemSlot = -10
exchangedItemEntry = -8
itemIndex = -6
targetMember = -4
member = -2


FieldMenu:
                
                module
                movem.l d0-d6/a0,-(sp)
                link    a6,#-22
                
@StartMain:     moveq   #0,d0           ; initial choice : up
                moveq   #0,d1           ; animate-in from bottom
                moveq   #MENU_FIELD,d2
                lea     (InitialStack).w,a0
                jsr     ExecuteDiamondMenu
                tst.w   d0
                bmi.s   @ExitMain
                
                ; Jump to menu action subroutine
                add.w   d0,d0
                move.w  rjt_MainMenuActions(pc,d0.w),d0
                jmp     rjt_MainMenuActions(pc,d0.w)
                
@ExitMain:      unlk    a6
                movem.l (sp)+,d0-d6/a0
                rts
; ---------------------------------------------------------------------------
rjt_MainMenuActions:
                
                dc.w MainMenu_Member-rjt_MainMenuActions
                dc.w MainMenu_Magic-rjt_MainMenuActions
                dc.w MainMenu_Item-rjt_MainMenuActions
                dc.w MainMenu_Search-rjt_MainMenuActions
; ---------------------------------------------------------------------------

MainMenu_Member:
                
                bsr.w   PopulateGenericListWithCurrentForceMembers
                clsTxt
@StartMember:   clr.b   ((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                jsr     ExecuteMembersListScreenOnMainSummaryPage
                tst.w   d0
                bmi.s   @StartMain              ; if player pressed B on member list screen, restart main menu
                jsr     BuildMemberScreen
                bra.s   @StartMember
; ---------------------------------------------------------------------------

MainMenu_Magic:
                
                bsr.w   PopulateGenericListWithCurrentForceMembers
@StartMagic:    clr.b   ((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                jsr     ExecuteMembersListScreenOnMagicSummaryPage
                tst.w   d0
                bmi.s   @StartMain
                
                ; Load local variables
                move.w  d0,member(a6)
                move.w  d1,spellEntry(a6)
                move.w  d1,spellIndex(a6)
                andi.w  #SPELLENTRY_MASK_INDEX,spellIndex(a6)
                clr.l   spellLevel(a6)
                lsr.l   #SPELLENTRY_OFFSET_LV,d1
                addq.l  #1,d1
                move.l  d1,spellLevel(a6)
                
                ; Is casting Detox?
                cmpi.w  #SPELL_DETOX,spellIndex(a6)
                beq.s   @CastDetox
                
                ; Cast a spell other than Detox
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  spellIndex(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                move.l  spellLevel(a6),((DIALOGUE_NUMBER-$1000000)).w
                txt     243             ; "{NAME} cast{N}{SPELL} level {#}!"
                sndCom  SFX_SPELL_CAST
                clsTxt
                
                ; Is casting Egress?
                cmpi.w  #SPELL_EGRESS,spellIndex(a6)
                beq.s   @CurrentlyOnOverworldMap
@NothingHappened:
                
                ; Nothing happens when casting spells other than Detox and Egress,
                ; or when casting Egress on non-overworld maps.
                txt     312             ; "But nothing happened."
                clsTxt
                bra.w   @StartMain
@CurrentlyOnOverworldMap:
                
                jsr     IsOverworldMap
                beq.s   @NothingHappened        ; nothing happens if not an overworld map
                
@Egress:        move.b  spellEntry(a6),d1
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_MP_COST(a0),d1
                move.w  member(a6),d0
                jsr     DecreaseCurrentMP
                jsr     ExecuteFlashScreenScript
                getSavedByte EGRESS_MAP, d0
                jsr     (GetSavepointForMap).w
                lea     ((MAP_EVENT_TYPE-$1000000)).w,a0
                move.w  #1,(a0)+
                clr.b   (a0)+
                move.b  d0,(a0)+                ; destination map index
                move.b  d1,(a0)+                ; X
                move.b  d2,(a0)+                ; Y
                move.b  d3,(a0)+                ; facing
                clearSavedByte PLAYER_TYPE
                bra.w   @ExitMain
                
                ; Cast Detox
@CastDetox:     txt     108             ; "Use magic on whom?{D1}"
                clsTxt
                clr.b   ((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     ExecuteMembersListScreenOnItemSummaryPage
                move.w  d0,targetMember(a6)
                bmi.w   @StartMagic
                
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  spellIndex(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                move.l  spellLevel(a6),((DIALOGUE_NUMBER-$1000000)).w
                txt     243             ; "{NAME} cast{N}{SPELL} level {#}!"
                clsTxt
                move.b  spellEntry(a6),d1
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_MP_COST(a0),d1
                move.w  member(a6),d0
                jsr     DecreaseCurrentMP
                move.w  targetMember(a6),d0
                jsr     GetStatusEffects
                moveq   #0,d2           ; d2.w = Detox effectivity (0 = nothing happened, -1 = cured something)
                move.l  spellLevel(a6),d3
                cmpi.w  #1,d3
                beq.s   @CurePoison
                cmpi.w  #2,d3
                beq.s   @CureStun
                
                ; If casting Detox level 3 or higher, start with curing the Curse status
                bclr    #STATUSEFFECT_BIT_CURSE,d1
                beq.s   @CureStun
                move.w  targetMember(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     303             ; "{NAME} is no longer{N}cursed."
                moveq   #-1,d2
                jsr     UnequipAllItemsIfNotCursed
@CureStun:      bclr    #STATUSEFFECT_BIT_STUN,d1
                beq.s   @CurePoison
                move.w  targetMember(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     302             ; "{NAME} is no longer{N}stunned."
                moveq   #-1,d2
@CurePoison:    bclr    #STATUSEFFECT_BIT_POISON,d1
                beq.s   @WasDetoxEffective
                move.w  targetMember(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     301             ; "{NAME} is no longer{N}poisoned."
                moveq   #-1,d2
@WasDetoxEffective:
                
                tst.w   d2
                bne.s   @UpdateStats
                txt     422             ; "But nothing happened.{D1}"
@UpdateStats:   clsTxt
                pea     @StartMain(pc)
                pea     ApplyStatusEffectsAndItemsOnStats
                jmp     SetStatusEffects
; ---------------------------------------------------------------------------

MainMenu_Item:
                
                moveq   #0,d0           ; initial choice: up
                moveq   #0,d1           ; animate-in from bottom
                moveq   #MENU_ITEM,d2
                lea     (InitialStack).w,a0
                jsr     ExecuteDiamondMenu
                tst.w   d0
                bmi.w   @StartMain
                
                ; Jump to Item submenu action
                add.w   d0,d0
                move.w  rjt_MainItemSubmenuActions(pc,d0.w),d0
                jmp     rjt_MainItemSubmenuActions(pc,d0.w)
; ---------------------------------------------------------------------------
rjt_MainItemSubmenuActions:
                
                dc.w MainItemSubmenu_Use-rjt_MainItemSubmenuActions
                dc.w MainItemSubmenu_Give-rjt_MainItemSubmenuActions
                dc.w MainItemSubmenu_Equip-rjt_MainItemSubmenuActions
                dc.w MainItemSubmenu_Drop-rjt_MainItemSubmenuActions
; ---------------------------------------------------------------------------

MainItemSubmenu_Use:
                
                bsr.w   PopulateGenericListWithCurrentForceMembers
@StartItemUse:  move.b  #1,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     ExecuteMembersListScreenOnItemSummaryPage
                tst.w   d0
                bmi.w   @ExitItemSubmenuAction
                
                ; Load local variables
                move.w  d0,member(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,itemIndex(a6)
                move.w  itemIndex(a6),d1
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),itemTypeBitfield(a6)
                                
                ; Using Angel Wing on an overworld map?
                cmpi.w  #ITEM_ANGEL_WING,d2
                bne.s   @HandleNonAngelWingItems
                jsr     IsOverworldMap
                beq.s   @HandleNonAngelWingItems
                
                ; Use Angel Wing
                jsr     RemoveItemBySlot
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     73                      ; "{NAME} used the{N}{ITEM}.{W2}"
                bra.w   @Egress
@HandleNonAngelWingItems:
                
                move.w  itemIndex(a6),d1
                jsr     IsItemUsableOnField
                tst.w   d2
                beq.s   @PickTarget        
                
                ; Check map events
                bsr.w   GetPlayerEntityPosition ; Get first entity's X, Y and facing -> d1.l, d2.l, d3.w
                move.w  itemIndex(a6),d4
                move.w  itemSlot(a6),d5
                jsr     RunMapSetupItemEvent
                tst.w   d6
                bne.w   @ExitMain
                
                ; Nothing happened (In: d0.w = member index, d4.w = item index)
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  d4,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     73                      ; "{NAME} used the{N}{ITEM}.{W2}"
                move.w  d4,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     422                     ; "But nothing happened.{D1}"
                bra.w   @ExitItemSubmenuAction
                
@PickTarget:    clsTxt
                clr.b   ((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                jsr     ExecuteMembersListScreenOnMainSummaryPage
                tst.w   d0
                bmi.w   @StartItemUse
                
                ; Use item
                move.w  itemIndex(a6),d1
                bsr.w   UseItemOnField
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                pea     @ExitItemSubmenuAction(pc)

            if (STANDARD_BUILD&FIX_FIELD_ITEM_CONSUMABLE=1)
                ; Is item consumable?
                btst    #ITEMTYPE_BIT_CONSUMABLE,itemTypeBitfield(a6)
                beq.w   @ExitItemSubmenuAction

                ; If so, remove
            endif
            
                jmp     RemoveItemBySlot
; ---------------------------------------------------------------------------

MainItemSubmenu_Give:
                
                bsr.w   PopulateGenericListWithCurrentForceMembers
@StartItemGive: move.b  #1,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     ExecuteMembersListScreenOnItemSummaryPage
                tst.w   d0
                bmi.w   @ExitItemSubmenuAction
                
                ; Load local variables
                move.w  d0,member(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,itemIndex(a6)
                
                ; Check equipment type
                jsr     GetEquipmentType
                beq.s   @PickRecipient          ; immediately pick recipient if neither a weapon or a ring
                bmi.s   @GiveRing               ; otherwise, giving a ring?
                jsr     GetEquippedWeapon       ; if not, giving a weapon
                bra.s   @GiveEquipment
@GiveRing:      jsr     GetEquippedRing
                
@GiveEquipment: bmi.s   @PickRecipient          ; immediately pick recipient if no weapon currently equipped
                cmp.w   itemSlot(a6),d2
                bne.s   @PickRecipient          ; immediately pick recipient if currently equipped weapon is in a different slot
                
                ; Giving a cursed item?
                move.w  itemIndex(a6),d1
                jsr     IsItemCursed
                bcc.s   @PickRecipient          ; immediately pick recipient if not cursed
                move.w  d1,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                sndCom  MUSIC_CURSED_ITEM
                txt     55                      ; "{LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}"
                pea     @StartItemGive(pc)
                bra.w   WaitForMusicResumeAndPlayerInput
                
@PickRecipient: move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     54                      ; "Pass the {ITEM}{N}to whom?{D1}"
                clsTxt
                move.b  #2,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  itemIndex(a6),((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     ExecuteMembersListScreenOnItemSummaryPage
                tst.w   d0
                bmi.w   @StartItemGive
                
                ; Start giving item
                move.w  d0,targetMember(a6)
                move.w  d1,targetItemSlot(a6)
                
                ; Is recipient's inventory full?
                jsr     GetItemBySlotAndHeldItemsNumber ; d1.w = exhanged item entry
                cmpi.w  #COMBATANT_ITEMSLOTS,d2
                beq.s   @ExchangeItems          ; exchange items if recipient's inventory is full
                
                ; Give item
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     RemoveItemBySlot
                move.w  targetMember(a6),d0
                move.w  itemIndex(a6),d1
                jsr     AddItem
                move.w  member(a6),d0
                move.w  targetMember(a6),d1
                cmp.w   d0,d1
                bne.s   @GiveToRecipient
                
                ; Give to self
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     74                      ; "{NAME} changed hands{N}to hold the {ITEM}.{W2}"
                bra.w   @ExitItemSubmenuAction   
@GiveToRecipient:
                
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  targetMember(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     65                      ; "The {ITEM} now{N}belongs to {NAME}.{W2}"
                bra.w   @ExitItemSubmenuAction
                
@ExchangeItems: move.w  d1,exchangedItemEntry(a6)
                jsr     GetEquipmentType
                beq.s   @StartExchange          ; immediately start exchange if neither a weapon or a ring
                bmi.s   @ExchangeRing           ; otherwise, exchanging a ring?
                jsr     GetEquippedWeapon       ; if not, exchanging a weapon
                bra.s   @ExchangeEquipment
@ExchangeRing:  jsr     GetEquippedRing
@ExchangeEquipment:
                
                bmi.s   @StartExchange          ; immediately start exchange if no weapon currently equipped
                cmp.w   targetItemSlot(a6),d2
                bne.s   @StartExchange          ; immediately start exchange if currently equipped weapon is in a different slot
                
                ; Exchanging a cursed item?
                move.w  exchangedItemEntry(a6),d1
                jsr     IsItemCursed
                bcc.s   @StartExchange          ; immediately start exchange if not cursed
                move.w  d1,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                sndCom  MUSIC_CURSED_ITEM
                txt     55                      ; "{LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}"
                pea     @PickRecipient(pc)
                bra.w   WaitForMusicResumeAndPlayerInput
                
@StartExchange: move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     UnequipItemBySlotIfNotCursed
                
                ; Are giver and recipient the same?
                move.w  targetMember(a6),d2
                cmp.w   member(a6),d2
                bne.s   @ExchangeToRecipient
                
                ; And if so, are items being exchanged also the same?
                move.w  targetItemSlot(a6),d3
                cmp.w   itemSlot(a6),d3
                beq.s   @SkipExchange
@ExchangeToRecipient:
                
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     DropItemBySlot
                move.w  exchangedItemEntry(a6),d1
                jsr     AddItem
                move.w  targetMember(a6),d2
                cmp.w   member(a6),d2
                bne.s   @ExchangeFromRecipient
                
                ; Exchange with self
                move.w  targetItemSlot(a6),d3
                cmp.w   itemSlot(a6),d3
                blo.s   @ExchangeFromRecipient
                subq.w  #1,targetItemSlot(a6)
@ExchangeFromRecipient:
                
                move.w  targetMember(a6),d0
                move.w  targetItemSlot(a6),d1
                jsr     RemoveItemBySlot
                move.w  itemIndex(a6),d1
                jsr     AddItem
                
@SkipExchange:  move.w  member(a6),d0
                move.w  targetMember(a6),d1
                cmp.w   d0,d1
                bne.s   @ExchangedMessage
                
                ; "Changed hands" message
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     74                      ; "{NAME} changed hands{N}to hold the {ITEM}.{W2}"
                bra.w   @ExitItemSubmenuAction
@ExchangedMessage:
                
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  targetMember(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                move.w  exchangedItemEntry(a6),((DIALOGUE_NAME_INDEX_3-$1000000)).w
                txt     66                      ; "The {ITEM} was{N}exchanged for {NAME}'s{N}{ITEM}.{W2}"
                bra.w   @ExitItemSubmenuAction
; ---------------------------------------------------------------------------
                
MainItemSubmenu_Equip:
                
                bsr.w   PopulateGenericListWithCurrentForceMembers
                move.b  #3,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                pea     MainMenu_Item(pc)
                jmp     ExecuteMembersListScreenOnItemSummaryPage
; ---------------------------------------------------------------------------

MainItemSubmenu_Drop:
                
                bsr.w   PopulateGenericListWithCurrentForceMembers
@StartItemDrop: move.b  #1,((CURRENT_ITEM_SUBMENU_ACTION-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     ExecuteMembersListScreenOnItemSummaryPage
                tst.w   d0
                bmi.w   @ExitItemSubmenuAction
                
                ; Load local variables
                move.w  d0,member(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,itemIndex(a6)
                move.w  itemIndex(a6),d1
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_TYPE(a0),itemTypeBitfield(a6)
                
                ; Is item unsellable?
                move.w  d1,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                btst    #ITEMTYPE_BIT_UNSELLABLE,itemTypeBitfield(a6)
                beq.s   @ConfirmDrop
                
                ; Exit if unsellable
                txt     62                      ; "{LEADER}!  You can't{N}discard the {ITEM}!{W2}"
                bra.w   @ExitItemSubmenuAction
                
@ConfirmDrop:   txt     69                      ; "The {ITEM} will be{N}discarded.  OK?"
                jsr     alt_YesNoPrompt
                clsTxt
                tst.w   d0
                bne.s   @StartItemDrop          ; restart Drop action if answered "No"
                
                ; Check equipment type
                move.w  member(a6),d0
                move.w  itemIndex(a6),d1
                jsr     GetEquipmentType
                beq.s   @DropItem               ; immediately drop item if neither a weapon or a ring
                bmi.s   @DropRing               ; otherwise, dropping a ring?
                jsr     GetEquippedWeapon       ; if not, dropping a weapon
                bra.s   @DropEquipment
@DropRing:      jsr     GetEquippedRing
                
@DropEquipment: bmi.s   @DropItem               ; immediately drop item if no weapon currently equipped
                cmp.w   itemSlot(a6),d2
                bne.s   @DropItem               ; immediately drop item if currently equipped weapon is in a different slot
                
                ; Dropping a cursed item?
                move.w  itemIndex(a6),d1
                jsr     IsItemCursed
                bcc.s   @DropItem               ; immediately drop item if not cursed
                move.w  d1,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                sndCom  MUSIC_CURSED_ITEM
                txt     55                      ; "{LEADER}!  You can't{N}unequip the {ITEM}.{N}It's cursed!{W2}"
                pea     @ExitItemSubmenuAction(pc)
                bra.w   WaitForMusicResumeAndPlayerInput    
                
@DropItem:      move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     RemoveItemBySlot
                move.w  itemIndex(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     67                      ; "The {ITEM} is discarded.{W2}"
                
                ; Is dropped item rare?
                btst    #ITEMTYPE_BIT_RARE,itemTypeBitfield(a6)
                beq.s   @ExitItemSubmenuAction
                
                ; Add item to Deals if rare
                move.w  itemIndex(a6),d1
                jsr     AddItemToDeals
@ExitItemSubmenuAction:
                
                clsTxt                          ; Close textbox and restart item submenu
                bra.w   MainMenu_Item
; ---------------------------------------------------------------------------

MainMenu_Search:
                
                clr.w   d6
                pea     @ExitMain(pc)
                bra.w   CheckArea

    ; End of function MainMenuActions

                modend

; =============== S U B R O U T I N E =======================================


PopulateGenericListWithCurrentForceMembers:
                
                movem.l d7-a1,-(sp)
                jsr     UpdateForce
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     ((GENERIC_LIST-$1000000)).w,a1
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,((GENERIC_LIST_LENGTH-$1000000)).w
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                
@Loop:          move.b  (a0)+,(a1)+
                dbf     d7,@Loop
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function PopulateGenericListWithCurrentForceMembers

