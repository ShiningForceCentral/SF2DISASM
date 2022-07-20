
; ASM FILE code\common\menus\blacksmith\blacksmithactions.asm :
; 0x21A3A..0x21EB6 : Blacksmith functions

; =============== S U B R O U T I N E =======================================

characterClass = -24
ordersNumber = -22
var_20 = -20
var_18 = -18
currentOrder = -16
var_14 = -14
itemSlot = -12
currentItem = -10
var_8 = -8
selectedMember = -6
var_4 = -4

BlacksmithActions:
                
                movem.l d0-a5,-(sp)
                link    a6,#-24
                moveq   #0,d1
                move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
                blt.s   byte_21A50      
                jsr     j_InitPortraitWindow
byte_21A50:
                
                txt     194             ; "Welcome to the Dwarf{N}Craftsman!{D3}"
                jsr     j_HidePortraitWindow
                clr.w   var_18(a6)
                clr.w   var_14(a6)
                clr.w   currentOrder(a6)
                clr.w   var_20(a6)
                bsr.w   sub_21A92
                moveq   #0,d1
                move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
                blt.s   byte_21A7C      
                jsr     j_InitPortraitWindow
byte_21A7C:
                
                txt     198             ; "{CLEAR}Thank you very much!{W1}"
                clsTxt
                jsr     j_HidePortraitWindow
                unlk    a6
                movem.l (sp)+,d0-a5
                rts

    ; End of function BlacksmithActions


; =============== S U B R O U T I N E =======================================

characterClass = -24
ordersNumber = -22
var_20 = -20
var_18 = -18
currentOrder = -16
var_14 = -14
itemSlot = -12
currentItem = -10
var_8 = -8
selectedMember = -6
var_4 = -4

sub_21A92:
                
                jsr     j_UpdateForce
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,((GENERIC_LIST_LENGTH-$1000000)).w
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     ((GENERIC_LIST-$1000000)).w,a1
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.b  #1,d7
@CopyForceMembersList_Loop:
                
                move.b  (a0)+,(a1)+
                dbf     d7,@CopyForceMembersList_Loop
                
                bsr.w   sub_21E48
                cmpi.w  #1,var_20(a6)
                bne.w   loc_21AE8
                
                ; Check current mithril weapons list
                move.w  #BLACKSMITH_MAX_ORDERS_NUMBER,d7
                subq.w  #1,d7
                loadSavedDataAddress MITHRIL_WEAPONS_ON_ORDER, a0
loc_21ACA:
                
                if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                    movep.w 0(a0),d0
                    addq.w  #4,a0
                    move.w  d0,currentItem(a6)
                else
                    move.w  (a0)+,currentItem(a6)
                    cmpi.w  #0,currentItem(a6)
                endif
                beq.s   loc_21AE4
                move.w  d7,ordersNumber(a6)
                addi.w  #1,ordersNumber(a6)
                bsr.w   BlacksmithAction_FulfillOrder
loc_21AE4:
                
                dbf     d7,loc_21ACA
loc_21AE8:
                
                cmpi.w  #0,var_18(a6)
                beq.w   loc_21B0E
                move.w  var_18(a6),d0
                add.w   var_14(a6),d0
                sub.w   currentOrder(a6),d0
                cmpi.w  #4,d0
                beq.w   return_21B40
                txt     196             ; "{CLEAR}Anything else?"
                bra.w   loc_21B3C
loc_21B0E:
                
                cmpi.w  #0,var_14(a6)
                beq.w   byte_21B38      
                txt     206             ; "Oops...{N}I needs some more time.{W1}"
                move.w  var_18(a6),d0
                add.w   var_14(a6),d0
                sub.w   currentOrder(a6),d0
                cmpi.w  #4,d0
                beq.w   return_21B40
                txt     196             ; "{CLEAR}Anything else?"
                bra.w   loc_21B3C
byte_21B38:
                
                txt     195             ; "We can create a great and{N}special weapon for you if you{N}have some special material.{W1}"
loc_21B3C:
                
                bsr.w   BlacksmithAction_PlaceOrder
return_21B40:
                
                rts

    ; End of function sub_21A92


; =============== S U B R O U T I N E =======================================

characterClass = -24
ordersNumber = -22
var_20 = -20
var_18 = -18
currentOrder = -16
var_14 = -14
itemSlot = -12
currentItem = -10
var_8 = -8
selectedMember = -6
var_4 = -4

BlacksmithAction_FulfillOrder:
                
                movem.l d0-a1,-(sp)
                move.w  currentItem(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     207             ; "{CLEAR}I've been waiting!{N}This {ITEM} is for{N}you.  Isn't it great?!{W1}"
                txt     166             ; "Who gets it?{W2}"
                clsTxt
byte_21B58:
                
                clsTxt
                move.w  currentItem(a6),((SELECTED_ITEM_INDEX-$1000000)).w
                move.b  #0,((byte_FFB13C-$1000000)).w
                jsr     j_BuildMemberListScreen_NewATTandDEF
                cmpi.w  #$FFFF,d0
                bne.s   loc_21B7C
                txt     197             ; "{CLEAR}What a pity!{W2}"
                bra.w   loc_21CD4
loc_21B7C:
                
                move.w  d0,selectedMember(a6)
                moveq   #0,d1
                jsr     j_GetItemAndNumberHeld
                cmpi.w  #COMBATANT_ITEMSLOTS,d2
                bcs.s   loc_21BAC
                move.w  selectedMember(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     208             ; "{NAME}'s hands are are{N}full.  May I pass it to{N}somebody else?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                beq.s   byte_21B58
                txt     197             ; "{CLEAR}What a pity!{W2}"
                bra.w   loc_21CD4
loc_21BAC:
                
                move.w  currentItem(a6),d1
                jsr     j_GetEquipmentType
                cmpi.w  #EQUIPMENTTYPE_NONE,d2
                beq.s   loc_21BE4
                move.w  currentItem(a6),d1
                move.w  selectedMember(a6),d0
                jsr     j_IsWeaponOrRingEquippable
                bcs.s   loc_21BE4
                move.w  selectedMember(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     167             ; "{NAME} can't be{N}equipped with it.  OK?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                bne.w   byte_21B58
loc_21BE4:
                
                move.w  selectedMember(a6),d0
                move.w  currentItem(a6),d1
                jsr     j_AddItem
                move.w  #BLACKSMITH_MAX_ORDERS_NUMBER,d6
                sub.w   ordersNumber(a6),d6
                loadSavedDataAddress MITHRIL_WEAPONS_ON_ORDER, a1
                if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                    add.w   d6,d6
                    add.w   d6,d6
                    adda.w  d6,a1
                    movep.w 0(a1),d2
                    clr.w   d0
                    movep.w d0,0(a1)
                else
                    lsl.w   #1,d6
                    adda.w  d6,a1
                    move.w  (a1),d2
                    move.w  #0,(a1)
                endif
                addi.w  #1,currentOrder(a6)
                move.w  currentItem(a6),d1
                move.w  selectedMember(a6),d0
                jsr     j_IsWeaponOrRingEquippable
                bcc.w   byte_21CD0      
                txt     173             ; "{CLEAR}Equip it now?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                bne.w   byte_21CD0      
                move.w  currentItem(a6),d1
                jsr     j_GetEquipmentType
                cmpi.w  #EQUIPMENTTYPE_WEAPON,d2
                bne.s   loc_21C6E
                move.w  selectedMember(a6),d0
                jsr     j_GetEquippedWeapon
                cmpi.w  #$FFFF,d1
                beq.s   loc_21C9A
                move.w  d2,d1
                jsr     j_UnequipItemBySlotIfNotCursed
                cmpi.w  #2,d2
                bne.w   loc_21C9A
                move.w  selectedMember(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     176             ; "{NAME} can't remove{N}the cursed equipment.{W2}"
                bra.s   byte_21CD0      
loc_21C6E:
                
                move.w  selectedMember(a6),d0
                jsr     j_GetEquippedRing
                cmpi.w  #$FFFF,d1
                beq.s   loc_21C9A
                move.w  d2,d1
                jsr     j_UnequipItemBySlotIfNotCursed
                cmpi.w  #2,d2
                bne.w   loc_21C9A
                move.w  selectedMember(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     176             ; "{NAME} can't remove{N}the cursed equipment.{W2}"
                bra.s   byte_21CD0      
loc_21C9A:
                
                moveq   #0,d1
                jsr     j_GetItemAndNumberHeld
                move.w  d2,d1
                subq.w  #1,d1
                jsr     j_EquipItemBySlot
                cmpi.w  #2,d2
                bne.s   byte_21CC8      
                sndCom  MUSIC_CURSED_ITEM
                bsr.w   WaitForMusicResumeAndPlayerInput_Blacksmith
                move.w  selectedMember(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     175             ; "Gee, {NAME} gets{N}cursed.{W2}"
                bra.w   loc_21CD4
byte_21CC8:
                
                txt     174             ; "Ah, it suits you!{W2}"
                bra.w   loc_21CD4
byte_21CD0:
                
                txt     209             ; "{CLEAR}Here you go!{N}It's a great weapon!{W2}"
loc_21CD4:
                
                movem.l (sp)+,d0-a1
                rts

    ; End of function BlacksmithAction_FulfillOrder


; =============== S U B R O U T I N E =======================================

characterClass = -24
ordersNumber = -22
var_20 = -20
var_18 = -18
currentOrder = -16
var_14 = -14
itemSlot = -12
currentItem = -10
var_8 = -8
selectedMember = -6
var_4 = -4

BlacksmithAction_PlaceOrder:
                
                movem.l d0-d2,-(sp)
byte_21CDE:
                
                txt     199             ; "What kind of material do you{N}have?{D1}"
                clsTxt
                move.b  #1,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_BuildMemberListScreen_NewATTandDEF
                cmpi.w  #$FFFF,d0
                beq.w   loc_21E30
                move.w  d0,selectedMember(a6)
                move.w  d1,itemSlot(a6)
                move.w  d2,currentItem(a6)
                cmpi.w  #ITEM_MITHRIL,d2
                beq.w   byte_21D1A      
                txt     200             ; "Sorry, I've never worked{N}with that before....{W1}"
                bra.s   byte_21CDE      
byte_21D1A:
                
                txt     201             ; "{CLEAR}Whose weapon should I{N}make?{D1}"
                clsTxt
                move.b  #0,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     j_BuildMemberListScreen_NewATTandDEF
                cmpi.w  #$FFFF,d0
                beq.s   byte_21CDE      
                move.w  d0,var_8(a6)
                jsr     j_GetClass
                move.w  d1,characterClass(a6)
                cmpi.w  #CHAR_CLASS_FIRSTPROMOTED,d1
                bcc.w   loc_21D5C
                move.w  var_8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     211             ; "{NAME} has to be promoted{N}first.{W1}"
                bra.s   byte_21D1A      
loc_21D5C:
                
                bsr.w   IsClassBlacksmithEligible
                cmpi.w  #0,d0
                beq.w   loc_21D74
                move.w  var_8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     212             ; "Sorry, I can't create a{N}weapon for {NAME}.{W1}"
                bra.s   byte_21D1A      
loc_21D74:
                
                move.w  var_8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.l  #BLACKSMITH_ORDER_COST,((TEXT_NUMBER-$1000000)).w
                txt     202             ; "For {NAME}!  It will cost{N}{#} gold coins.  OK?"
                jsr     j_CreateGoldWindow
                jsr     j_YesNoChoiceBox
                jsr     j_HideGoldWindow
                cmpi.w  #0,d0
                beq.s   loc_21DA6
                txt     197             ; "{CLEAR}What a pity!{W2}"
                bra.w   byte_21D1A      
loc_21DA6:
                
                jsr     j_GetGold
                move.l  d1,var_4(a6)
                cmpi.l  #BLACKSMITH_ORDER_COST,d1
                bcc.w   loc_21DC2
                txt     203             ; "You have to bring more{N}money.{W2}"
                bra.w   loc_21E30
loc_21DC2:
                
                move.l  #BLACKSMITH_ORDER_COST,d1
                jsr     j_DecreaseGold
                addi.w  #1,var_14(a6)
                move.w  selectedMember(a6),d0
                move.w  itemSlot(a6),d1
                jsr     j_DropItemBySlot
                bsr.w   PickMithrilWeapon
                move.w  #80,d1
                jsr     j_ClearFlag
                txt     204             ; "{CLEAR}Great!{W2}"
                txt     205             ; "Please stop by shortly.{N}I'll surprise you!{W1}"
                move.w  var_14(a6),d0
                move.w  var_18(a6),d1
                move.w  currentOrder(a6),d2
                add.w   d1,d0
                sub.w   d2,d0
                cmpi.w  #4,d0
                bne.s   byte_21E16      
                txt     210             ; "Sorry, that's all for today.{W1}"
                bra.w   loc_21E30
byte_21E16:
                
                txt     196             ; "{CLEAR}Anything else?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                beq.w   byte_21CDE      
                txt     197             ; "{CLEAR}What a pity!{W2}"
                clsTxt
loc_21E30:
                
                movem.l (sp)+,d0-d2
                rts

    ; End of function BlacksmithAction_PlaceOrder


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

characterClass = -24
ordersNumber = -22
var_20 = -20
var_18 = -18
currentOrder = -16
var_14 = -14
itemSlot = -12
currentItem = -10
var_8 = -8
selectedMember = -6
var_4 = -4

sub_21E48:
                
                move.w  #80,d1
                jsr     j_CheckFlag
                beq.w   loc_21E5C
                move.w  #1,var_20(a6)
loc_21E5C:
                
                if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                    moveq   #BLACKSMITH_ORDERS_COUNTER,d7
                else
                    move.w  #BLACKSMITH_MAX_ORDERS_NUMBER,d7
                    subq.w  #1,d7
                endif
                loadSavedDataAddress MITHRIL_WEAPONS_ON_ORDER, a0
loc_21E66:
                
                if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                    addq.w  #MITHRILWEAPON_SLOT_SIZE,a0
                    movep.w -MITHRILWEAPON_SLOT_SIZE(a0),d1
                else
                    move.w  (a0)+,d1
                    cmpi.w  #0,d1
                endif
                beq.w   loc_21E88
                cmpi.w  #1,var_20(a6)
                bne.s   loc_21E82
                addi.w  #1,var_18(a6)
                bra.w   loc_21E88
loc_21E82:
                
                addi.w  #1,var_14(a6)
loc_21E88:
                
                dbf     d7,loc_21E66
                rts

    ; End of function sub_21E48


; =============== S U B R O U T I N E =======================================

characterClass = -24
ordersNumber = -22
var_20 = -20
var_18 = -18
currentOrder = -16
var_14 = -14
itemSlot = -12
currentItem = -10
var_8 = -8
selectedMember = -6
var_4 = -4

IsClassBlacksmithEligible:
                
                movem.l d1-d2/d7-a0,-(sp)
                clr.w   d0
                lea     tbl_BlacksmithEligibleClassesList(pc), a0
                move.w  (a0)+,d7
                subq.w  #1,d7
loc_21E9C:
                
                move.w  (a0)+,d1
                move.w  characterClass(a6),d2
                cmp.w   d1,d2
                beq.w   loc_21EB0
                dbf     d7,loc_21E9C
                
                move.w  #1,d0
loc_21EB0:
                
                movem.l (sp)+,d1-d2/d7-a0
                rts

    ; End of function IsClassBlacksmithEligible

