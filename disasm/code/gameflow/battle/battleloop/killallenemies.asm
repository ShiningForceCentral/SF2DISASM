
; ASM FILE code\gameflow\battle\battleloop\killallenemies.asm :
; 0x23BB4..0x23BFC : Battle loop

; =============== S U B R O U T I N E =======================================


KillRemainingEnemies:
                
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
                move.w  #COMBATANT_ENEMIES_START,d0
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a0
                clr.w   ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
@Loop:
                
                jsr     j_GetCombatantX
                tst.b   d1
                bmi.w   @Skip           ; skip if already dead
                jsr     j_GetCombatantY
                tst.b   d1
                bmi.w   @Skip
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.w   @Skip
                move.b  d0,(a0)+
                addq.w  #1,((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w
                moveq   #0,d1
                jsr     j_SetCurrentHp
@Skip:
                
                addq.w  #1,d0
                dbf     d7,@Loop
                rts

    ; End of function KillRemainingEnemies

