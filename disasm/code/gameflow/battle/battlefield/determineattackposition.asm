
; ASM FILE code\gameflow\battle\battlefield\determineattackposition.asm :
; 0xC71A..0xC7F2 : Determine attack position function

; =============== S U B R O U T I N E =======================================

; Return a nearby position that the moving combatant can move to in order to
;   attack a target, preferring spaces with higher movecost values to best
;   utilize ranged attacks.
; 
; In: d1.b,d2.b = target X,Y
;     d3.b,d4.b = maxRange,minRange
; 
; Out: d1.b,d2.b = destination X,Y (-1 if no position is available)

candidateMoveCost = -5
candidateY = -4
candidateX = -3
targetY = -2
targetX = -1

DetermineAttackPosition:
                
                movem.l d0/d3-a6,-(sp)
                link    a6,#-6
                move.b  d1,targetX(a6)
                move.b  d2,targetY(a6)
                move.b  #-1,candidateX(a6)
                move.b  #-1,candidateY(a6)
                move.b  #-1,candidateMoveCost(a6)
                
                ; Validate target position
                cmpi.b  #MAP_SIZE_MAX_TILEWIDTH,d1
                bcc.w   @ReturnInfo
                
                cmpi.b  #MAP_SIZE_MAX_TILEHEIGHT,d2
                bcc.w   @ReturnInfo     ; return target position if out-of-bounds
                
                ; Iterate offsets in a diamond-shaped pattern from radius = minRange..maxRange
                move.b  d3,d6
                neg.b   d6              ; d6.b = offsetY
@OuterLoop:
                
                move.b  d3,d5
                move.b  d6,d0
                or.b    d0,d0
                bge.s   @loc2
                
                neg.b   d0
@loc2:
                
                sub.b   d0,d5
                neg.b   d5              ; d5.b = offsetX
                move.b  d3,d0
@InnerLoop:
                
                cmp.b   d4,d0
                bcs.w   @Next           ; skip if less than min range
                
                ; Validate candidate position
                move.b  targetX(a6),d1
                add.b   d5,d1           ; candidateX d1.b = targetX d1.b + offsetX d5.b
                cmpi.b  #MAP_SIZE_MAX_TILEWIDTH,d1
                bcc.w   @Next
                
                move.b  targetY(a6),d2
                add.b   d6,d2           ; candidateY d2.b = targetY d2.b + offsetY d6.b
                cmpi.b  #MAP_SIZE_MAX_TILEHEIGHT,d2
                bcc.w   @Next           ; skip if out-of-bounds
                
                bsr.w   GetMoveCostToDestination
                tst.w   d0
                beq.w   @Done           ; exit early if attacker is already standing in range
                
                btst    #15,d0
                bne.w   @Next           ; skip if space is obstructed
                
                ; Compare candidate move-cost with the best found so far
                cmp.b   candidateMoveCost(a6),d0
                bcc.w   @Next           ; skip if best move-cost is higher or same
                
                ; Check occupancy
                move.b  d0,d7
                andi.w  #BYTE_MASK,d1
                andi.w  #BYTE_MASK,d2
                bsr.w   GetCombatantOccupyingSpace
                cmpi.b  #-1,d0
                bne.w   @Next           ; someone is already there, so it can't be chosen
                
                ; Select this candidate as the best one so far
                move.b  d7,candidateMoveCost(a6)
                move.b  d1,candidateX(a6)
                move.b  d2,candidateY(a6)
@Next:
                
                addq.b  #1,d5
                move.b  d5,d1
                or.b    d1,d1
                bge.s   @loc5
                
                neg.b   d1
@loc5:
                
                move.b  d6,d0
                or.b    d0,d0
                bge.s   @loc6
                
                neg.b   d0
@loc6:
                
                add.b   d1,d0
                cmp.b   d3,d0
                bls.s   @InnerLoop
                
                cmp.b   d3,d6
                beq.w   @ReturnInfo
                
                addq.b  #1,d6
                bra.w   @OuterLoop
@ReturnInfo:
                
                move.b  candidateX(a6),d1
                move.b  candidateY(a6),d2
@Done:
                
                unlk    a6
                movem.l (sp)+,d0/d3-a6
                rts

    ; End of function DetermineAttackPosition

