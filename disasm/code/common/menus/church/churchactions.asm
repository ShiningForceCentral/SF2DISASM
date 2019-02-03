
; ASM FILE code\common\menus\church\churchactions.asm :
; 0x20A02..0x2127E : Church functions

; =============== S U B R O U T I N E =======================================

ChurchMenuActions:
                
                movem.l d0-a5,-(sp)
                link    a6,#-$24
                moveq   #0,d1
                move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
                blt.s   byte_20A18      
                jsr     j_InitPortraitWindow
byte_20A18:
                
                txt     $6E             ; "Welcome!{W2}{N}Your desire will be fulfilled!{W2}"
                clsTxt
                jsr     j_HidePortraitWindow
loc_20A26:
                
                moveq   #0,d0
                moveq   #0,d1
                moveq   #5,d2
                lea     (InitStack).w,a0
                jsr     j_ExecuteMenu
                cmpi.w  #$FFFF,d0
                beq.s   loc_20A40
                bra.w   loc_20A64
loc_20A40:
                
                moveq   #0,d1
                move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
                blt.s   byte_20A4E      
                jsr     j_InitPortraitWindow
byte_20A4E:
                
                txt     $71             ; "{CLEAR}Be careful.  The light{N}is always on your side.{W1}"
                clsTxt
                jsr     j_HidePortraitWindow
                unlk    a6
                movem.l (sp)+,d0-a5
                rts
loc_20A64:
                
                cmpi.w  #0,d0
                bne.w   loc_20B58
                txt     $76             ; "Let me investigate all{N}of you.{W2}"
                bsr.w   Church_GetCurrentForceMemberInfo
                clr.w   -$E(a6)
loc_20A78:
                
                clr.w   d0
                move.b  (a0)+,d0
                move.w  d0,-$C(a6)
                jsr     j_GetCurrentHP
                tst.w   d1
                bhi.w   loc_20B42
                addi.w  #1,-$E(a6)
                move.w  d0,((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $81             ; "Gosh!  {NAME} is{N}exhausted!{W2}"
                jsr     j_GetCurrentLevel
                mulu.w  #$A,d1
                move.l  d1,-8(a6)
                jsr     j_GetClass      
                move.w  #0,d2
                bsr.w   sub_210D0
                cmpi.w  #0,-$24(a6)
                beq.w   loc_20AC8
                addi.l  #$C8,-8(a6) 
loc_20AC8:
                
                move.l  -8(a6),((TEXT_NUMBER-$1000000)).w
                txt     $82             ; "But I can recall the soul.{W2}{N}It will cost {#} gold{N}coins.  OK?"
                jsr     sub_10050
                jsr     j_YesNoChoiceBox
                jsr     sub_10058
                cmpi.w  #0,d0
                beq.w   loc_20AF4
                txt     $7C             ; "You don't need my help?{W2}"
                bra.w   loc_20B42
loc_20AF4:
                
                jsr     j_GetGold
                move.l  d1,-4(a6)
                move.l  -8(a6),d0
                cmp.l   d0,d1
                bcc.s   loc_20B0C
                txt     $7D             ; "You can't afford it?!{N}What a pity....{W2}"
                bra.s   loc_20B42
loc_20B0C:
                
                moveq   #0,d1
                move.l  -8(a6),d1
                jsr     j_DecreaseGold
                move.w  -$C(a6),d0
                move.w  #$C8,d1 
                jsr     j_IncreaseCurrentHP
                sndCom  MUSIC_REVIVE
                jsr     WaitForMusicResumeAndPlayerInput(pc)
                nop
                move.w  -$C(a6),d0
                bsr.w   sub_2124A
                move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $83             ; "{NAME} is revived!{W2}"
loc_20B42:
                
                dbf     d7,loc_20A78
                cmpi.w  #0,-$E(a6)
                bne.w   byte_21028
                txt     $80             ; "Nobody is dead.{W2}"
                bra.w   byte_21028
loc_20B58:
                
                cmpi.w  #1,d0
                bne.w   loc_20D3A
                txt     $76             ; "Let me investigate all{N}of you.{W2}"
                bsr.w   Church_GetCurrentForceMemberInfo
                clr.w   -$10(a6)
                clr.w   -$12(a6)
                clr.w   -$18(a6)
loc_20B74:
                
                clr.w   d0
                move.b  (a0)+,d0
                movem.l a0,-(sp)
                move.w  d0,-$C(a6)
                jsr     j_GetCharEntryAddress
                lea     $2C(a0),a0
                move.w  (a0),d2
                move.w  d2,d3
                andi.w  #2,d3
                beq.w   loc_20C24
                addi.w  #1,-$10(a6)
                move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $79             ; "Gosh!  {NAME} is{N}poisoned!{W2}"
                move.l  #$A,-8(a6)
                move.l  -8(a6),((TEXT_NUMBER-$1000000)).w
                txt     $7B             ; "But I can treat you.{N}It will cost {#} gold{N}coins.  OK?"
                jsr     sub_10050
                jsr     j_YesNoChoiceBox
                jsr     sub_10058
                cmpi.w  #0,d0
                beq.w   loc_20BDA
                txt     $7C             ; "You don't need my help?{W2}"
                bra.w   loc_20C24
loc_20BDA:
                
                jsr     j_GetGold
                move.l  d1,-4(a6)
                move.l  -8(a6),d0
                cmp.l   d0,d1
                bcc.s   loc_20BF4
                txt     $7D             ; "You can't afford it?!{N}What a pity....{W2}"
                clr.w   d7
                bra.s   loc_20C24
loc_20BF4:
                
                moveq   #0,d1
                move.l  -8(a6),d1
                jsr     j_DecreaseGold
                move.w  -$C(a6),d0
                move.w  d2,d1
                andi.w  #$FFFD,d1
                jsr     j_SetStatus
                sndCom  MUSIC_CURE
                jsr     WaitForMusicResumeAndPlayerInput(pc)
                nop
                move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $7E             ; "{NAME} is no longer{N}poisoned.{W2}"
loc_20C24:
                
                movem.l (sp)+,a0
                dbf     d7,loc_20B74
                cmpi.w  #0,-$10(a6)
                bne.w   loc_20C3A
                txt     $77             ; "Nobody is poisoned.{W2}"
loc_20C3A:
                
                bsr.w   ChurchCure
                bsr.w   Church_GetCurrentForceMemberInfo
loc_20C42:
                
                clr.w   d0
                move.b  (a0)+,d0
                movem.l a0,-(sp)
                move.w  d0,-$C(a6)
                jsr     j_GetCharEntryAddress
                lea     $2C(a0),a0
                move.w  (a0),d2
                andi.w  #4,d2
                beq.w   loc_20D20
                addi.w  #1,-$12(a6)
                move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $7A             ; "Gosh!  {NAME} is{N}cursed!{W2}"
                clr.w   d1
                jsr     j_GetItemAndNumberOfItems
                move.w  d2,-$14(a6)
                move.w  -$14(a6),d6
                subq.b  #1,d6
                clr.l   d3
loc_20C86:
                
                move.w  d6,d1
                jsr     j_GetItemAndNumberOfItems
                jsr     j_IsItemCursed
                bcc.w   loc_20CA8
                jsr     j_GetItemDefAddress
                clr.l   d4
                move.w  6(a0),d4
                lsr.w   #2,d4
                add.l   d4,d3
loc_20CA8:
                
                dbf     d6,loc_20C86
                move.l  d3,-8(a6)
                move.l  -8(a6),((TEXT_NUMBER-$1000000)).w
                txt     $7B             ; "But I can treat you.{N}It will cost {#} gold{N}coins.  OK?"
                jsr     sub_10050
                jsr     j_YesNoChoiceBox
                jsr     sub_10058
                cmpi.w  #0,d0
                beq.w   loc_20CDC
                txt     $7C             ; "You don't need my help?{W2}"
                bra.w   loc_20D20
loc_20CDC:
                
                jsr     j_GetGold
                move.l  d1,-4(a6)
                move.l  -8(a6),d0
                cmp.l   d0,d1
                bcc.s   loc_20CF6
                txt     $7D             ; "You can't afford it?!{N}What a pity....{W2}"
                clr.w   d7
                bra.s   loc_20D20
loc_20CF6:
                
                moveq   #0,d1
                move.l  -8(a6),d1
                jsr     j_DecreaseGold
                move.w  -$C(a6),d0
                jsr     j_UnequipAllItemsIfNotCursed
                sndCom  MUSIC_CURE
                jsr     WaitForMusicResumeAndPlayerInput(pc)
                nop
                move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $7F             ; "{NAME} is no longer{N}cursed.{W2}"
loc_20D20:
                
                movem.l (sp)+,a0
                dbf     d7,loc_20C42
                cmpi.w  #0,-$12(a6)
                bne.w   byte_21028
                txt     $78             ; "Nobody is cursed.{W2}"
                bra.w   byte_21028
loc_20D3A:
                
                cmpi.w  #2,d0
                bne.w   byte_20FCC      
                txt     $76             ; "Let me investigate all{N}of you.{W2}"
                bsr.w   sub_21072
                cmpi.w  #0,-$16(a6)
                bne.w   byte_20D5C      
                txt     $87             ; "{CLEAR}Well, nobody can be{N}promoted now.{W2}"
                bra.w   byte_21028
byte_20D5C:
                
                txt     $88             ; "{CLEAR}Who do you want to{N}promote?{W2}"
                clsTxt
                move.b  #0,((byte_FFB13C-$1000000)).w
                jsr     sub_10040
                cmpi.w  #$FFFF,d0
                bne.w   loc_20D80
                txt     $89             ; "Oh, I'm wrong.{W2}"
                bra.w   byte_21028
loc_20D80:
                
                move.w  d0,-$C(a6)
                jsr     j_GetClass      
                move.w  d1,-$1A(a6)
                move.w  #0,d2
                bsr.w   sub_210D0
                cmpi.w  #0,-$24(a6)
                beq.w   loc_20DAE
                move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $8E             ; "Hmmm...{D1} {NAME} had{N}better remain the current{N}class.{W2}"
                bra.w   loc_20FC8
loc_20DAE:
                
                jsr     j_GetCurrentLevel
                cmpi.w  #$14,d1
                bcc.w   loc_20DCA
                move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $8A             ; "Hmmm...{NAME} needs{N}more experience!{W2}"
                bra.w   loc_20FC8
loc_20DCA:
                
                clr.w   -$1C(a6)
                move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $8B             ; "{NAME} wants to be{N}promoted to the a fighting{N}class, right?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                beq.w   loc_20DEE
                txt     $89             ; "Oh, I'm wrong.{W2}"
                bra.w   loc_20FC8
loc_20DEE:
                
                move.w  -$1A(a6),d1
                move.w  #2,d2
                bsr.w   sub_210D0
                cmpi.w  #0,-$24(a6)
                bne.w   loc_20EEA
                clr.w   -$1E(a6)
                move.w  -$20(a6),d7
                subq.b  #1,d7
                move.w  #4,d2
                bsr.w   FindPromotionSection
                addq.w  #1,a0
loc_20E18:
                
                move.b  (a0)+,-$1E(a6)
                dbf     d7,loc_20E18
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d6
                subq.w  #1,d6
loc_20E2A:
                
                move.b  (a0)+,d0
                clr.w   d1
                jsr     j_GetItemAndNumberOfItems
                cmpi.w  #0,d2
                beq.w   loc_20E56
                move.w  d2,d7
                subq.w  #1,d7
loc_20E40:
                
                move.w  d7,d1
                jsr     j_GetItemAndNumberOfItems
                move.b  d1,d2
                cmp.b   -$1E(a6),d2
                beq.w   loc_20E5E
                dbf     d7,loc_20E40
loc_20E56:
                
                dbf     d6,loc_20E2A
                bra.w   loc_20EEA
loc_20E5E:
                
                move.w  d0,-$12(a6)
                move.w  d7,-$14(a6)
                move.w  d1,-$1E(a6)
                move.w  #3,d2
                bsr.w   FindPromotionSection
                addq.w  #1,a0
                move.w  -$20(a6),d7
                subq.w  #1,d7
                clr.w   d0
loc_20E7C:
                
                move.b  (a0)+,d0
                dbf     d7,loc_20E7C
                move.w  d0,-$1C(a6)
                move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  -$1E(a6),((TEXT_NAME_INDEX_3-$1000000)).w
                move.w  -$1C(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                txt     $8F             ; "{NAME} can be promoted{N}to {CLASS} with the{N}{ITEM}.{W2}"
                txt     $93             ; "OK?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                beq.w   loc_20EB6
                txt     $90             ; "Then"
                bra.w   loc_20EEA
loc_20EB6:
                
                cmpi.w  #CLASSIDX_SORC,-$1C(a6)
                bne.w   loc_20ED8
                move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $91             ; "{NAME} loses all spells{N}that were learned.{N}OK?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                bne.w   loc_20FC8
loc_20ED8:
                
                move.w  -$12(a6),d0
                move.w  -$14(a6),d1
                jsr     j_RemoveItemBySlot
                bra.w   loc_20F30
loc_20EEA:
                
                move.w  #0,d2
                move.w  -$1A(a6),d1
                bsr.w   sub_210D0
                move.w  -$20(a6),d7
                subq.w  #1,d7
                move.w  #1,d2
                bsr.w   FindPromotionSection
                addq.w  #1,a0
                clr.w   d0
loc_20F08:
                
                move.b  (a0)+,d0
                dbf     d7,loc_20F08
                move.w  d0,-$1C(a6)
                move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  -$1C(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                txt     $92             ; "{NAME} can be promoted{N}to {CLASS}.{N}OK?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                bne.w   loc_20FC8
loc_20F30:
                
                move.w  -$1A(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  -$C(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                move.w  -$1C(a6),((TEXT_NAME_INDEX_3-$1000000)).w
                txt     $8C             ; "Now, let me conduct the{N}rite.{D1}  The light blesses...{N}{D1}{CLASS} {NAME}...{W2}{N}with a class of {CLASS}!{W2}"
                move.w  -$C(a6),d0
                move.w  -$1C(a6),d1
                jsr     j_SetClass
                jsr     j_Promote
                cmpi.w  #CLASSIDX_SORC,-$1C(a6)
                bne.s   loc_20F66
                bsr.w   ReplaceSpellsWithSORCDefaults
loc_20F66:
                
                cmpi.w  #CLASSIDX_MMNK,-$1C(a6)
                beq.s   loc_20F7A       
                cmpi.w  #CLASSIDX_NINJ,-$1C(a6)
                beq.s   loc_20F7A       
                bra.w   byte_20F90
loc_20F7A:
                
                move.w  -$C(a6),d0      ; new class uses a different type of weapon, so unequip weapon
                jsr     j_GetEquippedWeapon
                cmpi.w  #$FFFF,d1
                beq.s   byte_20F90
                jsr     j_UnequipWeapon
byte_20F90:
                
                sndCom  MUSIC_PROMOTION
                jsr     WaitForMusicResumeAndPlayerInput(pc)
                nop
                move.w  -$C(a6),d0
                bsr.w   sub_2124A
                move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  -$1C(a6),((TEXT_NAME_INDEX_2-$1000000)).w
                txt     $8D             ; "{NAME} was successfully{N}promoted to {CLASS}.{W2}"
                move.w  -$C(a6),d0
                move.b  #1,d1
                jsr     j_SetLevel
                clr.w   d1
                jsr     j_SetCurrentEXP
loc_20FC8:
                
                bra.w   byte_20D5C      
byte_20FCC:
                
                txt     $72             ; "May I record your adventure{N}now?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                beq.w   loc_20FE6
                txt     $7C             ; "You don't need my help?{W2}"
                bra.w   byte_21028
loc_20FE6:
                
                move.b  ((CURRENT_MAP-$1000000)).w,((EGRESS_MAP_INDEX-$1000000)).w
                move.w  ((SAVE_SLOT_INDEX-$1000000)).w,d0
                setFlg  $18F            ; set after first battle's cutscene OR first save? Checked at witch screens
                                enableSram
                jsr     (SaveGame).w
                disableSram
                sndCom  MUSIC_SAVE
                jsr     WaitForMusicResumeAndPlayerInput(pc)
                nop
                txt     $73             ; "{CLEAR}The light allows you to{N}resume your adventure!{W1}"
                txt     $74             ; "{CLEAR}Will you continue your{N}adventure?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                beq.w   loc_20A40
                txt     $75             ; "{CLEAR}Then, take a rest before{N}you continue.{W1}"
                jsr     (FadeOutToBlack).w
                jmp     (WitchSuspend).w
                bra.w   *+4
byte_21028:
                
                clsTxt
                txt     $70             ; "{CLEAR}Do you have another desire?"
                jsr     j_YesNoChoiceBox
                cmpi.w  #0,d0
                bne.w   loc_20A40
                clsTxt
                bra.w   loc_20A26

	; End of function ChurchMenuActions

Promotions:     incbin "data/stats/allies/promotions.bin"

; =============== S U B R O U T I N E =======================================

sub_21072:
                
                movem.l d7-a1,-(sp)
                jsr     j_UpdateForce
                clr.w   -$16(a6)
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,((word_FFB12E-$1000000)).w
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                lea     ((byte_FFB0AE-$1000000)).w,a1
                subq.b  #1,d7
loc_21094:
                
                clr.w   d0
                move.b  (a0),d0
                jsr     j_GetClass      
                move.w  #0,d2
                bsr.w   sub_210D0
                cmpi.w  #0,-$24(a6)
                bne.w   loc_210C4
                jsr     j_GetCurrentLevel
                cmpi.w  #$14,d1
                bcs.w   loc_210C4
                addi.w  #1,-$16(a6)
loc_210C4:
                
                move.b  (a0)+,(a1)+
                dbf     d7,loc_21094
                movem.l (sp)+,d7-a1
                rts

	; End of function sub_21072


; =============== S U B R O U T I N E =======================================

sub_210D0:
                
                movem.l d7-a0,-(sp)
                clr.w   -$22(a6)
                clr.w   -$20(a6)
                clr.w   -$24(a6)
                bsr.w   FindPromotionSection
                clr.w   d7
                move.b  (a0)+,d7
                move.w  d7,-$22(a6)
                move.w  d7,-$20(a6)
                subq.b  #1,d7
loc_210F2:
                
                cmp.b   (a0)+,d1
                beq.w   loc_21102
                dbf     d7,loc_210F2
                move.w  #1,-$24(a6)
loc_21102:
                
                sub.w   d7,-$20(a6)
                movem.l (sp)+,d7-a0
                rts

	; End of function sub_210D0


; =============== S U B R O U T I N E =======================================

; In: D2 = section type (regpre, regpost, specpre, specpost, specitem)
; Out: A0 = address

FindPromotionSection:
                
                movem.l d0/d6,-(sp)
                lea     Promotions(pc), a0
                move.w  d2,d6
                subq.w  #1,d6
                bcs.w   loc_21126
                clr.w   d0
loc_2111E:
                
                move.b  (a0)+,d0
                adda.w  d0,a0
                dbf     d6,loc_2111E
loc_21126:
                
                movem.l (sp)+,d0/d6
                rts

	; End of function FindPromotionSection


; =============== S U B R O U T I N E =======================================

; In: A6 = church actions stack

ReplaceSpellsWithSORCDefaults:
                
                move.w  -$C(a6),d0
                jsr     j_GetCharEntryAddress
                lea     CHAR_OFFSET_SPELL_0(a0),a0
                move.w  #CHAR_SPELLSLOTS_COUNTER,d7
loc_2113E:
                
                move.b  #SPELLIDX_NOTHING,(a0)+
                dbf     d7,loc_2113E
                move.w  -$C(a6),d0
                move.w  #SPELLIDX_DAO,d1
                jsr     j_LearnSpell
                rts

	; End of function ReplaceSpellsWithSORCDefaults


; =============== S U B R O U T I N E =======================================

Church_GetCurrentForceMemberInfo:
                
                jsr     j_UpdateForce
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,-$A(a6)
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
                subq.b  #1,d7
                rts

	; End of function Church_GetCurrentForceMemberInfo


; =============== S U B R O U T I N E =======================================

ChurchCure:
                
                bsr.s   Church_GetCurrentForceMemberInfo
loc_21170:
                
                clr.w   d0
                move.b  (a0)+,d0
                movem.l a0,-(sp)
                move.w  d0,-$C(a6)
                jsr     j_GetCharEntryAddress
                lea     CHAR_OFFSET_STATUS(a0),a0
                move.w  (a0),d2
                move.w  d2,d3
                andi.w  #1,d3
                beq.w   loc_21220
                addi.w  #1,-$18(a6)
                move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $84             ; "Gosh!  {NAME} is{N}paralyzed.{W2}"
                move.l  #$14,-8(a6)
                move.l  -8(a6),((TEXT_NUMBER-$1000000)).w
                txt     $7B             ; "But I can treat you.{N}It will cost {#} gold{N}coins.  OK?"
                jsr     sub_10050
                jsr     j_YesNoChoiceBox
                jsr     sub_10058
                cmpi.w  #0,d0
                beq.w   loc_211D6
                txt     $7C             ; "You don't need my help?{W2}"
                bra.w   loc_21220
loc_211D6:
                
                jsr     j_GetGold
                move.l  d1,-4(a6)
                move.l  -8(a6),d0
                cmp.l   d0,d1
                bcc.s   loc_211F0
                txt     $7D             ; "You can't afford it?!{N}What a pity....{W2}"
                clr.w   d7
                bra.s   loc_21220
loc_211F0:
                
                moveq   #0,d1
                move.l  -8(a6),d1
                jsr     j_DecreaseGold
                move.w  -$C(a6),d0
                move.w  d2,d1
                andi.w  #$FFFE,d1
                jsr     j_SetStatus
                sndCom  MUSIC_CURE
                jsr     WaitForMusicResumeAndPlayerInput(pc)
                nop
                move.w  -$C(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $85             ; "{NAME} is no longer{N}paralyzed.{W2}"
loc_21220:
                
                movem.l (sp)+,a0
                dbf     d7,loc_21170
                cmpi.w  #0,-$18(a6)
                bne.w   return_21236
                txt     $86             ; "Nobody is paralyzed.{W2}"
return_21236:
                
                rts

	; End of function ChurchCure


; =============== S U B R O U T I N E =======================================

WaitForMusicResumeAndPlayerInput:
                
                move.w  d0,-(sp)
                move.w  #$FB,d0 
                jsr     (PlayMusicAfterCurrentOne).w
                jsr     (WaitForPlayerInput).w
                move.w  (sp)+,d0
                rts

	; End of function WaitForMusicResumeAndPlayerInput


; =============== S U B R O U T I N E =======================================

sub_2124A:
                
                cmpi.b  #$1E,d0
                bhi.s   return_2127C
                movem.l d0-d4/a0,-(sp)
                move.w  d0,d1
                jsr     j_GetForceMemberSpriteIdx
                move.w  d4,d3
                tst.b   d1
                beq.w   loc_2126C
                bsr.w   GetEntityNumberOfCombatant
                tst.b   d0
                ble.s   loc_21278
loc_2126C:
                
                clr.w   d1
                move.b  ((ENTITY_FACING-$1000000)).w,d1
                moveq   #$FFFFFFFF,d2
                jsr     (sub_6052).w    
loc_21278:
                
                movem.l (sp)+,d0-d4/a0
return_2127C:
                
                rts

	; End of function sub_2124A

