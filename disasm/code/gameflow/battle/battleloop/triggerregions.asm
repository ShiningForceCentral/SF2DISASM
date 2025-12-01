
; ASM FILE code\gameflow\battle\battleloop\triggerregions.asm :
; 0x1AC9FC..0x1ACF30 : Battle regions trigger and enemy AI update functions
;
; Conceptual Summary:
;   - Regions are decomposed into triangles.
;   - Each ally’s coordinates are tested against triangle edges using
;       relative position, collinearity, and boundedness checks.
;   - If any ally lies inside (including on an edge), the region is marked
;       triggered and linked AI is activated.


; =============== S U B R O U T I N E =======================================

; Is battle region indicated by bit d0.b triggered?
; 
; In: d0.b = region index  Out: d1.w = -1 if true


IsRegionTriggered:
                
                movem.l d0/d2-a6,-(sp)
                
                ; Validate region index
                cmpi.b  #-1,d0
                bne.s   @Continue
                
                clr.w   d6
                bra.w   @ReturnInfo
@Continue:
                ; Retrieve region definition from the battle spriteset data
                move.w  d0,d7           ; d7.w = region index copy
                move.b  #BATTLESPRITESET_SUBSECTION_AI_REGIONS,d1
                bsr.w   GetBattleSpritesetSubsection
                cmp.b   d1,d7
                ble.s   @GetEntryAddress
                bra.w   @ReturnInfo     ; if the index exceeds the number of defined regions,
                                        ; return without triggering (prevents reading past the region table)
@GetEntryAddress:
                
                move.w  d7,d0
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
                bsr.w   AreAnyAlliesInTriangle
                bra.s   @ReturnInfo
@Type4:
                ; Evaluate first triangle for region Type 4
                move.w  BATTLESPRITESET_REGIONOFFSET_X1_Y1(a0),d2
                move.w  BATTLESPRITESET_REGIONOFFSET_X2_Y2(a0),d3
                move.w  BATTLESPRITESET_REGIONOFFSET_X4_Y4(a0),d4
                bsr.w   AreAnyAlliesInTriangle
                cmpi.b  #0,d6
                beq.s   @SecondTriangle
                bra.w   @ReturnInfo
@SecondTriangle:
                ; Evaluate second triangle for region Type 4
                move.w  BATTLESPRITESET_REGIONOFFSET_X3_Y3(a0),d2
                move.w  BATTLESPRITESET_REGIONOFFSET_X2_Y2(a0),d3
                move.w  BATTLESPRITESET_REGIONOFFSET_X4_Y4(a0),d4
                bsr.w   AreAnyAlliesInTriangle
@ReturnInfo:
                
                move.w  d6,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function IsRegionTriggered


; =============== S U B R O U T I N E =======================================

; Iterate through all allies to check if any are inside the region triangle.
;
; In: d2.w, d3.w, d4.w = triangle vertices coordinates
;
; Out: d6.w = -1 if true


AreAnyAlliesInTriangle:
                
                movem.l d0-d5/d7-a6,-(sp)
                move.w  #COMBATANT_ALLIES_COUNTER,d7
                clr.w   d0
@Loop:
                ; Is ally dead?
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.s   @Goto_Next
                bpl.s   @CheckX
@Goto_Next:
                
                bra.w   @Next
@CheckX:
                ; Is ally positioned outside the battlefield?
                jsr     j_GetCombatantX
                tst.b   d1
                bpl.s   @CheckY
                bra.w   @Next
@CheckY:
                ; Get ally's X, Y coordinates -> d5.b, d1.b
                clr.w   d5
                move.b  d1,d5
                lsl.w   #BYTE_SHIFT_COUNT,d5
                jsr     j_GetCombatantY
                tst.b   d1
                bpl.s   @Continue
                bra.w   @Next
@Continue:
                
                or.b    d1,d5           ; pack ally's X and Y into a single word -> d5.w
                bsr.w   IsAllyInTriangle
                tst.w   d6
                bne.s   @Next
                bra.w   @ReturnTrue     ; if any ally is inside, set d6.w = -1 (return true) and exit early
@Next:
                
                addi.w  #1,d0
                dbf     d7,@Loop
                
                move.w  #0,d6           ; after all allies are checked, return false
                bra.w   @Done
@ReturnTrue:
                
                move.w  #-1,d6
@Done:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function AreAnyAlliesInTriangle


; =============== S U B R O U T I N E =======================================

; Test whether a single ally’s position lies inside a triangle defined by
;   three region vertices. This is done by checking the ally’s coordinates
;   against each edge of the triangle using orientation flags.
;
; In: d2.w, d3.w, d4.w = packed triangle vertices coordinates (XXYY)
;                 d5.w = packed ally coordinates
; 
; Out: d6.w =  0 -> ally is inside the triangle, else -1
;
; Notes:
;   - Each edge test calls CheckTestPointPositionRelativeToSegment,
;       which returns a 2-bit flag in d0.
;   - The ally is considered inside if any edge test returns %01, or if the
;       results of each pair of tests are identical.

positionFlags = -9
combatantY = -8
combatantX = -7
regionY3 = -6
regionX3 = -5
regionY2 = -4
regionX2 = -3
regionY1 = -2
regionX1 = -1

IsAllyInTriangle:
                
                movem.l d0-d5/d7-a6,-(sp)
                link    a6,#-10
                
                ; Extract region vertices coordinates
                move.w  d2,d0
                andi.w  #BYTE_MASK,d0
                move.b  d0,regionY1(a6)
                move.w  d2,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.b  d0,regionX1(a6)
                move.w  d3,d0
                andi.w  #BYTE_MASK,d0
                move.b  d0,regionY2(a6)
                move.w  d3,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.b  d0,regionX2(a6)
                move.w  d4,d0
                andi.w  #BYTE_MASK,d0
                move.b  d0,regionY3(a6)
                move.w  d4,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.b  d0,regionX3(a6)
                
                ; Extract ally's coordinates
                move.w  d5,d0
                andi.w  #BYTE_MASK,d0
                move.b  d0,combatantY(a6)
                move.w  d5,d0
                lsr.w   #BYTE_SHIFT_COUNT,d0
                move.b  d0,combatantX(a6)
                
                clr.w   d1
                clr.w   d2
                clr.w   d3
                clr.w   d4
                clr.w   d5
                clr.w   d6
; ---------------------------------------------------------------------------

                ; Test edge (vertex1 -> vertex2) against ally position
                move.b  regionX1(a6),d1
                move.b  regionY1(a6),d2
                move.b  regionX2(a6),d3
                move.b  regionY2(a6),d4
                move.b  combatantX(a6),d5
                move.b  combatantY(a6),d6
                bsr.w   CheckTestPointPositionRelativeToSegment
                
                cmpi.b  #%01,d0
                bne.s   @Continue_1
                bra.w   @ReturnInside       ; if result = %01 (collinear in-bounds), immediately return d6.w = 0 (inside)
@Continue_1:
                
                btst    #0,d0
                beq.s   @TestAgainstVertex3
                bra.w   @SecondEdgeTests    ; if result = %11 (exception), branch to next edge
                
@TestAgainstVertex3:
                ; Otherwise, test edge against vertex3
                move.b  d0,positionFlags(a6)
                move.b  regionX3(a6),d5
                move.b  regionY3(a6),d6
                bsr.w   CheckTestPointPositionRelativeToSegment
                
                cmp.b   positionFlags(a6),d0
                beq.s   @SecondEdgeTests    ; continue to next edge if results of tests are identical (i.e., ally and vertex3 are on the same side)
                bra.w   @ReturnOutside      ; otherwise, return d6.b = -1 (outside)
; ---------------------------------------------------------------------------

@SecondEdgeTests:
                ; Test edge (vertex3 -> vertex1)
                move.b  regionX3(a6),d1
                move.b  regionY3(a6),d2
                move.b  regionX1(a6),d3
                move.b  regionY1(a6),d4
                move.b  combatantX(a6),d5
                move.b  combatantY(a6),d6
                bsr.w   CheckTestPointPositionRelativeToSegment
                
                ; Same logic as above
                cmpi.b  #%01,d0
                bne.s   @Continue_2
                bra.w   @ReturnInside
@Continue_2:
                
                btst    #0,d0
                beq.s   @TestAgainstVertex2
                bra.w   @ThirdEdgeTests
@TestAgainstVertex2:
                ; Test against vertex2
                move.b  d0,positionFlags(a6)
                move.b  regionX2(a6),d5
                move.b  regionY2(a6),d6
                bsr.w   CheckTestPointPositionRelativeToSegment
                
                cmp.b   positionFlags(a6),d0
                beq.s   @ThirdEdgeTests
                bra.w   @ReturnOutside
; ---------------------------------------------------------------------------

@ThirdEdgeTests:
                ; Test edge (vertex3 -> vertex2)
                move.b  regionX3(a6),d1
                move.b  regionY3(a6),d2
                move.b  regionX2(a6),d3
                move.b  regionY2(a6),d4
                move.b  combatantX(a6),d5
                move.b  combatantY(a6),d6
                bsr.w   CheckTestPointPositionRelativeToSegment
                
                ; Same logic as above
                cmpi.b  #%01,d0
                bne.s   @Continue_3
                bra.w   @ReturnInside
@Continue_3:
                
                btst    #0,d0
                beq.s   @TestAgainstVertex1
                bra.w   @ReturnOutside  ; return d6.b = -1 (outside) if result = %11 (exception)
@TestAgainstVertex1:
                ; Test against vertex1
                move.b  d0,positionFlags(a6)
                move.b  regionX1(a6),d5
                move.b  regionY1(a6),d6
                bsr.w   CheckTestPointPositionRelativeToSegment
                
                cmp.b   positionFlags(a6),d0
                beq.s   @ReturnInside   ; if results of both tests are the same, return d6.w = 0 (inside)
                bra.w   @ReturnOutside  ; otherwise, return d6.b = -1 (outside)
; ---------------------------------------------------------------------------

@ReturnInside:
                ; Return with d6.w = 0 to indicate the ally is inside (region should trigger)
                clr.w   d6
                unlk    a6
                movem.l (sp)+,d0-d5/d7-a6
                rts
@ReturnOutside:
                ; Return with d6.b = -1 to indicate the ally is outside
                move.b  #-1,d6
                unlk    a6
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function IsAllyInTriangle


; =============== S U B R O U T I N E =======================================

; Core geometric test called by IsAllyInTriangle.
;
; Determine the relative position of a test point C with respect to a line
;   segment A–B, then return a 2-bit flag encoding whether the point is
;   above/left, below/right , or collinear with the segment.
;
; In: d1.b, d2.b = XA, YA (segment point A)
;     d3.b, d4.b = XB, YB (segment point B)
;     d5.b, d6.b = XC, YC (test point C)
;
; Out: d0.w = %00 -> Test point is positioned above or to the left of segment line A-B
;             %01 -> Test point is collinear and within segment bounds
;             %10 -> Test point is below or to the right, or is collinear but out-of-bounds
;             %11 -> Exception: Yproj/Xproj is negative or degenerate triangle detected
;
; Method:
;   1. Calculate vertical and horizontal distances between A and B,
;        then choose a path according to the dominant axis:
;        - If segment is wider than tall or same -> horizontal path
;        - Else -> vertical path
;   2. Project the line A–B onto the dominant axis at the test point’s
;        coordinate (XC or YC).
;        - If segment bounds are overlapping, return %11 (exception)
;   3. Compare projected coordinate with the test point’s actual coordinate:
;        - Equal -> collinear, proceed to boundedness check
;        - Not equal -> mark as above/left or below/right for flag synthesis
;   4. Boundedness check:
;        - Ensure the test point lies between A and B along the dominant axis.
;        - If so, return %01 (collinear in-bounds).
;        - If not, return %10 (collinear but out-of-bounds).

YC = -6
XC = -5
YB = -4
XB = -3
YA = -2
XA = -1

CheckTestPointPositionRelativeToSegment:
                
                movem.l d1-a6,-(sp)
                link    a6,#-6
                
                move.b  d1,XA(a6)       ; XA, YA: segment point A
                move.b  d2,YA(a6)
                move.b  d3,XB(a6)       ; XB, YB: segment point B
                move.b  d4,YB(a6)
                move.b  d5,XC(a6)       ; XC, YC: test point C
                move.b  d6,YC(a6)
                
                ; ------------------------------------------------------------
                ; 1. Determine dominant axis path
                ; ------------------------------------------------------------
                
                ; Calculate vertical distance between segment points A and B -> d0.w
                move.b  YA(a6),d1
                move.b  YB(a6),d0
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                bpl.s   @CalculateHorizontalDistance
                neg.w   d0
@CalculateHorizontalDistance:
                ; Calculate horizontal distance -> d1.w
                move.b  XA(a6),d2
                move.b  XB(a6),d1
                ext.w   d1
                ext.w   d2
                sub.w   d2,d1
                bpl.s   @DetermineSegmentOrientation
                neg.w   d1
@DetermineSegmentOrientation:
                ; Is segment A-B is wider than it is tall, or are both measurements the same?
                cmp.w   d0,d1
                bcc.s   @HorizontalPath ; continue if so
                bra.w   @VerticalPath   ; otherwise, branch to vertical-dominant path
; ---------------------------------------------------------------------------

                ; ------------------------------------------------------------
                ; HORIZONTAL-DOMINANT PATH
                ;
                ; 2. Project the line A–B at the XC position into Yproj -> d0.w
                ; ------------------------------------------------------------
@HorizontalPath:
                ; Calculate vertical delta between segment points B and A -> d0.w
                move.b  YB(a6),d0
                move.b  YA(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                move.w  d0,d6
                
                ; Calculate horizontal delta between segment point B and test point C -> d1.w
                move.b  XB(a6),d1
                move.b  XC(a6),d0
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                ext.l   d0
                ext.l   d6
                muls.w  d0,d6                       ; d6.w = ΔyBA * ΔxCB
                
                ; Calculate horizontal delta between B and A -> d0.w
                move.b  XB(a6),d0
                move.b  XA(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                bne.s   @CalculateHorizontalSlopeFactor
                bra.w   @VerticalPath               ; branch to vertical path avoid a division by 0
@CalculateHorizontalSlopeFactor:
                
                ext.l   d0
                ext.l   d6
                divs.w  d0,d6                       ; d6.w = (ΔyBA * ΔxCB) / ΔxBA
                
                move.b  YB(a6),d0
                ext.w   d0
                add.w   d6,d0                       ; d0.w = Yproj
                bpl.s   @CheckCollinearityInY
                bra.w   @ReturnNegativeProjection   ; return d0 = %10 if Yproj is negative
                
                ; ------------------------------------------------------------
                ; 3. Check collinearity in Y
                ;
                ; Compare Yproj with YC:
                ;   - If equal: the test point is exactly on the infinite line
                ;       through A–B at XC.
                ;   - If not equal: proceed to flag synthesis later
                ;       (this difference feeds the bit 0 logic.)
                ; ------------------------------------------------------------
@CheckCollinearityInY:
                
                move.b  YC(a6),d1
                ext.w   d1
                sub.w   d1,d0
                beq.s   @CheckBoundednessAlongX ; continue to boundedness checks if YC and Yproj are collinear
                bra.w   @SynthesizeFlag         ; otherwise, synthesize flag d0 = %00 if YC is above, or %10 if below Yproj
                
                ; ------------------------------------------------------------
                ; 4. Check boundedness along X (is XC betwwen XA and XB?)
                ;
                ; This ensures the point lies within the segment points,
                ;   not merely on the infinite line.
                ; ------------------------------------------------------------
@CheckBoundednessAlongX:
                ; Is B to the right of A?
                move.b  XA(a6),d0
                move.b  XB(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @IsCtoTheRightOfA           ; continue if not
                bra.w   @IsCtoTheRightOfB           ; otherwise, branch to "Is C right of B?" check
@IsCtoTheRightOfA:
                ; (A is right of B) Is C right of A?
                move.b  XC(a6),d1
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @IsBtoTheRightOfC           ; continue if not
                bra.w   @ReturnOutOfBounds          ; otherwise, return d0 = %10 (out-of-bounds)
@IsBtoTheRightOfC:
                ; (A is right of BC) Is B right of C?
                move.b  XC(a6),d0
                move.b  XB(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @ReturnCollinearInBounds    ; return d0 = %01 (collinear in-bounds) if not
                bra.w   @ReturnOutOfBounds          ; otherwise, return d0 = %10
@ReturnCollinearInBounds:
                
                eor.w   d0,d0                       ; clear d0.w to set CCR zero-bit later
                bra.w   @SynthesizeFlag
@IsCtoTheRightOfB:
                ; (B is right of A) Is C right of B?
                move.b  XB(a6),d0
                move.b  XC(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @IsAtoTheRightOfC           ; continue if not
                bra.w   @ReturnOutOfBounds          ; otherwise, return d0 = %10
@IsAtoTheRightOfC:
                ; (B is right of AC) Is A right of C?
                move.b  XC(a6),d0
                move.b  XA(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @ReturnCollinearInBounds_0  ; return d0 = %01 if not
                bra.w   @ReturnOutOfBounds          ; otherwise, return d0 = %10
; ---------------------------------------------------------------------------

@ReturnCollinearInBounds_0:
                
                eor.w   d0,d0           ; clear d0.w to set CCR zero-bit
@SynthesizeFlag:
                
                bne.s   @ClearBit0
                bset    #0,d0           ; set bit 0 if comparison was equal
                bra.w   @DetermineBoundedness
@ClearBit0:
                
                bclr    #0,d0           ; otherwise, clear bit 0
@DetermineBoundedness:
                
                bcc.s   @ClearBit1
                bset    #1,d0           ; carry set -> bit 1 = 1
                bra.w   @ReturnFlag
@ClearBit1:
                
                bclr    #1,d0           ; carry clear -> bit 1 = 0
@ReturnFlag:
                
                andi.w  #3,d0           ; mask to 2 bits, return final flag
                unlk    a6
                movem.l (sp)+,d1-a6
                rts
@ReturnOutOfBounds:
                
                move    #1,ccr
                bra.s   @SynthesizeFlag ; synthesize flag d0 = %10 (out-of-bounds)
; ---------------------------------------------------------------------------

                ; ------------------------------------------------------------
                ; VERTICAL-DOMINANT PATH
                ;
                ; 2. Project line A–B at the YC position into Xproj -> d0.w
                ; ------------------------------------------------------------
@VerticalPath:
                ; Calculate horizontal delta between segment points B and A -> d0.w
                move.b  XB(a6),d0
                move.b  XA(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                move.w  d0,d6
                
                ; Calculate vertical delta between test point C and segment point B -> d1.w
                move.b  YC(a6),d0
                move.b  YB(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                ext.l   d0
                ext.l   d6
                muls.w  d0,d6                           ; d6.w = ΔxBA * ΔyCB
                
                ; Calculate vertical delta between B and A -> d0.w
                move.b  YB(a6),d0
                move.b  YA(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                bne.s   @CalculateVerticalSlopeFactor
                bra.w   @ReturnDegenerateTriangle       ; return d0 = %11 if ΔyBA = 0 (vertically aligned)
@CalculateVerticalSlopeFactor:
                
                ext.l   d0
                ext.l   d6
                divs.w  d0,d6                           ; d6.w = (ΔxBA * ΔyCB) / ΔyBA
                
                move.b  XB(a6),d0
                ext.w   d0
                add.w   d6,d0                           ; d0.w = Xproj
                bpl.s   @CheckCollinearityInX
                bra.w   @ReturnNegativeProjection       ; return d0 = %10 if Xproj is negative
                
                ; ------------------------------------------------------------
                ; 3. Check collinearity in X
                ;
                ; Compare Xproj with XC:
                ;   - If equal: the test point is exactly on the infinite line
                ;       through A-B at YC.
                ;   - If not equal: proceed to flag synthesis later.
                ; ------------------------------------------------------------
@CheckCollinearityInX:
                
                move.b  XC(a6),d1
                ext.w   d1
                sub.w   d1,d0
                beq.s   @CheckBoundednessAlongY ; continue to boundedness checks
                bra.w   @SynthesizeFlag         ; otherwise, return d0 = %00 if XC is left or %10 if right of Xproj
                
                ; ------------------------------------------------------------
                ; 4. Check boundedness along X
                ; ------------------------------------------------------------
@CheckBoundednessAlongY:
                ; Is B below A?
                move.b  YA(a6),d0
                move.b  YB(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @IsCBelowA
                bra.w   @IsCBelowB
@IsCBelowA:
                ; (A is below B) Is C below A?
                move.b  YC(a6),d1
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @IsBBelowC                  ; continue if not
                bra.s   @ReturnOutOfBounds          ; otherwise, return d0 = %10 (out-of-bounds)
@IsBBelowC:
                ; (A is below BC) Is B below C?
                move.b  YC(a6),d0
                move.b  YB(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @ReturnCollinearInBounds_1  ; return d0 = %01 (collinear in-bounds)
                bra.w   @ReturnOutOfBounds          ; otherwise, return d0 = %10
@ReturnCollinearInBounds_1:
                
                eor.w   d0,d0                       ; clear d0.w to set CCR zero-bit later
                bra.w   @SynthesizeFlag
@IsCBelowB:
                ; (B is below A) Is C below B?
                move.b  YB(a6),d0
                move.b  YC(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @IsABelowC                  ; continue if not
                bra.w   @ReturnOutOfBounds          ; otherwise, return d0 = %10
@IsABelowC:
                ; (B is below AC) Is A below C?
                move.b  YC(a6),d0
                move.b  YA(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   @ReturnCollinearInBounds_2  ; return d0 = %01
                bra.w   @ReturnOutOfBounds          ; otherwise, return d0 = %10
; ---------------------------------------------------------------------------

@ReturnCollinearInBounds_2:
                
                eor.w   d0,d0
                bra.w   @SynthesizeFlag ; synthesize flag d0 = %01 if test point is collinear and within segment bounds
@ReturnNegativeProjection:
                
                move    #1,ccr
                bra.w   @SynthesizeFlag ; synthesize flag d0 = %11 if negative Yproj/Xproj exception
@ReturnDegenerateTriangle:
                
                ori     #1,ccr
                bra.w   @SynthesizeFlag ; synthesize flag d0 = %11 if degenerate triangle exception

    ; End of function CheckTestPointPositionRelativeToSegment


; =============== S U B R O U T I N E =======================================

; In: d0.b = region index  Out: return CCR zero-bit clear if set


CheckTriggerRegionFlag:
                
                movem.l d0-a6,-(sp)
                clr.w   d1
                move.b  d0,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_CheckFlag
                movem.l (sp)+,d0-a6
                rts

    ; End of function CheckTriggerRegionFlag


; =============== S U B R O U T I N E =======================================

; Iterate through all defined regions for the current battle,
;   calling IsRegionTriggered for each region.
; 
; If a region is triggered, set global flags and activate enemy AI linked
;   to that region.
;
; In: d0.w = combatant index


TriggerRegionsAndActivateEnemies:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7           ; save combatant index
                move.w  #BATTLESPRITESET_SUBSECTION_AI_REGIONS,d1
                bsr.w   GetBattleSpritesetSubsection
                tst.w   d1
                bne.s   @Continue
                bra.w   @Done
@Continue:
                
                move.w  d1,d2
                subi.w  #1,d2
                clr.w   d0
@TriggerRegionFlags_Loop:
                
                lea     (NEWLY_TRIGGERED_BATTLE_REGIONS).l,a0
                move.w  (a0),d1
                btst    d0,d1
                bne.s   @Next
                
                bsr.w   IsRegionTriggered
                tst.b   d1
                beq.s   @Next
                
                clr.w   d1
                move.b  d0,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_SetFlag
@Next:
                
                move.w  (a0),d1
                bset    d0,d1
                move.w  d1,(a0)
                addi.w  #1,d0
                dbf     d2,@TriggerRegionFlags_Loop
                
                ; ------------------------------------------------------------
                ; Check whether either of the AI’s assigned trigger regions
                ;   is active, and if so, set its activation bitfield.
                ; ------------------------------------------------------------
                
                move.w  d7,d0           ; restore combatant index
                jsr     j_GetTriggerRegions
                cmpi.w  #AI_TRIGGER_REGION_NONE,d1
                bne.s   @CheckPrimaryTriggerRegion
                
                cmpi.w  #AI_TRIGGER_REGION_NONE,d2
                bne.s   @CheckPrimaryTriggerRegion
                bra.w   @Done
@CheckPrimaryTriggerRegion:
                
                move.b  d0,d7           ; save combatant index
                move.b  d2,d6           ; save AI activation region 2
                move.b  d1,d5           ; save AI activation region 1
                cmpi.b  #AI_TRIGGER_REGION_NONE,d5
                bne.s   @IsPrimaryRegionTriggered
                bra.w   @CheckSecondaryTriggerRegion
@IsPrimaryRegionTriggered:
                
                clr.w   d1
                move.b  d5,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_CheckFlag
                bne.s   @ActivatePrimaryAi
                bra.w   @CheckSecondaryTriggerRegion
@ActivatePrimaryAi:
                
                clr.w   d0
                move.w  d7,d0
                jsr     j_GetActivationBitfield
                andi.w  #($FFFF-AIBITFIELD_PRIMARY_ACTIVE),d1
                bset    #AIBITFIELD_BIT_PRIMARY_ACTIVE,d1
                jsr     j_SetActivationBitfield
                bra.w   @Done
@CheckSecondaryTriggerRegion:
                
                cmpi.b  #AI_TRIGGER_REGION_NONE,d6
                bne.s   @IsSecondaryRegionTriggered
                bra.w   @Done
@IsSecondaryRegionTriggered:
                
                clr.w   d1
                move.b  d6,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_CheckFlag
                bne.s   @ActivateSecondaryAi
                bra.w   @Done
@ActivateSecondaryAi:
                
                clr.w   d0
                move.w  d7,d0
                jsr     j_GetActivationBitfield
                andi.w  #($FFFF-AIBITFIELD_PRIMARY_ACTIVE|AIBITFIELD_SECONDARY_ACTIVE),d1
                bset    #AIBITFIELD_BIT_PRIMARY_ACTIVE,d1
                bset    #AIBITFIELD_BIT_SECONDARY_ACTIVE,d1
                jsr     j_SetActivationBitfield
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function TriggerRegionsAndActivateEnemies

