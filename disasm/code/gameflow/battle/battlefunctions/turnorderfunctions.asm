
; ASM FILE code\gameflow\battle\battlefunctions\turnorderfunctions.asm :
; 0x25544..0x25610 : Battle turn order functions

; =============== S U B R O U T I N E =======================================


GenerateBattleTurnOrder:
                
                lea     ((BATTLE_TURN_ORDER-$1000000)).w,a0
                move.l  a0,-(sp)
                moveq   #TURN_ORDER_ENTRIES_COUNTER,d7
@ClearTurnOrder_Loop:
                
                move.w  #-1,(a0)+
                dbf     d7,@ClearTurnOrder_Loop
                
                movea.l (sp)+,a0
                clr.w   d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@AddAllyTurns_Loop:
                
                move.w  d7,-(sp)
                bsr.w   AddCombatantAndRandomizedAgiToTurnOrder
                move.w  (sp)+,d7
                addq.w  #1,d0
                dbf     d7,@AddAllyTurns_Loop
                
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #BATTLE_ENEMY_ENTITIES_COUNTER,d7
@AddEnemyTurns_Loop:
                
                move.w  d7,-(sp)
                bsr.w   AddCombatantAndRandomizedAgiToTurnOrder
                move.w  (sp)+,d7
                addq.w  #1,d0
                dbf     d7,@AddEnemyTurns_Loop
                
                moveq   #COMBATANTS_ALL_COUNTER,d6
@SortCombatants_OuterLoop:
                
                moveq   #TURN_ORDER_ENTRIES_MINUS_ONE_COUNTER,d7
                lea     ((BATTLE_TURN_ORDER-$1000000)).w,a0
@SortCombatants_InnerLoop:
                
                move.w  (a0),d0
                move.w  TURN_ORDER_ENTRY_SIZE(a0),d1
                cmp.b   d0,d1
                ble.s   @InOrder
                
                ; Swap entries
                move.w  d1,(a0)
                move.w  d0,TURN_ORDER_ENTRY_SIZE(a0)
@InOrder:
                
                addq.l  #TURN_ORDER_ENTRY_SIZE,a0
                dbf     d7,@SortCombatants_InnerLoop
                dbf     d6,@SortCombatants_OuterLoop
                
                clr.b   ((CURRENT_BATTLE_TURN-$1000000)).w
                rts

    ; End of function GenerateBattleTurnOrder


; =============== S U B R O U T I N E =======================================

; In: a0 = pointer to turn order entry
;     d0.w = combatant index


AddCombatantAndRandomizedAgiToTurnOrder:
                
                jsr     j_GetCombatantX
                tst.b   d1
                bmi.w   @Return
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.w   @Return         ; skip if combatant is not alive
                jsr     j_GetCurrentAgi
                move.w  d1,d3
                andi.w  #TURN_AGILITY_MASK,d1
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
@AddTurnData1:  move.b  d0,(a0)+
                move.b  d1,(a0)+
                cmpi.w  #TWO_TURN_THRESHOLD,d3
                blt.s   @Return
                
                ; Add a second turn if AGI >= 128
                move.w  d3,d1
                andi.w  #TURN_AGILITY_MASK,d1
                mulu.w  #5,d1
                divu.w  #6,d1
                move.w  d1,d6
                lsr.w   #3,d6
                jsr     (GenerateRandomNumber).w
                add.w   d7,d1
                jsr     (GenerateRandomNumber).w
                sub.w   d7,d1
@AddTurnData2:  move.b  d0,(a0)+
                move.b  d1,(a0)+
@Return:
                
                rts

    ; End of function AddCombatantAndRandomizedAgiToTurnOrder

