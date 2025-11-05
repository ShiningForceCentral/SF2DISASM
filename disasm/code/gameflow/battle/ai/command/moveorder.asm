
; ASM FILE code\gameflow\battle\ai\command\moveorder.asm :
; 0xE98C..0xEBA4 : AI command : Move order

; =============== S U B R O U T I N E =======================================

; Move order scripts (move to point, follow ally, follow force member)
; 
; In: d0.b = moving combatant index
;     d1.b = target type (0 = move-to-point, 1 = follow target)
;     d2.b = pathfinding mode (0 = regular, 1 = block-non-movable, 2 = block-and-carve/tethered)
; 
; Out: d1.b = -1 if command failed to execute
;
; Effect: Set CURRENT_BATTLEACTION and BATTLE_ENTITY_MOVE_STRING.
;
; Note: Temporary terrain flags should be cleared by the calling code where required.
;   ClearAllTemporaryObstructionFlags os called at key points before pathfinding.

pathfindingMode = -4
moveOrder = -3
targetType = -2
combatant = -1

aiCommand_MoveOrder:
                
                movem.l d0/d2-a6,-(sp)
                link    a6,#-6
                btst    #COMBATANT_BIT_ENEMY,d0
                bne.s   @Enemy
                
                ; Stay put if ally combatant
                move.b  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @ProcessMovementMode
@Enemy:
                ; Check movement capability
                move.b  d0,combatant(a6)
                move.b  d1,targetType(a6)
                move.b  d2,pathfindingMode(a6)
                bsr.w   GetCurrentMov
                tst.b   d1
                bne.s   @CanMove
                
                ; Stay put if cannot move
                move.b  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @ProcessMovementMode
@CanMove:
                ; Check move order
                bsr.w   GetMoveOrders 
                cmpi.b  #AIORDER_NONE,d1
                bne.s   @HasMoveOrder
                
                ; Stay put if no move order
                move.b  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @ProcessMovementMode
@HasMoveOrder:
                ; Is Move To order?
                move.b  d1,moveOrder(a6)
                btst    #AIORDER_BIT_MOVE_TO,d1
                bne.s   @CheckTargetType
                
                ; If not Move To, then is Follow order target alive?
                clr.w   d0
                move.b  d1,d0
                bsr.w   GetCurrentHp
                tst.w   d1
                bne.s   @CheckTargetType
                
                ; Stay put if Follow order target is dead
                move.b  #-1,d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @ProcessMovementMode
@CheckTargetType:
                
                move.b  targetType(a6),d0
                tst.b   d0
                bne.w   @FollowTarget
                
                ; ------------------------------------------------------------
                ; Move-to-point path
                ; ------------------------------------------------------------
                
                ; Temporarily mark allied-occupied tiles
                move.b  combatant(a6),d0
                move.w  #-1,d3
                bsr.w   UpdateOccupiedByAlliesTerrain ; set flags
                bsr.w   InitializeMovementArrays            ; initialize and populate movement arrays
                bsr.w   BuildMovementArrays
                clr.w   d3
                bsr.w   UpdateOccupiedByAlliesTerrain ; clear flags
                
                ; Find a nearby attack position
                clr.w   d0
                move.b  combatant(a6),d0
                bsr.w   DetermineAttackPositionForMoveOrder
                tst.b   d1
                bne.s   @TryAttackCommand1
                
                ; Stay put if no valid nearby attack position
                move.w  #-1,d1
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   @ProcessMovementMode
@TryAttackCommand1:
                ; Otherwise, clear temporary obstruction bits
                jsr     j_ClearAllTemporaryObstructionFlags
                move.b  combatant(a6),d0
                jsr     j_ApplyQuadrantTerrainMarking        ; mark region-biased obstructions
                move.b  combatant(a6),d0
                clr.w   d1
                bsr.w   aiCommand_Attack
                tst.b   d1
                bne.s   @CannotAttack1
                
                clr.w   d1                                  ; clear d1 and exit if Attack command is successful
                bra.w   @ProcessMovementMode
@CannotAttack1:
                
                jsr     j_ClearAllTemporaryObstructionFlags
                move.b  combatant(a6),d0
                move.b  moveOrder(a6),d1
                bsr.w   BuildMoveStringForMoveOrder         ; attempt building a path toward the AI point
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d1
                cmpi.b  #-1,d1
                bne.s   @StayAfterMoving1
                
                ; Stay put if cannot move
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   @ProcessMovementMode
                
                move.w  #-1,d1                              ; unreachable code
                bra.s   @Goto_ProcessMovementMode
@StayAfterMoving1:
                
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                clr.w   d1
                bra.w   @ProcessMovementMode
@Goto_ProcessMovementMode:
                
                bra.w   @ProcessMovementMode
                
                ; ------------------------------------------------------------
                ; Follow target path (teammate or opponent) 
                ; ------------------------------------------------------------
@FollowTarget:
                
                clr.w   d0
                move.b  combatant(a6),d0
                move.b  targetType(a6),d1
                bsr.w   GetCurrentTerrainTypeForMoveOrder   ; terrain byte bit 7 set = success
                tst.b   d1
                bne.s   @TryAttackCommand2
                
                ; Stay put on terrain check failure
                move.w  #-1,d1
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   @ProcessMovementMode
@TryAttackCommand2:
                
                jsr     j_ClearAllTemporaryObstructionFlags
                move.b  combatant(a6),d0
                jsr     j_ApplyQuadrantTerrainMarking      
                move.b  combatant(a6),d0
                clr.w   d1
                bsr.w   aiCommand_Attack
                tst.b   d1
                bne.s   @CannotAttack2
                
                clr.w   d1
                bra.w   @ProcessMovementMode
@CannotAttack2:
                
                jsr     j_ClearAllTemporaryObstructionFlags
                move.b  combatant(a6),d0
                move.b  moveOrder(a6),d1
                bsr.w   BuildMoveStringForMoveOrder        
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d1
                cmpi.b  #-1,d1
                bne.s   @StayAfterMoving2
                
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   @ProcessMovementMode
                
                move.w  #-1,d1          ; unreachable code
                bra.s   @ProcessMovementMode
@StayAfterMoving2:
                
                clr.w   d1
                lea     ((CURRENT_BATTLEACTION-$1000000)).w,a0
                move.w  #BATTLEACTION_STAY,(a0)
                bra.w   *+4
                
                ; ------------------------------------------------------------
                ; Movement mode post-processing
                ; ------------------------------------------------------------
@ProcessMovementMode:
                
                clr.w   d2
                move.b  pathfindingMode(a6),d2
                tst.w   d2
                beq.s   @Done
                
                cmpi.w  #AI_PATHFINDING_MODE_BLOCK_NON_MOVABLE,d2
                bne.s   @IsBlockAndCarve
                
                ; Mark non-movable tiles as temporarily obstructed using the movable-grid
                jsr     j_BlockNonMovableSpacesAroundDestination
@IsBlockAndCarve:
                
                cmpi.w  #AI_PATHFINDING_MODE_BLOCK_AND_CARVE,d2
                bne.s   @Done
                
                ; Mark all tiles obstructed then clear a small pocket around the destination
                jsr     j_BlockAndCarveAroundDestination
@Done:
                
                unlk    a6
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function aiCommand_MoveOrder

