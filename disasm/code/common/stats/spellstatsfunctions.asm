
; ASM FILE code\common\stats\spellstatsfunctions.asm :
; 0x91C6..0x928E : Character stats engine, part 2

; =============== S U B R O U T I N E =======================================

; In: D1 = spell index
; 
; Out: A0 = address of name
;      D7 = length of name


FindSpellName:
                
                move.w  d1,-(sp)
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                getPointer p_table_SpellNames, a0
                bsr.w   FindName        
                move.w  (sp)+,d1
                rts

    ; End of function FindSpellName


; =============== S U B R O U T I N E =======================================

; Find pointer to definition entry for spell D1 -> A0


FindSpellDefAddress:
                
                move.l  d0,-(sp)
                getPointer p_table_SpellDefinitions, a0
                getSpellDefsCounter d0
@Loop:
                
                cmp.b   (a0),d1
                beq.s   @Found
                lea     SPELLDEF_ENTRY_SIZE(a0),a0
                dbf     d0,@Loop
                
                ; Default to first entry if not found
                getPointer p_table_SpellDefinitions, a0
@Found:
                
                move.l  (sp)+,d0
                rts

    ; End of function FindSpellDefAddress


; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
;     D1 = spell slot
; 
; Out: D1 = first spell entry
;      D2 = number of spells learned


GetSpellAndNumberOfSpells:
                
                movem.l d0/d3/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   d1,d1
                lea     COMBATANT_OFFSET_SPELLS-1(a0),a0
                move.w  (a0,d1.w),d1
            else
                lea     COMBATANT_OFFSET_SPELLS(a0),a0
                move.b  (a0,d1.w),d1
            endif
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d3
                clr.w   d2
@Loop:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.w  (a0)+,d0
            else
                move.b  (a0)+,d0
            endif
                andi.b  #SPELLENTRY_MASK_INDEX,d0
                cmpi.b  #SPELL_NOTHING,d0
                beq.s   @Nothing
                addq.w  #1,d2
@Nothing:
                
                dbf     d3,@Loop
                movem.l (sp)+,d0/d3/a0
                rts

    ; End of function GetSpellAndNumberOfSpells


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index
;     D1 = spell entry
; 
; Out: D2 = result (0 = success, 1 = failure : same or higher level known, 2 = failure : no room)


LearnSpell:
                
                movem.l d0/d3-d5/a0,-(sp)
                bsr.w   GetCombatantEntryAddress
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                lea     COMBATANT_OFFSET_SPELLS_END-1(a0),a0
            else
                lea     COMBATANT_OFFSET_SPELLS_END(a0),a0
            endif
                move.w  d1,d4
                move.w  d1,d5
                move.w  #1,d2           ; 1 = failure : same or higher level known
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d3
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                lsr.w   #SPELLENTRY_OFFSET_LV,d5
@FindKnownSpell_Loop:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.w  -(a0),d0
            else
                move.b  -(a0),d0        ; loop through spells to see if we already know a lower level
            endif
                andi.b  #SPELLENTRY_MASK_INDEX,d0
                cmp.b   d4,d0
                bne.s   @Next
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.w  (a0),d0
            else
                move.b  (a0),d0
            endif
                lsr.b   #SPELLENTRY_OFFSET_LV,d0
                cmp.b   d0,d5
                bls.s   @Done
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.w  d1,(a0)
            else
                move.b  d1,(a0)         ; replace existing spell with new one (higher level)
            endif
                bra.s   @Success
@Next:
                
                dbf     d3,@FindKnownSpell_Loop
                
                moveq   #COMBATANT_SPELLSLOTS_COUNTER,d3
@FindEmptySlot_Loop:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.w  (a0)+,d0
            else
                move.b  (a0)+,d0        ; loop through spells to find the next empty slot
            endif
                andi.b  #SPELLENTRY_MASK_INDEX,d0
                cmpi.b  #SPELL_NOTHING,d0
                beq.s   @LearnNewSpell
                dbf     d3,@FindEmptySlot_Loop
                
                move.w  #2,d2           ; 2 = failure : no room
                bra.s   @Done
@LearnNewSpell:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.w  d1,-(a0)
            else
                move.b  d1,-(a0)
            endif
@Success:
                
                clr.w   d2              ; 0 = success
@Done:
                
                movem.l (sp)+,d0/d3-d5/a0
                rts

    ; End of function LearnSpell


; =============== S U B R O U T I N E =======================================

; Get spell D1's MP cost -> D1


GetSpellCost:
                
                move.l  a0,-(sp)
                bsr.w   FindSpellDefAddress
                clr.w   d1
                move.b  SPELLDEF_OFFSET_MP_COST(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetSpellCost

