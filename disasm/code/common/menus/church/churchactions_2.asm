
; ASM FILE code\common\menus\church\ChurchMenu_2.asm :
; 0x21072..0x2127E : Church functions

; =============== S U B R O U T I N E =======================================

cannotPromoteFlag = -36
promotionSectionLength = -34
promotionSectionOffset = -32
promotionItem = -30
newClass = -28
currentClass = -26
stunnedMembersCount = -24
promotableMembersCount = -22
itemsHeldNumber = -20
cursedMembersCount = -18
poisonedMembersCount = -16
deadMembersCount = -14
member = -12
membersListLength = -10
actionCost = -8
currentGold = -4

CountPromotableMembers:
                
                movem.l d7-a1,-(sp)
                jsr     j_UpdateForce
                clr.w   promotableMembersCount(a6)
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,((GENERIC_LIST_LENGTH-$1000000)).w
                lea     ((TARGETS_LIST-$1000000)).w,a0
                lea     ((GENERIC_LIST-$1000000)).w,a1
                subq.b  #1,d7
@Loop:
                
                clr.w   d0
                move.b  (a0),d0
                jsr     j_GetClass
                move.w  #PROMOTIONSECTION_REGULAR_BASE,d2
                bsr.w   GetPromotionData
                cmpi.w  #0,cannotPromoteFlag(a6)
                bne.w   @Next
                jsr     j_GetCurrentLevel
                cmpi.w  #CHURCHMENU_MIN_PROMOTABLE_LEVEL,d1
                bcs.w   @Next
                addi.w  #1,promotableMembersCount(a6)
@Next:
                
                move.b  (a0)+,(a1)+
                dbf     d7,@Loop
                
                movem.l (sp)+,d7-a1
                rts

    ; End of function CountPromotableMembers


; =============== S U B R O U T I N E =======================================

; Get promotion data for class d1.b, given section type d2.w
; 
;       Out: -32(a6) = promotion section offset
;            -34(a6) = promotion section length
;            -36(a6) = cannot promote flag (1 if no matching promotion data found)

cannotPromoteFlag = -36
promotionSectionLength = -34
promotionSectionOffset = -32
promotionItem = -30
newClass = -28
currentClass = -26
stunnedMembersCount = -24
promotableMembersCount = -22
itemsHeldNumber = -20
cursedMembersCount = -18
poisonedMembersCount = -16
deadMembersCount = -14
member = -12
membersListLength = -10
actionCost = -8
currentGold = -4

GetPromotionData:
                
                movem.l d7-a0,-(sp)
                clr.w   promotionSectionLength(a6)
                clr.w   promotionSectionOffset(a6)
                clr.w   cannotPromoteFlag(a6)
                bsr.w   FindPromotionSection
                clr.w   d7
                move.b  (a0)+,d7
                move.w  d7,promotionSectionLength(a6)
                move.w  d7,promotionSectionOffset(a6)
                subq.b  #1,d7
@FindClass_Loop:
                
                cmp.b   (a0)+,d1
                beq.w   @Found
                dbf     d7,@FindClass_Loop
                
                move.w  #1,cannotPromoteFlag(a6)
@Found:
                
                sub.w   d7,promotionSectionOffset(a6)
                movem.l (sp)+,d7-a0
                rts

    ; End of function GetPromotionData


; =============== S U B R O U T I N E =======================================

; In: D2 = section type (regpre, regpost, specpre, specpost, specitem)
; Out: A0 = address


FindPromotionSection:
                
                movem.l d0/d6,-(sp)
                lea     table_Promotions(pc), a0
                move.w  d2,d6
                subq.w  #1,d6
                bcs.w   @Done
                clr.w   d0
@Loop:
                
                move.b  (a0)+,d0
                adda.w  d0,a0
                dbf     d6,@Loop
@Done:
                
                movem.l (sp)+,d0/d6
                rts

    ; End of function FindPromotionSection


; =============== S U B R O U T I N E =======================================

; In: a6 = church actions stack
;     d1.w = replacement spell entry (if STANDARD_BUILD is enabled)

cannotPromoteFlag = -36
promotionSectionLength = -34
promotionSectionOffset = -32
promotionItem = -30
newClass = -28
currentClass = -26
stunnedMembersCount = -24
promotableMembersCount = -22
itemsHeldNumber = -20
cursedMembersCount = -18
poisonedMembersCount = -16
deadMembersCount = -14
member = -12
membersListLength = -10
actionCost = -8
currentGold = -4

ReplaceSpellsWithSorcDefaults:
                
                move.w  member(a6),d0
                jsr     j_GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_SPELLS(a0),a0
                move.w  #COMBATANT_SPELLSLOTS_COUNTER,d7
@Loop:
                
                setSavedByteWithPostIncrement #SPELL_NOTHING, a0
                dbf     d7,@Loop
                
            if (STANDARD_BUILD=1)
                jmp     LearnSpell
            else
                move.w  member(a6),d0
                move.w  #SPELL_DAO,d1
                jsr     j_LearnSpell
                rts
            endif

    ; End of function ReplaceSpellsWithSorcDefaults


; =============== S U B R O U T I N E =======================================

; Out: D7 = force members counter

cannotPromoteFlag = -36
promotionSectionLength = -34
promotionSectionOffset = -32
promotionItem = -30
newClass = -28
currentClass = -26
stunnedMembersCount = -24
promotableMembersCount = -22
itemsHeldNumber = -20
cursedMembersCount = -18
poisonedMembersCount = -16
deadMembersCount = -14
member = -12
membersListLength = -10
actionCost = -8
currentGold = -4

Church_GetCurrentForceMemberInfo:
                
                jsr     j_UpdateForce
                lea     ((TARGETS_LIST-$1000000)).w,a0
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,membersListLength(a6)
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                subq.b  #1,d7
                rts

    ; End of function Church_GetCurrentForceMemberInfo


; =============== S U B R O U T I N E =======================================

cannotPromoteFlag = -36
promotionSectionLength = -34
promotionSectionOffset = -32
promotionItem = -30
newClass = -28
currentClass = -26
stunnedMembersCount = -24
promotableMembersCount = -22
itemsHeldNumber = -20
cursedMembersCount = -18
poisonedMembersCount = -16
deadMembersCount = -14
member = -12
membersListLength = -10
actionCost = -8
currentGold = -4

Church_CureStun:
                
                bsr.s   Church_GetCurrentForceMemberInfo
@Loop:
                
                clr.w   d0
                move.b  (a0)+,d0
                movem.l a0,-(sp)
                move.w  d0,member(a6)
                jsr     j_GetCombatantEntryAddress
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                getSavedWord (a0), d2, COMBATANT_OFFSET_STATUSEFFECTS
            else
                lea     COMBATANT_OFFSET_STATUSEFFECTS(a0),a0
                move.w  (a0),d2
            endif
                move.w  d2,d3
                andi.w  #STATUSEFFECT_STUN,d3
                beq.w   @Next
                addi.w  #1,stunnedMembersCount(a6)
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     132             ; "Gosh!  {NAME} is{N}paralyzed.{W2}"
                
            if (STANDARD_BUILD&PER_LEVEL_CHURCH_COST=1)
                jsr     GetCurrentLevel
                mulu.w  #CHURCHMENU_PER_LEVEL_CURE_STUN_COST,d1
                move.l  d1,actionCost(a6)
                jsr     GetClass
                move.w  #0,d2
                bsr.w   GetPromotionData
                tst.w   cannotPromoteFlag(a6)
                beq.s   @CureParalysis_Unpromoted
                
                move.l  actionCost(a6),d1
                addi.l  #CHURCHMENU_CURE_STUN_COST_EXTRA_WHEN_PROMOTED,d1
                add.l   d1,actionCost(a6)
@CureParalysis_Unpromoted:
            else
                move.l  #CHURCHMENU_CURE_STUN_COST,actionCost(a6)
            endif
                move.l  actionCost(a6),((DIALOGUE_NUMBER-$1000000)).w
                txt     123             ; "But I can treat you.{N}It will cost {#} gold{N}coins.  OK?"
                jsr     j_OpenGoldWindow
                jsr     j_alt_YesNoPrompt
                jsr     j_CloseGoldWindow
                cmpi.w  #0,d0
                beq.w   @CheckGold
                txt     124             ; "You don't need my help?{W2}"
                bra.w   @Next
@CheckGold:
                
                jsr     j_GetGold
                move.l  d1,currentGold(a6)
                move.l  actionCost(a6),d0
                cmp.l   d0,d1
                bcc.s   @DoCureStun
                txt     125             ; "You can't afford it?!{N}What a pity....{W2}"
                clr.w   d7
                bra.s   @Next
@DoCureStun:
                
                moveq   #0,d1
                move.l  actionCost(a6),d1
                jsr     j_DecreaseGold
                move.w  member(a6),d0
                move.w  d2,d1
                andi.w  #STATUSEFFECT_POISON|STATUSEFFECT_CURSE|STATUSEFFECT_MUDDLE2|STATUSEFFECT_MUDDLE|STATUSEFFECT_SLEEP|STATUSEFFECT_SILENCE|STATUSEFFECT_SLOW|STATUSEFFECT_BOOST|STATUSEFFECT_ATTACK,d1
                jsr     j_SetStatusEffects
                sndCom  MUSIC_CURE
                jsr     WaitForMusicResumeAndPlayerInput(pc)
                nop
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     133             ; "{NAME} is no longer{N}paralyzed.{W2}"
@Next:
                
                movem.l (sp)+,a0
                dbf     d7,@Loop
                
                cmpi.w  #0,stunnedMembersCount(a6)
                bne.w   @Return
                txt     134             ; "Nobody is paralyzed.{W2}"
@Return:
                
                rts

    ; End of function Church_CureStun


; =============== S U B R O U T I N E =======================================


WaitForMusicResumeAndPlayerInput:
                
                move.w  d0,-(sp)
                move.w  #SOUND_COMMAND_PLAY_PREVIOUS_MUSIC,d0
                jsr     (PlayMusicAfterCurrentOne).w
                jsr     (WaitForPlayerInput).w
                move.w  (sp)+,d0
                rts

    ; End of function WaitForMusicResumeAndPlayerInput


; =============== S U B R O U T I N E =======================================


UpdateAllyMapsprite:
                
                cmpi.b  #COMBATANT_ALLIES_NUMBER,d0
                bhi.s   @Return
                
                movem.l d0-d4/a0,-(sp)
                move.w  d0,d1
                jsr     j_GetAllyMapsprite
                move.w  d4,d3
                tst.b   d1
                beq.w   @Skip           ; skip getting entity index if player character
                bsr.w   GetEntityIndexForCombatant
                tst.b   d0
                ble.s   @Done
@Skip:
                
                clr.w   d1
                move.b  ((ENTITY_FACING-$1000000)).w,d1
                moveq   #-1,d2
                jsr     (UpdateEntityProperties).w
@Done:
                
                movem.l (sp)+,d0-d4/a0
@Return:
                
                rts

    ; End of function UpdateAllyMapsprite

