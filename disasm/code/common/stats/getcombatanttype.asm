
; ASM FILE code\common\stats\getcombatanttype.asm :
; 0x851A..0x853A : Combatant type getter function

; =============== S U B R O U T I N E =======================================

; Get combatant d0.w type -> d1.w
; 
; If combatant is an ally, type is equal to combatant index plus allies number
;  times class type (0, 1, or 2 for base, promoted, and special, respectively),
;  and the most significant bit is set. However, this feature is unused.
; 
; Otherwise, if an enemy, return the enemy index.


GetCombatantType:
                
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                moveq   #0,d1
                bsr.w   GetClass        
                move.b  table_ClassTypes(pc,d1.w),d1 ; 0,1,2 = base class, promoted class, special promoted class
                mulu.w  #COMBATANT_ALLIES_NUMBER,d1
                add.w   d0,d1
                bset    #15,d1
                bra.s   @Return
@Enemy:
                
                bsr.s   GetEnemy        
@Return:
                
                rts

    ; End of function GetCombatantType

