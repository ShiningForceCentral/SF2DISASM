
; ASM FILE code\gameflow\battle\doescombatantrequirehealing-aienhancements.asm :

; =============== S U B R O U T I N E =======================================

; Determine if the target requires healing (as determined by an HP threshold.)
;
;   In: d0.w = target combatant index
;       d5.w = caster combatant index
;       d6.w = healing thresholds code
;
;   Out: carry and zero bits are cleared if the target hits the appropriate HP threshold


DoesCombatantRequireHealing:
                
                movem.l d1-d2/d5-d6,-(sp)
                bsr.w   GetAiCommandset     ; In: d0 = combatant index; Out: d1 = AI commandset
                cmpi.w  #AICOMMANDSET_LEADER,d1
                blt.s   @CheckBoss
                lsr.w   #6,d6
                bra.s   @Calculate
@CheckBoss:     cmpi.w  #COMBATANT_ENEMIES_START,d0
                bne.s   @CheckSelf
                lsr.w   #4,d6
                bra.s   @Calculate
@CheckSelf:     cmp.w   d0,d5
                bne.s   @Calculate
                lsr.w   #2,d6
@Calculate:     andi.w  #3,d6           ; keep only the first two bits so it doesn't matter what lsr is used
                bsr.w   GetCurrentHP
                move.w  d1,d2
                add.w   d1,d2
                add.w   d1,d2           ; d2 = current HP * 3
                bsr.w   GetMaxHP        ; d1 = max HP
                mulu.w  d6,d1           ; multiply max HP by whatever variable is dictated by the extra AI code
                cmp.w   d2,d1
                movem.l (sp)+,d1-d2/d5-d6
                rts
                
    ; End of function DoesCombatantRequireHealing

