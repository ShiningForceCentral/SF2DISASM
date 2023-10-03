
; ASM FILE code\gameflow\battle\battlefield\determinehealingspelllevel.asm :
; 0xCD68..0xCDEA : Determine healing spell level function

; =============== S U B R O U T I N E =======================================

; Decide which level of spell to use based upon the HP missing from target
;  and the MP available to the caster.
; 
;   In: d0.b = heal target character index
;       d1.b = combatant index of the spell caster
;       d4.b = spell entry
; 
;   Out: d2.w = spell level to cast (if -1, then no spell is cast)


DetermineHealingSpellLevel:
                
                movem.l d0-d1/d3-a6,-(sp)
                clr.w   d5
                move.b  d4,d5
                lsr.w   #SPELLENTRY_OFFSET_LV,d5
                andi.w  #SPELLENTRY_LOWERMASK_LV,d5
                move.w  d1,d3
                jsr     GetCurrentHp
                move.w  d1,d2
                jsr     GetMaxHp
                sub.w   d2,d1           ; d1 = max HP - current HP
                moveq   #-1,d2
                cmpi.w  #ENEMYAI_THRESHOLD_HEAL1,d1 ; 2
                bls.w   loc_CDDC
                moveq   #0,d2
                cmpi.w  #ENEMYAI_THRESHOLD_HEAL2,d1 ; 14
                bls.w   loc_CDB8
                cmpi.w  #SPELLENTRY_LV3,d5 ; check if spell level > 2
                bcs.w   loc_CDB8
                moveq   #SPELLENTRY_LV3,d2
                cmpi.w  #ENEMYAI_THRESHOLD_HEAL3,d1 ; 28
                bls.w   loc_CDB8
                cmpi.w  #SPELLENTRY_LV4,d5 ; check if spell level > 3
                bcs.w   loc_CDB8
                moveq   #SPELLENTRY_LV4,d2
loc_CDB8:
                
                move.w  d3,d0
                jsr     GetCurrentMp
                move.w  d1,d3
loc_CDC2:
                
                
                ; This next section attempts to check each spell level for
                ;  the appropriate amount of MP, but does so incorrectly.
                
                moveq   #0,d1
                add.w   d2,d1
                lsl.w   #5,d1           ; <bug> this should be lsl.w #6,d1 instead (see also GetHighestUsableSpellLevel for a comparable script)
                                        ; <bug> it is also necessary to andi.w #$3F,d4 to remove the spell level data from d4 before adding it,
                                        ;   although that also does not work due to d4 being used for storage of the spell definition
                                        ;   so first d4 would have to be moved before manipulated.
                add.w   d4,d1           ; d1 = the intent here is to create the spell index corresponding to the appropriate spell level,
                                        ;  but this doesn't work due to the bugs above
                jsr     FindSpellDefAddress
                cmp.b   SPELLDEF_OFFSET_MP_COST(a0),d3 ; check if spell cost is more than current MP
                bcc.w   loc_CDDC
                dbf     d2,loc_CDC2
loc_CDDC:
                
                cmpi.b  #1,d2           ; if level 2 is selected (d2=1), then select level 1 instead (d2=0)
                bne.s   loc_CDE4
                moveq   #0,d2
loc_CDE4:
                
                movem.l (sp)+,d0-d1/d3-a6
                rts

    ; End of function DetermineHealingSpellLevel

