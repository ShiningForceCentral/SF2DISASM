
; ASM FILE code\gameflow\battle\battlefield\doescombatantrequirehealing.asm :
; 0xD38A..0xD3CA : Does combatant require healing function

; =============== S U B R O U T I N E =======================================

; Is combatant d0 at 2/3 or less of max HP? Return carry clear if true.


DoesCombatantRequireHealing:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHP
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   @Continue
                movem.l d1-d2,-(sp)     ; unreachable code
                move.w  d1,d2
                jsr     GetMaxHP
                bra.w   @Continue
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHP
@Continue:
                
                mulu.w  #3,d2
                add.w   d1,d1
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2
                rts

    ; End of function DoesCombatantRequireHealing

