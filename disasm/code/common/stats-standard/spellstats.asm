
; ASM FILE code\common\stats-standard\spellstats.asm :
; Spell stats management functions

; =============== S U B R O U T I N E =======================================

; Find pointer to definition entry for spell d1.b -> a0


GetSpellDefinitionAddress:
                
                move.l  d0,-(sp)
                getPointer p_table_SpellDefinitions, a0
                getSpellDefsCounter d0
                
@Find_Loop:     cmp.b   (a0),d1
                beq.s   @Found
                lea     SPELLDEF_ENTRY_SIZE(a0),a0
                dbf     d0,@Find_Loop
                
                ; Default to first entry if not found
                getPointer p_table_SpellDefinitions, a0
                
@Found:         move.l  (sp)+,d0
                rts

    ; End of function GetSpellDefinitionAddress


; =============== S U B R O U T I N E =======================================

; Get spell d1.b's MP cost -> d1.w


GetSpellCost:
                
                move.l  a0,-(sp)
                bsr.s   GetSpellDefinitionAddress
                clr.w   d1
                move.b  SPELLDEF_OFFSET_MP_COST(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetSpellCost


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index, d1.w = spell slot
;
; Out: d1.b = first spell entry, d2.w = number of spells learned


GetSpellAndNumberOfSpells:
                
                movem.l d0/d3/a0,-(sp)
                clr.w   d2
                bsr.w   GetCombatantEntryAddress
                
                lea     COMBATANT_OFFSET_SPELLS(a0),a0
                move.l  a0,d3
                addToSavedBytePointer d1, a0
                move.b  (a0),d1
                movea.l d3,a0
                
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d3
@Loop:          getSavedByteWithPostIncrement a0, d0
                andi.b  #SPELLENTRY_MASK_INDEX,d0
                cmpi.b  #SPELL_NOTHING,d0
                beq.s   @Nothing
                
                addq.w  #1,d2
@Nothing:       dbf     d3,@Loop
                
                movem.l (sp)+,d0/d3/a0
                rts

    ; End of function GetSpellAndNumberOfSpells


; =============== S U B R O U T I N E =======================================

; Get ally d0's promoted at level -> d1.w (0 if not promoted)
;
; Out: CCR bit set accordingly to returned value

GetPromotedAtLevel:
                
            if (EXPANDED_SAVED_DATA=1)
                move.w  d0,-(sp)
                andi.w  #BYTE_MASK,d0
                loadSavedDataAddress PROMOTED_AT_LEVELS, a0
                addToSavedBytePointer d0, a0
                clr.w   d1
                move.b  (a0),d1
                movem.w  (sp)+,d0
                rts
            endif

    ; End of function GetPromotedAtLevel


; =============== S U B R O U T I N E =======================================

; Get ally's d0 total level (current level + promoted at level) -> d1.w

CalculateTotalLevel:
                
            if (EXPANDED_SAVED_DATA=1)
                movem.l d0/d2/a0,-(sp)
                clr.w   d2
                bsr.s   GetPromotedAtLevel ; -> d1.w
                beq.s   @Skip
                
                move.w  d1,d2
                bsr.w   GetLevel
                add.w   d2,d1
				subq.w  #1,d1		; This fixes an issue where promotion gave 1 extra level for the purpose of learning spells from the base class spell list
                bra.s   @Done		; Say, if character promotes at level 24 and is set-up to learn a spell at level 25, he must level up to promoted level 2 to learn the level 25 spell
                
                ; Pre-promoted characters are assumed to have been promoted at level 20
				; Note that this case doesn't matter anyway since pre-promoted characters don't have a base class spell list in the first place
@Skip:          bsr.w   CalculateEffectiveLevel
@Done:          movem.l (sp)+,d0/d2/a0
                rts
            endif

    ; End of function CalculateTotalLevel


; =============== S U B R O U T I N E =======================================

; In: d0.w = ally index

; Out: 	a0 = pointer to the first entry of the character spell list,
;			 or to a dummy empty spell list if no data can be found for the character's class

; This is a safe empty spell list in case we don't have a valid pointer to a real spell list...
	dc.b	ALLYSTATS_CODE_END_OF_SPELL_LIST
	dc.b	ALLYSTATS_CODE_END_OF_SPELL_LIST
EMPTY_SPELL_LIST:
	dc.b	ALLYSTATS_CODE_END_OF_SPELL_LIST
	dc.b	ALLYSTATS_CODE_END_OF_SPELL_LIST
	align
	
GetAllySpellListFirstEntry:
                move.w  d3,-(sp)
                bsr.w   GetClass  ; d1 = class index
                
                ; Get pointer to stat block for class d3.b -> a0
                move.w  d0,d2
                move.w  d1,d3
                bsr.w   GetAllyStatsBlockAddress
                tst.w   d3
                bmi.s   @NoData
                
                lea     ALLYSTATS_OFFSET_SPELL_LIST_MINUS_ONE(a0),a0
				bra.s	@Done
@NoData:
                lea     EMPTY_SPELL_LIST(pc),a0		; Should never happen...
				
@Done:          move.w  (sp)+,d3
                rts

    ; End of function GetAllySpellListFirstEntry


; =============== S U B R O U T I N E =======================================

; In: d0.w = ally index

LearnAllKnownSpells:
                
                bsr.w   CalculateEffectiveLevel		; d1 = effective level
                move.w  d1,d5
				
				bsr.s	GetAllySpellListFirstEntry	; a0 = pointer to first spell entry
				
				
@FindAllLearnableSpells_Loop:
                
                bsr.s   FindNextLearnableSpell			; d2 = success status, d1 = learned spell (unused)
                tst.w   d2
                beq.s   @FindAllLearnableSpells_Loop	; Keep learning until FindNextLearnableSpell reports it's over (!= 0)

@Done:          rts

    ; End of function LearnAllKnownSpells


; =============== S U B R O U T I N E =======================================

; In: a0 = pointer to ally spell list entry (will advance as the list is browsed)
;     d0.w = ally index
;     d5.w = current level
;
; Out: 	d1.w: spell learned, valid only if successful (see below)
;		d2.w = 0: successfully learned a spell (a0 now points to the entry after the spell that was successfully learned)
;             -1: end of spell list has been reached without finding a spell that could be successfully learned (a0 is now after the end of the spell list)

                module
@RetryWithFirstSpellList:
                
            if (EXPANDED_SAVED_DATA&LEARN_SPELLS_BASED_ON_TOTAL_LEVEL=1)
                ; Consider promoted at level when learning spells from the first list (i.e., the base class's)
                bsr.s   CalculateTotalLevel
                move.w  d1,d5
            endif
                move.w  d0,d2
                lsl.w   #INDEX_SHIFT_COUNT,d2
                movea.l (p_pt_AllyStats).l,a0
                movea.l (a0,d2.w),a0
                lea     ALLYSTATS_OFFSET_SPELL_LIST(a0),a0
FindNextLearnableSpell:
                
                move.b  (a0)+,d2            ; d2 = level which spell is learned at, or a special value that marks "end of list" / "use first list"
                move.b  (a0)+,d1            ; d1 = spell index
				
                cmpi.b  #ALLYSTATS_CODE_USE_FIRST_SPELL_LIST,d2 ; Have we reached the special entry in the list that tells us to use the first list?
                beq.s   @RetryWithFirstSpellList				; We will attempt to learn a spell again, this time with the first list
				
				cmpi.b	#ALLYSTATS_CODE_END_OF_SPELL_LIST,d2	; Have we reached the special entry in the list that marks the end of the list?
                beq.s   @ReachedEndOfSpellList					; We searched the full list, time to bail out
				
                cmp.b   d2,d5						; Perform comparison of (current level - learn level)
				blo.s   FindNextLearnableSpell		; Too low level to learn the spell (current level < learn level), let's keep going
				
                bsr.s   LearnSpell				; We have an eligible spell we can try to learn, so let's try!
				tst.w   d2						; Does LearnSpell report a success? (= 0)
				beq.s	@Done					; We successfully learned a spell, our job is done, d1 = spell learned
				bra.s   FindNextLearnableSpell	; Otherwise, keep browsing the list (we don't care about the reason the spell failed to be learned, we MUST keep browsing the full list)
@ReachedEndOfSpellList:
                moveq   #-1,d2					; Reached end of spell list, we're done and we report this fact
@Done:
                rts
                
                modend
                
    ; End of function FindNextLearnableSpell


; =============== S U B R O U T I N E =======================================

; In: d0.b = ally index, d1.w = spell entry
;
; Out: d2 = result (0 = success, 1 = failure : same or higher level known, 2 = failure : no room)


LearnSpell:
                
                movem.l d0/d3-d5/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                lea     COMBATANT_OFFSET_SPELLS_END(a0),a0
                move.w  d1,d4
                move.w  d1,d5
                moveq   #1,d2           ; 1 = failure : same or higher level known
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d3
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                lsr.w   #SPELLENTRY_OFFSET_LV,d5
@FindKnownSpell_Loop:
                
                getSavedByteWithPreDecrement a0, d0 ; loop through spells to see if we already know a lower level
                andi.b  #SPELLENTRY_MASK_INDEX,d0
                cmp.b   d4,d0
                bne.s   @Next
                
                move.b  (a0),d0
                lsr.b   #SPELLENTRY_OFFSET_LV,d0
                cmp.b   d0,d5
                bls.s   @Done
                
                move.b  d1,(a0)         ; replace existing spell with new one (higher level)
                bra.s   @Success
                
@Next:          dbf     d3,@FindKnownSpell_Loop
                
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d3
@FindEmptySlot_Loop:
                
                getSavedByteWithPostIncrement a0, d0 ; loop through spells to find the next empty slot
                andi.b  #SPELLENTRY_MASK_INDEX,d0
                cmpi.b  #SPELL_NOTHING,d0
                beq.s   @LearnNewSpell
                dbf     d3,@FindEmptySlot_Loop
                
                moveq   #2,d2           ; 2 = failure : no room
                bra.s   @Done
                
@LearnNewSpell: setSavedByteWithPreDecrement d1, a0
@Success:       clr.w   d2              ; 0 = success
@Done:          movem.l (sp)+,d0/d3-d5/a0
                rts

    ; End of function LearnSpell

