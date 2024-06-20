
; ASM FILE code\gameflow\battle\battlefield\useableaiactions-standard.asm :
; Standard reimplementation of actions usable by AI getter functions.

; =============== S U B R O U T I N E =======================================

; Get next attack spell usable by the caster.
;
;       In: d0.w = caster index, d3.w = starting spell slot
;       Out: d1.w = spell index, d2.w = spell slot


GetNextUsableAttackSpell:
                
                movem.l d3-d5/a0,-(sp)
                bsr.w   CheckMuddled2   
                move.w  d1,d5           ; remember whether caster is muddled
                tst.b   d0
                bmi.s   @Loop
                moveq   #1,d5           ; treat ally caster as muddled
                
@Loop:          move.w  d3,d1
                bsr.w   GetSpellAndNumberOfSpells
                move.w  d1,d4                       ; save spell entry
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                cmpi.w  #SPELL_NOTHING,d1
                beq.s   @Next
                
                ; Is spell attack type?
                bsr.w   FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                bne.s   @Next
                
                ; Is caster muddled?
                tst.w   d5
                bne.s   @Break
                
                ; Is spell excluded?
                lea     table_AiExcludedAttackSpells(pc), a0
                clr.w   d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Break
                
@Next:          addq.w  #1,d3
                cmpi.w  #COMBATANT_SPELLSLOTS,d3
                bcs.s   @Loop
                
                move.w  #SPELL_NOTHING,d1           ; checked all slots with no valid spell found
                bra.s   @Done
                
@Break:         exg     d1,d4                       ; exchange spell index d1 and spell entry d4
                bsr.w   GetHighestUsableSpellLevel
                move.w  d3,d2
@Done:          movem.l (sp)+,d3-d5/a0
                rts

    ; End of function GetNextUsableAttackSpell


; =============== S U B R O U T I N E =======================================

; Get next healing spell known by the combatant.
; 
;       In: d0.w = caster index, d3.w = starting spell slot
;       Out: d1.w = spell index, d2.w = spell slot


GetNextHealingSpell:
                
                movem.l d3-d4/a0,-(sp)
                
@Loop:          move.w  d3,d1
                bsr.w   GetSpellAndNumberOfSpells
                move.w  d1,d4
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                cmpi.w  #SPELL_NOTHING,d4
                beq.s   @Next
                
                ; Is spell heal type?
                bsr.w   FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                cmpi.b  #SPELLPROPS_TYPE_HEAL,d2
                beq.s   @Break
                
@Next:          addq.w  #1,d3
                cmpi.w  #COMBATANT_SPELLSLOTS,d3
                bcs.s   @Loop
                
                move.w  #SPELL_NOTHING,d1
                bra.s   @Done
@Break:         move.w  d3,d2
@Done:          movem.l (sp)+,d3-d4/a0
                rts

    ; End of function GetNextHealingSpell


; =============== S U B R O U T I N E =======================================

; Get next support spell known by the combatant.
;
;       In: d0.w = caster index, d3.w = starting spell slot
;       Out: d1.w = spell index, d2.w = spell slot


GetNextSupportSpell:
                
                movem.l d3-d4/a0,-(sp)
                
@Loop:          move.w  d3,d1
                bsr.w   GetSpellAndNumberOfSpells
                move.w  d1,d4
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                cmpi.w  #SPELL_NOTHING,d4
                beq.s   @Next
                
                ; Is spell support type?
                bsr.w   FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                cmpi.b  #SPELLPROPS_TYPE_SUPPORT,d2
                beq.s   @Break
                
@Next:          addq.w  #1,d3
                cmpi.w  #COMBATANT_SPELLSLOTS,d3
                bcs.s   @Loop
                
                move.w  #SPELL_NOTHING,d1
                bra.s   @Done
@Break:         move.w  d3,d2
@Done:          movem.l (sp)+,d3-d4/a0
                rts

    ; End of function GetNextSupportSpell


; =============== S U B R O U T I N E =======================================

; Get the next item in combatant's inventory that can be used to cast
;  BLAZE/FREEZE/BOLT/BLAST. <HARDCODED>
; 
;       In: d0.w = caster index, d3.w = starting spell slot
;       Out: d1.w = spell index, d2.w = spell slot


GetNextUsableAttackItem:
                
                movem.l d3-d5/a0,-(sp)
                bsr.w   CheckMuddled2   
                move.w  d1,d5           ; remember whether caster is muddled
                tst.b   d0
                bmi.s   @Loop
                move.w  #1,d5           ; treat ally caster as muddled
                
@Loop:          move.w  d3,d1
                bsr.w   GetItemBySlotAndHeldItemsNumber
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Next
                
                ; Is item usable?
                bsr.w   IsItemUsableInBattle
                bcc.s   @Next
                
                ; Is AI allowed to use item?
                btst    #ITEMENTRY_BIT_EQUIPPED,d1 ; if not equipped, AI must be set to use the item in battle data
                bne.s   @Continue
                btst    #ITEMENTRY_BIT_USABLE_BY_AI,d1
                beq.s   @Next
                
@Continue:      bsr.w   GetItemDefAddress
                move.w  d1,d4           ; save item entry
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                
@CheckSpellType:
                ; Is spell attack type?
                bsr.w   FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                bne.s   @Next
                
                ; Is caster muddled?
                tst.w   d5
                bne.s   @Break
                
                ; Is spell excluded?
                lea     table_AiExcludedItemUseAttackSpells(pc), a0
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                clr.w   d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Break
                
@Next:          addq.w  #1,d3
                cmpi.w  #COMBATANT_ITEMSLOTS,d3
                bcs.s   @Loop
                
                move.w  #ITEM_NOTHING,d1
                bra.s   @Done
@Break:         move.w  d3,d2
                move.w  d4,d1           ; restore item entry
@Done:          movem.l (sp)+,d3-d5/a0
                rts

    ; End of function GetNextUsableAttackItem


; =============== S U B R O U T I N E =======================================

; Get the next item in combatant's inventory that can be used to cast
;  a healing spell. <HARDCODED>
; 
; This only looks for Healing Rain as a valid healing item,
;  unless the AI is set to use the item the in battle data.
; 
;       In: d0.w = caster index, d3.w = starting spell slot
;       Out: d1.w = spell index, d2.w = spell slot


GetNextUsableHealingItem:
                
                movem.l d3-d4/a0,-(sp)
                
@Loop:          move.w  d3,d1
                bsr.w   GetItemBySlotAndHeldItemsNumber
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Next
                
                bsr.w   IsItemUsableInBattle
                bcc.s   @Next
                
                ; Is AI allowed to use item?
                cmpi.b  #ITEM_HEALING_RAIN,d1 ; if not Healing Rain, AI must be set to use the item in battle data
            if (HEALER_AI_ENHANCEMENTS=1)
                bls.s   @Continue         ; first eight items are allowed to be used
            else
                beq.s   @Continue
            endif
                btst    #ITEMENTRY_BIT_USABLE_BY_AI,d1
                beq.s   @Next
                
@Continue:      bsr.w   GetItemDefAddress
                move.w  d1,d4                           ; save item entry
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                bsr.w   FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                cmpi.b  #SPELLPROPS_TYPE_HEAL,d2
                beq.s   @Break
                
@Next:          addq.w  #1,d3
                cmpi.w  #COMBATANT_ITEMSLOTS,d3
                bcs.s   @Loop
                
                move.w  #ITEM_NOTHING,d1
                bra.s   @Done
@Break:         move.w  d3,d2
                move.w  d4,d1                           ; restore item entry
@Done:          movem.l (sp)+,d3-d4/a0
                rts

    ; End of function GetNextUsableHealingItem

