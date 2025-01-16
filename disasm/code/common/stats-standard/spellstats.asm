
; ASM FILE code\common\stats-standard\spellstats.asm :
; Spell stats management functions

; =============== S U B R O U T I N E =======================================

; Find pointer to definition entry for spell d1.b -> a0


GetSpellDefAddress:
                
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

    ; End of function GetSpellDefAddress


; =============== S U B R O U T I N E =======================================

; Get spell d1.b's MP cost -> d1.w


GetSpellCost:
                
                move.l  a0,-(sp)
                bsr.s   GetSpellDefAddress
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

; In: d0.w = ally index

LearnAllKnownSpells:
                      
                bsr.w   CalculateEffectiveLevel
                move.w  d1,d5
                bsr.w   GetClass
                
                ; Get pointer to stat block for class d1.b
                move.w  d0,d2
                lsl.w   #INDEX_SHIFT_COUNT,d2
                getPointer p_pt_AllyStats, a0
                movea.l (a0,d2.w),a0
@FindStatsBlockForClass_Loop:
                
                tst.b   (a0)
                bmi.s   @Return         ; exit function if no matching block found
                
                cmp.b   (a0)+,d1
                beq.s   @Continue
@FindNextStatsBlock_Loop:
                
                cmpi.b  #ALLYSTATS_CODE_USE_FIRST_SPELL_LIST,(a0)+ ; loop until we come across an "end of spell list" control code
                bcs.s   @FindNextStatsBlock_Loop
                bra.s   @FindStatsBlockForClass_Loop
@Continue:
                
                lea     ALLYSTATS_OFFSET_SPELL_LIST_MINUS_ONE(a0),a0
@FindAllLearnableSpells_Loop:
                
                bsr.s   FindNextLearnableSpell
                tst.w   d2
                bne.s   @Next
                moveq   #0,d2
@Next:          
                
                bpl.s   @FindAllLearnableSpells_Loop
@Return:
                
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

