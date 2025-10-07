
; ASM FILE code\gameflow\battle\ai\movementhelperfunctions.asm :
; 0x1AC38E..0x1AC8A0 : AI engine : Move and Move Order commands helper functions
;
; Determine preferred quadrant, mark/clear obstruction regions to bias pathfinding.

; =============== S U B R O U T I N E =======================================

; Determine quadrant bias and produce rectangular bounds toward AI move order point,
;   along with destination X,Y coordinates.
; 
; In: d0.b = moving combatant index
; 
; Out: d1.b = quadrant flags (bit 0 = target to right, bit 1 = target below)
;      d3.w,d4.w = destination X,Y toward AI point, +/-4 spaces from starting position


DetermineAiMoveOrderQuadrant:
                
                movem.l d0/d5-a6,-(sp)
                jsr     j_GetCombatantX
                move.w  d1,d3           ; d3.w = combatant X position
                jsr     j_GetCombatantY
                move.w  d1,d4           ; d4.w = combatant Y position
                
                ; Choose primary order if present else secondary (move order code placed in d0.b)
                jsr     j_GetAiMoveOrders
                cmpi.b  #AIORDER_NONE,d1
                bne.s   @ChoosePrimaryMoveOrder
                
                cmpi.b  #AIORDER_NONE,d2
                bne.s   @ChooseSecondaryMoveOrder
                
                move.b  #AIORDER_NONE,d1
                bra.w   @ReturnInfo     
                bra.s   @loc2           ; unreachable code
@ChooseSecondaryMoveOrder:
                
                move.b  d2,d0
@loc2:
                
                bra.s   @loc4
@ChoosePrimaryMoveOrder:
                
                move.b  d1,d0
@loc4:
                
                ; d0.b = chosen move order entry
                btst    #AIORDER_BIT_MOVE_TO,d0
                bne.s   @CheckAiPointPosition
                
                ; If not ordered to move to an AI point, check follow target's HP
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   @CheckAiPointPosition
                
                move.w  #-1,d5          ; return d1.b = -1 if follow target is dead
                bra.w   @ReturnInfo     
@CheckAiPointPosition:
                
                jsr     GetAiMoveOrderPosition
                clr.w   d5
                cmp.w   d3,d1
                bge.s   @IsAiPointAboveCombatant
                
                bset    #0,d5           ; set bit 0 if AI point is to the right of moving combatant
@IsAiPointAboveCombatant:
                
                cmp.w   d4,d2
                blt.s   @ExpandBoundAlongX
                
                bset    #1,d5           ; set bit 1 if AI point is above moving combatant
@ExpandBoundAlongX:
                
                btst    #0,d5
                bne.s   @ExpandToTheRight
                
                subi.w  #4,d3           ; expand rectangular bounds to the left by 4 spaces if bit 0 is clear
                tst.w   d3
                bpl.s   @Goto_ExpandBoundAlongX
                
                clr.w   d3              ; clamp to 0
@Goto_ExpandBoundAlongX:
                
                bra.s   @ExpandBoundAlongY
@ExpandToTheRight:
                
                addi.w  #4,d3           ; otherwise, expand rectangular bounds to the right by 4 spaces
                cmpi.w  #MAP_MAX_X,d3
                ble.s   @ExpandBoundAlongY
                
                move.w  #MAP_MAX_X,d3   ; cap to MAP_MAX_X
@ExpandBoundAlongY:
                
                btst    #1,d5
                beq.s   @ExpandDownward 
                
                subi.w  #4,d4           ; expand rectangular bounds upward by 4 spaces if bit 1 is set
                tst.w   d4
                bpl.s   @Goto_ReturnInfo
                
                clr.w   d4
@Goto_ReturnInfo:
                
                bra.s   @ReturnInfo     
@ExpandDownward:
                
                addi.w  #4,d4           ; otherwise, expand rectangular bounds downward by 4 spaces
                cmpi.w  #MAP_MAX_Y,d4
                ble.s   @ReturnInfo     
                
                move.w  #MAP_MAX_Y,d4
@ReturnInfo:
                
                move.b  d5,d1           ; return d1.b = d5.b (quadrant flags)
                movem.l (sp)+,d0/d5-a6
                rts

    ; End of function DetermineAiMoveOrderQuadrant


; =============== S U B R O U T I N E =======================================

; Mark terrain spaces that are obstructed and non-movable as blocked.
; 
; In: d0.w = moving combatant index
; 
; Effect: For move orders where the AI should avoid areas that are not
;   traversable by pathfinder, mark those tiles as additionally obstructed
;   to bias pathfinding away from them.
; 
; Note: This function temporarily modifies BATTLE_TERRAIN_ARRAY obstruction bits.
;   Always call ClearAllTemporaryObstructionFlags before/after path calculations.


BlockNonMovableSpacesAroundDestination:
                
                movem.l d0-a6,-(sp)
                move.b  d0,d7           ; save combatant index
                jsr     j_GetAiMoveOrders
                cmpi.b  #AIORDER_NONE,d1
                bne.s   @CheckMoveOrderType
                bra.w   @Done
                bra.s   @loc2           ; unreachable code
@CheckMoveOrderType:
                
                move.b  d1,d0           ; d0.w = AI move order
@loc2:
                
                btst    #AIORDER_BIT_MOVE_TO,d0
                bne.s   @Continue       ; continue is ordered to move into position
                
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   @Continue       ; continue if follow target is alive
                bra.w   @Done
@Continue:
                
                jsr     GetAiMoveOrderPosition
                clr.l   d5
                clr.l   d6
                move.w  d1,d5
                move.w  d2,d6           ; d5.w,d6.w = destination X,Y
                
                move.w  d7,d0           ; restore combatant index
                jsr     j_InitializeMovementArrays
                move.w  d5,d3
                move.w  d6,d4
                jsr     j_PopulateMovementArrays
                
                ; Iterate the entire terrain array rows and columns
                move.w  #TERRAIN_ARRAY_ROWS_COUNTER,d4
                move.w  #0,d2
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
                lea     (FF4D00_LOADING_SPACE).l,a1 ; Movable grid array (0 = movable space, -1 = not movable)
@OuterLoop:
                
                move.w  #TERRAIN_ARRAY_COLUMNS_COUNTER,d3
                move.w  #0,d1
@InnerLoop:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                bne.s   @IsMovableSpace 
                bra.w   @NextSpace      ; skip if space is impassable
@IsMovableSpace:
                
                move.l  d3,-(sp)        ; otherwise, check corresponding movable-grid entry
                move.w  d0,d3
                move.b  (a1,d1.w),d0
                btst    #7,d0
                beq.s   @SkipMovableSpace ; skip if space is movable
                
                move.w  d3,d0
                bset    #7,d0           ; otherwise, set obstruction flag
                bset    #6,d0
                move.b  d0,(a0,d1.w)
@SkipMovableSpace:
                
                move.l  (sp)+,d3
@NextSpace:
                
                addi.w  #1,d1
                dbf     d3,@InnerLoop
                
                adda.w  #TERRAIN_ARRAY_OFFSET_NEXT_ROW,a0
                adda.w  #TERRAIN_ARRAY_OFFSET_NEXT_ROW,a1
                addi.w  #1,d2
                dbf     d4,@OuterLoop
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function BlockNonMovableSpacesAroundDestination


; =============== S U B R O U T I N E =======================================

; Mark entire terrain obstructed then carve small allowed patterns around AI point.
; 
; In: d0.w = moving combatant index
; 
; Effect: Aggressively block movement everywhere, then selectively opens small patterns
;   around the order point (or tether target) to force a very constrained movement behavior.
; 
; Note: This function temporarily modifies BATTLE_TERRAIN_ARRAY obstruction bits.
;   Always call ClearAllTemporaryObstructionFlags before/after path calculations.


BlockAndCarveAroundDestination:
                
                movem.l d0-a6,-(sp)
                move.b  d0,d7           ; d7.b = copy of combatant
                clr.w   d1
                move.b  d0,d1           ; d1.b = copy of combatant
                
                ; Look up AI_LAST_TARGET_TABLE for last target
                lea     (AI_LAST_TARGET_TABLE).l,a0
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d1
                move.b  (a0,d1.w),d1
                cmpi.b  #-1,d1
                beq.s   @CheckSpecialMoveOrders
                
                ; If found, take tethered target path and return
                bsr.w   BlockAndCarveForTetheredTarget
                bra.w   @Done
@CheckSpecialMoveOrders:
                
                move.w  d7,d0
                jsr     j_GetAiMoveOrders
                cmpi.b  #AIORDER_NONE,d1
                bne.s   @CheckMoveOrderType
                
                bra.w   @Done           ; done if no special move orders
                bra.s   @loc3           ; unreachable code
@CheckMoveOrderType:
                
                move.b  d1,d0
@loc3:
                
                btst    #AIORDER_BIT_MOVE_TO,d0
                bne.s   @Continue       ; continue is ordered to move to AI point
                
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   @Continue       ; otherwise, continue if follow target is alive
                bra.w   @Done
@Continue:
                
                jsr     GetAiMoveOrderPosition
                move.w  d1,d5
                move.w  d2,d6           ; d5.w,d6.w = destination X,Y
                
                ; Iterate the entire terrain array rows and columns
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
                move.w  #TERRAIN_ARRAY_ROWS_COUNTER,d4
@OuterLoop:
                
                move.w  #TERRAIN_ARRAY_COLUMNS_COUNTER,d3
                move.w  #0,d1
@InnerLoop:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                bne.s   @SetFlags
                bra.w   @Next
@SetFlags:
                
                ; Set bits 7 and 6 (mark obstructed) for all non -1 spaces (this blocks the entire map area except -1)
                bset    #7,d0
                bset    #6,d0
                move.b  d0,(a0,d1.w)
@Next:
                
                addi.w  #1,d1
                dbf     d3,@InnerLoop
                
                adda.w  #TERRAIN_ARRAY_OFFSET_NEXT_ROW,a0
                dbf     d4,@OuterLoop
                
                ; Clear small pockets around the destination
                lea     list_Radius0(pc), a0
                nop
                bsr.w   ClearObstructionFlagsAroundDestination
                lea     list_Radius1(pc), a0
                nop
                bsr.w   ClearObstructionFlagsAroundDestination
                lea     list_Radius2(pc), a0
                nop
                bsr.w   ClearObstructionFlagsAroundDestination
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function BlockAndCarveAroundDestination


; =============== S U B R O U T I N E =======================================

; Tethered-to-last-target variant: mark terrain and carve concentric allowed
;   patterns around last target.
; 
; In: d0.w = combatant index
; 
; Note: This function temporarily modifies BATTLE_TERRAIN_ARRAY obstruction bits.
;   Always call ClearAllTemporaryObstructionFlags before/after path calculations.


BlockAndCarveForTetheredTarget:
                
                movem.l d0-a6,-(sp)
                move.b  d0,d7
                jsr     j_GetAiMoveOrders
                cmpi.b  #AIORDER_NONE,d1
                bne.s   @CheckMoveOrderType
                
                bra.w   @Done
                bra.s   @loc2           ; unreachable code
@CheckMoveOrderType:
                
                move.b  d1,d0
@loc2:
                
                btst    #AIORDER_BIT_MOVE_TO,d0
                bne.s   @Continue
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   @Continue
                bra.w   @Done
@Continue:
                
                bsr.w   GetAiMoveOrderPosition
                move.w  d1,d5
                move.w  d2,d6
                move.w  #TERRAIN_ARRAY_ROWS_COUNTER,d4
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
@OuterLoop:
                
                move.w  #TERRAIN_ARRAY_COLUMNS_COUNTER,d3
                move.w  #0,d1
@InnerLoop:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                bne.s   @SetFlags       
                bra.w   @NextSpace
@SetFlags:
                
                bset    #7,d0           ; set obstruction flags
                bset    #6,d0
                move.b  d0,(a0,d1.w)
@NextSpace:
                
                addi.w  #1,d1
                dbf     d3,@InnerLoop
                
                adda.w  #TERRAIN_ARRAY_OFFSET_NEXT_ROW,a0
                dbf     d4,@OuterLoop
                
                lea     list_Radius0(pc), a0
                nop
                bsr.w   ClearObstructionFlagsAroundDestination
                lea     list_Radius1(pc), a0
                nop
                bsr.w   ClearObstructionFlagsAroundDestination
                lea     list_Radius2(pc), a0
                nop
                bsr.w   ClearObstructionFlagsAroundDestination
                lea     list_Radius3(pc), a0
                nop
                bsr.w   ClearObstructionFlagsAroundDestination
                lea     list_Radius4(pc), a0
                nop
                bsr.w   ClearObstructionFlagsAroundDestination
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function BlockAndCarveForTetheredTarget


; =============== S U B R O U T I N E =======================================

; Clear temporary obstruction bits 6 and 7 for entire battle terrain array.


ClearAllTemporaryObstructionFlags:
                
                movem.l d0-a6,-(sp)
                move.w  #TERRAIN_ARRAY_ROWS_COUNTER,d4
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
@OuterLoop:
                
                move.w  #TERRAIN_ARRAY_COLUMNS_COUNTER,d3
                move.w  #0,d1
@InnerLoop:
                
                move.b  (a0,d1.w),d0
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                bne.s   @ClearFlags
                bra.w   @Next
@ClearFlags:
                
                bclr    #7,d0
                bclr    #6,d0
                move.b  d0,(a0,d1.w)
@Next:
                
                addi.w  #1,d1
                dbf     d3,@InnerLoop
                
                adda.w  #TERRAIN_ARRAY_OFFSET_NEXT_ROW,a0
                dbf     d4,@OuterLoop
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ClearAllTemporaryObstructionFlags


; =============== S U B R O U T I N E =======================================

; Call DetermineAiMoveOrderQuadrant and apply MarkTerrainRectangleObstructed
;   with permutations to mark regions.
; 
; In: d0.b = moving combatant index


ApplyQuadrantTerrainMarking:
                
                movem.l d0-a6,-(sp)
                clr.l   d7
                move.b  d0,d7           ; save combatant index
                bsr.w   DetermineAiMoveOrderQuadrant
                clr.l   d6
                clr.l   d5
                move.b  d1,d5           ; save quadrant flags
                
                ; If AI point is down/left: call MarkTerrainRectangleObstructed with d1 = [1,2,3] in turn
                tst.b   d5
                bne.s   @CheckDownRight
                
                move.b  #1,d1
                bsr.w   MarkTerrainRectangleObstructed
                move.b  #2,d1
                bsr.w   MarkTerrainRectangleObstructed
                move.b  #3,d1
                bsr.w   MarkTerrainRectangleObstructed
@CheckDownRight:
                
                ; Else, if AI point is down/right: call with with order [0,2,3]
                cmpi.b  #1,d5
                bne.s   @CheckUpRight
                
                move.b  #0,d1
                bsr.w   MarkTerrainRectangleObstructed
                move.b  #2,d1
                bsr.w   MarkTerrainRectangleObstructed
                move.b  #3,d1
                bsr.w   MarkTerrainRectangleObstructed
@CheckUpRight:
                
                ; Else, if AI point is up/right: call with with order [0,1,3]
                cmpi.b  #%11,d5
                bne.s   @CheckUpLeft
                
                move.b  #0,d1
                bsr.w   MarkTerrainRectangleObstructed
                move.b  #1,d1
                bsr.w   MarkTerrainRectangleObstructed
                move.b  #3,d1
                bsr.w   MarkTerrainRectangleObstructed
@CheckUpLeft:
                
                ; Else, if AI point is up/left: call with with order [0,1,2]
                cmpi.b  #%10,d5
                bne.s   @Done
                
                move.b  #0,d1
                bsr.w   MarkTerrainRectangleObstructed
                move.b  #1,d1
                bsr.w   MarkTerrainRectangleObstructed
                move.b  #2,d1
                bsr.w   MarkTerrainRectangleObstructed
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ApplyQuadrantTerrainMarking


; =============== S U B R O U T I N E =======================================

; Mark rectangle in BATTLE_TERRAIN_ARRAY by setting obstruction bits 6 and 7.
; 
; In: a0 = pointer to BATTLE_TERRAIN_ARRAY
;     d1.b = selection code 0..3 (determines which corner/pair becomes min/max)
;     d3.w,d4.w = corner coordinates X,Y toward AI point

bottomY = -4
topY = -3
rightX = -2
leftX = -1

MarkTerrainRectangleObstructed:
                
                movem.l d0-a6,-(sp)
                link    a6,#-4
                move.w  d3,d6           ; d6.w = max attack range copy
                move.w  d4,d7           ; d7.w = min attack range copy
                
                ; Is top/right quadrant?
                cmpi.b  #0,d1
                bne.s   @IsTopLeftQuadrant
                
                move.b  #MAP_MIN_Y,leftX(a6) ; top edge
                move.b  d7,rightX(a6)   ; bottom edge
                move.b  d6,topY(a6)     ; left edge
                move.b  #MAP_MAX_X,bottomY(a6) ; right edge
@IsTopLeftQuadrant:
                
                cmpi.b  #1,d1
                bne.s   @IsBottomLeftQuadrant
                
                move.b  #MAP_MIN_Y,leftX(a6)
                move.b  d7,rightX(a6)
                move.b  #MAP_MIN_X,topY(a6)
                move.b  d6,bottomY(a6)
@IsBottomLeftQuadrant:
                
                cmpi.b  #2,d1
                bne.s   @IsBottomRightQuadrant
                
                move.b  d7,leftX(a6)
                move.b  #MAP_MAX_Y,rightX(a6)
                move.b  #MAP_MIN_X,topY(a6)
                move.b  d6,bottomY(a6)
@IsBottomRightQuadrant:
                
                cmpi.b  #3,d1
                bne.s   @CalculateRectangleSize
                
                move.b  d7,leftX(a6)
                move.b  #MAP_MAX_Y,rightX(a6)
                move.b  d6,topY(a6)
                move.b  #MAP_MAX_X,bottomY(a6)
@CalculateRectangleSize:
                
                clr.w   d4
                move.b  rightX(a6),d4
                sub.b   leftX(a6),d4
                ext.w   d4
                lea     (BATTLE_TERRAIN_ARRAY).l,a0
                move.b  leftX(a6),d2
                ext.w   d2
@OuterLoop:
                
                ; For each row...
                move.b  topY(a6),d1
                ext.w   d1
                move.b  bottomY(a6),d3
                sub.b   topY(a6),d3
                ext.w   d3
@InnerLoop:
                
                ; ...and for each column, convert coordinates to address
                movea.l a0,a1
                move.l  d2,-(sp)
                mulu.w  #MAP_SIZE_MAX_TILEWIDTH,d2
                adda.w  d2,a1
                move.l  (sp)+,d2
                
                ; Load byte from array
                move.b  (a1,d1.w),d0
                cmpi.b  #-1,d0          ; skip if entry = -1
                beq.s   @NextSpace
                
                bset    #7,d0           ; otherwise, set bits 6 and 7
                bset    #6,d0
                move.b  d0,(a1,d1.w)
@NextSpace:
                
                addi.w  #1,d1
                dbf     d3,@InnerLoop
                
                addi.w  #1,d2
                dbf     d4,@OuterLoop
                
                unlk    a6
                movem.l (sp)+,d0-a6
                rts

    ; End of function MarkTerrainRectangleObstructed


; =============== S U B R O U T I N E =======================================

; Clear obstruction bits for a short list of relative coordinates around AI point.
; 
; In: a0 = pointer to relative coordinates list (first byte = count, followed by pairs relX,relY)
;     d5.w,d6.w = center position X,Y


ClearObstructionFlagsAroundDestination:
                
                movem.l d0-a1,-(sp)
                clr.w   d7
                move.b  (a0)+,d7
                subq.w  #1,d7
@Loop:
                
                ; Calculate absolute Y = d6 + relY
                move.w  d6,d2
                add.b   1(a0),d2
                cmpi.w  #MAP_SIZE_MAX_TILEHEIGHT,d2 ; check < MAP_SIZE_MAX_TILEHEIGHT
                bcc.w   @Next
                
                ; Calculate absolute X = d5 + relX
                move.w  d5,d1
                add.b   (a0),d1
                cmpi.w  #MAP_SIZE_MAX_TILEWIDTH,d1 ; check < MAP_SIZE_MAX_TILEWIDTH
                bcc.w   @Next
                
                ; Call GetTerrain if inside map bounds
                jsr     j_GetTerrain
                cmpi.b  #TERRAIN_OBSTRUCTED,d0
                beq.s   @Next
                
                bclr    #7,d0           ; clear obstructed flags if space is not impassable
                bclr    #6,d0
                jsr     j_SetTerrain
@Next:
                
                addq.l  #2,a0
                dbf     d7,@Loop
                
                movem.l (sp)+,d0-a1
                rts

    ; End of function ClearObstructionFlagsAroundDestination

list_Radius0:   dc.b 1                  ; AI command : Move Order-related relative coordinates lists
                dc.b 0, 0
                
list_Radius1:   dc.b 4
                dc.b 0, 1
                dc.b 1, 0
                dc.b 0, -1
                dc.b -1, 0
                
list_Radius2:   dc.b 8
                dc.b 0, -2
                dc.b -1, -1
                dc.b -2, 0
                dc.b -1, 1
                dc.b 0, 2
                dc.b 1, 1
                dc.b 2, 0
                dc.b 1, -1
                
list_Radius3:   dc.b 12
                dc.b 0, -3
                dc.b -1, -2
                dc.b -2, -1
                dc.b -3, 0
                dc.b -2, 1
                dc.b -1, 2
                dc.b 0, 3
                dc.b 1, 2
                dc.b 2, 1
                dc.b 3, 0
                dc.b 2, -1
                dc.b 1, -2
                
list_Radius4:   dc.b 16
                dc.b 0, -4
                dc.b -1, -3
                dc.b -2, -2
                dc.b -3, -1
                dc.b -4, 0
                dc.b -3, 1
                dc.b -2, 2
                dc.b -1, 3
                dc.b 0, 4
                dc.b 1, 3
                dc.b 2, 2
                dc.b 3, 1
                dc.b 4, 0
                dc.b 3, -1
                dc.b 2, -2
                dc.b 1, -3
                
                align
