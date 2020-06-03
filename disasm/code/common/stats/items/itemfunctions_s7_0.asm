
; ASM FILE code\common\stats\items\itemfunctions_s7_0.asm :
; 0x4F48A..0x4F6E2 : Unidentified item functions

; =============== S U B R O U T I N E =======================================

GetMandatoryItem:
                
                movem.l d1-d5/a0,-(sp)
                move.w  d0,d4
                move.w  d1,d5
                jsr     j_UpdateForce
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d3
                subq.w  #1,d3
loc_4F4A2:
                
                clr.w   d0
                move.b  (a0)+,d0
                clr.w   d1
                jsr     j_GetItemAndNumberOfItems
                cmpi.w  #4,d2
                bcs.w   loc_4F510
                dbf     d3,loc_4F4A2
                moveq   #1,d0
                tst.w   d5
                beq.w   loc_4F53C
                move.w  d4,(TEXT_NAME_INDEX_1).l
                txt     $D6             ; "Found the {ITEM}, but{N}can't carry it.{N}You must discard something.{W1}"
                clsTxt
                movem.w d4,-(sp)
                bsr.w   DiscardItem
                movem.w (sp)+,d1
                move.w  d0,(TEXT_NAME_INDEX_1).l
                move.w  d2,(TEXT_NAME_INDEX_2).l
                jsr     j_AddItem
                move.w  d1,(TEXT_NAME_INDEX_3).l
                sndCom  MUSIC_ITEM
                txt     $D7             ; "{NAME} discarded{N}the {ITEM} and{N}picked up the {ITEM}."
                jsr     j_FadeOut_WaitForP1Input
                jsr     (WaitForPlayerInput).w
                clsTxt
                moveq   #2,d0
                bra.w   loc_4F53C
loc_4F510:
                
                move.w  d4,d1
                jsr     j_AddItem
                move.w  d0,(TEXT_NAME_INDEX_1).l
                move.w  d1,(TEXT_NAME_INDEX_2).l
                sndCom  MUSIC_ITEM
                txt     $D5             ; "{NAME} received the{N}{ITEM}."
                jsr     j_FadeOut_WaitForP1Input
                jsr     (WaitForPlayerInput).w
                clsTxt
                clr.w   d0
loc_4F53C:
                
                movem.l (sp)+,d1-d5/a0
                rts

    ; End of function GetMandatoryItem


; =============== S U B R O U T I N E =======================================

RemoveItemFromInventory:
                
                movem.w d1-d2,-(sp)
                move.w  d0,d1
                jsr     j_GetItemInventoryLocation
                cmpi.w  #$FFFF,d0
                beq.w   loc_4F56A
                jsr     j_RemoveItemBySlot
                move.w  #$FFFF,d0
                cmpi.w  #3,d2
                beq.w   loc_4F56A
                clr.w   d0
loc_4F56A:
                
                movem.w (sp)+,d1-d2
                rts

    ; End of function RemoveItemFromInventory


; =============== S U B R O U T I N E =======================================

DiscardItem:
                
                movem.l d7-a1,-(sp)
                link    a6,#-$C
                jsr     j_UpdateForce
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                lea     (INDEX_LIST).l,a1
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,(INDEX_LIST_ENTRIES_NUMBER).l
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
                subq.w  #1,d7
loc_4F596:
                
                move.b  (a0)+,(a1)+
                dbf     d7,loc_4F596
loc_4F59C:
                
                move.b  #1,(byte_FFB13C).l
                jsr     sub_10044
                cmpi.w  #$FFFF,d0
                bne.w   loc_4F5B6
                bra.w   loc_4F6CA
loc_4F5B6:
                
                move.w  d0,-2(a6)
                move.w  d1,-6(a6)
                move.w  d2,-4(a6)
                move.w  -4(a6),d1
                jsr     j_GetItemDefAddress
                move.l  ITEMDEF_OFFSET_TYPE(a0),-$A(a6)
                move.b  -$A(a6),d1
                andi.b  #$10,d1
                cmpi.b  #0,d1
                beq.s   loc_4F5F0
                move.w  -4(a6),(TEXT_NAME_INDEX_1).l
                txt     $25             ; "{LEADER}!  You can't{N}discard the {ITEM}!{W2}"
                bra.w   loc_4F6CA
loc_4F5F0:
                
                move.w  -4(a6),(TEXT_NAME_INDEX_1).l
                txt     $2C             ; "The {ITEM} will be{N}discarded.  Are you sure?"
                jsr     j_YesNoChoiceBox
                clsTxt
                cmpi.w  #0,d0
                beq.w   loc_4F610
                bra.s   loc_4F59C
loc_4F610:
                
                move.w  -4(a6),d1
                jsr     j_GetItemType
                cmpi.w  #1,d2
                bne.s   loc_4F65C
                move.w  -2(a6),d0
                jsr     j_GetEquippedWeapon
                cmpi.w  #$FFFF,d1
                beq.w   loc_4F69C
                cmp.w   -6(a6),d2
                bne.w   loc_4F69C
                move.w  -4(a6),d1
                jsr     j_IsItemCursed
                bcc.w   loc_4F69C
                move.w  -4(a6),(TEXT_NAME_INDEX_1).l
                txt     $1E             ; "{LEADER}!  You can't{N}remove the {ITEM}!{N}It's cursed!{W2}"
                clsTxt
                bra.w   loc_4F6CA
loc_4F65C:
                
                cmpi.w  #0,d2
                beq.w   loc_4F69C
                move.w  -2(a6),d0
                jsr     j_GetEquippedRing
                cmpi.w  #$FFFF,d1
                beq.w   loc_4F69C
                cmp.w   -6(a6),d2
                bne.w   loc_4F69C
                move.w  -4(a6),d1
                jsr     j_IsItemCursed
                bcc.w   loc_4F69C
                move.w  -4(a6),(TEXT_NAME_INDEX_1).l
                txt     $1E             ; "{LEADER}!  You can't{N}remove the {ITEM}!{N}It's cursed!{W2}"
                bra.w   loc_4F6CA
loc_4F69C:
                
                move.w  -2(a6),d0
                move.w  -6(a6),d1
                jsr     j_RemoveItemBySlot
                move.w  -4(a6),(TEXT_NAME_INDEX_1).l
                move.b  -$A(a6),d1
                andi.b  #8,d1
                cmpi.b  #0,d1
                beq.s   loc_4F6CE
                move.w  -4(a6),d1
                jsr     j_AddItemToDeals
loc_4F6CA:
                
                bra.w   loc_4F59C
loc_4F6CE:
                
                move.w  -2(a6),d0
                move.w  -6(a6),d1
                move.w  -4(a6),d2
                unlk    a6
                movem.l (sp)+,d7-a1
                rts

    ; End of function DiscardItem

