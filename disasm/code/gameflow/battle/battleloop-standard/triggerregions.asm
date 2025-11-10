
; ASM FILE code\gameflow\battle\battleloop-standard\triggerregions.asm :
;
; Conceptual Summary:
;   - Regions are decomposed into triangles.
;   - Each ally’s coordinates are tested against triangle edges using
;       relative position, collinearity, and boundedness checks.
;   - If any ally lies inside (including on an edge), the region is marked
;       triggered and linked AI is activated.
;
; Optimization:
;   - Refactored region-trigger scan to single-pass discovery returning
;       newly-triggered bitfield in d3; enemy AI activation now deferred to
;       a separate pass to avoid per-enemy rescans. As a result, worst-case
;       complexity is reduced from O(regions * enemies) to O(regions + enemies).
;   - Simplified the core geometric test output for better readability and
;       for faster evaluation by the caller routine.


; =============== S U B R O U T I N E =======================================

; Iterate through all defined regions for the current battle, calling
;   IsRegionTriggered for each region and updating newly-triggered regions
;   bitfield accordingly.
;
; Out: d3.w = newly-triggered regions bitfield (0 = no new triggers)
;
; Optimization:
;   - Previously this routine performed region-trigger scanning per enemy,
;       which caused redundant scans; now it defers calling
;       ActivateEnemies until after all regions are scanned.


TriggerRegions:
                
                clr.w   d0
                clr.w   d3                  ; clear newly-triggered regions bitfield
                move.w  #BATTLESPRITESET_SUBSECTION_AI_REGIONS,d1
                jsr     GetBattleSpritesetSubsection
                move.w  d1,d7
                move.w  #BATTLE_REGION_FLAGS_START,d1
                bra.s   @EnterLoop
@Loop:
                ; Has region already been activated?
                jsr     CheckFlag
                bne.s   @Next
                
                ; Are any allies positioned within region?
                bsr.s   IsRegionTriggered   ; Out: d6.w = -1 if true
                beq.s   @Next
                
                jsr     SetFlag
                bset    d0,d3               ; update newly-triggered regions bitfield
                
@Next:
                addq.w  #1,d0
                addq.w  #1,d1
                
@EnterLoop:
                dbf     d7,@Loop
                
                rts

    ; End of function TriggerRegions


; =============== S U B R O U T I N E =======================================

; Is AI region indicated by bit d0.w triggered?
; 
; In: a0 = base pointer to regions table, d0.w = region index
;
; Out: d6.w = -1 if any ally inside, else 0


IsRegionTriggered:
                
                movem.l d0-d1/d3/d7-a0,-(sp)
                
                ; Retrieve region definition from the battle spriteset data
                mulu.w  #BATTLESPRITESET_REGION_ENTRY_SIZE,d0
                adda.w  d0,a0
                move.b  (a0),d0
                
                ; Determine region type:
                ;   - Type 3: a triangle (3 points)
                ;   - Type 4: a quadrilateral (4 points, split into two triangles sharing the diagonal 2–4)
                cmpi.b  #3,d0
                bne.s   @Type4
                
                ; Evaluate region Type 3
                move.w  BATTLESPRITESET_REGIONOFFSET_X1_Y1(a0),d2
                move.w  BATTLESPRITESET_REGIONOFFSET_X2_Y2(a0),d3
                move.w  BATTLESPRITESET_REGIONOFFSET_X3_Y3(a0),d4
                bsr.s   AreAnyAlliesInTriangle  ; Out: d6.w = -1 if true
                bra.s   @Done
@Type4:
                ; Evaluate first triangle for region Type 4
                move.w  BATTLESPRITESET_REGIONOFFSET_X1_Y1(a0),d2
                move.w  BATTLESPRITESET_REGIONOFFSET_X2_Y2(a0),d3
                move.w  BATTLESPRITESET_REGIONOFFSET_X4_Y4(a0),d4
                bsr.s   AreAnyAlliesInTriangle  ; Out: d6.w = -1 if true
                bne.s   @Done
                
                ; Evaluate second triangle for region Type 4
                move.w  BATTLESPRITESET_REGIONOFFSET_X3_Y3(a0),d2
                move.w  BATTLESPRITESET_REGIONOFFSET_X2_Y2(a0),d3
                move.w  BATTLESPRITESET_REGIONOFFSET_X4_Y4(a0),d4
                bsr.s   AreAnyAlliesInTriangle  ; Out: d6.w = -1 if true
@Done:
                
                movem.l (sp)+,d0-d1/d3/d7-a0
                rts

    ; End of function IsRegionTriggered


; =============== S U B R O U T I N E =======================================

; Iterate through all allies to check if any are inside the region triangle.
;
; In: d2.w, d3.w, d4.w = packed triangle vertices coordinates (XXYY)
;
; Out: d6.w = -1 if any ally inside, else 0


AreAnyAlliesInTriangle:
                
                clr.w   d0
                move.w  #COMBATANT_ALLIES_COUNTER,d7
@Loop:
                ; Is ally active?
                jsr     GetCombatantX
                move.w  d1,d5
                bmi.s   @Next
                
                jsr     GetCurrentHp
                beq.s   @Next
                
                ; Pack ally's X and Y into a single word -> d5.w
                jsr     GetCombatantY     
                bmi.s   @Next
                
                lsl.w   #BYTE_SHIFT_COUNT,d5
                or.w    d1,d5
                bsr.s   IsAllyInTriangle    ; Out: d6.w = -1 if true
                bne.s   @Return             ; return true
@Next:
                
                addq.w  #1,d0
                dbf     d7,@Loop
                
                clr.w   d6                  ; after all allies are checked, return false
@Return:        rts

    ; End of function AreAnyAlliesInTriangle


; =============== S U B R O U T I N E =======================================

; Test whether a single ally’s position lies inside a triangle defined by
;   three region vertices. This is done by checking the ally’s coordinates
;   against each edge of the triangle using orientation flags.
;
; In: d2.w, d3.w, d4.w = packed triangle vertices coordinates (XXYY)
;                 d5.w = packed ally coordinates
; 
; Out: d6.w = -1 if any ally is inside the triangle, else 0
;
; Notes:
;   - Each edge test calls CheckTestPointPositionRelativeToSegment,
;       which returns a 2-bit flag in d0.
;   - The ally is considered inside if any edge test returns %01, or if the
;       results of each pair of tests are identical.
;
; Optimization:
;   - Convert byte loads to word loads to reduce EXT/LSR patterns and
;       consolidate arithmetic to word-sized ops, which simplifies the
;       code path and reduces instruction count in some inner loops.

positionFlags = -18
combatantY = -16
combatantX = -14
regionY3 = -12
regionX3 = -10
regionY2 = -8
regionX2 = -6
regionY1 = -4
regionX1 = -2

IsAllyInTriangle:
                
                movem.l d0/d2-d4,-(sp)
                link    a6,#-18
                
                ; Extract region vertices coordinates
                move.w  d2,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,regionY1(a6)
                move.w  d2,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.w  d0,regionX1(a6)
                move.w  d3,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,regionY2(a6)
                move.w  d3,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.w  d0,regionX2(a6)
                move.w  d4,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,regionY3(a6)
                move.w  d4,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.w  d0,regionX3(a6)
                
                ; Extract ally's coordinates
                move.w  d5,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,combatantY(a6)
                move.w  d5,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.w  d0,combatantX(a6)
; ---------------------------------------------------------------------------

                ; Test edge (vertex1 -> vertex2) against ally position
                move.w  regionX1(a6),d1
                move.w  regionY1(a6),d2
                move.w  regionX2(a6),d3
                move.w  regionY2(a6),d4
                move.w  combatantX(a6),d5
                move.w  combatantY(a6),d6
                bsr.w   CheckTestPointPositionRelativeToSegment
                
                beq.s   @ReturnInside       ; immediately return d6.w = -1 (inside) if CCR zero-bit is set
                bmi.s   @ReturnOutside      ; immediately return d6.w = 0 (outside) if CCR negative-bit is set
                
                ; Otherwise, test edge against vertex3
                move.w  d0,positionFlags(a6)
                move.w  regionX3(a6),d5
                move.w  regionY3(a6),d6
                bsr.w   CheckTestPointPositionRelativeToSegment
                cmp.w   positionFlags(a6),d0
                bne.s   @ReturnOutside      ; return d6.w = 0 (outside) if results of tests differ (ally and vertex3 are on opposite sides)
; ---------------------------------------------------------------------------

                ; Test edge (vertex3 -> vertex1)
                move.w  regionX3(a6),d1
                move.w  regionY3(a6),d2
                move.w  regionX1(a6),d3
                move.w  regionY1(a6),d4
                move.w  combatantX(a6),d5
                move.w  combatantY(a6),d6
                bsr.s   CheckTestPointPositionRelativeToSegment
                
                ; Same logic as above
                beq.s   @ReturnInside
                bmi.s   @ReturnOutside
                
                ; Test against vertex2
                move.w  d0,positionFlags(a6)
                move.w  regionX2(a6),d5
                move.w  regionY2(a6),d6
                bsr.s   CheckTestPointPositionRelativeToSegment
                cmp.w   positionFlags(a6),d0
                bne.s   @ReturnOutside
; ---------------------------------------------------------------------------

                ; Test edge (vertex3 -> vertex2)
                move.w  regionX3(a6),d1
                move.w  regionY3(a6),d2
                move.w  regionX2(a6),d3
                move.w  regionY2(a6),d4
                move.w  combatantX(a6),d5
                move.w  combatantY(a6),d6
                bsr.s   CheckTestPointPositionRelativeToSegment
                
                ; Same logic as above
                beq.s   @ReturnInside
                bmi.s   @ReturnOutside
                
                ; Test against vertex1
                move.w  d0,positionFlags(a6)
                move.w  regionX1(a6),d5
                move.w  regionY1(a6),d6
                bsr.s   CheckTestPointPositionRelativeToSegment
                cmp.w   positionFlags(a6),d0
                bne.s   @ReturnOutside
; ---------------------------------------------------------------------------

@ReturnInside:
                moveq   #-1,d6
                bra.s   @Done
                
@ReturnOutside:
                clr.w   d6
                
@Done:
                unlk    a6
                movem.l (sp)+,d0/d2-d4
                rts

    ; End of function IsAllyInTriangle


; =============== S U B R O U T I N E =======================================

; Core geometric test called by IsAllyInTriangle.
;
; Determine the relative position of a test point C with respect to a line
;   segment A–B, then return a 2-bit flag encoding whether the point is
;   above/left, below/right , or collinear with the segment.
;
; In: d1.w, d2.w = XA, YA (segment point A)
;     d3.w, d4.w = XB, YB (segment point B)
;     d5.w, d6.w = XC, YC (test point C)
;
; Out: d0.w = 0 -> Test point is collinear and within segment bounds
;             1 -> Test point is positioned above or to the left of segment line A-B
;             2 -> Test point is positioned below or to the right
;            -1 -> Test point is collinear but out-of-bounds, or an exception is thrown (Yproj/Xproj is negative or degenerate triangle detected)
;
;      CCR zero-bit set causes caller to immediately return "inside"
;      CCR negative-bit set causes caller to immediately return "outside"
;
; Method:
;   1. Calculate vertical and horizontal distances between A and B,
;        then choose a path according to the dominant axis:
;        - If segment is wider than tall or same -> horizontal path
;        - Else -> vertical path
;   2. Project the line A–B onto the dominant axis at the test point’s
;      coordinate (XC or YC).
;        - If segment bounds are overlapping, return %11 (exception)
;   3. Compare projected coordinate with the test point’s actual coordinate:
;        - Equal -> collinear, proceed to boundedness check
;        - Not equal -> return either $00 (above/left) or %10 (below/right)
;   4. Boundedness check:
;        - Ensure the test point lies between A and B along the dominant axis.
;        - If so, return %01 (collinear in-bounds).
;        - If not, return %10 (collinear but out-of-bounds).

YC = -12
XC = -10
YB = -8
XB = -6
YA = -4
XA = -2

CheckTestPointPositionRelativeToSegment:
                
                movem.l d1-d6,-(sp)
                link    a6,#-12
                
                move.w  d1,XA(a6)       ; XA, YA: segment point A
                move.w  d2,YA(a6)
                move.w  d3,XB(a6)       ; XB, YB: segment point B
                move.w  d4,YB(a6)
                move.w  d5,XC(a6)       ; XC, YC: test point C
                move.w  d6,YC(a6)
                
                ; ------------------------------------------------------------
                ; 1. Determine dominant axis path
                ; ------------------------------------------------------------
                
                ; Calculate vertical distance between segment points A and B -> d0.w
                move.w  YA(a6),d1
                move.w  YB(a6),d0
                sub.w   d1,d0
                bpl.s   @CalculateHorizontalDistance
                neg.w   d0
                
@CalculateHorizontalDistance:
                ; Calculate horizontal distance -> d1.w
                move.w  XA(a6),d2
                move.w  XB(a6),d1
                sub.w   d2,d1
                bpl.s   @DetermineSegmentOrientation
                neg.w   d1
                
@DetermineSegmentOrientation:
                ; Is segment A-B is taller than it is wide?
                cmp.w   d0,d1
                blo.w   @VerticalPath   ; branch to vertical path if so
; ---------------------------------------------------------------------------
                
                ; ------------------------------------------------------------
                ; HORIZONTAL-DOMINANT PATH
                ;
                ; 2. Project line A–B at the XC position into Yproj -> d0.w
                ; ------------------------------------------------------------
                
                ; Calculate vertical delta between segment points B and A -> d0.w
                move.w  YB(a6),d0
                move.w  YA(a6),d1
                sub.w   d1,d0
                move.w  d0,d6
                
                ; Calculate horizontal delta between segment point B and test point C -> d1.w
                move.w  XB(a6),d1
                move.w  XC(a6),d0
                sub.w   d1,d0
                muls.w  d0,d6                       ; d6.w = ΔyBA * ΔxCB
                
                ; Calculate horizontal delta between B and A -> d0.w
                move.w  XB(a6),d0
                move.w  XA(a6),d1
                sub.w   d1,d0
                beq.s   @VerticalPath               ; branch to vertical path avoid a division by 0
                
                ; Calculate horizontal slope factor
                divs.w  d0,d6                       ; d6.w = (ΔyBA * ΔxCB) / ΔxBA
                
                move.w  YB(a6),d0
                add.w   d6,d0                       ; d0.w = Yproj
                bmi.w   @ReturnOutOfBounds          ; return d0 = -1 if Yproj is negative
                
                ; ------------------------------------------------------------
                ; 3. Check collinearity in Y
                ;
                ; If YC and Yproj are equal, the test point is exactly on the
                ;   infinite line through A–B at XC.
                ; ------------------------------------------------------------
                
                move.w  YC(a6),d1
                sub.w   d1,d0
                bhi.w   @ReturnAboveOrLeft                  ; return d0 = 1 if YC is above Yproj
                blo.w   @ReturnBelowOrRight                 ; return d0 = 2 if YC is below Yproj
                                                            ; otherwise, continue to boundedness checks
                
                ; ------------------------------------------------------------
                ; 4. Check boundedness along X (is XC betwwen XA and XB?)
                ;
                ; This ensures the point lies within the segment points,
                ;   not merely on the infinite line.
                ; ------------------------------------------------------------
                
                ; Is B right of A?
                move.w  XA(a6),d0
                move.w  XB(a6),d1
                cmp.w   d1,d0
                blo.s   @IsCtoTheRightOfB                   ; branch to "Is C right of B?" check if so
                
                ; (A is right of B) Is C right of A?
                move.w  XC(a6),d1
                cmp.w   d1,d0
                blo.w   @ReturnOutOfBounds                  ; return d0 = -1 (out-of-bounds) if C is right of BA
                
                ; (A is right of BC) Is B right of C?
                move.w  XC(a6),d0
                move.w  XB(a6),d1
                cmp.w   d1,d0
                blo.w   @ReturnOutOfBounds                  ; return d0 = -1 if BA is right of C
                
                ; C is positioned between A and B along X
                bra.w   @ReturnCollinearInBounds            ; return d0 = 0 (collinear in-bounds)
                
@IsCtoTheRightOfB:
                ; (B is right of A) Is C right of B?
                move.w  XB(a6),d0
                move.w  XC(a6),d1
                cmp.w   d1,d0
                blo.w   @ReturnOutOfBounds                  ; return d0 = -1 if C is right of AB
                
                ; (B is right of AC) Is A right of C?
                move.w  XC(a6),d0
                move.w  XA(a6),d1
                cmp.w   d1,d0
                blo.w   @ReturnOutOfBounds                  ; return d0 = -1 if AB is right of C
                
                ; C is positioned  between B and A along X
                bra.w   @ReturnCollinearInBounds            ; return d0 = 0
; ---------------------------------------------------------------------------

                ; ------------------------------------------------------------
                ; VERTICAL-DOMINANT PATH
                ;
                ; 2. Project line A–B at the YC position into Xproj -> d0.w
                ; ------------------------------------------------------------
@VerticalPath:
                ; Calculate horizontal delta between segment points B and A -> d0.w
                move.w  XB(a6),d0
                move.w  XA(a6),d1
                sub.w   d1,d0
                move.w  d0,d6
                
                ; Calculate vertical delta between test point C and segment point B -> d1.w
                move.w  YC(a6),d0
                move.w  YB(a6),d1
                sub.w   d1,d0
                muls.w  d0,d6                       ; d6.w = ΔxBA * ΔyCB
                
                ; Calculate vertical delta between B and A -> d0.w
                move.w  YB(a6),d0
                move.w  YA(a6),d1
                sub.w   d1,d0
                beq.s   @ReturnOutOfBounds          ; return d0 = -1 if ΔyBA = 0 (vertically aligned)
                
                ; Calculate vertical slope factor
                divs.w  d0,d6                       ; d6.w = (ΔxBA * ΔyCB) / ΔyBA
                
                move.w  XB(a6),d0
                add.w   d6,d0                       ; d0.w = Xproj
                bmi.s   @ReturnOutOfBounds          ; return d0 = -1 if Xproj is negative
                
                ; ------------------------------------------------------------
                ; 3. Check collinearity in X
                ;
                ; If XC and Xproj are equal, the test point is exactly on the
                ;   infinite line through A–B at YC.
                ; ------------------------------------------------------------
                
                move.w  XC(a6),d1
                sub.w   d1,d0
                bhi.s   @ReturnAboveOrLeft                  ; return d0 = 1 if XC is to the left
                blo.s   @ReturnBelowOrRight                 ; return d0 = 2 if XC is to the right of Xproj
                                                            ; otherwise, continue to boundedness checks
                
                ; ------------------------------------------------------------
                ; 4. Check boundedness along X
                ; ------------------------------------------------------------
                
                ; Is B below A?
                move.w  YA(a6),d0
                move.w  YB(a6),d1
                cmp.w   d1,d0
                blo.s   @IsCBelowB                          ; branch to "Is C below B?" check if so
                
                ; (A is below B) Is C below A?
                move.w  YC(a6),d1
                cmp.w   d1,d0
                blo.s   @ReturnOutOfBounds                  ; return d0 = -1 (out-of-bounds) if C is below AB
                
                ; (A is below BC) Is B below C?
                move.w  YC(a6),d0
                move.w  YB(a6),d1
                cmp.w   d1,d0
                blo.s   @ReturnOutOfBounds                  ; return d0 = -1 if AB is below C
                bra.s   @ReturnCollinearInBounds            ; otherwise, return d0 = 0 (collinear in-bounds)
                
@IsCBelowB:
                ; (B is below A) Is C below B?
                move.w  YB(a6),d0
                move.w  YC(a6),d1
                cmp.w   d1,d0
                blo.s   @ReturnOutOfBounds                  ; return d0 = -1 if C is below BA
                
                ; (B is below AC) Is A below C?
                move.w  YC(a6),d0
                move.w  YA(a6),d1
                cmp.w   d1,d0
                blo.s   @ReturnOutOfBounds                  ; return d0 = -1 if BA is below C
                                                            ; otherwise, return d0 = 0
; ---------------------------------------------------------------------------

@ReturnCollinearInBounds:
                moveq   #0,d0           ; return d0 = 0 if test point is collinear and within segment bounds
                bra.s   @Done
                
@ReturnAboveOrLeft:
                moveq   #1,d0           ; return d0 = 1 if positioned above or left of segment line A-B
                bra.s   @Done
                
@ReturnBelowOrRight:
                moveq   #2,d0           ; return d0 = 2 if positioned below or right
                bra.s   @Done
                
@ReturnOutOfBounds:
                moveq   #-1,d0          ; return d0 = -1 if test point is out-of-bounds, or if negative Yproj/Xproj or degenerate triangle exception
                
@Done:          unlk    a6
                movem.l (sp)+,d1-d6
                rts

    ; End of function CheckTestPointPositionRelativeToSegment

