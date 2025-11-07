
; ASM FILE code\gameflow\battle\battleloop\activateenemies.asm :
; 0x2550C..0x25544 : Battle loop : Update Enemy AI functions

; =============== S U B R O U T I N E =======================================

; BUG -- A Goddess Staff is added to the deals section in shops whenever a DEF-CON switch 
;       is activated, and if one of the following items is also present :
;       - Quick Ring
;       - Protect Ring
;       - White Ring
;       - Running Ring
; 
; End function with a RTS intruction to fix


ActivateEnemies:
                
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
@Loop:
                
                move.w  d7,-(sp)
                bsr.w   UpdateEnemyActivationBitfield
                move.w  (sp)+,d7
                addq.w  #1,d0
                dbf     d7,@Loop

    ; End of function ActivateEnemies


; =============== S U B R O U T I N E =======================================


UpdateEnemyActivationBitfield:
                
                jsr     j_GetCombatantX
                tst.b   d1
                bmi.w   @Return
                
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.w   @Return
                
                tst.b   d0
                bpl.s   @Return
                
                jsr     j_TriggerRegionsAndActivateEnemies
@Return:
                
                rts

    ; End of function UpdateEnemyActivationBitfield

