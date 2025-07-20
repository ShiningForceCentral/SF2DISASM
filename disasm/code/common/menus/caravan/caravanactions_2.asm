
; ASM FILE code\common\menus\caravan\caravanactions_2.asm :
; 0x228A8..0x229CA : Caravan menu functions

; =============== S U B R O U T I N E =======================================

; In: d1.w = message index


DisplayCaravanMessageWithPortrait:
                
                movem.l d0-d1,-(sp)
                move.l  d1,-(sp)
                chkFlg  70              ; Astral is a follower
                bne.s   @AstralIsPresent
                moveq   #CARAVAN_ROHDE_PORTRAIT,d0 ; HARDCODED portraits
                bra.s   @DeliverLines
@AstralIsPresent:
                
                moveq   #CARAVAN_ASTRAL_PORTRAIT,d0
@DeliverLines:
                
                moveq   #0,d1
                jsr     j_OpenPortraitWindow
                move.l  (sp)+,d0
                jsr     (DisplayText).w 
                clsTxt
                jsr     j_ClosePortraitWindow
                movem.l (sp)+,d0-d1
                rts

    ; End of function DisplayCaravanMessageWithPortrait


; =============== S U B R O U T I N E =======================================


PopulateGenericListWithMembersList:
                
                movem.l d7-a1,-(sp)
                jsr     j_UpdateForce
                tst.w   d1              ; all members
                bne.s   @CheckMemberGroup
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                bra.s   @Continue
@CheckMemberGroup:
                
                cmpi.w  #1,d1
                bne.s   @ReserveMembers
                lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a0
                move.w  ((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w,d7
                bra.s   @Continue
@ReserveMembers:
                
                lea     ((RESERVE_MEMBERS-$1000000)).w,a0
                move.w  ((OTHER_PARTY_MEMBERS_NUMBER-$1000000)).w,d7
@Continue:
                
                lea     ((GENERIC_LIST-$1000000)).w,a1
                move.w  d7,((GENERIC_LIST_LENGTH-$1000000)).w
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   @Skip
@PopulateList_Loop:
                
                move.b  (a0)+,(a1)+
                dbf     d7,@PopulateList_Loop
@Skip:
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function PopulateGenericListWithMembersList


; =============== S U B R O U T I N E =======================================

; Copy caravan item indexes to generic list space


CopyCaravanItems:
                
                movem.l d7-a1,-(sp)
                move.w  ((CARAVAN_ITEMS_NUMBER-$1000000)).w,d7
                move.w  d7,((GENERIC_LIST_LENGTH-$1000000)).w
                subq.w  #1,d7
                bcs.w   @Skip
                
                lea     ((CARAVAN_ITEMS-$1000000)).w,a0
                lea     ((GENERIC_LIST-$1000000)).w,a1
@Loop:
                
                move.b  (a0)+,(a1)+
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
                jsr     j_GetItemDefinitionAddress
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

