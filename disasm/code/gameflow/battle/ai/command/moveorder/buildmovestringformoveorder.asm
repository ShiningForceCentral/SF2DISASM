
; ASM FILE code\gameflow\battle\ai\command\moveorder\buildmovestringformoveorder.asm :
; 0xF7A0..0xF8EA : AI engine : Build move string for Move Order function

; =============== S U B R O U T I N E =======================================

; Build AI move string path toward move-order destination using radius
;   expansion to find closest attack tile.
;
; In: d0.b = moving combatant index
;     d1.b = AI move order entry
;
; Effect: Build BATTLE_ENTITY_MOVE_STRING via BuildMoveStringForAi or write -1.

destinationX = -4
destinationY = -3
moveOrder = -2
combatant = -1

BuildMoveStringForMoveOrder:
                
                movem.l d0-a6,-(sp)
                link    a6,#-4
                move.b  d0,combatant(a6)
                move.b  d1,moveOrder(a6)
                
                ; Populate move costs table, then get move order position -> d3.w, d4.w
                clr.w   d0
                move.b  combatant(a6),d0
                bsr.w   PopulateMovecostsTable
                move.b  moveOrder(a6),d0
                jsr     j_GetMoveOrderPosition
                move.w  d1,d3
                move.w  d2,d4
                
                ; Prepare pointers, then call BuildMovementArrays
                move.w  #128,d0         ; HARDCODED move budget
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                lea     (BATTLE_TERRAIN_ARRAY).l,a4
                lea     ((MOVECOSTS_TABLE-$1000000)).w,a5
                bsr.w   BuildMovementArrays
                
                ; Compute movable grid and targets array
                move.w  #-1,d3
                bsr.w   UpdateMovableGrid
                bsr.w   BuildTargetsArrayWithAllCombatants
                
                ; Build a move string
                clr.w   d0
                move.b  combatant(a6),d0
                bsr.w   GetCombatantX
                move.w  d1,d2
                bsr.w   GetCurrentMov
                move.w  d1,d3
                add.w   d3,d3           ; d3.w = move budget (MOV * 2)
                bsr.w   GetCombatantY
                move.w  d2,d0           ; d0.w, d1.w = moving combatant's X,Y coordinates
                bsr.w   BuildMoveString 
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  (a0),d0
                cmpi.b  #-1,d0
                bne.s   @ResolveDestination
                bra.w   @Done           ; early exit if no path found
@ResolveDestination:
                
                clr.w   d0
                move.b  combatant(a6),d0
                bsr.w   GetMoveStringDestination
                move.b  d1,destinationX(a6)
                move.b  d2,destinationY(a6)
                
                move.w  #-1,d3
                bsr.w   UpdateOccupiedByAlliesTerrain ; set flags
                move.b  combatant(a6),d0
                bsr.w   InitializeMovementArrays
                bsr.w   BuildMovementArrays
                move.w  #0,d3
                bsr.w   UpdateOccupiedByAlliesTerrain ; clear flags
                
                ; Find a nearby acceptable attack space
                move.b  destinationX(a6),d1
                move.b  destinationY(a6),d2
                clr.w   d3
                clr.w   d4
                bsr.w   DetermineAttackPosition
                cmpi.b  #-1,d1
                beq.s   @Radius1                ; if it returns -1, try the same with increasingly larger radius offsets
                bra.w   @BuildAttackMoveString  ; otherwise, use that destination
@Radius1:
                
                move.b  destinationX(a6),d1
                move.b  destinationY(a6),d2
                move.w  #1,d3
                move.w  #1,d4
                bsr.w   DetermineAttackPosition
                cmpi.b  #-1,d1
                beq.s   @Radius2
                bra.w   @BuildAttackMoveString
@Radius2:
                
                move.b  destinationX(a6),d1
                move.b  destinationY(a6),d2
                move.w  #2,d3
                move.w  #2,d4
                bsr.w   DetermineAttackPosition
                cmpi.b  #-1,d1
                beq.s   @Radius3
                bra.w   @BuildAttackMoveString
@Radius3:
                
                move.b  destinationX(a6),d1
                move.b  destinationY(a6),d2
                move.w  #3,d3
                move.w  #3,d4
                bsr.w   DetermineAttackPosition
                cmpi.b  #-1,d1
                beq.s   @EndMoveString
                bra.w   @BuildAttackMoveString
@EndMoveString:
                ; Set BATTLE_ENTITY_MOVE_STRING = -1 and return if no acceptable attack space is found
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a0
                move.b  #-1,(a0)
                bra.w   @Done
@BuildAttackMoveString:
                ; Otherwise, build move string leading to attack space
                move.w  d1,d0
                move.w  d2,d1
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   BuildMoveStringForAi
@Done:
                
                unlk    a6
                movem.l (sp)+,d0-a6
                rts

    ; End of function BuildMoveStringForMoveOrder

