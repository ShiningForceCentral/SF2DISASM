
; ASM FILE code\common\menus\caravan\caravanactions_1.asm :
; 0x21FD2..0x228A2 : Caravan functions

; =============== S U B R O U T I N E =======================================

targetItemSlot = -12
targetItemIndex = -10
targetMember = -8
itemSlot = -6
itemIndex = -4
member = -2

CaravanMenuActions:
                
                module
                movem.l d0-a5,-(sp)
                link    a6,#-12
                move.w  #2,d1           ; "{LEADER}, are you ready{N}for battle?{D3}"
                bsr.w   DisplayCaravanMessageWithPortrait
                moveq   #0,d1           ; animate-in from bottom
                bra.w   @StartCaravan   
@RestartCaravan:
                
                moveq   #-1,d1          ; animate-in from right
@StartCaravan:
                
                moveq   #0,d0           ; initial choice : up
                moveq   #MENU_CARAVAN,d2
                lea     (InitStack).w,a0
                jsr     j_ExecuteMenu
                cmpi.w  #$FFFF,d0
                beq.w   @ExitCaravan
                add.w   d0,d0
                move.w  rjt_CaravanMenuActions(pc,d0.w),d0
                jsr     rjt_CaravanMenuActions(pc,d0.w)
                bra.s   @RestartCaravan 
rjt_CaravanMenuActions:
                
                dc.w CaravanMenu_Join-rjt_CaravanMenuActions
                dc.w CaravanMenu_Depot-rjt_CaravanMenuActions
                dc.w CaravanMenu_Item-rjt_CaravanMenuActions
                dc.w CaravanMenu_Purge-rjt_CaravanMenuActions
@ExitCaravan:
                
                moveq   #0,d0
                moveq   #0,d1
                move.w  #10,d1          ; "{LEADER}, take it easy!{W1}"
                bsr.w   DisplayCaravanMessageWithPortrait
                unlk    a6
                movem.l (sp)+,d0-a5
                rts

    ; End of function CaravanMenuActions

                modend

; =============== S U B R O U T I N E =======================================

targetItemSlot = -12
targetItemIndex = -10
targetMember = -8
itemSlot = -6
itemIndex = -4
member = -2

CaravanMenu_Join:
                
                module
                moveq   #2,d1           ; ; reserve members
                bsr.w   PopulateGenericListWithMembersList
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                beq.w   @NoReserveMembers
                
                ; Pick joiner
                move.w  #15,d1          ; "Who joins the battle party?{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                jsr     j_InitializeMemberListScreen
                move.w  d0,member(a6)
                cmpi.w  #$FFFF,d0
                beq.w   byte_220E8      ; Exit Join action
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   @CheckBattleParty
                
                ; Joiner is dead
                move.w  member(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     19              ; "{NAME} is dead.{N}Are you sure?"
                jsr     j_YesNoChoiceBox
                tst.w   d0
                bne.w   loc_220FE
@CheckBattleParty:
                
                moveq   #1,d1           ; battle party members
                bsr.w   PopulateGenericListWithMembersList
                cmpi.w  #FORCE_MAX_SIZE,((GENERIC_LIST_LENGTH-$1000000)).w
                bcc.s   @ChooseRelief   
                
                ; If force max size not reached, join immediately
                move.w  member(a6),d0
                jsr     j_JoinBattleParty
                move.w  member(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #21,d1          ; "{NAME}, fight bravely in the{N}front.{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                bra.s   @RestartJoin
@ChooseRelief:
                
                move.w  #23,d1          ; "Choose a relief.{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                jsr     j_InitializeMemberListScreen
                cmpi.w  #$FFFF,d0
                beq.s   byte_220DE      ; Close textbox and restart Join action
                
                ; Is leader leaving the battle party?
            if (STANDARD_BUILD&BOWIE_CAN_LEAVE_BATTLE_PARTY=1)
            else
                tst.w   d0
                beq.s   @LeaderCannotLeave
            endif
                
                ; 
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                jsr     j_LeaveBattleParty
                move.w  member(a6),d0
                jsr     j_JoinBattleParty
                move.w  member(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  #17,d1          ; "{NAME} returns to the{N}Caravan.{W2}{N}{NAME} joins the battle{N}party.{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
            if (STANDARD_BUILD&BOWIE_CAN_LEAVE_BATTLE_PARTY=1)
            else
                bra.s   @Goto_RestartJoin
@LeaderCannotLeave:
                
                move.w  #20,d1          ; "{LEADER}!  What will they{N}do without you?!{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
            endif
@Goto_RestartJoin:
                
                bra.s   @RestartJoin
byte_220DE:
                
                
                ; Close textbox and restart Join action
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
@RestartJoin:
                
                bra.s   loc_220F2
byte_220E8:
                
                
                ; Exit Join action
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function CaravanMenu_Join


; START OF FUNCTION CHUNK FOR CaravanMenu_Join

loc_220F2:
                
                bra.s   loc_220FE
@NoReserveMembers:
                
                move.w  #18,d1          ; "Oh, {LEADER}...there are{N}no reliefs.{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                rts
loc_220FE:
                
                bra.w   CaravanMenu_Join

; END OF FUNCTION CHUNK FOR CaravanMenu_Join

                modend

; =============== S U B R O U T I N E =======================================


CaravanMenu_Purge:
                
                module
                moveq   #1,d1           ; battle party members
                bsr.w   PopulateGenericListWithMembersList
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                beq.s   @Return
                
                ; Pick a quitter
                move.w  #16,d1          ; "Who quits the battle party?{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                jsr     j_InitializeMemberListScreen
                cmpi.w  #$FFFF,d0
                beq.s   byte_22144      ; Exit Purge action
                
            if (STANDARD_BUILD&BOWIE_CAN_LEAVE_BATTLE_PARTY=1)
                ; Is there only 1 battle party member remaining?
                cmpi.w  #1,((GENERIC_LIST_LENGTH-$1000000)).w
                bls.s   @LeaderCannotLeave
            else
                ; Is leader leaving the battle party?
                tst.w   d0
                beq.s   @LeaderCannotLeave
            endif
                jsr     j_LeaveBattleParty
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #22,d1          ; "{NAME}, why don't you{N}take a rest now?{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                bra.s   @RestartPurge
@LeaderCannotLeave:
                
                move.w  #20,d1          ; "{LEADER}!  What will they{N}do without you?!{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
@RestartPurge:
                
                bra.s   loc_2214E
byte_22144:
                
                
                ; Exit Purge action
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function CaravanMenu_Purge


; START OF FUNCTION CHUNK FOR CaravanMenu_Purge

loc_2214E:
                
                bra.s   loc_22152
@Return:
                
                rts
loc_22152:
                
                bra.s   CaravanMenu_Purge

; END OF FUNCTION CHUNK FOR CaravanMenu_Purge

                modend

; =============== S U B R O U T I N E =======================================


CaravanMenu_Depot:
                
                module
                moveq   #0,d1           ; animate-in from bottom
                bra.w   @Start          
@Restart:
                
                moveq   #-1,d1          ; animate-in from right
@Start:
                
                moveq   #0,d0           ; initial choice : up
                moveq   #MENU_DEPOT,d2
                lea     (InitStack).w,a0
                jsr     j_ExecuteMenu
                cmpi.w  #$FFFF,d0
                beq.w   @Return
                add.w   d0,d0
                move.w  rjt_CaravanDepotSubmenuActions(pc,d0.w),d0
                jsr     rjt_CaravanDepotSubmenuActions(pc,d0.w)
                bra.s   @Restart        
rjt_CaravanDepotSubmenuActions:
                
                dc.w CaravanDepotSubmenu_Look-rjt_CaravanDepotSubmenuActions
                dc.w CaravanDepotSubmenu_Deposit-rjt_CaravanDepotSubmenuActions
                dc.w CaravanDepotSubmenu_Derive-rjt_CaravanDepotSubmenuActions
                dc.w CaravanDepotSubmenu_Drop-rjt_CaravanDepotSubmenuActions
@Return:
                
                rts

    ; End of function CaravanMenu_Depot

                modend

; =============== S U B R O U T I N E =======================================

targetItemSlot = -12
targetItemIndex = -10
targetMember = -8
itemSlot = -6
itemIndex = -4
member = -2

CaravanDepotSubmenu_Look:
                
                module
                bsr.w   CopyCaravanItems
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                beq.w   @StorehouseIsEmpty
                
                move.w  #MESSAGE_CARAVAN_APPRAISE_WHICH_ITEM,d1 ; "Appraise which item?{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                jsr     j_CreateShopInventoryScreen
                move.w  d0,d2
                move.w  d1,itemSlot(a6)
                move.w  d2,itemIndex(a6)
                cmpi.w  #$FFFF,d0
                beq.w   byte_222E0      
                chkFlg  70              ; Astral is a follower
                bne.s   @AstralIsFollower
                moveq   #PORTRAIT_ROHDE,d0
                bra.s   @HasSpecialDescription
@AstralIsFollower:
                
                moveq   #PORTRAIT_ASTRAL,d0
@HasSpecialDescription:
                
                moveq   #0,d1
                jsr     j_CreatePortraitWindow
                move.w  itemIndex(a6),d1
                bsr.w   DisplaySpecialCaravanDescription
                bne.w   @IsUnsellable
                
                ; Check equipment type
                move.w  itemIndex(a6),d1
                jsr     j_GetEquipmentType
                tst.w   d2
                bne.s   @IsWeapon
                txt     92              ; "It's a tool.{W2}"
                bra.s   @HasUseSpell
@IsWeapon:
                
                cmpi.w  #EQUIPMENTTYPE_WEAPON,d2
                bne.s   byte_221F4      
                txt     90              ; "It's a weapon.{W2}"
                bra.s   @HasUseSpell
byte_221F4:
                
                txt     91              ; "It's a ring.{W2}"
@HasUseSpell:
                
                move.w  itemIndex(a6),d1
                jsr     j_GetItemDefAddress
                cmpi.b  #SPELL_NOTHING,ITEMDEF_OFFSET_USE_SPELL(a0)
                beq.s   byte_22210      
                txt     93              ; "It has a special effect when{N}used in battle.{W2}"
                bra.s   @IsWeaponOrRing
byte_22210:
                
                txt     94              ; "It has no effect in battle.{W2}"
@IsWeaponOrRing:
                
                move.w  itemIndex(a6),d1
                jsr     j_GetEquipmentType
                tst.w   d2
                beq.w   @IsUnsellable
                
                cmpi.w  #ITEM_POWER_RING,d1 ; HARDCODED item indexes with special message
                beq.w   byte_222A4
                cmpi.w  #ITEM_PROTECT_RING,d1
                beq.w   byte_222A4
                cmpi.w  #ITEM_QUICK_RING,d1
                beq.w   byte_222A4
                cmpi.w  #ITEM_RUNNING_RING,d1
                beq.w   byte_222A4
                move.w  itemIndex(a6),d1
                move.w  d1,((TEXT_NAME_INDEX_1-$1000000)).w
                txt     96              ; "The {ITEM} is for{N}"
                jsr     j_UpdateForce
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   @IsUnsellable
                lea     ((TARGETS_LIST-$1000000)).w,a0
                
        if (STANDARD_BUILD&FIX_CARAVAN_DESCRIPTIONS=1)
                clr.w   d3
@ClearCount:    clr.w   d6
@EquippableMessage_Loop:
                
                cmpi.w  #4,d6
                beq.s   @ClearCount
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                move.l  d7,-(sp)
                move.b  (a0)+,d0
                jsr     IsWeaponOrRingEquippable
                movem.l (sp)+,d7
            else
                move.b  (a0)+,d0
                jsr     j_IsWeaponOrRingEquippable
            endif
                bcc.s   @NextMember
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w ; argument (character index) for trap #5 using a {NAME} command
                txt     98              ; "{DICT}{NAME},"
                addq.w  #1,d6
                moveq   #2,d3
                cmpi.w  #4,d6
                bne.s   @NextMember
                txt     99              ; "{N}"
@NextMember:    dbf     d7,@EquippableMessage_Loop

                tst.w   d3
        else
                clr.w   d6
@EquippableMessage_Loop:
                
            if (STANDARD_BUILD&EXPANDED_CLASSES=1)
                move.l  d7,-(sp)
                move.b  (a0)+,d0
                jsr     IsWeaponOrRingEquippable
                movem.l (sp)+,d7
            else
                move.b  (a0)+,d0
                jsr     j_IsWeaponOrRingEquippable
            endif
                bcc.s   @NextMember
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w ; argument (character index) for trap #5 using a {NAME} command
                txt     98              ; "{DICT}{NAME},"
                addq.w  #1,d6
                cmpi.w  #1,d6
                bne.s   @Skip
                txt     99              ; "{N}"
@Skip:
                
                cmpi.w  #4,d6
                bne.s   @NextMember
                txt     99              ; "{N}"
@NextMember:
                
                dbf     d7,@EquippableMessage_Loop
                
                tst.w   d6
        endif
                bne.s   byte_2229C      
                txt     97              ; "nobody so far.{W2}"
                bra.s   @Goto_IsUnsellable
byte_2229C:
                
                txt     100             ; "to equip.{W2}"
@Goto_IsUnsellable:
                
                bra.w   @IsUnsellable
byte_222A4:
                
                txt     95              ; "Everybody can equip it.{W2}"
@IsUnsellable:
                
                move.w  itemIndex(a6),d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_UNSELLABLE,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   @GetSellingPrice
                txt     102             ; "You can't sell it at a shop.{W2}"
                bra.s   byte_222D4
@GetSellingPrice:
                
                clr.l   d1
                move.w  ITEMDEF_OFFSET_PRICE(a0),d1
                mulu.w  #ITEMSELLPRICE_MULTIPLIER,d1
                lsr.l   #ITEMSELLPRICE_BITSHIFTRIGHT,d1
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     101             ; "It brings {#} gold coins{N}at a shop.{W2}"
byte_222D4:
                
                clsTxt
                jsr     j_RemovePortraitWindow
                bra.s   @Goto_Restart
byte_222E0:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function CaravanDepotSubmenu_Look


; START OF FUNCTION CHUNK FOR CaravanDepotSubmenu_Look

@Goto_Restart:
                
                bra.s   @Restart
@StorehouseIsEmpty:
                
                move.w  #MESSAGE_CARAVAN_WELL_THE_STOREHOUSE_IS_EMPTY,d1 
                                                        ; "Well, the storehouse is{N}empty.{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                rts
@Restart:
                
                bra.w   CaravanDepotSubmenu_Look

; END OF FUNCTION CHUNK FOR CaravanDepotSubmenu_Look

                modend

; =============== S U B R O U T I N E =======================================


CaravanDepotSubmenu_Deposit:
                
                module
                bsr.w   CopyCaravanItems
                cmpi.w  #CARAVAN_MAX_ITEMS_NUMBER,((GENERIC_LIST_LENGTH-$1000000)).w
                bcc.s   @Exit           
                
                moveq   #0,d1           ; all force members
                bsr.w   PopulateGenericListWithMembersList
                move.w  #MESSAGE_CARAVAN_STORE_WHOSE_ITEM,d1 ; "Store whose item?{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                move.b  #1,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_BuildMemberListScreen_NewAttAndDefPage
                move.w  d0,member(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,itemIndex(a6)
                cmpi.w  #$FFFF,d0
                beq.s   byte_2236A      
                
                bsr.w   IsItemInSlotEquippedAndCursed
                bcs.w   @Restart
                
                ; Deposit item
                move.w  itemIndex(a6),d1
                jsr     j_AddItemToCaravan
                move.w  itemSlot(a6),d1
                jsr     j_DropItemBySlot
                move.w  member(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  itemIndex(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  #MESSAGE_CARAVAN_ITEM_IS_NOW_IN_THE_STOREHOUSE,d1 
                                                        ; "{NAME}'s {ITEM}{N}is now in the storehouse.{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                bra.s   @Goto_Restart
byte_2236A:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts
@Goto_Restart:
                
                bra.s   @Restart
@Exit:
                
                move.w  #MESSAGE_CARAVAN_SORRY_THERE_IS_NO_ROOM,d1 ; "Sorry, there's no room!{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                rts

    ; End of function CaravanDepotSubmenu_Deposit


; START OF FUNCTION CHUNK FOR CaravanDepotSubmenu_Deposit

@Restart:
                
                bra.w   CaravanDepotSubmenu_Deposit

; END OF FUNCTION CHUNK FOR CaravanDepotSubmenu_Deposit

                modend

; =============== S U B R O U T I N E =======================================


CaravanDepotSubmenu_Derive:
                
                module
                bsr.w   CopyCaravanItems
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                beq.w   @Exit           
                
                ; Pick item from storehouse
                move.w  #MESSAGE_CARAVAN_CHOOSE_WHICH_ITEM,d1 ; "Choose which item?{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                jsr     j_CreateShopInventoryScreen
                move.w  d0,d2
                move.w  d1,itemSlot(a6)
                move.w  d2,itemIndex(a6)
                cmpi.w  #$FFFF,d2
                beq.w   byte_2247E      
                
                ; Pick recipient
                moveq   #0,d1           ; all force members
                bsr.w   PopulateGenericListWithMembersList
                move.w  itemIndex(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #MESSAGE_CARAVAN_PASS_THE_ITEM_TO_WHOM,d1 ; "Pass the {ITEM}{N}to whom?{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                move.b  #2,((byte_FFB13C-$1000000)).w
                move.w  itemIndex(a6),((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_BuildMemberListScreen_NewAttAndDefPage
                move.w  d0,targetMember(a6)
                move.w  d1,targetItemSlot(a6)
                move.w  d2,targetItemIndex(a6)
                cmpi.w  #$FFFF,d0
                beq.w   @Goto_Restart
                
                ; Is recipient's inventory full?
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                cmpi.w  #COMBATANT_ITEMSLOTS,d2
                beq.s   @Exchange
                
                ; Derive item
            if (STANDARD_BUILD&FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
            else
                move.w  itemIndex(a6),d1
                jsr     j_AddItem
            endif
                move.w  itemSlot(a6),d1
                jsr     j_RemoveItemFromCaravan
            if (STANDARD_BUILD&FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
                jsr     AddItem
            endif
                move.w  targetMember(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  itemIndex(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  #MESSAGE_CARAVAN_CHARACTER_NOW_HAS_THE_ITEM,d1 
                                                        ; "{NAME} now has the{N}{ITEM}.{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                bra.s   @Goto_Restart
@Exchange:
                
                move.w  targetMember(a6),d1
                move.w  targetItemSlot(a6),d1
                bsr.w   IsItemInSlotEquippedAndCursed
                bcs.w   @Restart_0
                
                move.w  targetMember(a6),d0
                move.w  targetItemSlot(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  itemSlot(a6),d1
                jsr     j_RemoveItemFromCaravan
                move.w  targetMember(a6),d0
            if (STANDARD_BUILD&FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
            else
                move.w  itemIndex(a6),d1
            endif
                jsr     j_AddItem
                move.w  targetItemIndex(a6),d1
                jsr     j_AddItemToCaravan
                move.w  itemIndex(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  targetMember(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  targetItemIndex(a6),((TEXT_NAME_INDEX_3-$1000000)).w
                move.w  #MESSAGE_ITEMMENU_ITEM_IS_EXCHANGED_FOR,d1 ; "{ITEM} is exchanged{N}for {NAME}'s {ITEM}.{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
@Goto_Restart:
                
                bra.s   @Restart
byte_2247E:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function CaravanDepotSubmenu_Derive


; START OF FUNCTION CHUNK FOR CaravanDepotSubmenu_Derive

@Restart:
                
                bra.s   @Restart_0
@Exit:
                
                move.w  #MESSAGE_CARAVAN_WELL_THE_STOREHOUSE_IS_EMPTY,d1 
                                                        ; "Well, the storehouse is{N}empty.{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                rts
@Restart_0:
                
                bra.w   CaravanDepotSubmenu_Derive

; END OF FUNCTION CHUNK FOR CaravanDepotSubmenu_Derive

                modend

; =============== S U B R O U T I N E =======================================

targetItemSlot = -12
targetItemIndex = -10
targetMember = -8
itemSlot = -6
itemIndex = -4
member = -2

CaravanDepotSubmenu_Drop:
                
                module
                bsr.w   CopyCaravanItems
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                beq.w   @Exit           
                
                move.w  #MESSAGE_CARAVAN_DISCARD_WHICH_ITEM,d1 ; "Discard which item?{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                jsr     j_CreateShopInventoryScreen
                move.w  d0,d2
                move.w  d1,itemSlot(a6)
                move.w  d2,itemIndex(a6)
                move.w  itemIndex(a6),d1
                jsr     IsItemUnsellable
                bcs.w   @Restart_0
                cmpi.w  #$FFFF,itemIndex(a6)
                beq.s   byte_2251E      
                
                ; Confirm discard
                move.w  itemIndex(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     44              ; "The {ITEM} will be{N}discarded.  Are you sure?"
                jsr     j_YesNoChoiceBox
                tst.w   d0
                bne.s   byte_22518      
                
                move.w  itemSlot(a6),d1
                jsr     j_RemoveItemFromCaravan
                move.w  itemIndex(a6),d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_RARE,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   @Continue
                jsr     j_AddItemToDeals
@Continue:
                
                move.w  itemIndex(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #MESSAGE_ITEMMENU_DISCARDED_THE_ITEM,d1 ; "Discarded the {ITEM}.{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                bra.s   @Goto_Restart
byte_22518:
                
                txt     4               ; "Did you change your mind?{W2}"
@Goto_Restart:
                
                bra.s   @Restart
byte_2251E:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function CaravanDepotSubmenu_Drop


; START OF FUNCTION CHUNK FOR CaravanDepotSubmenu_Drop

@Restart:
                
                bra.s   @Restart_0
@Exit:
                
                move.w  #MESSAGE_CARAVAN_WELL_THE_STOREHOUSE_IS_EMPTY,d1 
                                                        ; "Well, the storehouse is{N}empty.{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                rts
@Restart_0:
                
                bra.w   CaravanDepotSubmenu_Drop

; END OF FUNCTION CHUNK FOR CaravanDepotSubmenu_Drop

                modend

; =============== S U B R O U T I N E =======================================


CaravanMenu_Item:
                
                module
                moveq   #0,d1           ; animate-in from bottom
                bra.w   @Start          
@Restart:
                
                moveq   #-1,d1          ; animate-in from right
@Start:
                
                moveq   #0,d0           ; initial choice : up
                moveq   #MENU_ITEM,d2
                lea     (InitStack).w,a0
                jsr     j_ExecuteMenu
                cmpi.w  #$FFFF,d0
                beq.w   @Return
                add.w   d0,d0
                move.w  rjt_CaravanItemSubmenuActions(pc,d0.w),d0
                jsr     rjt_CaravanItemSubmenuActions(pc,d0.w)
                bra.s   @Restart        
rjt_CaravanItemSubmenuActions:
                
                dc.w CaravanItemSubmenu_Use-rjt_CaravanItemSubmenuActions
                dc.w CaravanItemSubmenu_Give-rjt_CaravanItemSubmenuActions
                dc.w CaravanItemSubmenu_Equip-rjt_CaravanItemSubmenuActions
                dc.w CaravanItemSubmenu_Drop-rjt_CaravanItemSubmenuActions
@Return:
                
                rts

    ; End of function CaravanMenu_Item

                modend

; =============== S U B R O U T I N E =======================================

targetItemSlot = -12
targetItemIndex = -10
targetMember = -8
itemSlot = -6
itemIndex = -4
member = -2

CaravanItemSubmenu_Use:
                
                module
                move.w  #24,d1          ; "Use whose item?{D1}"
                bsr.w   DisplayCaravanMessageWithPortrait
@Start:
                
                moveq   #0,d1           ; all force members
                bsr.w   PopulateGenericListWithMembersList
                move.b  #1,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_BuildMemberListScreen_NewAttAndDefPage
                move.w  d0,member(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,itemIndex(a6)
                cmpi.w  #$FFFF,d0
                beq.s   byte_225FA      ; Exit Item Use action
                
                ; Is item usable?
                move.w  itemIndex(a6),d1
                jsr     IsItemUsableOnField
                tst.w   d2
                bne.s   @NotUsable
                
                ; Pick target
                move.w  itemIndex(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #25,d1          ; "Use the {ITEM}{N}on whom?{D1}"
                bsr.w   DisplayCaravanMessageWithPortrait
                move.b  #0,((byte_FFB13C-$1000000)).w
                jsr     j_InitializeMemberListScreen
                cmpi.w  #$FFFF,d0
                beq.s   byte_225E4      
                
                ; Use item
                move.w  itemIndex(a6),d1
                bsr.w   UseItemOnField  
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_RemoveItemBySlot
                bra.s   @Goto_Restart
byte_225E4:
                
                txt     4               ; "Did you change your mind?{W2}"
@Goto_Restart:
                
                bra.s   @Restart
@NotUsable:
                
                move.w  itemIndex(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #26,d1          ; "{LEADER}! {D1}{N}What do you think you're{N}doing with the {ITEM}?!{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
@Restart:
                
                bra.s   loc_22604
byte_225FA:
                
                
                ; Exit Item Use action
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function CaravanItemSubmenu_Use


; START OF FUNCTION CHUNK FOR CaravanItemSubmenu_Use

loc_22604:
                
                move.w  #27,d1          ; "Use another item?{N}"
                bsr.w   DisplayCaravanMessageWithPortrait
                bra.w   @Start          

; END OF FUNCTION CHUNK FOR CaravanItemSubmenu_Use

                modend

; =============== S U B R O U T I N E =======================================

targetItemSlot = -12
targetItemIndex = -10
targetMember = -8
itemSlot = -6
itemIndex = -4
member = -2

CaravanItemSubmenu_Give:
                
                module
                move.w  #28,d1          ; "Pass whose item?{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
@Start:
                
                moveq   #0,d1           ; all force members
                bsr.w   PopulateGenericListWithMembersList
                move.b  #1,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_BuildMemberListScreen_NewAttAndDefPage
                move.w  d0,member(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,itemIndex(a6)
                cmpi.w  #$FFFF,d0
                beq.w   byte_22760      
                
                bsr.w   IsItemInSlotEquippedAndCursed
                bcs.w   @Restart_0
                
                ; Pick a recipient
                move.w  itemIndex(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #29,d1          ; "Pass the {ITEM}{N}to whom?{D1}"
                bsr.w   DisplayCaravanMessageWithPortrait
                move.b  #2,((byte_FFB13C-$1000000)).w
                move.w  itemIndex(a6),((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_BuildMemberListScreen_NewAttAndDefPage
                move.w  d0,targetMember(a6)
                move.w  d1,targetItemSlot(a6)
                move.w  d2,targetItemIndex(a6)
                cmpi.w  #$FFFF,d0
                beq.w   byte_2275A      ; Changed your mind
                
                ; Is giving to self?
                cmp.w   member(a6),d0
                bne.s   @IsInventoryFull
                
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  itemIndex(a6),d1
                jsr     j_AddItem
                move.w  member(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  itemIndex(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  #48,d1          ; "{NAME} now has the{N}{ITEM} in hand.{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                bra.w   @Goto_Restart
@IsInventoryFull:
                
                moveq   #0,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                cmpi.w  #COMBATANT_ITEMSLOTS,d2
                beq.s   @ExchangeItems
                
                ; Give item
                move.w  targetMember(a6),d0
                move.w  itemIndex(a6),d1
                jsr     j_AddItem
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  itemIndex(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  targetMember(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  #40,d1          ; "{ITEM} belongs{N}to {NAME} now.{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                bra.s   @Goto_Restart
@ExchangeItems:
                
                move.w  targetMember(a6),d1
                move.w  targetItemSlot(a6),d1
                bsr.w   IsItemInSlotEquippedAndCursed
                bcs.w   @Restart_0
                
                move.w  targetMember(a6),d0
                move.w  targetItemSlot(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  targetMember(a6),d0
                move.w  itemIndex(a6),d1
                jsr     j_AddItem
                move.w  member(a6),d0
                move.w  targetItemIndex(a6),d1
                jsr     j_AddItem
                move.w  itemIndex(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  targetMember(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  targetItemIndex(a6),((TEXT_NAME_INDEX_3-$1000000)).w
                move.w  #41,d1          ; "{ITEM} is exchanged{N}for {NAME}'s {ITEM}.{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
@Goto_Restart:
                
                bra.s   @Restart
byte_2275A:
                
                
                ; Changed your mind
                txt     4               ; "Did you change your mind?{W2}"
@Restart:
                
                bra.s   @Restart_0
byte_22760:
                
                
                ; Exit Item Give action
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function CaravanItemSubmenu_Give


; START OF FUNCTION CHUNK FOR CaravanItemSubmenu_Give

@Restart_0:
                
                move.w  #32,d1          ; "Pass another item?"
                bsr.w   DisplayCaravanMessageWithPortrait
                bra.w   @Start          

; END OF FUNCTION CHUNK FOR CaravanItemSubmenu_Give

                modend

; =============== S U B R O U T I N E =======================================


CaravanItemSubmenu_Equip:
                
                module
                move.w  #33,d1          ; "Who will you equip?{D1}"
                bsr.w   DisplayCaravanMessageWithPortrait
@Start:
                
                moveq   #0,d1           ; all force members
                bsr.w   PopulateGenericListWithMembersList
                move.b  #3,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_BuildMemberListScreen_NewAttAndDefPage
                cmpi.w  #$FFFF,d0
                bne.s   @Restart
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function CaravanItemSubmenu_Equip


; START OF FUNCTION CHUNK FOR CaravanItemSubmenu_Equip

@Restart:
                
                move.w  #35,d1          ; Equip another item?{D1}
                bsr.w   DisplayCaravanMessageWithPortrait
                bra.s   @Start          

; END OF FUNCTION CHUNK FOR CaravanItemSubmenu_Equip

                modend

; =============== S U B R O U T I N E =======================================

targetItemSlot = -12
targetItemIndex = -10
targetMember = -8
itemSlot = -6
itemIndex = -4
member = -2

CaravanItemSubmenu_Drop:
                
                module
                move.w  #36,d1          ; "Discard whose item?{D1}"
                bsr.w   DisplayCaravanMessageWithPortrait
@Start:
                
                moveq   #0,d1           ; all force members
                bsr.w   PopulateGenericListWithMembersList
                move.b  #1,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_BuildMemberListScreen_NewAttAndDefPage
                move.w  d0,member(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,itemIndex(a6)
                cmpi.w  #$FFFF,member(a6)
                beq.s   byte_2284E      
                
                bsr.w   IsItemInSlotEquippedAndCursed
                bcs.w   @Restart
                
                ; Confirm discard
                move.w  itemIndex(a6),d1
                jsr     IsItemUnsellable
                bcs.w   @Restart
                
                move.w  itemIndex(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     44              ; "The {ITEM} will be{N}discarded.  Are you sure?"
                jsr     j_YesNoChoiceBox
                tst.w   d0
                bne.s   byte_22844      
                
                ; Discard item
                move.w  member(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_DropItemBySlot
                move.w  itemIndex(a6),d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_RARE,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   @Continue
                jsr     j_AddItemToDeals
@Continue:
                
                move.w  itemIndex(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #42,d1          ; "Discarded the {ITEM}.{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                bra.s   @Goto_Restart
byte_22844:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
@Goto_Restart:
                
                bra.s   @Restart
byte_2284E:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function CaravanItemSubmenu_Drop


; START OF FUNCTION CHUNK FOR CaravanItemSubmenu_Drop

@Restart:
                
                move.w  #38,d1          ; "Discard another item?"
                bsr.w   DisplayCaravanMessageWithPortrait
                bra.w   @Start          

; END OF FUNCTION CHUNK FOR CaravanItemSubmenu_Drop

                modend

; =============== S U B R O U T I N E =======================================

; Return CCR zero-bit set if special description was found.
; (Only used for Chirrup Sandals.)


DisplaySpecialCaravanDescription:
                
                movem.l d0-d1/a0,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                lea     tbl_SpecialCaravanDescriptions(pc), a0
@FindItem_Loop:
                
                cmpi.w  #CODE_TERMINATOR_WORD,(a0)
                beq.w   @Done
                cmp.b   (a0),d1
                bne.s   @Next
                move.b  1(a0),d1        ; d1.b = number of lines to display
                subq.w  #1,d1
                move.w  2(a0),d0        ; d2.w = first message index
@DisplayText_Loop:
                
                jsr     (DisplayText).w 
                addq.w  #1,d0
                dbf     d1,@DisplayText_Loop
                
                moveq   #-1,d0
                bra.w   @Done
@Next:
                
                adda.w  #4,a0
                bra.s   @FindItem_Loop
@Done:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function DisplaySpecialCaravanDescription

