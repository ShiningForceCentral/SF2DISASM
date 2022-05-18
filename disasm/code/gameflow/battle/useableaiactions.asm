
; ASM FILE code\gameflow\battle\useableaiactions.asm :
; 0xCF74..0xD1CC : Usable AI actions getter functions

; =============== S U B R O U T I N E =======================================

; Get next attack spell usable by the caster.
; 
;       In: D0 = caster index, D3 = starting spell slot
;       Out: D1 = spell index, D2 = spell slot


GetNextUsableAttackSpell:
                
                movem.l d0/d3-a6,-(sp)
                bsr.w   CheckMuddled2   
                move.w  d1,d7           ; remember whether caster is muddled
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Start
                move.w  #1,d7           ; treat ally caster as muddled
@Start:
                
                move.w  d3,d1
                jsr     GetSpellAndNumberOfSpells
                move.w  d1,d4
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                cmpi.w  #SPELL_NOTHING,d4
                bne.s   @CheckMuddled
                bra.w   @NextSlot
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
                bne.s   @Goto_NextSlot
                bra.w   @CheckSpellType
@Goto_NextSlot:
                
                bra.w   @NextSlot
@CheckSpellType:
                
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                beq.w   @Continue
@NextSlot:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_SPELLSLOTS,d3
                bcs.s   @Start
                
                move.w  #SPELL_NOTHING,d1 ; checked all slots with no valid spell found
                bra.w   @Done
@Continue:
                
                bsr.w   GetHighestUsableSpellLevel
                move.w  d3,d2
@Done:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextUsableAttackSpell


; =============== S U B R O U T I N E =======================================

; Get next healing spell known by the combatant.
; 
;       In: D0 = entity index, D3 = starting spell slot
;       Out: D1 = spell index, D2 = spell slot


GetNextHealingSpell:
                
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
                cmpi.b  #SPELLPROPS_TYPE_HEAL,d2
                beq.w   @GetSpellSlot
@NextSlot:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_SPELLSLOTS,d3
                bcs.s   @Start
                
                move.w  #SPELL_NOTHING,d1
                bra.w   @Done
@GetSpellSlot:
                
                move.w  d3,d2
@Done:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextHealingSpell


; =============== S U B R O U T I N E =======================================


GetNextSupportSpell:
                
                movem.l d0/d3-a6,-(sp)
loc_D066:
                
                move.w  d3,d1
                jsr     GetSpellAndNumberOfSpells
                move.w  d1,d4
                andi.w  #SPELLENTRY_MASK_INDEX,d4
                cmpi.w  #SPELL_NOTHING,d4
                bne.s   loc_D07E
                bra.w   loc_D094
loc_D07E:
                
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                cmpi.b  #SPELLPROPS_TYPE_STATUS,d2
                beq.w   loc_D0A4
loc_D094:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_SPELLSLOTS,d3
                bcs.s   loc_D066
                move.w  #SPELL_NOTHING,d1
                bra.w   loc_D0A6
loc_D0A4:
                
                move.w  d3,d2
loc_D0A6:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextSupportSpell


; =============== S U B R O U T I N E =======================================

; Get the next item in combatant's inventory that can be used to cast
; BLAZE/FREEZE/BOLT/BLAST (HARDCODED spell indexes)
; 
;       In: D0 = combatant index, D3 = starting item slot
;       Out: D1 = item index, D2 = item slot


GetNextUsableAttackItem:
                
                movem.l d0/d3-a6,-(sp)
                bsr.w   CheckMuddled2   
                move.w  d1,d6
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   loc_D0C0
                move.w  #1,d6
loc_D0C0:
                
                move.w  d3,d1
                jsr     GetItemAndNumberHeld
                cmpi.w  #ITEM_NOTHING,d1
                bne.s   loc_D0D2
                bra.w   loc_D0DC
loc_D0D2:
                
                jsr     IsItemUsableInBattle
                bcs.w   loc_D0E8
loc_D0DC:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_ITEMSLOTS,d3
                bcs.s   loc_D0C0
                bra.w   loc_D156
loc_D0E8:
                
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                bne.w   loc_D0F8
                btst    #ITEMENTRY_BIT_USABLE_BY_AI,d1
                beq.w   loc_D156
loc_D0F8:
                
                jsr     GetItemDefAddress
                move.w  d1,d7
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                tst.b   d6
                beq.s   loc_D13C
                move.w  d1,d5
                andi.b  #SPELLENTRY_MASK_INDEX,d5
                cmpi.b  #SPELL_BLAZE,d5 ; HARDCODED spell indexes
                bne.s   loc_D11A
                bra.w   loc_D13C
loc_D11A:
                
                cmpi.b  #SPELL_FREEZE,d5
                bne.s   loc_D124
                bra.w   loc_D13C
loc_D124:
                
                cmpi.b  #SPELL_BOLT,d5
                bne.s   loc_D12E
                bra.w   loc_D13C
loc_D12E:
                
                cmpi.b  #SPELL_BLAST,d5
                bne.s   loc_D138
                bra.w   loc_D13C
loc_D138:
                
                bra.w   loc_D156
loc_D13C:
                
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                bne.w   loc_D156
                move.w  d3,d2
                move.w  d7,d1
                bra.w   loc_D15A
loc_D156:
                
                move.w  #ITEM_NOTHING,d1
loc_D15A:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextUsableAttackItem


; =============== S U B R O U T I N E =======================================

; Get the next item in combatant's inventory that can be used to cast
; a healing spell. <HARDCODED>
; 
; This only looks for Healing Rain as a valid healing item,
; but is easy enough to change to allow the AI to use healing items.
; 
;       In: D0 = combatant index, D3 = starting item slot
;       Out: D1 = item entry, D2 = item slot


GetNextUsableHealingItem:
                
                movem.l d0/d3-a6,-(sp)
@Start:
                
                move.w  d3,d1
                jsr     GetItemAndNumberHeld
                cmpi.w  #ITEM_NOTHING,d1
                bne.s   @Continue
                bra.w   @NextSlot
@Continue:
                
                move.w  d1,d7
                jsr     IsItemUsableInBattle
                bcc.s   @NextSlot
                cmpi.b  #ITEM_HEALING_RAIN,d7
                beq.s   @CheckSpellType ; Right now the logic requires the item to be Healing Rain to count as a healing item.
                btst    #ITEMENTRY_BIT_USABLE_BY_AI,d1
                beq.w   @NextSlot
@CheckSpellType:
                
                jsr     GetItemDefAddress
                move.w  d1,d7           ; D7 = copy of item entry
                clr.w   d1
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d1
                jsr     FindSpellDefAddress
                move.b  SPELLDEF_OFFSET_PROPS(a0),d2
                andi.b  #SPELLPROPS_MASK_TYPE,d2
                cmpi.b  #SPELLPROPS_TYPE_HEAL,d2
                bne.w   @NextSlot
                move.w  d3,d2
                move.w  d7,d1
                bra.w   @Done
@NextSlot:
                
                addq.w  #1,d3
                cmpi.w  #COMBATANT_ITEMSLOTS,d3
                bcs.s   @Start
                move.w  #ITEM_NOTHING,d1
@Done:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetNextUsableHealingItem

