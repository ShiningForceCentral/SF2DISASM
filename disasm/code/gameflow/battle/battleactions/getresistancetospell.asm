
; ASM FILE code\gameflow\battle\battleactions\getresistancetospell.asm :
; 0xC22A..0xC24E : Resistance to spell element getter function

; =============== S U B R O U T I N E =======================================

; Get combatant d0.b's resistance setting to spell d1.w -> d2.w


GetResistanceToSpell:
                
                movem.l d0-d1/d3-a6,-(sp)
                andi.b  #SPELLENTRY_MASK_INDEX,d1
                move.b  table_SpellElements(pc,d1.w),d2
                jsr     GetCurrentResistance
                andi.w  #RESISTANCEENTRY_MASK_ALL,d1
                ror.w   d2,d1
                move.w  d1,d2
                andi.w  #RESISTANCEENTRY_LOWERMASK_SETTING,d2
                movem.l (sp)+,d0-d1/d3-a6
                rts

    ; End of function GetResistanceToSpell

