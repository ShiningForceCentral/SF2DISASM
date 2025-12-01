
; ASM FILE code\gameflow\battle\battlefield\getclosestattackpositionformoveorder.asm :
; 0xCE96..0xCED2 : Determine attack postion for move order function

; =============== S U B R O U T I N E =======================================


DetermineAttackPositionForMoveOrder:
                
                movem.l d0/d3-a6,-(sp)
                jsr     GetCombatantY
                move.w  d1,d2
                jsr     GetCombatantX
                bsr.w   BuildTargetsArrayWithAllCombatants
                moveq   #0,d3
                moveq   #0,d4
                move.w  d1,d5
                move.w  d2,d6
                bsr.w   DetermineAttackPosition
                cmpi.w  #-1,d1
                bne.w   @Done
                
                moveq   #1,d3
                moveq   #1,d4
                move.w  d5,d1
                move.w  d6,d2
                bsr.w   DetermineAttackPosition
@Done:
                
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function DetermineAttackPositionForMoveOrder

