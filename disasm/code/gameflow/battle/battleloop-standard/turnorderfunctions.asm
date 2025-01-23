
; ASM FILE code\gameflow\battle\battleloop-standard\turnorderfunctions.asm :

                module
                
@randomizeFirstTurnEntry: macro
              if (DISABLE_TURN_ORDER_RANDOMIZATION=0)
                andi.w  #CHAR_STATCAP_AGI_CURRENT,d1
                move.w  d1,d6
                lsr.w   #3,d6
                jsr     (GenerateRandomNumber).w
                add.w   d7,d1
                jsr     (GenerateRandomNumber).w
                sub.w   d7,d1
                moveq   #3,d6
                jsr     (GenerateRandomNumber).w
                subq.w  #1,d7
                add.w   d7,d1
                tst.b   d1
                bpl.s   @AddFirstTurnEntry\@
                moveq   #CHAR_STATCAP_AGI_CURRENT,d1    ; Cap randomized AGI to prevent skipped turns
@AddFirstTurnEntry\@:
              endif
                
                appendBattleTurnEntry d0, d1, a0
            endm
                
@randomizeSecondTurnEntry: macro
              if (DISABLE_TURN_ORDER_RANDOMIZATION=0)
                andi.w  #CHAR_STATCAP_AGI_CURRENT,d1
                mulu.w  #5,d1
                divu.w  #6,d1
                move.w  d1,d6
                lsr.w   #3,d6
                jsr     (GenerateRandomNumber).w
                add.w   d7,d1
                jsr     (GenerateRandomNumber).w
                sub.w   d7,d1
                tst.b   d1
                bpl.s   @AddSecondTurnEntry\@
                moveq   #CHAR_STATCAP_AGI_CURRENT,d1
@AddSecondTurnEntry\@:
              endif
                
                appendBattleTurnEntry d0, d1, a0
            endm
                
@compareEntries: macro
                getSavedWord a0, d0
                getSavedWord a0, d1, TURN_ORDER_ENTRY_SIZE
                cmp.b   d0,d1
                ble.s   @CompareNextPair\@
                
                setSavedWord d1, a0
                setSavedWord d0, a0, TURN_ORDER_ENTRY_SIZE
@CompareNextPair\@:
                
                addq.w  #TURN_ORDER_ENTRY_SIZE,a0
            endm


; =============== S U B R O U T I N E =======================================

; Fill the the turn order table with -1 word entries.
;
; Out: a0 = pointer to start of turn order table
;      CURRENT_BATTLE_ORDER.w = 0

InitializeBattleTurnOrder:
                
                loadSavedDataAddress BATTLE_TURN_ORDER, a0
                move.l  a0,d5
                moveq   #-1,d6
                moveq   #(TURN_ORDER_ENTRIES_NUMBER/2)-1,d7
@InitializeTable_Loop:
                
                setSavedLongWithPostIncrement d6, a0
                dbf     d7,@InitializeTable_Loop
                
                ; Reset battle turn
                clr.w   d0
                loadSavedDataAddress CURRENT_BATTLE_TURN, a0
                setSavedWord d0, a0
                movea.l d5,a0
                rts

    ; End of function InitializeBattleTurnOrder


; =============== S U B R O U T I N E =======================================


GenerateBattleTurnOrder:
                
                bsr.s   InitializeBattleTurnOrder
                
                ; Add allies
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d5
                bsr.s   AddTurnOrderEntries_Loop
                
                ; Add enemies
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER-2,d5
                bsr.s   AddTurnOrderEntries_Loop
                
                ; Sort entries by randomized AGI
                moveq   #TURN_ORDER_ENTRIES_COUNTER,d6
@SortEntries_OuterLoop:
                
                moveq   #TURN_ORDER_ENTRIES_COUNTER-1,d7
                loadSavedDataAddress BATTLE_TURN_ORDER, a0
@SortEntries_InnerLoop:
                
                @compareEntries
                dbf     d7,@SortEntries_InnerLoop
                dbf     d6,@SortEntries_OuterLoop
                
                rts

    ; End of function GenerateBattleTurnOrder


; =============== S U B R O U T I N E =======================================

; In: a0 = pointer to turn order entry
;     d0.w = first combatant index
;     d5.w = loop counter


AddTurnOrderEntries_Loop:
                
                jsr     GetCombatantX
                bmi.s   @HandleNextCombatant
                jsr     GetCurrentHp
                beq.s   @HandleNextCombatant
                jsr     GetCurrentAgi
                move.w  d1,d3                           ; save current AGI
                @randomizeFirstTurnEntry
                
                move.b  d3,d1                           ; restore current AGI (byte only so we can branch on positive)
                bpl.s   @HandleNextCombatant
                
                ; Add a second turn if current AGI > 127
                @randomizeSecondTurnEntry
@HandleNextCombatant:
                
                addq.w  #1,d0
                dbf     d5,AddTurnOrderEntries_Loop
                
                rts

    ; End of function AddTurnOrderEntries_Loop


; =============== S U B R O U T I N E =======================================

; Out: d3.l = copy of pointer to current turn entry

UpdateBattleTurnOrder:
                
                loadSavedDataAddress BATTLE_TURN_ORDER, a0
                loadSavedDataAddress CURRENT_BATTLE_TURN, a1
                getSavedWord a1, d5
                adda.w  d5,a0                           ; a0 = pointer to current turn entry
                move.l  a0,d3                           ; d3.l = copy of pointer to current turn entry
                moveq   #0,d4                           ; d4.l = ally second turn flags
                moveq   #0,d5                           ; d5.l = enemy second turn flags
                
@Loop:          move.b  (a0),d0                         ; d0.b = actor combatant
                cmpi.b  #-1,d0
                beq.w   @Break
                
                jsr     GetCombatantX
                bmi.s   @AddNullEntry
                
                jsr     GetCurrentHp
                beq.s   @AddNullEntry
                
                jsr     GetCurrentAgi
                
                ; Is ally or enemy taking a second turn?
                tst.b   d0
                bmi.s   @Enemy
                
                bset    d0,d4
                beq.s   @FirstTurn
                bra.s   @SecondTurn
                
@Enemy:         bset    d0,d5
                bne.s   @SecondTurn
                
@FirstTurn:     @randomizeFirstTurnEntry
                bra.s   @Loop
                
@SecondTurn:    @randomizeSecondTurnEntry
                bra.w   @Loop
                
@AddNullEntry:  ; Add null entry
                moveq   #-1,d1
                setSavedWordWithPostIncrement d1, a0
                bra.w   @Loop
                
@Break:         ; Sort entries by randomized AGI
                getSavedWord a1, d5
                lsr.w   #(TURN_ORDER_ENTRY_SIZE>>1),d5
                moveq   #TURN_ORDER_ENTRIES_COUNTER,d6
                sub.w   d5,d6                           ; d6.w = outer loop counter
                move.w  d6,d5
                subq.w  #1,d5                           ; d5.w = inner loop counter
                
@OuterLoop:     move.w  d5,d7
                movea.l d3,a0
                
@InnerLoop:     @compareEntries
                dbf     d7,@InnerLoop
                dbf     d6,@OuterLoop
                
                rts

    ; End of function UpdateBattleTurnOrder

                modend
