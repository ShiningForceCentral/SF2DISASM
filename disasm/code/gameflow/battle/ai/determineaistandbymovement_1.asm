
; ASM FILE code\gameflow\battle\ai\determineaistandbymovement_1.asm :
; 0xF522..0xF78A : AI engine : Determine standby movement function, part 1

; =============== S U B R O U T I N E =======================================

; Decide whether an AI combatant on standby should stay or take a small
;   random/local move, build that move into the AI move string,
;   and update the AI memory table with the chosen standby pattern.
; 
; In: d0.w = moving combatant index
; 
; Aftermath:
;   May write BATTLE_ENTITY_MOVE_STRING = -1 (no move), or build an AI move
;     string via BuildMoveStringForAi.
; 
;   Update the AI_MEMORY_TABLE byte entry for the combatant, initializing the
;     lower nibble if zero and refreshing the upper nibble when choosing a move.
; 
;   Finish with setting CURRENT_BATTLEACTION to BATTLEACTION_STAY.

moveCount = -4
combatant = -3
startingY = -2
startingX = -1

DetermineAiStandbyMovement:
                
                movem.l d0-a6,-(sp)
                link    a6,#-4
                move.b  d0,combatant(a6)
                
                ; Generate random 0..7 : "Stay" battleaction chosen when value equals 2,4,6 -> 3/8 chance
                move.w  #8,d6
                jsr     j_GenerateRandomNumberUnderD6
                cmpi.b  #2,d7
                bne.s   @loc1
                
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #-1,(a2)
                bra.w   @Done
@loc1:
                
                cmpi.b  #4,d7
                bne.s   @loc2
                
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #-1,(a2)
                bra.w   @Done
@loc2:
                
                cmpi.b  #6,d7
                bne.s   @DetermineMoveOrderType
                
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #-1,(a2)
                bra.w   @Done
@DetermineMoveOrderType:
                
                bsr.w   ValidateAiStandbyEligibility
                tst.b   d1
                beq.s   @IsMoveOrder
                
                ; Stay put if disallowed to move
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #-1,(a2)
                bra.w   @Done
@IsMoveOrder:
                
                tst.b   d2
                bne.s   @PerformMoveOrder
                
                ; Perform regular movement
                clr.w   d0
                move.b  combatant(a6),d0
                jsr     j_GetCombatantStartingPosition
                move.b  d1,startingX(a6)
                move.b  d2,startingY(a6)
                bra.s   @SetupArraysAndMemory
@PerformMoveOrder:
                
                clr.w   d0
                move.b  combatant(a6),d0
                bsr.w   GetMoveOrders 
                move.w  d1,d0
                jsr     j_GetMoveOrderPosition
                move.b  d1,startingX(a6)
                move.b  d1,startingY(a6)
@SetupArraysAndMemory:
                
                ; Setup movement/target arrays and AI memory
                move.b  combatant(a6),d0
                bsr.w   InitializeMovementArrays
                bsr.w   BuildMovementArrays
                bsr.w   BuildTargetsArrayWithAllCombatants
                
                ; Get pointer to this combatant's entry in AI_MEMORY_TABLE -> a0
                lea     (AI_MEMORY_TABLE).l,a0 ; holds two pieces of data per combatant:
                                        ;   - lower nibble = standby move count (3 or 4)
                                        ;   - upper nibble = last-chosen relative position index (0..3)
                clr.w   d0
                move.b  combatant(a6),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                adda.w  d0,a0
                
                ; Load byte at that table location into d1.b and isolate lower nibble
                clr.w   d1
                move.b  (a0),d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d1
                tst.b   d1
                bne.s   @SaveMoveCount
                
                ; Randomly pick a move count if lower nibble is zero with 1/2 chance
                clr.w   d6
                move.w  #2,d6
                jsr     j_GenerateRandomNumberUnderD6
                tst.b   d7
                bne.s   @loc7           
                
                move.b  #4,d1           ; if random 0..1 = 0, set lower nibble = 4 into the AI memory byte
                move.b  d1,(a0)
                bra.s   @SaveMoveCount
@loc7:
                
                move.b  #3,d1           ; otherwise, set lower nibble = 3
                move.b  d1,(a0)
@SaveMoveCount:
                
                ; Save move count (3 or 4) into moveCount and d5 (used later as loop counter)
                move.b  d1,moveCount(a6)
                clr.l   d5
                move.b  d1,d5
                subi.l  #1,d5
                
                ; Extract upper nibble from AI_MEMORY_TABLE byte and save it in d6 (used later)
                clr.w   d1
                move.b  (a0),d1
                lsr.w   #NIBBLE_SHIFT_COUNT,d1
                move.w  d1,d6
                
                ; Prepare candidate relative positions table index selection:
                ;   - d7 accumulates valid-candidate bits
                ;   - d3 indexes candidate number
                ;   - later we clear previous selection bit d6 and pick a random set bit
                clr.w   d7
                lea     pt_StandbyAiMovements(pc), a1
                nop
                move.b  moveCount(a6),d7
                subi.b  #3,d7
                lsl.l   #2,d7           ; d7 = (moveCount - 3) * 4
                movea.l (a1,d7.w),a1
                clr.w   d7
                clr.w   d0
                clr.w   d3
@EvaluateMoveCandiates_Loop:
                
                ; Load offset pair X, Y from (a1 + d0) where d0 increments by 2 each loop
                clr.w   d1
                clr.w   d2
                move.b  (a1,d0.w),d1
                move.b  1(a1,d0.w),d2
                
                ; Add them to startingX/Y to get candidate tile coordinates in d1/d2
                add.b   startingX(a6),d1
                add.b   startingY(a6),d2
                
                ; Reject candidate if X or Y is out of [0..MAP_SIZE_MAX-1]
                tst.b   d1
                bpl.s   @loc10
                bra.w   @EvaluateNext
@loc10:
                
                cmpi.b  #MAP_SIZE_MAX_TILEWIDTH,d1
                ble.s   @loc11
                bra.w   @EvaluateNext
@loc11:
                
                tst.b   d2
                bpl.s   @loc12
                bra.w   @EvaluateNext
@loc12:
                
                cmpi.b  #MAP_SIZE_MAX_TILEHEIGHT,d2
                ble.s   @CheckPositionEligibility
                bra.w   @EvaluateNext
@CheckPositionEligibility:
                
                move.l  d3,-(sp)
                clr.w   d3
                clr.w   d4
                bsr.w   DetermineAttackPosition
                move.l  (sp)+,d3
                cmpi.b  #-1,d1
                bne.s   @SetValidCandiateBit
                bra.w   @EvaluateNext
@SetValidCandiateBit:
                
                bset    d3,d7           ; set valid-candidate bit in d7
@EvaluateNext:
                
                addi.w  #2,d0
                addi.w  #1,d3
                dbf     d5,@EvaluateMoveCandiates_Loop
                
                bclr    d6,d7           ; clear bit previously extracted from AI memory upper nibble
                tst.b   d7
                bne.s   @CountValidCandiates ; branch if any valid candidates remain
                
                ; Clear the AI_MEMORY_TABLE byte
                lea     (AI_MEMORY_TABLE).l,a0
                clr.w   d0
                move.b  combatant(a6),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                adda.w  d0,a0
                move.b  #0,(a0)
                
                ; Stay put if no valid candidates remain
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
                lea     ((BATTLE_ENTITY_MOVE_STRING-$1000000)).w,a2
                move.b  #-1,(a2)
                bra.w   @Done
@CountValidCandiates:
                
                ; Count the number of set bits -> d0.w
                move.w  d7,d5
                move.w  #3,d4
                clr.w   d0
@CountValidCandiates_Loop:
                
                lsr.w   #1,d5
                bcc.s   @CountNext
                addi.b  #1,d0
@CountNext:
                
                dbf     d4,@CountValidCandiates_Loop
                
                ; Randomly pick one valid candidate bit
                move.w  d7,d5
                move.w  d0,d6
                jsr     j_GenerateRandomNumberUnderD6
                clr.l   d4
                move.b  moveCount(a6),d4
                subi.w  #1,d4           ; d4.l = moveCount - 1
                clr.w   d0
                clr.w   d1
@PickMoveCandiate_Loop:
                
                lsr.w   #1,d5
                bcc.s   @IncrementIndex 
                cmp.b   d7,d0
                bne.s   @PickNext
                bra.w   @Break
@PickNext:
                
                addi.b  #1,d0
@IncrementIndex:
                
                addi.b  #1,d1           ; d1.w = chosen bit index
                dbf     d4,@PickMoveCandiate_Loop
@Break:
                
                ; Update AI memory
                lea     (AI_MEMORY_TABLE).l,a0
                clr.w   d0
                move.b  combatant(a6),d0
                andi.b  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d0
                adda.w  d0,a0
                move.b  (a0),d0
                move.b  d1,d2
                lsl.w   #NIBBLE_SHIFT_COUNT,d2
                andi.b  #BYTE_UPPER_NIBBLE_MASK,d2
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d0
                or.b    d2,d0
                move.b  d0,(a0)         ; set AI memory upper nibble to d0
                
                ; Compute pointer into the chosen movement table entry using d1.b as index (d1 * 2)
                clr.l   d7
                move.b  d1,d7
                lsl.w   #1,d7
                move.b  (a1,d7.w),d0    ; load the chosen offset pair into d0,d1
                move.b  1(a1,d7.w),d1
                add.b   startingX(a6),d0 ; then add startingX/Y to get absolute destination coordinates
                add.b   startingY(a6),d1
                
                ; Build move string
                lea     (FF4400_LOADING_SPACE).l,a2
                lea     (FF4D00_LOADING_SPACE).l,a3
                bsr.w   BuildMoveStringForAi
                
                ; Stay after moving
                lea     (CURRENT_BATTLEACTION).l,a2
                move.w  #BATTLEACTION_STAY,(a2)
@Done:
                
                unlk    a6
                movem.l (sp)+,d0-a6
                rts

    ; End of function DetermineAiStandbyMovement

