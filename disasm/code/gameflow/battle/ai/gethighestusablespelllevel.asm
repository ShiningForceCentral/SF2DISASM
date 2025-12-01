
; ASM FILE code\gameflow\battle\ai\gethighestusablespelllevel.asm :
; 0xCED2..0xCF0E : Highest usable spell level getter function

; =============== S U B R O U T I N E =======================================

; Get highest usable level of spell d1.w, considering current MP and highest known level.
; 
;   In: d0.w = caster index, d1.w = highest known level spell entry, d4.w = spell index
;   Out: d1.w = highest usuable level spell entry


GetHighestUsableSpellLevel:
                
                movem.l d0/d2-a6,-(sp)
                move.w  d1,d2
                jsr     GetCurrentMp
                move.w  d1,d3
                move.w  d2,d1
                andi.w  #SPELLENTRY_MASK_INDEX,d1
                lsr.w   #SPELLENTRY_OFFSET_LV,d2
                andi.w  #SPELLENTRY_LOWERMASK_LV,d2
@Loop:
                
                moveq   #0,d1
                add.w   d2,d1
                lsl.w   #SPELLENTRY_OFFSET_LV,d1
                add.w   d4,d1
                jsr     GetSpellDefinitionAddress
                cmp.b   SPELLDEF_OFFSET_MP_COST(a0),d3
                bcc.w   @Break
                
                dbf     d2,@Loop
                
                moveq   #SPELL_NOTHING,d1
@Break:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function GetHighestUsableSpellLevel

