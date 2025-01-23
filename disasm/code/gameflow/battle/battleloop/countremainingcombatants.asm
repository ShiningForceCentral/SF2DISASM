
; ASM FILE code\gameflow\battle\battleloop\countremainingcombatants.asm :
; 0x23C58..0x23CBA : Battle loop

; =============== S U B R O U T I N E =======================================

; Get number of allies living, number of enemies living -> D2, D3


CountRemainingCombatants:
                
                clr.w   d2
                clr.w   d3
                clr.w   d0
                move.w  #COMBATANT_ALLIES_COUNTER,d7
@Allies_Loop:
                
                jsr     j_GetCombatantX
                tst.b   d1
                bmi.w   @DeadAlly
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.w   @DeadAlly
                addq.w  #1,d2
@DeadAlly:
                
                addq.w  #1,d0
                dbf     d7,@Allies_Loop
                
                move.w  #COMBATANT_ENEMIES_START,d0
                move.w  #COMBATANT_ENEMIES_COUNTER,d7
@Enemies_Loop:
                
                jsr     j_GetCombatantX
                tst.b   d1
                bmi.w   @DeadEnemy
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.w   @DeadEnemy
                addq.w  #1,d3
@DeadEnemy:
                
                addq.w  #1,d0
                dbf     d7,@Enemies_Loop
                
            if (STANDARD_BUILD&NO_DEFEAT_ON_LEADER_DEATH=1)
            else
                clr.w   d0
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   @Return
                clr.w   d2
            endif
@Return:
                
                rts

    ; End of function CountRemainingCombatants

