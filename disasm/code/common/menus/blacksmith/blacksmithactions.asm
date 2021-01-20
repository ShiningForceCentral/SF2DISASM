
; ASM FILE code\common\menus\blacksmith\blacksmithactions.asm :
; 0x21A3A..0x21F62 : Blacksmith functions

; =============== S U B R O U T I N E =======================================

var_22 = -22
var_20 = -20
var_18 = -18
var_16 = -16
var_14 = -14
var_12 = -12
var_10 = -10
var_8 = -8
var_6 = -6
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
                clr.w   var_16(a6)
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

var_22 = -22
var_20 = -20
var_18 = -18
var_16 = -16
var_14 = -14
var_12 = -12
var_10 = -10
var_8 = -8
var_6 = -6
var_4 = -4

sub_21A92:
                
                jsr     j_UpdateForce
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,((GENERIC_LIST_LENGTH-$1000000)).w
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     ((GENERIC_LIST-$1000000)).w,a1
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.b  #1,d7
loc_21AAC:
                
                move.b  (a0)+,(a1)+
                dbf     d7,loc_21AAC
                bsr.w   sub_21E48
                cmpi.w  #1,var_20(a6)
                bne.w   loc_21AE8
                move.w  #4,d7
                subq.w  #1,d7
                lea     ((CURRENT_MITHRIL_WEAPON_INDEX-$1000000)).w,a0
loc_21ACA:
                
                move.w  (a0)+,var_10(a6)
                cmpi.w  #0,var_10(a6)
                beq.s   loc_21AE4
                move.w  d7,var_22(a6)
                addi.w  #1,var_22(a6)
                bsr.w   sub_21B42
loc_21AE4:
                
                dbf     d7,loc_21ACA
loc_21AE8:
                
                cmpi.w  #0,var_18(a6)
                beq.w   loc_21B0E
                move.w  var_18(a6),d0
                add.w   var_14(a6),d0
                sub.w   var_16(a6),d0
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
                sub.w   var_16(a6),d0
                cmpi.w  #4,d0
                beq.w   return_21B40
                txt     196             ; "{CLEAR}Anything else?"
                bra.w   loc_21B3C
byte_21B38:
                
                txt     195             ; "We can create a great and{N}special weapon for you if you{N}have some special material.{W1}"
loc_21B3C:
                
                bsr.w   loc_21CDA
return_21B40:
                
                rts

    ; End of function sub_21A92


; =============== S U B R O U T I N E =======================================

var_22 = -22
var_20 = -20
var_18 = -18
var_16 = -16
var_14 = -14
var_12 = -12
var_10 = -10
var_8 = -8
var_6 = -6
var_4 = -4

sub_21B42:
                
                movem.l d0-a1,-(sp)
                move.w  var_10(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     207             ; "{CLEAR}I've been waiting!{N}This {ITEM} is for{N}you.  Isn't it great?!{W1}"
                txt     166             ; "Who gets it?{W2}"
                clsTxt
byte_21B58:
                
                clsTxt
                move.w  var_10(a6),((SELECTED_ITEM_INDEX-$1000000)).w
                move.b  #0,((byte_FFB13C-$1000000)).w
                jsr     sub_10044
                cmpi.w  #$FFFF,d0
                bne.s   loc_21B7C
                txt     197             ; "{CLEAR}What a pity!{W2}"
                bra.w   loc_21CD4
loc_21B7C:
                
                move.w  d0,var_6(a6)
                moveq   #0,d1
                jsr     j_GetItemAndNumberHeld
                cmpi.w  #4,d2
                bcs.s   loc_21BAC
                move.w  var_6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     208             ; "{NAME}'s hands are are{N}full.  May I pass it to{N}somebody else?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                beq.s   byte_21B58
                txt     197             ; "{CLEAR}What a pity!{W2}"
                bra.w   loc_21CD4
loc_21BAC:
                
                move.w  var_10(a6),d1
                jsr     j_GetEquipmentType
                cmpi.w  #0,d2
                beq.s   loc_21BE4
                move.w  var_10(a6),d1
                move.w  var_6(a6),d0
                jsr     j_IsWeaponOrRingEquippable
                bcs.s   loc_21BE4
                move.w  var_6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     167             ; "{NAME} can't be{N}equipped with it.  OK?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                bne.w   byte_21B58
loc_21BE4:
                
                move.w  var_6(a6),d0
                move.w  var_10(a6),d1
                jsr     j_AddItem
                move.w  #4,d6
                sub.w   var_22(a6),d6
                lea     ((CURRENT_MITHRIL_WEAPON_INDEX-$1000000)).w,a1
                lsl.w   #1,d6
                adda.w  d6,a1
                move.w  (a1),d2
                move.w  #0,(a1)
                addi.w  #1,var_16(a6)
                move.w  var_10(a6),d1
                move.w  var_6(a6),d0
                jsr     j_IsWeaponOrRingEquippable
                bcc.w   byte_21CD0      
                txt     173             ; "{CLEAR}Equip it now?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                bne.w   byte_21CD0      
                move.w  var_10(a6),d1
                jsr     j_GetEquipmentType
                cmpi.w  #1,d2
                bne.s   loc_21C6E
                move.w  var_6(a6),d0
                jsr     j_GetEquippedWeapon
                cmpi.w  #$FFFF,d1
                beq.s   loc_21C9A
                move.w  d2,d1
                jsr     j_UnequipItemBySlotIfNotCursed
                cmpi.w  #2,d2
                bne.w   loc_21C9A
                move.w  var_6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     176             ; "{NAME} can't remove{N}the cursed equipment.{W2}"
                bra.s   byte_21CD0      
loc_21C6E:
                
                move.w  var_6(a6),d0
                jsr     j_GetEquippedRing
                cmpi.w  #$FFFF,d1
                beq.s   loc_21C9A
                move.w  d2,d1
                jsr     j_UnequipItemBySlotIfNotCursed
                cmpi.w  #2,d2
                bne.w   loc_21C9A
                move.w  var_6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
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
                move.w  var_6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
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
loc_21CDA:
                
                movem.l d0-d2,-(sp)
byte_21CDE:
                
                txt     199             ; "What kind of material do you{N}have?{D1}"
                clsTxt
                move.b  #1,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     sub_10044
                cmpi.w  #$FFFF,d0
                beq.w   loc_21E30
                move.w  d0,var_6(a6)
                move.w  d1,var_12(a6)
                move.w  d2,var_10(a6)
                cmpi.w  #$7B,d2 
                beq.w   byte_21D1A      
                txt     200             ; "Sorry, I've never worked{N}with that before....{W1}"
                bra.s   byte_21CDE      
byte_21D1A:
                
                txt     201             ; "{CLEAR}Whose weapon should I{N}make?{D1}"
                clsTxt
                move.b  #0,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((SELECTED_ITEM_INDEX-$1000000)).w
                jsr     sub_10044
                cmpi.w  #$FFFF,d0
                beq.s   byte_21CDE      
                move.w  d0,var_8(a6)
                jsr     j_GetClass
                move.w  d1,-$18(a6)
                cmpi.w  #$C,d1
                bcc.w   loc_21D5C
                move.w  var_8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     211             ; "{NAME} has to be promoted{N}first.{W1}"
                bra.s   byte_21D1A      
loc_21D5C:
                
                bsr.w   sub_21E8E
                cmpi.w  #0,d0
                beq.w   loc_21D74
                move.w  var_8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     212             ; "Sorry, I can't create a{N}weapon for {NAME}.{W1}"
                bra.s   byte_21D1A      
loc_21D74:
                
                move.w  var_8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.l  #$1388,((TEXT_NUMBER-$1000000)).w
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
                cmpi.l  #$1388,d1
                bcc.w   loc_21DC2
                txt     203             ; "You have to bring more{N}money.{W2}"
                bra.w   loc_21E30
loc_21DC2:
                
                move.l  #$1388,d1
                jsr     j_DecreaseGold
                addi.w  #1,var_14(a6)
                move.w  var_6(a6),d0
                move.w  var_12(a6),d1
                jsr     j_DropItemBySlot
                bsr.w   PickMithrilWeapon
                move.w  #$50,d1 
                jsr     j_ClearFlag
                txt     204             ; "{CLEAR}Great!{W2}"
                txt     205             ; "Please stop by shortly.{N}I'll surprise you!{W1}"
                move.w  var_14(a6),d0
                move.w  var_18(a6),d1
                move.w  var_16(a6),d2
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

    ; End of function sub_21B42


; =============== S U B R O U T I N E =======================================


WaitForMusicResumeAndPlayerInput_Blacksmith:
                
                move.w  d0,-(sp)
                move.w  #$FB,d0 
                jsr     (PlayMusicAfterCurrentOne).w
                jsr     (WaitForPlayerInput).w
                move.w  (sp)+,d0
                rts

    ; End of function WaitForMusicResumeAndPlayerInput_Blacksmith


; =============== S U B R O U T I N E =======================================

var_22 = -22
var_20 = -20
var_18 = -18
var_16 = -16
var_14 = -14
var_12 = -12
var_10 = -10
var_8 = -8
var_6 = -6
var_4 = -4

sub_21E48:
                
                move.w  #$50,d1 
                jsr     j_CheckFlag
                beq.w   loc_21E5C
                move.w  #1,var_20(a6)
loc_21E5C:
                
                move.w  #4,d7
                subq.w  #1,d7
                lea     ((CURRENT_MITHRIL_WEAPON_INDEX-$1000000)).w,a0
loc_21E66:
                
                move.w  (a0)+,d1
                cmpi.w  #0,d1
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


sub_21E8E:
                
                movem.l d1-d2/d7-a0,-(sp)
                clr.w   d0
                lea     word_21EB6(pc), a0
                move.w  (a0)+,d7
                subq.w  #1,d7
loc_21E9C:
                
                move.w  (a0)+,d1
                move.w  -$18(a6),d2
                cmp.w   d1,d2
                beq.w   loc_21EB0
                dbf     d7,loc_21E9C
                move.w  #1,d0
loc_21EB0:
                
                movem.l (sp)+,d1-d2/d7-a0
                rts

    ; End of function sub_21E8E

word_21EB6:     dc.w $F
                dc.w $C
                dc.w $D
                dc.w $E
                dc.w $F
                dc.w $10
                dc.w $11
                dc.w $12
                dc.w $13
                dc.w $14
                dc.w $15
                dc.w $16
                dc.w $17
                dc.w $19
                dc.w $1B
                dc.w $1F

; =============== S U B R O U T I N E =======================================


PickMithrilWeapon:
                
                movem.l d0-a0,-(sp)
                clr.w   d0
                lea     tbl_MithrilWeaponClasses(pc), a0
                move.w  #MITHRILWEAPONCLASSES_COUNTER,d7
@FindWeaponClass_Loop:
                
                move.w  (a0)+,d6        ; D6 = number of character classes
                subq.w  #1,d6
@FindCharacterClass_Loop:
                
                move.w  (a0)+,d1        ; D1 = weapon class
                move.w  -$18(a6),d2     ; D2 = character class
                cmp.w   d1,d2
                beq.w   @GetWeaponsEntryAddress ; found character class belonging to weapon class
                dbf     d6,@FindCharacterClass_Loop
                
                addi.w  #1,d0
                dbf     d7,@FindWeaponClass_Loop
                
                ; Randomly determine weapon class for classes BRN and RDBN
                clr.w   d0
                move.w  #2,d6
                jsr     (GenerateRandomNumber).w
                cmpi.w  #0,d7
                bne.w   @GetWeaponsEntryAddress
                move.w  #2,d0
@GetWeaponsEntryAddress:
                
                lsl.w   #3,d0           ; D0 = weapon class index * 8 (weapons entry size)
                lea     tbl_MithrilWeapons(pc), a0
                adda.w  d0,a0
                move.w  #MITHRILWEAPONS_COUNTER,d5
@PickWeapon_Loop:
                
                clr.w   d0
                clr.w   d1
                move.b  (a0)+,d0        ; D0 = parameter
                move.b  (a0)+,d1        ; D1 = item index
                move.w  d0,d6
                jsr     (GenerateRandomNumber).w
                cmpi.w  #0,d7
                beq.w   @LoadIndex
                dbf     d5,@PickWeapon_Loop
@LoadIndex:
                
                lea     ((CURRENT_MITHRIL_WEAPON_INDEX-$1000000)).w,a0
                move.w  #MITHRILWEAPONSLOTS_COUNTER,d7
@LoadIndex_Loop:
                
                cmpi.w  #0,(a0)
                bne.w   @Next           ; check next weapon slot if current one is occupied
                move.w  d1,(a0)
                bra.w   @Done           ; move item index to current weapon slot in RAM, and we're done
@Next:
                
                move.w  #2,d0
                adda.w  d0,a0
                dbf     d7,@LoadIndex_Loop
@Done:
                
                movem.l (sp)+,d0-a0
                rts

    ; End of function PickMithrilWeapon

