
; ASM FILE code\gameflow\battle\turnorderfunctions-standard.asm :
; Standard reimplementation of battle turn order functions.

                module
                
@addTurnOrderEntry: macro
              if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.b  d0,(a0)
                move.b  d1,2(a0)
                addq.w  #TURN_ORDER_ENTRY_SIZE,a0
              else
                move.b  d0,(a0)+
                move.b  d1,(a0)+
              endif
            endm
                
; =============== S U B R O U T I N E =======================================


GenerateBattleTurnOrder:
                
                move.l  d5,-(sp)
                loadSavedDataAddress BATTLE_TURN_ORDER, a0
                
                ; Initialize table with null entries
                move.l  a0,-(sp)
                moveq   #-1,d7
                moveq   #(TURN_ORDER_ENTRIES_NUMBER/2)-1,d5
@InitializeTable_Loop:
                
                setSavedLongWithPostIncrement d7, a0
                dbf     d5,@InitializeTable_Loop
                
                movea.l (sp)+,a0
                
                ; Add allies
                clr.w   d0
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
                
                getSavedWord (a0), d0
                getSavedWord (a0), d1, TURN_ORDER_ENTRY_SIZE
                cmp.b   d0,d1
                ble.s   @CompareNextPair
                setSavedWord d1, (a0)
                setSavedWord d0, (a0), TURN_ORDER_ENTRY_SIZE
@CompareNextPair:
                
                addq.w  #TURN_ORDER_ENTRY_SIZE,a0
                dbf     d7,@SortEntries_InnerLoop
                dbf     d6,@SortEntries_OuterLoop
                
                clearSavedByte CURRENT_BATTLE_TURN
                move.l  (sp)+,d5
                rts

    ; End of function GenerateBattleTurnOrder


; =============== S U B R O U T I N E =======================================

; In: a0 = pointer to turn order entry
;     d0.w = first combatant index
;     d5.w = loop counter


AddTurnOrderEntries_Loop:
                
                jsr     GetCombatantX
                bmi.s   @HandleNextCombatant
                jsr     GetCurrentHP
                beq.s   @HandleNextCombatant
                jsr     GetCurrentAGI
                move.w  d1,d3                           ; save current AGI
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
                bpl.s   @AddFirstTurnEntry
                moveq   #CHAR_STATCAP_AGI_CURRENT,d1    ; Cap randomized AGI to prevent skipped turns
@AddFirstTurnEntry:
                
                @addTurnOrderEntry
                
                move.b  d3,d1                           ; restore current AGI (byte only so we can branch on positive)
                bpl.s   @HandleNextCombatant
                
                ; Add a second turn if current AGI > 127
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
                bpl.s   @AddSecondTurnEntry
                moveq   #CHAR_STATCAP_AGI_CURRENT,d1
@AddSecondTurnEntry:
                
                @addTurnOrderEntry
@HandleNextCombatant:
                
                addq.w  #1,d0
                dbf     d5,AddTurnOrderEntries_Loop
                
                rts

    ; End of function AddTurnOrderEntries_Loop

                modend
