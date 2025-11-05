
; ASM FILE code\gameflow\battle\battlefield\getcurrentterraintypeformoveorder.asm :
; 0xD430..0xD460 : Current terrain type for move order getter function

; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index
;     d1.b = move order command primary characteristic
; 
; Out: d1.b = 0 if passable, or -1 if obstructed

targetType = -2
combatant = -1

GetCurrentTerrainTypeForMoveOrder:
                
                movem.l d0/d2-a6,-(sp)
                link    a6,#-2
                move.b  d0,combatant(a6)
                move.b  d1,targetType(a6) ; unused
                clr.w   d0
                move.b  combatant(a6),d0
                bsr.w   GetCurrentTerrainType
                btst    #7,d0
                bne.s   @Obstructed
                
                clr.w   d1
                bra.s   @Done
@Obstructed:
                
                move.b  #-1,d1
@Done:
                
                unlk    a6
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function GetCurrentTerrainTypeForMoveOrder

