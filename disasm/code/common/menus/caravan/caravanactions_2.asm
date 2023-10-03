
; ASM FILE code\common\menus\caravan\CaravanMenu_2.asm :
; 0x228D8..0x229CA : Caravan functions

; =============== S U B R O U T I N E =======================================


PopulateGenericListWithMembersList:
                
                movem.l d7-a1,-(sp)
                jsr     j_UpdateForce
                tst.w   d1              ; all members
                bne.s   @CheckMemberGroup
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                bra.s   @PopulateList
@CheckMemberGroup:
                
                cmpi.w  #1,d1
                bne.s   @ReserveMembers
                lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a0
                move.w  ((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w,d7
                bra.s   @PopulateList
@ReserveMembers:
                
                lea     ((RESERVE_MEMBERS-$1000000)).w,a0
                move.w  ((OTHER_PARTY_MEMBERS_NUMBER-$1000000)).w,d7
@PopulateList:
                
                lea     ((GENERIC_LIST-$1000000)).w,a1
                move.w  d7,((GENERIC_LIST_LENGTH-$1000000)).w
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   @SkipLoop
@PopulateList_Loop:
                
                move.b  (a0)+,(a1)+
                dbf     d7,@PopulateList_Loop
@SkipLoop:
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function PopulateGenericListWithMembersList


; =============== S U B R O U T I N E =======================================

; Copy caravan item indexes to generic list space

caravanItemsAddress = CARAVAN_ITEMS
    if (STANDARD_BUILD&FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
caravanItemsAddress = caravanItemsAddress+2
    endif

CopyCaravanItems:
                
                movem.l d7-a1,-(sp)
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                lea     (caravanItemsAddress).l,a0
                movep.w CARAVAN_ITEMS_NUMBER-caravanItemsAddress(a0),d7   ; d7.w = caravan items number
                move.w  d7,((GENERIC_LIST_LENGTH-$1000000)).w
                subq.w  #1,d7
                bcs.s   @Skip
            else
                move.w  ((CARAVAN_ITEMS_NUMBER-$1000000)).w,d7
                move.w  d7,((GENERIC_LIST_LENGTH-$1000000)).w
                subq.w  #1,d7
                bcs.w   @Skip
                lea     ((CARAVAN_ITEMS-$1000000)).w,a0
            endif
                lea     ((GENERIC_LIST-$1000000)).w,a1
@Loop:
                
        if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.b  (a0),(a1)+
                addq.w  #CARAVAN_ITEM_ENTRY_SIZE,a0
        else
            if (STANDARD_BUILD&FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
                addq.w  #1,a0
            endif
                move.b  (a0)+,(a1)+
        endif
                dbf     d7,@Loop
@Skip:
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function CopyCaravanItems


; =============== S U B R O U T I N E =======================================

; Is item in slot d1.w cursed and equipped by combatant d0.b?
; Return CCR carry-bit set if true.


IsItemInSlotEquippedAndCursed:
                
                movem.l d1,-(sp)
                jsr     j_GetItemBySlotAndHeldItemsNumber
                bclr    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   @NotEquipped
                jsr     j_IsItemCursed
                bcc.w   @NotCursed
                sndCom  MUSIC_CURSED_ITEM
                move.w  #60,d0
                jsr     (Sleep).w       
                move.w  d1,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  #30,d1          ; "{LEADER}!  You can't{N}remove the {ITEM}!{N}It's cursed!{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                bsr.w   PlayPreviousMusicAfterCurrentOne
                ori     #1,ccr
@NotCursed:
                
                bra.s   @Done
@NotEquipped:
                
                tst.b   d0
@Done:
                
                movem.l (sp)+,d1
                rts

    ; End of function IsItemInSlotEquippedAndCursed


; =============== S U B R O U T I N E =======================================


PlayPreviousMusicAfterCurrentOne:
                
                move.w  d0,-(sp)
                move.w  #SOUND_COMMAND_PLAY_PREVIOUS_MUSIC,d0
                jsr     (PlayMusicAfterCurrentOne).w
                move.w  (sp)+,d0
                rts

    ; End of function PlayPreviousMusicAfterCurrentOne


; =============== S U B R O U T I N E =======================================

; Is item d1.w unsellable? Return CCR carry-bit set if true.


IsItemUnsellable:
                
                movem.l d1/a0,-(sp)
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_UNSELLABLE,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   @NotUnsellable
                move.w  d1,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  #37,d1          ; "{LEADER}!  You can't{N}discard the {ITEM}!{W2}"
                bsr.w   DisplayCaravanMessageWithPortrait
                ori     #1,ccr
                bra.s   @Done
@NotUnsellable:
                
                tst.b   d0
@Done:
                
                movem.l (sp)+,d1/a0
                rts

    ; End of function IsItemUnsellable

