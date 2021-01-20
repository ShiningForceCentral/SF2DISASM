
; ASM FILE code\common\menus\caravan\caravanactions_2.asm :
; 0x228A8..0x229CA : Caravan functions

; =============== S U B R O U T I N E =======================================


ChooseCaravanPortrait:
                
                movem.l d0-d1,-(sp)
                move.l  d1,-(sp)
                chkFlg  70              ; Astral is a follower
                bne.s   loc_228B8
                moveq   #PORTRAIT_ROHDE,d0 ; HARDCODED portraits
                bra.s   loc_228BA
loc_228B8:
                
                moveq   #PORTRAIT_ASTRAL,d0
loc_228BA:
                
                moveq   #0,d1
                jsr     j_InitPortraitWindow
                move.l  (sp)+,d0
                jsr     (DisplayText).w 
                clsTxt
                jsr     j_HidePortraitWindow
                movem.l (sp)+,d0-d1
                rts

    ; End of function ChooseCaravanPortrait


; =============== S U B R O U T I N E =======================================


sub_228D8:
                
                movem.l d7-a1,-(sp)
                jsr     j_UpdateForce
                tst.w   d1
                bne.s   loc_228F0
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                bra.s   loc_22908
loc_228F0:
                
                cmpi.w  #1,d1
                bne.s   loc_22900
                lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a0
                move.w  ((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w,d7
                bra.s   loc_22908
loc_22900:
                
                lea     ((RESERVE_MEMBERS-$1000000)).w,a0
                move.w  ((OTHER_PARTY_MEMBERS_NUMBER-$1000000)).w,d7
loc_22908:
                
                lea     ((GENERIC_LIST-$1000000)).w,a1
                move.w  d7,((GENERIC_LIST_LENGTH-$1000000)).w
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   loc_22920
loc_2291A:
                
                move.b  (a0)+,(a1)+
                dbf     d7,loc_2291A
loc_22920:
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function sub_228D8


; =============== S U B R O U T I N E =======================================

; Copy caravan item indexes to generic list space


CopyCaravanItems:
                
                movem.l d7-a1,-(sp)
                move.w  ((CARAVAN_ITEMS_NUMBER-$1000000)).w,d7
                move.w  d7,((GENERIC_LIST_LENGTH-$1000000)).w
                subq.w  #1,d7
                bcs.w   loc_22946
                lea     ((CARAVAN_ITEMS-$1000000)).w,a0
                lea     ((GENERIC_LIST-$1000000)).w,a1
loc_22940:
                
                move.b  (a0)+,(a1)+
                dbf     d7,loc_22940
loc_22946:
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function CopyCaravanItems


; =============== S U B R O U T I N E =======================================

; Is character D0's item in slot D1 equipped and cursed ? CCR carry-bit set if true


IsItemInSlotEquippedAndCursed:
                
                movem.l d1,-(sp)
                jsr     j_GetItemAndNumberHeld
                bclr    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   @WasNotEquipped
                jsr     j_IsItemCursed
                bcc.w   @NotCursed
                sndCom  MUSIC_CURSED_ITEM
                move.w  #$3C,d0 
                jsr     (Sleep).w       
                move.w  d1,((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #$1E,d1
                bsr.w   ChooseCaravanPortrait
                bsr.w   PlayPreviousMusicAfterCurrentOne
                ori     #1,ccr
@NotCursed:
                
                bra.s   @Done
@WasNotEquipped:
                
                tst.b   d0
@Done:
                
                movem.l (sp)+,d1
                rts

    ; End of function IsItemInSlotEquippedAndCursed


; =============== S U B R O U T I N E =======================================


PlayPreviousMusicAfterCurrentOne:
                
                move.w  d0,-(sp)
                move.w  #$FB,d0 
                jsr     (PlayMusicAfterCurrentOne).w
                move.w  (sp)+,d0
                rts

    ; End of function PlayPreviousMusicAfterCurrentOne


; =============== S U B R O U T I N E =======================================


sub_2299E:
                
                movem.l d1/a0,-(sp)
                jsr     j_GetItemDefAddress
                btst    #ITEMTYPE_BIT_UNSELLABLE,ITEMDEF_OFFSET_TYPE(a0)
                beq.s   loc_229C2
                move.w  d1,((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #$25,d1 
                bsr.w   ChooseCaravanPortrait
                ori     #1,ccr
                bra.s   loc_229C4
loc_229C2:
                
                tst.b   d0
loc_229C4:
                
                movem.l (sp)+,d1/a0
                rts

    ; End of function sub_2299E

