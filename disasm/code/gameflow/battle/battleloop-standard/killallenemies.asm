
; ASM FILE code\gameflow\battle\battleloop-standard\killallenemies.asm :
; 0x23BB4..0x23BFC : Battle loop

; =============== S U B R O U T I N E =======================================


KillRemainingEnemies:
                
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
                move.w  #COMBATANT_ENEMIES_START,d0
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
                clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
@Loop:
                
                jsr     GetCombatantX
                bmi.s   @Skip           ; skip if already dead
                
                jsr     GetCombatantY
                bmi.s   @Skip
                
                jsr     GetCurrentHp
                beq.s   @Skip
                
                move.b  d0,(a0)+
                addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                moveq   #0,d1
                jsr     SetCurrentHp
@Skip:
                
                addq.w  #1,d0
                dbf     d7,@Loop
                rts

    ; End of function KillRemainingEnemies

