
; ASM FILE code\common\menus\church\churchactions_2.asm :
; 0x21072..0x2127E : Church functions

; =============== S U B R O U T I N E =======================================

sub_21072:
                
                movem.l d7-a1,-(sp)
                jsr     j_UpdateForce
                clr.w   -$16(a6)
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d7
                move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,((INDEX_LIST_ENTRIES_NUMBER-$1000000)).w
                lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
                lea     ((INDEX_LIST-$1000000)).w,a1
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

ReplaceSpellsWithSORCdefaults:
                
                move.w  -$C(a6),d0
                jsr     j_GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_SPELLS_START(a0),a0
                move.w  #COMBATANT_SPELLSLOTS_COUNTER,d7
@Loop:
                
                move.b  #SPELL_NOTHING,(a0)+
                dbf     d7,@Loop
                move.w  -$C(a6),d0
                move.w  #SPELL_DAO,d1
                jsr     j_LearnSpell
                rts

    ; End of function ReplaceSpellsWithSORCdefaults


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
                jsr     j_GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_STATUSEFFECTS(a0),a0
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
                
                cmpi.b  #COMBATANT_ALLIES_NUMBER,d0
                bhi.s   return_2127C
                movem.l d0-d4/a0,-(sp)
                move.w  d0,d1
                jsr     j_GetAllyMapSprite
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
                jsr     (UpdateEntityProperties).w
loc_21278:
                
                movem.l (sp)+,d0-d4/a0
return_2127C:
                
                rts

    ; End of function sub_2124A

