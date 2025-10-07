
; ASM FILE code\gameflow\battle\battleloop\initializecombatants.asm :
; 0x1B1272..0x1B15F8 : Battle loop functions

; =============== S U B R O U T I N E =======================================


InitializeAllAlliesBattlePositions:
                
                movem.l d0-a6,-(sp)
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                move.w  #-1,d1
@ResetPositions_Loop:
                
                jsr     j_SetCombatantX
                addq.b  #1,d0
                dbf     d7,@ResetPositions_Loop
                
                jsr     j_UpdateForce
                lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a1
                move.w  ((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w,d6
                subq.w  #1,d6
                moveq   #BATTLESPRITESET_SUBSECTION_SIZES,d1
                bsr.w   GetBattleSpritesetSubsection
                clr.w   d7
                move.b  (a0),d7
                subq.w  #1,d7
                bcs.w   @Done
                lea     BATTLESPRITESET_OFFSET_ALLY_ENTRIES(a0),a0
@InitPositions_Loop:
                
                move.b  (a1),d0         ; d0.b = ally index from battle party members table
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.s   @Skip           ; skip positioning if ally is dead
                clr.w   d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_X(a0),d1
                jsr     j_SetCombatantX
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_Y(a0),d1
                jsr     j_SetCombatantY
                lea     NEXT_BATTLESPRITESET_ENTITY(a0),a0
@Skip:
                
                addq.l  #1,a1
                subq.w  #1,d6
                bcs.w   @Done
                dbf     d7,@InitPositions_Loop
@LeaveBattleParty_Loop:
                
                move.b  (a1)+,d0
                jsr     j_LeaveBattleParty
                dbf     d6,@LeaveBattleParty_Loop
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function InitializeAllAlliesBattlePositions


; =============== S U B R O U T I N E =======================================


InitializeAllEnemiesBattlePositions:
                
                movem.l d0/d7,-(sp)
                move.b  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
@InitPositions_Loop:
                
                bsr.w   InitializeEnemyBattlePosition
                addq.b  #1,d0
                dbf     d7,@InitPositions_Loop
                
                movem.l (sp)+,d0/d7
                rts

    ; End of function InitializeAllEnemiesBattlePositions


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index


InitializeEnemyBattlePosition:
                
                movem.l d0-a6,-(sp)
                lea     ((CURRENT_BATTLE-$1000000)).w,a0
                move.b  (a0),d1
                cmpi.b  #BATTLE_TO_MOUN,d1
                bne.s   @loc_1
                cmpi.b  #COMBATANT_ENEMY_INDEX_15,d0
                bne.s   @loc_1
                bsr.w   HasJaroJoinedTheForce ; HARDCODED check for Jaro in battle 32
                tst.w   d1
                beq.s   @loc_1
                bra.w   @loc_3          ; skip positioning enemy 15 in battle 32 if Jaro has joined the Force
@loc_1:
                
                moveq   #BATTLESPRITESET_SUBSECTION_ENEMIES,d1
                bsr.w   GetBattleSpritesetSubsection
                move.w  d1,d2
                bset    #COMBATANT_BIT_ENEMY,d2
                clr.w   d1
                cmp.b   d2,d0
                bcc.w   @loc_2
                move.b  d0,d1
                andi.l  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d1
                mulu.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,d1
                adda.w  d1,a0
                move.w  BATTLESPRITESET_ENTITYOFFSET_INITIALIZATION_TYPE(a0),d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                cmpi.w  #2,d1
                bge.w   @loc_2
                bsr.w   InitializeEnemyStats
                bra.w   @loc_3
@loc_2:
                
                lsl.w   #BYTE_SHIFT_COUNT,d1
                jsr     j_SetActivationBitfield
                clr.w   d1
                jsr     j_SetMaxHp
                jsr     j_SetCurrentHp
                move.w  #-1,d1
                jsr     j_SetCombatantX
                clr.w   d1
                clr.w   d2
                move.b  BATTLESPRITESET_ENTITYOFFSET_PRIMARY_TRIGGER_REGION(a0),d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_SECONDARY_TRIGGER_REGION(a0),d2
                jsr     j_SetAiRegion
@loc_3:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function InitializeEnemyBattlePosition


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index
;     d1.w = AI activation bitfield
; 
; Out: CCR carry-bit set if spawn position is occupied


ResetSpawningEnemyStats:
                
                movem.l d0-a6,-(sp)
                move.w  d1,d2
                moveq   #BATTLESPRITESET_SUBSECTION_ENEMIES,d1
                bsr.w   GetBattleSpritesetSubsection
                bset    #7,d1
                cmp.b   d1,d0
                bcc.w   @PositionEnemyOffscreen
                move.b  d0,d1
                andi.l  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d1
                mulu.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,d1
                adda.w  d1,a0
                clr.w   d3
                clr.w   d4
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_X(a0),d3
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_Y(a0),d4
                bsr.w   IsEnemyStartingPositionOccupied
                bcs.w   @PositionEnemyOffscreen
                bsr.w   InitializeEnemyStats
                move.w  d2,d1
                jsr     j_SetActivationBitfield
                bra.w   @Done
@PositionEnemyOffscreen:
                
                clr.w   d1
                jsr     j_SetMaxHp
                jsr     j_SetCurrentHp
                move.w  #-1,d1
                jsr     j_SetCombatantX
                ori     #1,ccr
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function ResetSpawningEnemyStats


; =============== S U B R O U T I N E =======================================

; In: a0 = pointer to battle entity definition
;     d0.b = combatant index


InitializeEnemyStats:
                
                movem.l d0-a1,-(sp)
                clr.l   d1
                move.b  (a0),d1
                bsr.w   UpgradeRandomBattleEnemies
                move.w  d1,d6           ; d1.w, d6.w = upgraded enemy index
                mulu.w  #ENEMYDEF_ENTRY_SIZE,d1
                lea     table_EnemyDefinitions(pc), a1
                adda.w  d1,a1
                move.l  a0,-(sp)
                jsr     j_GetCombatantEntryAddress_0
                moveq   #ENEMYDEF_LONGWORDS_COUNTER,d7
@Loop:
                
                move.l  (a1)+,(a0)+
                dbf     d7,@Loop
                
                movea.l (sp)+,a0
                jsr     j_GetMaxHp
                jsr     j_SetCurrentHp
                jsr     j_GetMaxMp
                jsr     j_SetCurrentMp
                clr.w   d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_X(a0),d1
                jsr     j_SetCombatantX
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_Y(a0),d1
                jsr     j_SetCombatantY
                jsr     j_GetMoveType
                lsl.w   #NIBBLE_SHIFT_COUNT,d1
                andi.w  #BYTE_UPPER_NIBBLE_MASK,d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_AI_COMMANDSET(a0),d2
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d2
                or.w    d2,d1
                jsr     j_SetMoveTypeAndAiCommandset
                move.b  d6,d1
                jsr     j_SetEnemyIndex
                move.b  BATTLESPRITESET_ENTITYOFFSET_PRIMARY_TRIGGER_REGION(a0),d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_SECONDARY_TRIGGER_REGION(a0),d2
                jsr     j_SetAiRegion
                move.b  BATTLESPRITESET_ENTITYOFFSET_PRIMARY_ORDER(a0),d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_SECONDARY_ORDER(a0),d2
                jsr     j_SetAiMoveOrders
                move.w  BATTLESPRITESET_ENTITYOFFSET_ITEMS(a0),d1
                bsr.w   InitializeEnemyItems
                jsr     j_GetActivationBitfield
                move.w  d1,d2
                andi.w  #WORD_UPPER_NIBBLE_MASK,d2
                move.w  BATTLESPRITESET_ENTITYOFFSET_INITIALIZATION_TYPE(a0),d1
                ror.w   #8,d1
                andi.w  #$FFF,d1
                or.w    d2,d1
                jsr     j_SetActivationBitfield
                bsr.w   AdjustEnemyBaseAttForDifficulty
                jsr     j_UpdateCombatantStats
                movem.l (sp)+,d0-a1
                rts

    ; End of function InitializeEnemyStats


; =============== S U B R O U T I N E =======================================


InitializeEnemyList:
                
                movem.l d1/a0-a1,-(sp)
                lea     ((ENEMY_LIST-$1000000)).w,a1
                moveq   #7,d1
@Clear_Loop:
                
                clr.l   (a1)+
                dbf     d1,@Clear_Loop
                moveq   #BATTLESPRITESET_SUBSECTION_ENEMIES,d1
                bsr.w   GetBattleSpritesetSubsection
                subq.w  #1,d1
                lea     ((ENEMY_LIST-$1000000)).w,a1
@Populate_Loop:
                
                move.b  (a0),(a1)+
                adda.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,a0
                dbf     d1,@Populate_Loop
                movem.l (sp)+,d1/a0-a1
                rts

    ; End of function InitializeEnemyList


; =============== S U B R O U T I N E =======================================


InitializeEnemyItems:
                
                movem.l d0-a0,-(sp)
                cmpi.w  #ITEM_NOTHING,d1
                beq.w   @Done
                jsr     j_AddItem
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   @Done
                move.w  d1,d3
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                subi.w  #1,d2
                move.w  d2,d4
                clr.w   d5
@Item_Loop:
                
                move.w  d5,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                cmp.b   d1,d3
                bne.s   @NextItem
                move.w  d5,d1
                jsr     j_EquipItemBySlot
                bra.w   @Done
@NextItem:
                
                addi.w  #1,d5
                dbf     d4,@Item_Loop
@Done:
                
                movem.l (sp)+,d0-a0
                rts

    ; End of function InitializeEnemyItems


; =============== S U B R O U T I N E =======================================

; Is enemy starting position d3.w,d4.w curently occupied?
; Return CCR carry-bit set if true.


IsEnemyStartingPositionOccupied:
                
                movem.l d0-d2/d7,-(sp)
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@AlliesLoop:
                
                jsr     j_GetCombatantX
                cmp.w   d1,d3
                bne.s   @NextAlly
                jsr     j_GetCombatantY
                cmp.w   d1,d4
                ori     #1,ccr
                beq.w   @Done
@NextAlly:
                
                addq.w  #1,d0
                dbf     d7,@AlliesLoop
                
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
@EnemiesLoop:
                
                jsr     j_GetCombatantX
                cmp.w   d1,d3
                bne.s   @NextEnemy
                jsr     j_GetCombatantY
                cmp.w   d1,d4
                ori     #1,ccr
                beq.w   @Done
@NextEnemy:
                
                addq.w  #1,d0
                dbf     d7,@EnemiesLoop
                
                tst.b   d0
@Done:
                
                movem.l (sp)+,d0-d2/d7
                rts

    ; End of function IsEnemyStartingPositionOccupied


; =============== S U B R O U T I N E =======================================

; Adjust enemy base ATT according to difficulty.
; 
;   In: d0.b = combatant index


AdjustEnemyBaseAttForDifficulty:
                
                move.l  d1,-(sp)
                jsr     j_GetDifficulty
                cmpi.w  #DIFFICULTY_SUPER,d1 ; pointless comparison
                beq.s   @Continue
                beq.w   @Done
@Continue:
                
                clr.l   d1
                jsr     j_GetBaseAtt
                mulu.w  #5,d1
                lsr.l   #2,d1           ; base ATT effectively multiplied by 1.25
                jsr     j_SetBaseAtt
                jsr     j_GetDifficulty
                cmpi.w  #DIFFICULTY_SUPER,d1
                beq.s   @SuperDifficulty
                bra.w   @Done
@SuperDifficulty:
                
                clr.l   d1
                jsr     j_GetBaseAtt
                mulu.w  #5,d1
                lsr.l   #2,d1           ; if SUPER difficulty, multiply base ATT by 1.25 a second time
                jsr     j_SetBaseAtt
@Done:
                
                move.l  (sp)+,d1
                rts

    ; End of function AdjustEnemyBaseAttForDifficulty

