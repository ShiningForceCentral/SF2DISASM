
; ASM FILE code\gameflow\battle\battleloop\cleardeadcombatantslist.asm :
; 0x24512..0x24518 : Battle loop functions

; =============== S U B R O U T I N E =======================================


ClearDeadCombatantsListLength:
                
                clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                rts

    ; End of function ClearDeadCombatantsListLength

