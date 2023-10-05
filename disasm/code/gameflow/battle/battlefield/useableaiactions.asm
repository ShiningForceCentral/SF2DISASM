
; ASM FILE code\gameflow\battle\battlefield\useableaiactions.asm :
; 0xCF74..0xD1CC : Usable AI actions getter functions

; =============== S U B R O U T I N E =======================================

; Get next attack spell usable by the caster.
; 
;   In: d0.w = caster index, d3.w = starting spell slot
;   Out: d1.w = spell index, d2.w = spell slot


GetNextUsableAttackSpell:
                
                movem.l d0/d3-a6,-(sp)
                bsr.w   CheckMuddled2   
                move.w  d1,d7           ; remember whether caster is muddled
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Loop
                move.w  #1,d7           ; treat ally caster as muddled
@Loop:
                
                move.w  d3,d1
                jsr     GetSpellAndNumberOfSpells
                move.w  d1,d4
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                cmpi.w  #SPELL_NOTHING,d4
                bne.s   @CheckMuddled
                bra.w   @Next
@CheckMuddled:
                
                tst.b   d7
                beq.s   @CheckSpellType
                move.w  d1,d5
                andi.b  #SPELLENTRY_MASK_INDEX,d5
                cmpi.b  #SPELL_BLAZE,d5 ; HARDCODED spell indexes
                bne.s   @CheckFreeze
                bra.w   @CheckSpellType
@CheckFreeze:
                
                cmpi.b  #SPELL_FREEZE,d5
                bne.s   @CheckBolt
                bra.w   @CheckSpellType
@CheckBolt:
                
                cmpi.b  #SPELL_BOLT,d5
                bne.s   @CheckBlast
                bra.w   @CheckSpellType
@CheckBlast:
                
                cmpi.b  #SPELL_BLAST,d5
                bne.s   @CheckKaton
                bra.w   @CheckSpellType
@CheckKaton:
                
                cmpi.b  #SPELL_KATON,d5
                bne.s   @CheckRaijin
                bra.w   @CheckSpellType
@CheckRaijin:
                
                cmpi.b  #SPELL_RAIJIN,d5
                bne.s   @Goto_Next
                bra.w   @CheckSpellType
@Goto_Next:
                
                bra.w   @Next
@CheckSpellType:
                
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                beq.w   @Break
@Next:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_SPELLSLOTS,d3
                bcs.s   @Loop
                
                move.w  #SPELL_NOTHING,d1 ; checked all slots with no valid spell found
                bra.w   @Done
@Break:
                
                bsr.w   GetHighestUsableSpellLevel
                move.w  d3,d2
@Done:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextUsableAttackSpell


; =============== S U B R O U T I N E =======================================

; Get next healing spell known by the combatant.
; 
;       In: d0.w = caster index, d3.w = starting spell slot
;       Out: d1.w = spell index, d2.w = spell slot


GetNextHealingSpell:
                
                movem.l d0/d3-a6,-(sp)
@Loop:
                
                move.w  d3,d1
                jsr     GetSpellAndNumberOfSpells
                move.w  d1,d4
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                cmpi.w  #SPELL_NOTHING,d4
                bne.s   @Continue
                bra.w   @Next
@Continue:
                
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                cmpi.b  #SPELLPROPS_TYPE_HEAL,d2
                beq.w   @Break
@Next:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_SPELLSLOTS,d3
                bcs.s   @Loop
                
                move.w  #SPELL_NOTHING,d1
                bra.w   @Done
@Break:
                
                move.w  d3,d2
@Done:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextHealingSpell


; =============== S U B R O U T I N E =======================================

; Get next support spell known by the combatant.
; 
;       In: d0.w = caster index, d3.w = starting spell slot
;       Out: d1.w = spell index, d2.w = spell slot


GetNextSupportSpell:
                
                movem.l d0/d3-a6,-(sp)
@Start:
                
                move.w  d3,d1
                jsr     GetSpellAndNumberOfSpells
                move.w  d1,d4
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                cmpi.w  #SPELL_NOTHING,d4
                bne.s   @Continue
                bra.w   @NextSlot
@Continue:
                
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                cmpi.b  #SPELLPROPS_TYPE_SUPPORT,d2
                beq.w   @GetSlot
@NextSlot:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_SPELLSLOTS,d3
                bcs.s   @Start
                move.w  #SPELL_NOTHING,d1
                bra.w   @Done
@GetSlot:
                
                move.w  d3,d2
@Done:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextSupportSpell


; =============== S U B R O U T I N E =======================================

; Get the next item in combatant's inventory that can be used to cast
;  BLAZE/FREEZE/BOLT/BLAST.
; 
;       In: d0.w = caster index, d3.w = starting spell slot
;       Out: d1.w = spell index, d2.w = spell slot
; 
; HARDCODED spell indexes


GetNextUsableAttackItem:
                
                movem.l d0/d3-a6,-(sp)
                bsr.w   CheckMuddled2
                move.w  d1,d6           ; remember whether caster is muddled
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Loop
                move.w  #1,d6           ; treat ally caster as muddled
@Loop:
                
                move.w  d3,d1
                jsr     GetItemBySlotAndHeldItemsNumber
                cmpi.w  #ITEM_NOTHING,d1
                bne.s   @Continue
                bra.w   @Next
@Continue:
                
                jsr     IsItemUsableInBattle
                bcs.w   @CheckAllowedToUse
@Next:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_ITEMSLOTS,d3
                bcs.s   @Loop
                bra.w   @Nothing
@CheckAllowedToUse:
                
                btst    #ITEMENTRY_BIT_EQUIPPED,d1 ; if not equipped, AI must be set to use the item in battle data
                bne.w   @CheckSpellValidity
                btst    #ITEMENTRY_BIT_USABLE_BY_AI,d1
                beq.w   @Nothing
@CheckSpellValidity:
                
                jsr     GetItemDefAddress
                move.w  d1,d7           ; save item entry
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                
                ; Is caster muddled?
                tst.b   d6
                beq.s   @CheckSpellType
                move.w  d1,d5
                andi.b  #SPELLENTRY_MASK_INDEX,d5
                
                ; Check Blaze
                cmpi.b  #SPELL_BLAZE,d5 ; HARDCODED spell indexes
                bne.s   @CheckFreeze
                bra.w   @CheckSpellType
@CheckFreeze:
                
                cmpi.b  #SPELL_FREEZE,d5
                bne.s   @CheckBolt
                bra.w   @CheckSpellType
@CheckBolt:
                
                cmpi.b  #SPELL_BOLT,d5
                bne.s   @CheckBlast
                bra.w   @CheckSpellType
@CheckBlast:
                
                cmpi.b  #SPELL_BLAST,d5
                bne.s   @Goto_Nothing
                bra.w   @CheckSpellType
@Goto_Nothing:
                
                bra.w   @Nothing
@CheckSpellType:
                
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                bne.w   @Nothing
                move.w  d3,d2
                move.w  d7,d1           ; restore item entry
                bra.w   @Done
@Nothing:
                
                move.w  #ITEM_NOTHING,d1
@Done:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextUsableAttackItem


; =============== S U B R O U T I N E =======================================

; Get the next item in combatant's inventory that can be used to cast
;  a healing spell.
; 
; This only looks for Healing Rain as a valid healing item,
;  unless the AI is set to use the item the in battle data.
; 
;       In: d0.w = caster index, d3.w = starting spell slot
;       Out: d1.w = spell index, d2.w = spell slot
; 
; HARDCODED item and spell indexes


GetNextUsableHealingItem:
                
                movem.l d0/d3-a6,-(sp)
@Loop:
                
                move.w  d3,d1
                jsr     GetItemBySlotAndHeldItemsNumber
                cmpi.w  #ITEM_NOTHING,d1
                bne.s   @Continue
                bra.w   @Next
@Continue:
                
                move.w  d1,d7
                jsr     IsItemUsableInBattle
                bcc.s   @Next
                
                ; Is AI allowed to use item?
                cmpi.b  #ITEM_HEALING_RAIN,d7 ; if not Healing Rain, AI must be set to use the item in battle data
                beq.s   @CheckSpellType
                btst    #ITEMENTRY_BIT_USABLE_BY_AI,d1
                beq.w   @Next
@CheckSpellType:
                
                jsr     GetItemDefAddress
                move.w  d1,d7           ; save item entry
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                cmpi.b  #SPELLPROPS_TYPE_HEAL,d2
                bne.w   @Next
                move.w  d3,d2
                move.w  d7,d1           ; restore item entry
                bra.w   @Done
@Next:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_ITEMSLOTS,d3
                bcs.s   @Loop
                move.w  #ITEM_NOTHING,d1
@Done:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextUsableHealingItem

