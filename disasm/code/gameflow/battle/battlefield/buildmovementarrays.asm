
; ASM FILE code\gameflow\battle\battlefield\buildmovementarrays.asm :
; 0xDA82..0xDB9A : Build movement arrays function

; =============== S U B R O U T I N E =======================================

; In: a2, a3 = pointers to total movecosts and movable grid arrays
;     d0.w = move budget (MOV * 2)
;     d3.b, d4.b = moving combatant X, Y

tempMovableGridArray = -BUILD_MOVEMENT_ARRAYS_STACK_BYTESIZE
tempTotalMovecostsArray = -(BUILD_MOVEMENT_ARRAYS_STACK_BYTESIZE-1)

BuildMovementArrays:
                
                movem.l d0-a5,-(sp)
                link    a6,#-BUILD_MOVEMENT_ARRAYS_STACK_BYTESIZE           ; 64
                lea     (a6),a1
                move.w  #BUILD_MOVEMENT_ARRAYS_STACK_LONGWORDS_COUNTER,d5   ; 15
                move.l  #BUILD_MOVEMENT_ARRAYS_STACK_INITIAL_PATTERN,d1     ; $40004000
@InitializeStackFrame_Loop:
                
                move.l  d1,-(a1)
                dbf     d5,@InitializeStackFrame_Loop
                
                lea     (a3),a1
                move.w  #MAP_ARRAY_QUAD_LONGWORDS_COUNTER,d5    ; 143
                moveq   #-1,d1
@ClearMovableGridArray_Loop:
                
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                dbf     d5,@ClearMovableGridArray_Loop
                
                lea     (a2),a1
                move.w  #MAP_ARRAY_QUAD_LONGWORDS_COUNTER,d5    ; 143
                moveq   #-1,d1
@ClearTotalMovecostsArray_Loop:
                
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                move.l  d1,(a1)+
                dbf     d5,@ClearTotalMovecostsArray_Loop
                
                ; Convert moving combatant X, Y to offset
                clr.w   d6
                moveq   #0,d5
                move.b  d4,d5
                mulu.w  #MAP_SIZE_MAX_TILEWIDTH,d5
                andi.w  #BYTE_MASK,d3
                add.w   d3,d5           ; d5.w = coordinates converted to offset
@ExpandMovement_Loop:
                ; For each expansion step (d6.w = current expansion depth / move count, starting at 0):
                move.b  d6,(a2,d5.w)    ; populate total-movecosts with current move-count byte
                move.w  d6,d1
                lsr.w   #BYTE_SHIFT_COUNT,d1
                move.b  d1,(a3,d5.w)    ; populate movable-grid with current move-count byte / 16
                
                ; Check right 1 space ahead to the right
                tst.b   1(a3,d5.w)
                bpl.s   @CheckLeft
                
                ; Evaluate neighbor space if negative (meaning not processed or not passable)
                addq.w  #1,d5
                bsr.s   TestAndMarkNeighborSpace        
                subq.w  #1,d5
@CheckLeft:
                
                tst.b   -1(a3,d5.w)
                bpl.s   @CheckUp
                
                subq.w  #1,d5
                bsr.s   TestAndMarkNeighborSpace        
                addq.w  #1,d5
@CheckUp:
                
                tst.b   -MAP_SIZE_MAX_TILEWIDTH(a3,d5.w)
                bpl.s   @CheckDown
                
                subi.w  #MAP_SIZE_MAX_TILEWIDTH,d5
                bsr.s   TestAndMarkNeighborSpace        
                addi.w  #MAP_SIZE_MAX_TILEWIDTH,d5
@CheckDown:
                
                tst.b   MAP_SIZE_MAX_TILEWIDTH(a3,d5.w)
                bpl.s   @FindProcessedCandidate_Loop
                
                addi.w  #MAP_SIZE_MAX_TILEWIDTH,d5
                bsr.s   TestAndMarkNeighborSpace        
                subi.w  #MAP_SIZE_MAX_TILEWIDTH,d5
@FindProcessedCandidate_Loop:
                
                move.w  d0,d1                               ; d1.w = remaining move budget
                andi.w  #BATTLEFIELD_MOVE_BUDGET_MASK,d1    ; $1F
                add.w   d1,d1
                move.w  tempMovableGridArray(a6,d1.w),d5    ; retrieve coordinates offset
                btst    #BATTLEFIELD_PROCESSED_SPACE_BIT,d5 ; 14
                bne.s   @FoundProcessedCandidate
                
                move.b  (a3,d5.w),tempMovableGridArray(a6,d1.w)
                move.b  (a2,d5.w),tempTotalMovecostsArray(a6,d1.w)
                bra.s   @ExpandMovement_Loop      
@FoundProcessedCandidate:
                
                addq.w  #1,d6           ; increment move count
                subq.w  #1,d0           ; decrement move budget
                bmi.s   @Done
                
                bne.s   @FindProcessedCandidate_Loop
@Done:
                
                unlk    a6
                movem.l (sp)+,d0-a5
                rts

    ; End of function BuildMovementArrays


; =============== S U B R O U T I N E =======================================

; In: a2, a3 = pointers to total movecosts and movable grid arrays
;     a4 = pointer to battle terrain array
;     a5 = pointer to move costs table
;     d0.w = move budget (MOV * 2)
;     d5.w = coordinates offset
;     d6.w = move count


TestAndMarkNeighborSpace:
                
                cmpi.w  #MAP_ARRAY_BYTESIZE,d5
                bcs.s   @Continue           ; continue if not reached end of array
                rts
@Continue:
                
                move.b  (a4,d5.w),d1        ; d1.w = terrain entry
                btst    #TERRAIN_BIT_OCCUPIED,d1
                beq.s   @SpaceNotOccupied   ; continue if space is not occupied
                rts
@SpaceNotOccupied:
                
                andi.w  #BATTLEFIELD_TERRAIN_ENTRY_MASK,d1  ; d1.w = terrain type
                move.b  (a5,d1.w),d2
                ext.w   d2                  ; d2.w = move cost
                cmp.w   d2,d0
                bcc.s   @CanAffordMove      ; continue if move can be afforded
                rts
@CanAffordMove:
                
                beq.s   @MoveBudgetSpent    ; skip if move budget is fully spent
                
                move.w  d0,d1
                sub.w   d2,d1               ; subtract movecost from value
                andi.w  #BATTLEFIELD_MOVE_BUDGET_MASK,d1 ; $1F
                add.w   d1,d1
                move.b  tempMovableGridArray(a6,d1.w),(a3,d5.w)
                move.b  tempTotalMovecostsArray(a6,d1.w),(a2,d5.w)
                move.w  d5,tempMovableGridArray(a6,d1.w) ; store latest candidate coordinates offset
                rts                         ; (and clear bit 14 from stack frame entry in the process, indicating that the space has been checked)
@MoveBudgetSpent:
                
                add.w   d6,d2
                move.b  d2,(a2,d5.w)
                move.w  d2,d1
                lsr.w   #BYTE_SHIFT_COUNT,d1
                move.b  d1,(a3,d5.w)
                rts

    ; End of function TestAndMarkNeighborSpace

