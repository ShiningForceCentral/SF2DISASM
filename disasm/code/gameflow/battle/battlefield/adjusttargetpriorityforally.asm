
; ASM FILE code\gameflow\battle\battlefield\adjusttargetpriorityforally.asm :
; 0xCE36..0xCE96 : Adjust target priority for ally function

; =============== S U B R O U T I N E =======================================

; Extra adjustments on target priority if the attacker is an ally 
;  (does not apply to enemies.)
; 
; In: D0 = defender index
;     D1 = defenders remaining HP after taking theoretical max damage from an attack (prior routines)
;     D4 = attacker index (the one attacking or casting the offensive spell)
;     D7 = who the enemy targeted last
; 
; Out: D6 = priority of the action (basically the total max damage output of the action plus adjustments)


AdjustTargetPriorityForAlly:
                
                movem.l d0-d5/d7-a6,-(sp)
                clr.w   d5
                move.b  d0,d5
                move.w  d4,d0
                btst    #COMBATANT_BIT_ENEMY,d0
                beq.s   loc_CE4A
                bra.w   loc_CE90
loc_CE4A:
                
                bsr.w   IsConfused      
                tst.b   d1
                beq.s   loc_CE56        ; if attacker is not inflicted with Muddle2
                bra.w   loc_CE90
loc_CE56:
                
                cmpi.b  #1,d7
                bne.s   loc_CE66
                lea     (table_DA22).l,a4
                bra.w   loc_CE80
loc_CE66:
                
                clr.l   d0
                move.b  d4,d0           ; d0 = attacker index
                jsr     GetMoveType     
                clr.l   d3
                move.b  d1,d3
                lea     (pt_D9C2).l,a4  
                lsl.l   #2,d3
                movea.l (a4,d3.l),a4
loc_CE80:
                
                clr.w   d0
                move.b  d5,d0           ; d0 = defender index
                bsr.w   GetClass        
                clr.w   d2
                move.b  (a4,d1.w),d2
                add.w   d2,d6           ; d6 = priority of the action
loc_CE90:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function AdjustTargetPriorityForAlly

