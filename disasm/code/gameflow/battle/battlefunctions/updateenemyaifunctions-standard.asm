
; ASM FILE code\gameflow\battle\battlefunctions\updateenemyaifunctions-standard.asm :
; 

; =============== S U B R O U T I N E =======================================


UpdateAllEnemiesAi:
                
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
@Loop:          jsr     GetCombatantX
                bmi.s   @Next
                jsr     GetCurrentHP
                beq.s   @Next
                tst.b   d0
                bpl.s   @Next
                jsr     UpdateTriggeredRegionsAndAi
@Next:          addq.w  #1,d0
                dbf     d7,@Loop
                rts

    ; End of function UpdateAllEnemiesAi

