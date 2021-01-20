
; ASM FILE code\common\menus\caravan\caravanactions_1.asm :
; 0x21FD2..0x228A2 : Caravan functions

; =============== S U B R O U T I N E =======================================


CaravanMenuActions:
                
                movem.l d0-a5,-(sp)
                link    a6,#-12
                move.w  #2,d1
                bsr.w   ChooseCaravanPortrait
                moveq   #0,d1
                bra.w   loc_21FEA
loc_21FE8:
                
                moveq   #$FFFFFFFF,d1
loc_21FEA:
                
                moveq   #0,d0
                moveq   #MENU_CARAVAN,d2
                lea     (InitStack).w,a0
                jsr     j_ExecuteMenu
                cmpi.w  #$FFFF,d0
                beq.w   loc_22014
                add.w   d0,d0
                move.w  rjt_CaravanActions(pc,d0.w),d0
                jsr     rjt_CaravanActions(pc,d0.w)
                bra.s   loc_21FE8
rjt_CaravanActions:
                
                dc.w sub_22028-rjt_CaravanActions
                dc.w CaravanDepotActions-rjt_CaravanActions
                dc.w CaravanItemMenuActions-rjt_CaravanActions
                dc.w sub_22102-rjt_CaravanActions
loc_22014:
                
                moveq   #0,d0
                moveq   #0,d1
                move.w  #$A,d1
                bsr.w   ChooseCaravanPortrait
                unlk    a6
                movem.l (sp)+,d0-a5
                rts

    ; End of function CaravanMenuActions


; =============== S U B R O U T I N E =======================================


sub_22028:
                
                moveq   #2,d1
                bsr.w   sub_228D8
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                beq.w   loc_220F4
                move.w  #$F,d1
                bsr.w   ChooseCaravanPortrait
                jsr     j_InitMemberListScreen
                move.w  d0,var_2(a6)
                cmpi.w  #$FFFF,d0
                beq.w   byte_220E8      
                jsr     j_GetCurrentHP
                tst.w   d1
                bne.s   loc_22070
                move.w  var_2(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     19              ; "{NAME} is dead.{N}Are you sure?"
                jsr     j_YesNoChoiceBox
                tst.w   d0
                bne.w   loc_220FE
loc_22070:
                
                moveq   #1,d1
                bsr.w   sub_228D8
                cmpi.w  #$C,((GENERIC_LIST_LENGTH-$1000000)).w
                bcc.s   loc_22098
                move.w  var_2(a6),d0
                jsr     j_JoinBattleParty
                move.w  var_2(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #$15,d1
                bsr.w   ChooseCaravanPortrait
                bra.s   loc_220E6
loc_22098:
                
                move.w  #$17,d1
                bsr.w   ChooseCaravanPortrait
                jsr     j_InitMemberListScreen
                cmpi.w  #$FFFF,d0
                beq.s   byte_220DE      
                tst.w   d0
                beq.s   loc_220D4
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                jsr     j_LeaveBattleParty
                move.w  var_2(a6),d0
                jsr     j_JoinBattleParty
                move.w  var_2(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  #$11,d1
                bsr.w   ChooseCaravanPortrait
                bra.s   loc_220DC
loc_220D4:
                
                move.w  #$14,d1
                bsr.w   ChooseCaravanPortrait
loc_220DC:
                
                bra.s   loc_220E6
byte_220DE:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
loc_220E6:
                
                bra.s   loc_220F2
byte_220E8:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function sub_22028


; START OF FUNCTION CHUNK FOR sub_22028

loc_220F2:
                
                bra.s   loc_220FE
loc_220F4:
                
                move.w  #$12,d1
                bsr.w   ChooseCaravanPortrait
                rts
loc_220FE:
                
                bra.w   sub_22028

; END OF FUNCTION CHUNK FOR sub_22028


; =============== S U B R O U T I N E =======================================


sub_22102:
                
                moveq   #1,d1
                bsr.w   sub_228D8
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                beq.s   return_22150
                move.w  #$10,d1
                bsr.w   ChooseCaravanPortrait
                jsr     j_InitMemberListScreen
                cmpi.w  #$FFFF,d0
                beq.s   byte_22144      
                tst.w   d0
                beq.s   loc_2213A
                jsr     j_LeaveBattleParty
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #$16,d1
                bsr.w   ChooseCaravanPortrait
                bra.s   loc_22142
loc_2213A:
                
                move.w  #$14,d1
                bsr.w   ChooseCaravanPortrait
loc_22142:
                
                bra.s   loc_2214E
byte_22144:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function sub_22102


; START OF FUNCTION CHUNK FOR sub_22102

loc_2214E:
                
                bra.s   loc_22152
return_22150:
                
                rts
loc_22152:
                
                bra.s   sub_22102

; END OF FUNCTION CHUNK FOR sub_22102


; =============== S U B R O U T I N E =======================================


CaravanDepotActions:
                
                moveq   #0,d1
                bra.w   loc_2215C
loc_2215A:
                
                moveq   #$FFFFFFFF,d1
loc_2215C:
                
                moveq   #0,d0
                moveq   #MENU_DEPOT,d2
                lea     (InitStack).w,a0
                jsr     j_ExecuteMenu
                cmpi.w  #$FFFF,d0
                beq.w   return_22186
                add.w   d0,d0
                move.w  rjt_CaravanItemActions(pc,d0.w),d0
                jsr     rjt_CaravanItemActions(pc,d0.w)
                bra.s   loc_2215A
rjt_CaravanItemActions:
                
                dc.w Caravan_DescribeItem-rjt_CaravanItemActions
                dc.w Caravan_StoreItem-rjt_CaravanItemActions
                dc.w Caravan_PassItem-rjt_CaravanItemActions
                dc.w Caravan_DiscardItem-rjt_CaravanItemActions
return_22186:
                
                rts

    ; End of function CaravanDepotActions


; =============== S U B R O U T I N E =======================================


Caravan_DescribeItem:
                
                bsr.w   CopyCaravanItems
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                beq.w   loc_222EC       
                move.w  #MESSAGE_CARAVAN_APPRAISE_WHICH_ITEM,d1 ; "Appraise which item?{W2}"
                bsr.w   ChooseCaravanPortrait
                jsr     j_CreateShopInventoryScreen
                move.w  d0,d2
                move.w  d1,var_6(a6)
                move.w  d2,var_4(a6)
                cmpi.w  #$FFFF,d0
                beq.w   byte_222E0      
                chkFlg  70              ; Astral is a follower
                bne.s   loc_221BE
                moveq   #PORTRAIT_ROHDE,d0
                bra.s   loc_221C0
loc_221BE:
                
                moveq   #PORTRAIT_ASTRAL,d0
loc_221C0:
                
                moveq   #0,d1
                jsr     j_InitPortraitWindow
                move.w  var_4(a6),d1
                bsr.w   DisplaySpecialCaravanDescription
                bne.w   loc_222A8
                move.w  var_4(a6),d1
                jsr     j_GetEquipmentType
                tst.w   d2
                bne.s   loc_221E8
                txt     92              ; "It's a tool.{W2}"
                bra.s   loc_221F8
loc_221E8:
                
                cmpi.w  #1,d2
                bne.s   byte_221F4      
                txt     90              ; "It's a weapon.{W2}"
                bra.s   loc_221F8
byte_221F4:
                
                txt     91              ; "It's a ring.{W2}"
loc_221F8:
                
                move.w  var_4(a6),d1
                jsr     j_GetItemDefAddress
                cmpi.b  #SPELL_NOTHING,ITEMDEF_OFFSET_USE_SPELL(a0)
                beq.s   byte_22210      
                txt     93              ; "It has a special effect when{N}used in battle.{W2}"
                bra.s   loc_22214
byte_22210:
                
                txt     94              ; "It has no effect in battle.{W2}"
loc_22214:
                
                move.w  var_4(a6),d1
                jsr     j_GetEquipmentType
                tst.w   d2
                beq.w   loc_222A8
                cmpi.w  #ITEM_POWER_RING,d1
                beq.w   byte_222A4      
                cmpi.w  #ITEM_PROTECT_RING,d1
                beq.w   byte_222A4      
                cmpi.w  #ITEM_QUICK_RING,d1
                beq.w   byte_222A4      
                cmpi.w  #ITEM_RUNNING_RING,d1
                beq.w   byte_222A4      
                move.w  var_4(a6),d1
                move.w  d1,((TEXT_NAME_INDEX_1-$1000000)).w
                txt     96              ; "The {ITEM} is for{N}"
                jsr     j_UpdateForce
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   loc_222A8
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.w   d6
loc_22266:
                
                move.b  (a0)+,d0
                jsr     j_IsWeaponOrRingEquippable
                bcc.s   loc_2228E
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w ; argument (character index) for trap #5 using a {NAME} command
                txt     98              ; "{DICT}{NAME},"
                addq.w  #1,d6
                cmpi.w  #1,d6
                bne.s   loc_22284
                txt     99              ; "{N}"
loc_22284:
                
                cmpi.w  #4,d6
                bne.s   loc_2228E
                txt     99              ; "{N}"
loc_2228E:
                
                dbf     d7,loc_22266
                tst.w   d6
                bne.s   byte_2229C      
                txt     97              ; "nobody so far.{W2}"
                bra.s   loc_222A0
byte_2229C:
                
                txt     100             ; "to equip.{W2}"
loc_222A0:
                
                bra.w   loc_222A8
byte_222A4:
                
                txt     95              ; "Everybody can equip it.{W2}"
loc_222A8:
                
                move.w  var_4(a6),d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_UNSELLABLE,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   loc_222C0
                txt     102             ; "You can't sell it at a shop.{W2}"
                bra.s   byte_222D4
loc_222C0:
                
                clr.l   d1
                move.w  ITEMDEF_OFFSET_PRICE(a0),d1
                mulu.w  #ITEMSELLPRICE_MULTIPLIER,d1
                lsr.l   #ITEMSELLPRICE_BITSHIFTRIGHT,d1
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     101             ; "It brings {#} gold coins{N}at a shop.{W2}"
byte_222D4:
                
                clsTxt
                jsr     j_HidePortraitWindow
                bra.s   loc_222EA
byte_222E0:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function Caravan_DescribeItem


; START OF FUNCTION CHUNK FOR Caravan_DescribeItem

loc_222EA:
                
                bra.s   loc_222F6
loc_222EC:
                
                move.w  #MESSAGE_CARAVAN_WELL_THE_STOREHOUSE_IS_EMPTY,d1 
                                                        ; "Well, the storehouse is{N}empty.{W2}"
                bsr.w   ChooseCaravanPortrait
                rts
loc_222F6:
                
                bra.w   Caravan_DescribeItem

; END OF FUNCTION CHUNK FOR Caravan_DescribeItem


; =============== S U B R O U T I N E =======================================


Caravan_StoreItem:
                
                bsr.w   CopyCaravanItems
                cmpi.w  #CARAVAN_MAX_ITEMS_NUMBER,((GENERIC_LIST_LENGTH-$1000000)).w
                bcc.s   loc_22376       
                moveq   #0,d1
                bsr.w   sub_228D8
                move.w  #MESSAGE_CARAVAN_STORE_WHOSE_ITEM,d1 ; "Store whose item?{W2}"
                bsr.w   ChooseCaravanPortrait
                move.b  #1,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     sub_10044
                move.w  d0,var_2(a6)
                move.w  d1,var_6(a6)
                move.w  d2,var_4(a6)
                cmpi.w  #$FFFF,d0
                beq.s   byte_2236A      
                bsr.w   IsItemInSlotEquippedAndCursed
                bcs.w   loc_22380
                move.w  var_4(a6),d1
                jsr     j_AddItemToCaravan
                move.w  var_6(a6),d1
                jsr     j_DropItemBySlot
                move.w  var_2(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  var_4(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  #MESSAGE_CARAVAN_ITEM_IS_NOW_IN_THE_STOREHOUSE,d1 
                                                        ; "{NAME}'s {ITEM}{N}is now in the storehouse.{W2}"
                bsr.w   ChooseCaravanPortrait
                bra.s   loc_22374
byte_2236A:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts
loc_22374:
                
                bra.s   loc_22380
loc_22376:
                
                move.w  #MESSAGE_CARAVAN_SORRY_THERE_IS_NO_ROOM,d1 ; "Sorry, there's no room!{W2}"
                bsr.w   ChooseCaravanPortrait
                rts

    ; End of function Caravan_StoreItem


; START OF FUNCTION CHUNK FOR Caravan_StoreItem

loc_22380:
                
                bra.w   Caravan_StoreItem

; END OF FUNCTION CHUNK FOR Caravan_StoreItem


; =============== S U B R O U T I N E =======================================


Caravan_PassItem:
                
                bsr.w   CopyCaravanItems
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                beq.w   loc_2248A       
                move.w  #MESSAGE_CARAVAN_CHOOSE_WHICH_ITEM,d1 ; "Choose which item?{W2}"
                bsr.w   ChooseCaravanPortrait
                jsr     j_CreateShopInventoryScreen
                move.w  d0,d2
                move.w  d1,var_6(a6)
                move.w  d2,var_4(a6)
                cmpi.w  #$FFFF,d2
                beq.w   byte_2247E      
                moveq   #0,d1
                bsr.w   sub_228D8
                move.w  var_4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #MESSAGE_CARAVAN_PASS_THE_ITEM_TO_WHOM,d1 ; "Pass the {ITEM}{N}to whom?{W2}"
                bsr.w   ChooseCaravanPortrait
                move.b  #2,((byte_FFB13C-$1000000)).w
                move.w  var_4(a6),((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     sub_10044
                move.w  d0,var_8(a6)
                move.w  d1,var_12(a6)
                move.w  d2,var_10(a6)
                cmpi.w  #$FFFF,d0
                beq.w   loc_2247C
                clr.w   d1
                jsr     j_GetItemAndNumberHeld
                cmpi.w  #4,d2
                beq.s   loc_22422
                move.w  var_4(a6),d1
                jsr     j_AddItem
                move.w  var_6(a6),d1
                jsr     j_RemoveItemFromCaravan
                move.w  var_8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  var_4(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  #MESSAGE_CARAVAN_CHARACTER_NOW_HAS_THE_ITEM,d1 
                                                        ; "{NAME} now has the{N}{ITEM}.{W2}"
                bsr.w   ChooseCaravanPortrait
                bra.s   loc_2247C
loc_22422:
                
                move.w  var_8(a6),d1
                move.w  var_12(a6),d1
                bsr.w   IsItemInSlotEquippedAndCursed
                bcs.w   loc_22494
                move.w  var_8(a6),d0
                move.w  var_12(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  var_6(a6),d1
                jsr     j_RemoveItemFromCaravan
                move.w  var_8(a6),d0
                move.w  var_4(a6),d1
                jsr     j_AddItem
                move.w  var_10(a6),d1
                jsr     j_AddItemToCaravan
                move.w  var_4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  var_8(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  var_10(a6),((TEXT_NAME_INDEX_3-$1000000)).w
                move.w  #MESSAGE_ITEMMENU_ITEM_IS_EXCHANGED_FOR,d1 ; "{ITEM} is exchanged{N}for {NAME}'s {ITEM}.{W2}"
                bsr.w   ChooseCaravanPortrait
loc_2247C:
                
                bra.s   loc_22488
byte_2247E:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function Caravan_PassItem


; START OF FUNCTION CHUNK FOR Caravan_PassItem

loc_22488:
                
                bra.s   loc_22494
loc_2248A:
                
                move.w  #MESSAGE_CARAVAN_WELL_THE_STOREHOUSE_IS_EMPTY,d1 
                                                        ; "Well, the storehouse is{N}empty.{W2}"
                bsr.w   ChooseCaravanPortrait
                rts
loc_22494:
                
                bra.w   Caravan_PassItem

; END OF FUNCTION CHUNK FOR Caravan_PassItem


; =============== S U B R O U T I N E =======================================


Caravan_DiscardItem:
                
                bsr.w   CopyCaravanItems
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                beq.w   loc_2252A       
                move.w  #MESSAGE_CARAVAN_DISCARD_WHICH_ITEM,d1 ; "Discard which item?{W2}"
                bsr.w   ChooseCaravanPortrait
                jsr     j_CreateShopInventoryScreen
                move.w  d0,d2
                move.w  d1,var_6(a6)
                move.w  d2,var_4(a6)
                move.w  var_4(a6),d1
                jsr     sub_2299E
                bcs.w   loc_22534
                cmpi.w  #$FFFF,var_4(a6)
                beq.s   byte_2251E      
                move.w  var_4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     44              ; "The {ITEM} will be{N}discarded.  Are you sure?"
                jsr     j_YesNoChoiceBox
                tst.w   d0
                bne.s   byte_22518      
                move.w  var_6(a6),d1
                jsr     j_RemoveItemFromCaravan
                move.w  var_4(a6),d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_RARE,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   loc_22508
                jsr     j_AddItemToDeals
loc_22508:
                
                move.w  var_4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #MESSAGE_ITEMMENU_DISCARDED_THE_ITEM,d1 ; "Discarded the {ITEM}.{W2}"
                bsr.w   ChooseCaravanPortrait
                bra.s   loc_2251C
byte_22518:
                
                txt     4               ; "Did you change your mind?{W2}"
loc_2251C:
                
                bra.s   loc_22528
byte_2251E:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function Caravan_DiscardItem


; START OF FUNCTION CHUNK FOR Caravan_DiscardItem

loc_22528:
                
                bra.s   loc_22534
loc_2252A:
                
                move.w  #MESSAGE_CARAVAN_WELL_THE_STOREHOUSE_IS_EMPTY,d1 
                                                        ; "Well, the storehouse is{N}empty.{W2}"
                bsr.w   ChooseCaravanPortrait
                rts
loc_22534:
                
                bra.w   Caravan_DiscardItem

; END OF FUNCTION CHUNK FOR Caravan_DiscardItem


; =============== S U B R O U T I N E =======================================


CaravanItemMenuActions:
                
                moveq   #0,d1
                bra.w   loc_22540
loc_2253E:
                
                moveq   #$FFFFFFFF,d1
loc_22540:
                
                moveq   #0,d0
                moveq   #MENU_ITEM,d2
                lea     (InitStack).w,a0
                jsr     j_ExecuteMenu
                cmpi.w  #$FFFF,d0
                beq.w   return_2256A
                add.w   d0,d0
                move.w  rjt_CaravanItemMenuActions(pc,d0.w),d0
                jsr     rjt_CaravanItemMenuActions(pc,d0.w)
                bra.s   loc_2253E
rjt_CaravanItemMenuActions:
                
                dc.w sub_2256C-rjt_CaravanItemMenuActions
                dc.w sub_22610-rjt_CaravanItemMenuActions
                dc.w sub_22776-rjt_CaravanItemMenuActions
                dc.w sub_227B0-rjt_CaravanItemMenuActions
return_2256A:
                
                rts

    ; End of function CaravanItemMenuActions


; =============== S U B R O U T I N E =======================================


sub_2256C:
                
                move.w  #$18,d1
                bsr.w   ChooseCaravanPortrait
loc_22574:
                
                moveq   #0,d1
                bsr.w   sub_228D8
                move.b  #1,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     sub_10044
                move.w  d0,var_2(a6)
                move.w  d1,var_6(a6)
                move.w  d2,var_4(a6)
                cmpi.w  #$FFFF,d0
                beq.s   byte_225FA      
                move.w  var_4(a6),d1
                jsr     FindUsableOutsideBattleItem
                tst.w   d2
                bne.s   loc_225EA
                move.w  var_4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #$19,d1
                bsr.w   ChooseCaravanPortrait
                move.b  #0,((byte_FFB13C-$1000000)).w
                jsr     j_InitMemberListScreen
                cmpi.w  #$FFFF,d0
                beq.s   byte_225E4      
                move.w  var_4(a6),d1
                bsr.w   UseFieldItem    
                move.w  var_2(a6),d0
                move.w  var_6(a6),d1
                jsr     j_RemoveItemBySlot
                bra.s   loc_225E8
byte_225E4:
                
                txt     4               ; "Did you change your mind?{W2}"
loc_225E8:
                
                bra.s   loc_225F8
loc_225EA:
                
                move.w  var_4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #$1A,d1
                bsr.w   ChooseCaravanPortrait
loc_225F8:
                
                bra.s   loc_22604
byte_225FA:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function sub_2256C


; START OF FUNCTION CHUNK FOR sub_2256C

loc_22604:
                
                move.w  #$1B,d1
                bsr.w   ChooseCaravanPortrait
                bra.w   loc_22574

; END OF FUNCTION CHUNK FOR sub_2256C


; =============== S U B R O U T I N E =======================================


sub_22610:
                
                move.w  #$1C,d1
                bsr.w   ChooseCaravanPortrait
loc_22618:
                
                moveq   #0,d1
                bsr.w   sub_228D8
                move.b  #1,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     sub_10044
                move.w  d0,var_2(a6)
                move.w  d1,var_6(a6)
                move.w  d2,var_4(a6)
                cmpi.w  #$FFFF,d0
                beq.w   byte_22760      
                bsr.w   IsItemInSlotEquippedAndCursed
                bcs.w   loc_2276A
                move.w  var_4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #$1D,d1
                bsr.w   ChooseCaravanPortrait
                move.b  #2,((byte_FFB13C-$1000000)).w
                move.w  var_4(a6),((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     sub_10044
                move.w  d0,var_8(a6)
                move.w  d1,var_12(a6)
                move.w  d2,var_10(a6)
                cmpi.w  #$FFFF,d0
                beq.w   byte_2275A      
                cmp.w   var_2(a6),d0
                bne.s   loc_226B6
                move.w  var_2(a6),d0
                move.w  var_6(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  var_4(a6),d1
                jsr     j_AddItem
                move.w  var_2(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  var_4(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  #$30,d1 
                bsr.w   ChooseCaravanPortrait
                bra.w   loc_22758
loc_226B6:
                
                moveq   #0,d1
                jsr     j_GetItemAndNumberHeld
                cmpi.w  #4,d2
                beq.s   loc_226F6
                move.w  var_8(a6),d0
                move.w  var_4(a6),d1
                jsr     j_AddItem
                move.w  var_2(a6),d0
                move.w  var_6(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  var_4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  var_8(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  #$28,d1 
                bsr.w   ChooseCaravanPortrait
                bra.s   loc_22758
loc_226F6:
                
                move.w  var_8(a6),d1
                move.w  var_12(a6),d1
                bsr.w   IsItemInSlotEquippedAndCursed
                bcs.w   loc_2276A
                move.w  var_8(a6),d0
                move.w  var_12(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  var_2(a6),d0
                move.w  var_6(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  var_8(a6),d0
                move.w  var_4(a6),d1
                jsr     j_AddItem
                move.w  var_2(a6),d0
                move.w  var_10(a6),d1
                jsr     j_AddItem
                move.w  var_4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  var_8(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  var_10(a6),((TEXT_NAME_INDEX_3-$1000000)).w
                move.w  #$29,d1 
                bsr.w   ChooseCaravanPortrait
loc_22758:
                
                bra.s   loc_2275E
byte_2275A:
                
                txt     4               ; "Did you change your mind?{W2}"
loc_2275E:
                
                bra.s   loc_2276A
byte_22760:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function sub_22610


; START OF FUNCTION CHUNK FOR sub_22610

loc_2276A:
                
                move.w  #$20,d1 
                bsr.w   ChooseCaravanPortrait
                bra.w   loc_22618

; END OF FUNCTION CHUNK FOR sub_22610


; =============== S U B R O U T I N E =======================================


sub_22776:
                
                move.w  #$21,d1 
                bsr.w   ChooseCaravanPortrait
loc_2277E:
                
                moveq   #0,d1
                bsr.w   sub_228D8
                move.b  #3,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     sub_10044
                cmpi.w  #$FFFF,d0
                bne.s   loc_227A6
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function sub_22776


; START OF FUNCTION CHUNK FOR sub_22776

loc_227A6:
                
                move.w  #$23,d1 
                bsr.w   ChooseCaravanPortrait
                bra.s   loc_2277E

; END OF FUNCTION CHUNK FOR sub_22776


; =============== S U B R O U T I N E =======================================


sub_227B0:
                
                move.w  #$24,d1 
                bsr.w   ChooseCaravanPortrait
loc_227B8:
                
                moveq   #0,d1
                bsr.w   sub_228D8
                move.b  #1,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     sub_10044
                move.w  d0,var_2(a6)
                move.w  d1,var_6(a6)
                move.w  d2,var_4(a6)
                cmpi.w  #$FFFF,var_2(a6)
                beq.s   byte_2284E      
                bsr.w   IsItemInSlotEquippedAndCursed
                bcs.w   loc_22858
                move.w  var_4(a6),d1
                jsr     sub_2299E
                bcs.w   loc_22858
                move.w  var_4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     44              ; "The {ITEM} will be{N}discarded.  Are you sure?"
                jsr     j_YesNoChoiceBox
                tst.w   d0
                bne.s   byte_22844      
                move.w  var_2(a6),d0
                move.w  var_6(a6),d1
                jsr     j_DropItemBySlot
                move.w  var_4(a6),d1
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_RARE,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   loc_22834
                jsr     j_AddItemToDeals
loc_22834:
                
                move.w  var_4(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #$2A,d1 
                bsr.w   ChooseCaravanPortrait
                bra.s   loc_2284C
byte_22844:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
loc_2284C:
                
                bra.s   loc_22858
byte_2284E:
                
                txt     4               ; "Did you change your mind?{W2}"
                clsTxt
                rts

    ; End of function sub_227B0


; START OF FUNCTION CHUNK FOR sub_227B0

loc_22858:
                
                move.w  #$26,d1 
                bsr.w   ChooseCaravanPortrait
                bra.w   loc_227B8

; END OF FUNCTION CHUNK FOR sub_227B0


; =============== S U B R O U T I N E =======================================

; only used for chirrup sandals


DisplaySpecialCaravanDescription:
                
                movem.l d0-d1/a0,-(sp)
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                lea     tbl_SpecialCaravanDescriptions(pc), a0
loc_22870:
                
                cmpi.w  #$FFFF,(a0)
                beq.w   loc_2289C
                cmp.b   (a0),d1
                bne.s   loc_22896
                move.b  1(a0),d1
                subq.w  #1,d1
                move.w  2(a0),d0
loc_22886:
                
                jsr     (DisplayText).w 
                addq.w  #1,d0
                dbf     d1,loc_22886
                moveq   #$FFFFFFFF,d0
                bra.w   loc_2289C
loc_22896:
                
                adda.w  #4,a0
                bra.s   loc_22870
loc_2289C:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function DisplaySpecialCaravanDescription

