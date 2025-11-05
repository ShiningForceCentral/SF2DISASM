
; ASM FILE code\gameflow\battle\ai\determineaistandbymovement_2.asm :
; 0xF8EA..0xF9B4 : AI engine : Determine standby movement function, part 2

; =============== S U B R O U T I N E =======================================

; Evaluate whether a combatant is allowed to perform standby movement
;   and whether they have a special AI move order active.
; 
; Determine movement permission based on primary/secondary AI move orders
;   and activation regions.
; 
; In: d0.w = moving combatant index
; 
; Out: d1.w != 0 if allowed to move
;      d2.w != 0 if the combatant is set to perform a special move order

secondaryMoveOrder = -4
primaryMoveOrder = -3
secondaryTriggerRegion = -2
primaryTriggerRegion = -1

ValidateAiStandbyEligibility:
                
                movem.l d0/d3-a6,-(sp)
                link    a6,#-4
                move.w  d0,d7           ; save combatant index (useless)
                bsr.w   GetMoveOrders 
                move.b  d1,primaryMoveOrder(a6)
                move.b  d2,secondaryMoveOrder(a6)
                bsr.w   GetTriggerRegions     
                move.b  d1,primaryTriggerRegion(a6)
                move.b  d2,secondaryTriggerRegion(a6)
                
                ; Check primary move order
                move.b  primaryMoveOrder(a6),d0
                cmpi.b  #AIORDER_NONE,d0
                beq.s   @CheckSecondaryMoveOrder
                
                cmpi.b  #AI_TRIGGER_REGION_NONE,d1
                beq.s   @CheckSecondaryMoveOrder ; continue if no primary move order or no trigger region
                
                move.b  #1,d1           ; otherwise, return d1.w = 1 (allow movement)
                bra.w   @Done
@CheckSecondaryMoveOrder:
                
                move.b  secondaryMoveOrder(a6),d0
                cmpi.b  #AIORDER_NONE,d0
                beq.s   @IsMoveOrder
                
                cmpi.b  #AI_TRIGGER_REGION_NONE,d2
                beq.s   @IsMoveOrder
                
                move.b  #1,d1
                bra.w   @Done
@IsMoveOrder:
                
                move.b  primaryMoveOrder(a6),d0
                cmpi.b  #AIORDER_NONE,d0
                beq.s   @IsPrimaryMoveOrderRegionTriggered
                
                ; If set to follow a combatant
                move.b  primaryTriggerRegion(a6),d0
                cmpi.b  #AI_TRIGGER_REGION_NONE,d0
                bne.s   @IsPrimaryMoveOrderRegionTriggered
                
                move.b  secondaryMoveOrder(a6),d0
                cmpi.b  #AIORDER_NONE,d0
                bne.s   @IsPrimaryMoveOrderRegionTriggered
                
                move.b  secondaryTriggerRegion(a6),d0
                cmpi.b  #AI_TRIGGER_REGION_NONE,d0
                beq.s   @IsPrimaryMoveOrderRegionTriggered
                
                ; - primaryMoveOrder != NONE
                ; - primaryTriggerRegion = 15
                ; - secondaryMoveOrder = NONE
                ; - secondaryTriggerRegion != 15
                clr.w   d1              ; return d1.w = 0 (disallow movement)
                move.b  #1,d2           ; return d2.w = 1 (has a move order)
                bra.w   @Done
@IsPrimaryMoveOrderRegionTriggered:
                
                move.b  primaryMoveOrder(a6),d0
                cmpi.b  #AIORDER_NONE,d0
                bne.s   @IsSecondaryMoveOrderRegionTriggered
                
                ; If not set to follow a combatant
                move.b  primaryTriggerRegion(a6),d0
                cmpi.b  #AI_TRIGGER_REGION_NONE,d0
                beq.s   @IsSecondaryMoveOrderRegionTriggered
                
                clr.w   d1              ; return d1.w = 0 (disallow movement)
                clr.w   d2              ; return d2.w = 0 (no move order)
                bra.w   @Done
@IsSecondaryMoveOrderRegionTriggered:
                
                move.b  secondaryMoveOrder(a6),d0
                cmpi.b  #AIORDER_NONE,d0
                bne.s   @ReturnDefault  
                
                move.b  secondaryTriggerRegion(a6),d0
                cmpi.b  #AI_TRIGGER_REGION_NONE,d0
                beq.s   @ReturnDefault  
                
                clr.w   d1              ; return d1.w = 0 (disallow movement)
                clr.w   d2              ; return d2.w = 0 (no move order)
                bra.w   @Done
@ReturnDefault:
                
                move.w  #1,d1           ; return d1.w = 1 (allow movement)
                clr.w   d2              ; return d2.w = 0 (no move order)
@Done:
                
                unlk    a6
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function ValidateAiStandbyEligibility

