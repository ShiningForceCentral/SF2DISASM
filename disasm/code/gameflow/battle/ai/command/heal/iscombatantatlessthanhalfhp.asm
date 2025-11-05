
; ASM FILE code\gameflow\battle\ai\command\heal\iscombatantatlessthanhalfhp.asm :
; 0xD296..0xD2D2 : Is combatant at less than half HP checker function

; =============== S U B R O U T I N E =======================================

; Is combatant d0.w at less than half HP? Return CCR carry-bit clear if true.


IsCombatantAtLessThanHalfHp:
                
                movem.l d1-d2,-(sp)
                jsr     GetCurrentHp
                move.w  d1,d2
                jsr     GetMaxHp
                bra.w   @Continue
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetMaxHp
                bra.w   @Continue
                
                movem.l d1-d2,-(sp)
                move.w  d1,d2
                jsr     GetCurrentHp
@Continue:
                
                add.w   d2,d2
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2
                rts

    ; End of function IsCombatantAtLessThanHalfHp

