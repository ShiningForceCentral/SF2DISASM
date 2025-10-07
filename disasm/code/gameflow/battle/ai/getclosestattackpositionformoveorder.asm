
; ASM FILE code\gameflow\battle\ai\getclosestattackpositionformoveorder.asm :
; 0xCE96..0xCED2 : Closest attack postion for move order getter function

; =============== S U B R O U T I N E =======================================

; Find a nearby attack position for an AI controlled combatant executing
;   a move order command.
;
; In: d0.b = combatant index
;
; Out: d1.b,d2.b = destination X,Y (-1 if no position is available)


GetClosestAttackPositionForMoveOrder:
                
                movem.l d0/d3-a6,-(sp)
                jsr     GetCombatantY
                move.w  d1,d2
                jsr     GetCombatantX
                bsr.w   PopulateTargetsArrayWithAllCombatants
                
                ; Save current coordinates, then try current position
                moveq   #0,d3
                moveq   #0,d4
                move.w  d1,d5
                move.w  d2,d6
                bsr.w   GetClosestAttackPosition
                
                cmpi.w  #-1,d1
                bne.w   @Done
                
                ; Restore saved coordinates, then try again with an expanded range
                moveq   #1,d3
                moveq   #1,d4
                move.w  d5,d1
                move.w  d6,d2
                bsr.w   GetClosestAttackPosition
@Done:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function GetClosestAttackPositionForMoveOrder

