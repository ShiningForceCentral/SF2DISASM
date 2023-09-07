
; ASM FILE code\gameflow\battle\determinehealingspelllevel-aienhancements.asm :

; =============== S U B R O U T I N E =======================================

; Return the lowest level spell that still fully heals the target and that can be cast by the caster
;  (or choose the maximum healing amount if no spell level can fully heal.)
;
;   In: d0.b = target index
;       d1.b = caster index
;       d4.w = spell entry
;
;   Out: d2.w = spell level to cast (if -1, then no spell is cast)


DetermineHealingSpellLevel:
                
                movem.l d0-d1/d3-a0,-(sp)
                move.w  d4,d2
                lsr.w   #SPELLENTRY_OFFSET_LV,d2
                andi.w  #SPELLENTRY_LOWERMASK_LV,d2 ; d2 = highest level of healing spell known by the caster
                
                move.w  d1,d3               ; save caster index
                bsr.w   GetMaxHP
                move.w  d1,d7
                bsr.w   GetCurrentHP
                sub.w   d1,d7               ; d7 = missing HP for target
                
                move.w  d4,d1
                bsr.w   FindSpellDefAddress
                move.w  d3,d0               ; restore caster index
                bsr.s   GetAdjustedHealingPower
                tst.w   d5      ; check if the spell has any spell power; if not, the spell must not be a healing spell and is instead a status spell like Detox
                beq.s   @Done   ; if the spell is a status spell, always select the highest level provided to this subroutine
                
                bsr.w   GetCurrentMP
                move.w  d1,d3               ; d3 = current MP of spell caster

                ; a0 = spell definition location
                ; d7 = target's missing HP
                ; d5 = power of the spell level to use
                ; d4 = spell entry
                ; d3 = caster's current MP
                ; d2 = spell level to use (output of this subroutine); begins at the maximum
                ; d0 = caster index
@Loop:          move.b  SPELLDEF_OFFSET_MP_COST(a0),d6
                subi.b  #64,d4              ; reduce spell entry by one level (this will be used in the next loop or after the MP check, but is placed here for efficiency purposes)
                move.w  d4,d1
                bsr.w   FindSpellDefAddress ; Load spell definition for the new, lower level
                cmp.b   d6,d3               ; check if the caster has sufficient MP
                blo.s   @Next               ; if d3 is less than d6, can't cast the given level of spell and a lower level must be selected
                
                move.w  d5,d6
                bsr.s   GetAdjustedHealingPower ; d5 = heal amount (adjusted for promotion bonus) of the lower level spell
                cmp.w   d5,d6   ; check if the lower level spell has the same healing amount as the higher level spell
                blt.s   @Next   ; if d6 < d5, then the healing power of the lower level is greater than or equal to that of the higher level, so keep checking to find the best spell to cast
                
                cmp.w   d5,d7   ; check if the healing amount is sufficient
                bgt.s   @Done   ; if d7 > d5, healing power of lower level is insufficient to heal the target, so end processing and use the currently selected level
@Next:          dbf     d2,@Loop

@Done:          movem.l (sp)+,d0-d1/d3-a0
                rts

    ; End of function DetermineHealingSpellLevel


; =============== S U B R O U T I N E =======================================

; In: A0 = spell definition pointer, D0 = caster index
; Out: D5 = spell power adjusted for promotion bonus


GetAdjustedHealingPower:
                
                clr.w   d5
                move.b  SPELLDEF_OFFSET_POWER(a0),d5
                bsr.w   GetClassType
                beq.s   @Return     ; go to next step if caster is not promoted
                mulu.w  #5,d5
                lsr.w   #2,d5       ; +25% spell power
@Return:        rts

    ; End of function GetAdjustedHealingPower

