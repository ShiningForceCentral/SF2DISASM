
; ASM FILE code\common\menus\blacksmith\blacksmithactions.asm :
; 0x21A3A..0x21F62 : Blacksmith functions

; =============== S U B R O U T I N E =======================================

BlacksmithActions:
                
                movem.l d0-a5,-(sp)
                link    a6,#-$18
                moveq   #0,d1
                move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
                blt.s   byte_21A50      
                jsr     j_InitPortraitWindow
byte_21A50:
                
                txt     $C2             ; "Welcome to the Dwarf{N}Craftsman!{D3}"
                jsr     j_HidePortraitWindow
                clr.w   -$12(a6)
                clr.w   -$E(a6)
                clr.w   -$10(a6)
                clr.w   -$14(a6)
                bsr.w   sub_21A92
                moveq   #0,d1
                move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
                blt.s   byte_21A7C      
                jsr     j_InitPortraitWindow
byte_21A7C:
                
                txt     $C6             ; "{CLEAR}Thank you very much!{W1}"
                clsTxt
                jsr     j_HidePortraitWindow
                unlk    a6
                movem.l (sp)+,d0-a5
                rts

    ; End of function BlacksmithActions


; =============== S U B R O U T I N E =======================================

sub_21A92:
                
                jsr     j_UpdateForce
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,((INDEX_LIST_ENTRIES_NUMBER-$1000000)).w
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                lea     ((INDEX_LIST-$1000000)).w,a1
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
                subq.b  #1,d7
loc_21AAC:
                
                move.b  (a0)+,(a1)+
                dbf     d7,loc_21AAC
                bsr.w   sub_21E48
                cmpi.w  #1,-$14(a6)
                bne.w   loc_21AE8
                move.w  #4,d7
                subq.w  #1,d7
                lea     ((CURRENT_MITHRIL_WEAPON_INDEX-$1000000)).w,a0
loc_21ACA:
                
                move.w  (a0)+,-$A(a6)
                cmpi.w  #0,-$A(a6)
                beq.s   loc_21AE4
                move.w  d7,-$16(a6)
                addi.w  #1,-$16(a6)
                bsr.w   sub_21B42
loc_21AE4:
                
                dbf     d7,loc_21ACA
loc_21AE8:
                
                cmpi.w  #0,-$12(a6)
                beq.w   loc_21B0E
                move.w  -$12(a6),d0
                add.w   -$E(a6),d0
                sub.w   -$10(a6),d0
                cmpi.w  #4,d0
                beq.w   return_21B40
                txt     $C4             ; "{CLEAR}Anything else?"
                bra.w   loc_21B3C
loc_21B0E:
                
                cmpi.w  #0,-$E(a6)
                beq.w   byte_21B38      
                txt     $CE             ; "Oops...{N}I needs some more time.{W1}"
                move.w  -$12(a6),d0
                add.w   -$E(a6),d0
                sub.w   -$10(a6),d0
                cmpi.w  #4,d0
                beq.w   return_21B40
                txt     $C4             ; "{CLEAR}Anything else?"
                bra.w   loc_21B3C
byte_21B38:
                
                txt     $C3             ; "We can create a great and{N}special weapon for you if you{N}have some special material.{W1}"
loc_21B3C:
                
                bsr.w   loc_21CDA
return_21B40:
                
                rts

    ; End of function sub_21A92


; =============== S U B R O U T I N E =======================================

sub_21B42:
                
                movem.l d0-a1,-(sp)
                move.w  -$A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $CF             ; "{CLEAR}I've been waiting!{N}This {ITEM} is for{N}you.  Isn't it great?!{W1}"
                txt     $A6             ; "Who gets it?{W2}"
                clsTxt
byte_21B58:
                
                clsTxt
                move.w  -$A(a6),((word_FFB13A-$1000000)).w
                move.b  #0,((byte_FFB13C-$1000000)).w
                jsr     sub_10044
                cmpi.w  #$FFFF,d0
                bne.s   loc_21B7C
                txt     $C5             ; "{CLEAR}What a pity!{W2}"
                bra.w   loc_21CD4
loc_21B7C:
                
                move.w  d0,-6(a6)
                moveq   #0,d1
                jsr     j_GetItemAndNumberOfItems
                cmpi.w  #4,d2
                bcs.s   loc_21BAC
                move.w  -6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $D0             ; "{NAME}'s hands are are{N}full.  May I pass it to{N}somebody else?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                beq.s   byte_21B58
                txt     $C5             ; "{CLEAR}What a pity!{W2}"
                bra.w   loc_21CD4
loc_21BAC:
                
                move.w  -$A(a6),d1
                jsr     j_GetItemType
                cmpi.w  #0,d2
                beq.s   loc_21BE4
                move.w  -$A(a6),d1
                move.w  -6(a6),d0
                jsr     j_IsWeaponOrRingEquippable
                bcs.s   loc_21BE4
                move.w  -6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $A7             ; "{NAME} can't be{N}equipped with it.  OK?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                bne.w   byte_21B58
loc_21BE4:
                
                move.w  -6(a6),d0
                move.w  -$A(a6),d1
                jsr     j_AddItem
                move.w  #4,d6
                sub.w   -$16(a6),d6
                lea     ((CURRENT_MITHRIL_WEAPON_INDEX-$1000000)).w,a1
                lsl.w   #1,d6
                adda.w  d6,a1
                move.w  (a1),d2
                move.w  #0,(a1)
                addi.w  #1,-$10(a6)
                move.w  -$A(a6),d1
                move.w  -6(a6),d0
                jsr     j_IsWeaponOrRingEquippable
                bcc.w   byte_21CD0      
                txt     $AD             ; "{CLEAR}Equip it now?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                bne.w   byte_21CD0      
                move.w  -$A(a6),d1
                jsr     j_GetItemType
                cmpi.w  #1,d2
                bne.s   loc_21C6E
                move.w  -6(a6),d0
                jsr     j_GetEquippedWeapon
                cmpi.w  #$FFFF,d1
                beq.s   loc_21C9A
                move.w  d2,d1
                jsr     j_UnequipItemIfNotCursed
                cmpi.w  #2,d2
                bne.w   loc_21C9A
                move.w  -6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $B0             ; "{NAME} can't remove{N}the cursed equipment.{W2}"
                bra.s   byte_21CD0      
loc_21C6E:
                
                move.w  -6(a6),d0
                jsr     j_GetEquippedRing
                cmpi.w  #$FFFF,d1
                beq.s   loc_21C9A
                move.w  d2,d1
                jsr     j_UnequipItemIfNotCursed
                cmpi.w  #2,d2
                bne.w   loc_21C9A
                move.w  -6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $B0             ; "{NAME} can't remove{N}the cursed equipment.{W2}"
                bra.s   byte_21CD0      
loc_21C9A:
                
                moveq   #0,d1
                jsr     j_GetItemAndNumberOfItems
                move.w  d2,d1
                subq.w  #1,d1
                jsr     j_EquipItem
                cmpi.w  #2,d2
                bne.s   byte_21CC8      
                sndCom  MUSIC_CURSED_ITEM
                bsr.w   WaitForMusicResumeAndPlayerInput_Blacksmith
                move.w  -6(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $AF             ; "Gee, {NAME} gets{N}cursed.{W2}"
                bra.w   loc_21CD4
byte_21CC8:
                
                txt     $AE             ; "Ah, it suits you!{W2}"
                bra.w   loc_21CD4
byte_21CD0:
                
                txt     $D1             ; "{CLEAR}Here you go!{N}It's a great weapon!{W2}"
loc_21CD4:
                
                movem.l (sp)+,d0-a1
                rts
loc_21CDA:
                
                movem.l d0-d2,-(sp)
byte_21CDE:
                
                txt     $C7             ; "What kind of material do you{N}have?{D1}"
                clsTxt
                move.b  #1,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((word_FFB13A-$1000000)).w
                jsr     sub_10044
                cmpi.w  #$FFFF,d0
                beq.w   loc_21E30
                move.w  d0,-6(a6)
                move.w  d1,-$C(a6)
                move.w  d2,-$A(a6)
                cmpi.w  #$7B,d2 
                beq.w   byte_21D1A      
                txt     $C8             ; "Sorry, I've never worked{N}with that before....{W1}"
                bra.s   byte_21CDE      
byte_21D1A:
                
                txt     $C9             ; "{CLEAR}Whose weapon should I{N}make?{D1}"
                clsTxt
                move.b  #0,((byte_FFB13C-$1000000)).w
                move.w  #ITEM_NOTHING,((word_FFB13A-$1000000)).w
                jsr     sub_10044
                cmpi.w  #$FFFF,d0
                beq.s   byte_21CDE      
                move.w  d0,-8(a6)
                jsr     j_GetClass
                move.w  d1,-$18(a6)
                cmpi.w  #$C,d1
                bcc.w   loc_21D5C
                move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $D3             ; "{NAME} has to be promoted{N}first.{W1}"
                bra.s   byte_21D1A      
loc_21D5C:
                
                bsr.w   sub_21E8E
                cmpi.w  #0,d0
                beq.w   loc_21D74
                move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $D4             ; "Sorry, I can't create a{N}weapon for {NAME}.{W1}"
                bra.s   byte_21D1A      
loc_21D74:
                
                move.w  -8(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.l  #$1388,((TEXT_NUMBER-$1000000)).w
                txt     $CA             ; "For {NAME}!  It will cost{N}{#} gold coins.  OK?"
                jsr     sub_10050
                jsr     j_YesNoChoiceBox
                jsr     sub_10058
                cmpi.w  #0,d0
                beq.s   loc_21DA6
                txt     $C5             ; "{CLEAR}What a pity!{W2}"
                bra.w   byte_21D1A      
loc_21DA6:
                
                jsr     j_GetGold
                move.l  d1,-4(a6)
                cmpi.l  #$1388,d1
                bcc.w   loc_21DC2
                txt     $CB             ; "You have to bring more{N}money.{W2}"
                bra.w   loc_21E30
loc_21DC2:
                
                move.l  #$1388,d1
                jsr     j_DecreaseGold
                addi.w  #1,-$E(a6)
                move.w  -6(a6),d0
                move.w  -$C(a6),d1
                jsr     j_DropItemBySlot
                bsr.w   PickMithrilWeapon
                move.w  #$50,d1 
                jsr     j_ClearFlag
                txt     $CC             ; "{CLEAR}Great!{W2}"
                txt     $CD             ; "Please stop by shortly.{N}I'll surprise you!{W1}"
                move.w  -$E(a6),d0
                move.w  -$12(a6),d1
                move.w  -$10(a6),d2
                add.w   d1,d0
                sub.w   d2,d0
                cmpi.w  #4,d0
                bne.s   byte_21E16      
                txt     $D2             ; "Sorry, that's all for today.{W1}"
                bra.w   loc_21E30
byte_21E16:
                
                txt     $C4             ; "{CLEAR}Anything else?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                beq.w   byte_21CDE      
                txt     $C5             ; "{CLEAR}What a pity!{W2}"
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

sub_21E48:
                
                move.w  #$50,d1 
                jsr     j_CheckFlag
                beq.w   loc_21E5C
                move.w  #1,-$14(a6)
loc_21E5C:
                
                move.w  #4,d7
                subq.w  #1,d7
                lea     ((CURRENT_MITHRIL_WEAPON_INDEX-$1000000)).w,a0
loc_21E66:
                
                move.w  (a0)+,d1
                cmpi.w  #0,d1
                beq.w   loc_21E88
                cmpi.w  #1,-$14(a6)
                bne.s   loc_21E82
                addi.w  #1,-$12(a6)
                bra.w   loc_21E88
loc_21E82:
                
                addi.w  #1,-$E(a6)
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
                lea     MithrilWeaponClassLists(pc), a0
                move.w  #7,d7
loc_21EE4:
                
                move.w  (a0)+,d6
                subq.w  #1,d6
loc_21EE8:
                
                move.w  (a0)+,d1
                move.w  -$18(a6),d2
                cmp.w   d1,d2
                beq.w   loc_21F16
                dbf     d6,loc_21EE8
                addi.w  #1,d0
                dbf     d7,loc_21EE4
                clr.w   d0
                move.w  #2,d6
                jsr     (GenerateRandomNumber).w
                cmpi.w  #0,d7
                bne.w   loc_21F16
                move.w  #2,d0
loc_21F16:
                
                lsl.w   #3,d0
                lea     MithrilWeaponLists(pc), a0
                adda.w  d0,a0
                move.w  #3,d5
loc_21F22:
                
                clr.w   d0
                clr.w   d1
                move.b  (a0)+,d0
                move.b  (a0)+,d1
                move.w  d0,d6
                jsr     (GenerateRandomNumber).w
                cmpi.w  #0,d7
                beq.w   loc_21F3C
                dbf     d5,loc_21F22
loc_21F3C:
                
                lea     ((CURRENT_MITHRIL_WEAPON_INDEX-$1000000)).w,a0
                move.w  #3,d7
loc_21F44:
                
                cmpi.w  #0,(a0)
                bne.w   loc_21F52
                move.w  d1,(a0)
                bra.w   loc_21F5C
loc_21F52:
                
                move.w  #2,d0
                adda.w  d0,a0
                dbf     d7,loc_21F44
loc_21F5C:
                
                movem.l (sp)+,d0-a0
                rts

    ; End of function PickMithrilWeapon

