
; ASM FILE code\gameflow\battle\battleloop\cleardeadcombatantslist.asm :
; 0x24512..0x24518 : Battle functions

; =============== S U B R O U T I N E =======================================

; Unused in standard build

ClearDeadCombatantsListLength:
                
            if (VANILLA_BUILD=1)
                clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                rts
            endif

    ; End of function ClearDeadCombatantsListLength

