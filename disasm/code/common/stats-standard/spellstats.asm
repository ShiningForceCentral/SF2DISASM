
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
                bra.s   @Done
                
                ; Pre-promoted characters are assumed to have been promoted at level 20
@Skip:          bsr.w   CalculateEffectiveLevel
@Done:          movem.l (sp)+,d0/d2/a0
                rts
            endif

    ; End of function CalculateTotalLevel


; =============== S U B R O U T I N E =======================================

; In: d0.w = ally index

LearnAllKnownSpells:
                
                move.w  d3,-(sp)
                bsr.w   CalculateEffectiveLevel
                move.w  d1,d5
                bsr.w   GetClass
                
                ; Get pointer to stat block for class d3.b -> a0
                move.w  d0,d2
                move.w  d1,d3
                bsr.w   GetAllyStatsBlockAddress
                tst.w   d3
                bmi.s   @Done
                
                lea     ALLYSTATS_OFFSET_SPELL_LIST_MINUS_ONE(a0),a0
@FindAllLearnableSpells_Loop:
                
                bsr.s   FindNextLearnableSpell
                tst.w   d2
                bne.s   @Next
                
                moveq   #0,d2
@Next:          bpl.s   @FindAllLearnableSpells_Loop
                
@Done:          move.w  (sp)+,d3
                rts

    ; End of function LearnAllKnownSpells


; =============== S U B R O U T I N E =======================================

; In: a0 = pointer to ally spell list entry
;     d0.w = ally index
;     d5.w = current level
;
; Out: d2.w = 0: successfully learned spell
;             1: failure : same or higher level spell already known
;             2: failure : all spell slots already occupied
;            -1: current level is too low, or end of spell list has been reached

                module
@GetFirstSpellList:
                
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
                
                move.b  (a0)+,d2            ; d2 = level which spell is learned at
                move.b  (a0)+,d1            ; d1 = spell index
                cmp.b   d2,d5
                bhs.s   LearnSpell
                
                cmpi.b  #ALLYSTATS_CODE_USE_FIRST_SPELL_LIST,d2
                beq.s   @GetFirstSpellList
                
                moveq   #-1,d2
                rts
                
                modend
                
    ; End of function FindNextLearnableSpell


; =============== S U B R O U T I N E =======================================

; In: d0.b = ally index, d1.w = spell entry
;
; Out: d2 = result (0 = success, 1 = failure : same or higher level known, -1 = failure : no room)


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
                
                moveq   #-1,d2           ; 2 = failure : no room
                bra.s   @Done
                
@LearnNewSpell: setSavedByteWithPreDecrement d1, a0
@Success:       clr.w   d2              ; 0 = success
@Done:          movem.l (sp)+,d0/d3-d5/a0
                rts

    ; End of function LearnSpell

