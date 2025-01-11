
; ASM FILE code\gameflow\battle\battleloop\initializecombatantsforbattle.asm :
; 0x1B1272..0x1B15F8 : Battle loop functions

; =============== S U B R O U T I N E =======================================


InitializeCombatantsForBattle:
                
            if (STANDARD_BUILD=1)
                pea     InitializeAllEnemiesBattlePositions(pc)
            endif
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
                
                move.b  (a1),d0         ; D0 = ally index from battle party members table
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
                loadSavedDataAddress CURRENT_BATTLE, a0
                move.b  (a0),d1
                cmpi.b  #BATTLE_TO_MOUN,d1
                bne.s   loc_1B132E
                cmpi.b  #COMBATANT_ENEMY_INDEX_15,d0
                bne.s   loc_1B132E
                bsr.w   HasJaroJoinedTheForce ; HARDCODED check for Jaro in battle 32
                tst.w   d1
                beq.s   loc_1B132E
                bra.w   loc_1B139A      ; skip positioning enemy 15 in battle 32 if Jaro has joined the Force
loc_1B132E:
                
                moveq   #BATTLESPRITESET_SUBSECTION_ENEMIES,d1
                bsr.w   GetBattleSpritesetSubsection
                move.w  d1,d2
                bset    #COMBATANT_BIT_ENEMY,d2
                clr.w   d1
                cmp.b   d2,d0
                bcc.w   loc_1B1368
                move.b  d0,d1
                andi.l  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d1
                mulu.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,d1
                adda.w  d1,a0
                move.w  BATTLESPRITESET_ENTITYOFFSET_AI_ACTIVATION_FLAG(a0),d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                cmpi.w  #2,d1
                bge.w   loc_1B1368
                bsr.w   InitializeEnemyStats
                bra.w   loc_1B139A
loc_1B1368:
                
                lsl.w   #BYTE_SHIFT_COUNT,d1
                jsr     j_SetActivationBitfield
                clr.w   d1
                jsr     j_SetMaxHp
                jsr     j_SetCurrentHp
                move.w  #-1,d1
                jsr     j_SetCombatantX
                clr.w   d1
                clr.w   d2
                move.b  BATTLESPRITESET_ENTITYOFFSET_AI_TRIGGER_REGION(a0),d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_9(a0),d2
                jsr     j_SetAiRegion
loc_1B139A:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function InitializeEnemyBattlePosition


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index
;     d1.w = AI activation flag
; 
; Out: CCR carry-bit clear if respawn


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
            if (STANDARD_BUILD=1)
                getPointer p_table_EnemyDefinitions, a1
            else
                lea     table_EnemyDefinitions(pc), a1
            endif
                adda.w  d1,a1
                move.l  a0,-(sp)
                jsr     j_GetCombatantEntryAddress_0
                moveq   #13,d7
@Loop:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  (a1)+,d1
                movep.l d1,0(a0)
                addq.w  #8,a0
            else
                move.l  (a1)+,(a0)+
            endif
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
                jsr     j_SetMoveType
                move.b  d6,d1
                jsr     j_SetEnemyIndex
                move.b  BATTLESPRITESET_ENTITYOFFSET_AI_TRIGGER_REGION(a0),d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_9(a0),d2
                jsr     j_SetAiRegion
                move.b  BATTLESPRITESET_ENTITYOFFSET_ENTITY_TO_FOLLOW(a0),d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_MOVE_TO_POSITION(a0),d2
                jsr     j_SetAiSpecialMoveOrders
                move.w  BATTLESPRITESET_ENTITYOFFSET_ITEMS(a0),d1
                bsr.w   InitializeEnemyItems
                jsr     j_GetActivationBitfield
                move.w  d1,d2
                andi.w  #WORD_UPPER_NIBBLE_MASK,d2
                move.w  BATTLESPRITESET_ENTITYOFFSET_AI_ACTIVATION_FLAG(a0),d1
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

; Unused in standard build

InitializeEnemyList:
                
            if (VANILLA_BUILD=1)
                movem.l d1/a0-a1,-(sp)
                lea     ((ENEMY_LIST-$1000000)).w,a1
                moveq   #7,d1
loc_1B14E2:
                
                clr.l   (a1)+
                dbf     d1,loc_1B14E2
                moveq   #BATTLESPRITESET_SUBSECTION_ENEMIES,d1
                bsr.w   GetBattleSpritesetSubsection
                subq.w  #1,d1
                lea     ((ENEMY_LIST-$1000000)).w,a1
loc_1B14F4:
                
                move.b  (a0),(a1)+
                adda.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,a0
                dbf     d1,loc_1B14F4
                movem.l (sp)+,d1/a0-a1
                rts
            endif

    ; End of function InitializeEnemyList


; =============== S U B R O U T I N E =======================================


InitializeEnemyItems:
                
                movem.l d0-a0,-(sp)
                cmpi.w  #ITEM_NOTHING,d1
                beq.w   loc_1B154E
                jsr     j_AddItem
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   loc_1B154E
                move.w  d1,d3
                clr.w   d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                subi.w  #1,d2
                move.w  d2,d4
                clr.w   d5
loc_1B152E:
                
                move.w  d5,d1
                jsr     j_GetItemBySlotAndHeldItemsNumber
                cmp.b   d1,d3
                bne.s   loc_1B1546
                move.w  d5,d1
                jsr     j_EquipItemBySlot
                bra.w   loc_1B154E
loc_1B1546:
                
                addi.w  #1,d5
                dbf     d4,loc_1B152E
loc_1B154E:
                
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
loc_1B155C:
                
                jsr     j_GetCombatantX
                cmp.w   d1,d3
                bne.s   loc_1B1576
                jsr     j_GetCombatantY
                cmp.w   d1,d4
                ori     #1,ccr
                beq.w   loc_1B15A4
loc_1B1576:
                
                addq.w  #1,d0
                dbf     d7,loc_1B155C
                
                move.w  #COMBATANT_ENEMIES_START,d0
                moveq   #COMBATANT_ENEMIES_COUNTER,d7
loc_1B1582:
                
                jsr     j_GetCombatantX
                cmp.w   d1,d3
                bne.s   loc_1B159C
                jsr     j_GetCombatantY
                cmp.w   d1,d4
                ori     #1,ccr
                beq.w   loc_1B15A4
loc_1B159C:
                
                addq.w  #1,d0
                dbf     d7,loc_1B1582
                
                tst.b   d0
loc_1B15A4:
                
                movem.l (sp)+,d0-d2/d7
                rts

    ; End of function IsEnemyStartingPositionOccupied


; =============== S U B R O U T I N E =======================================

; Adjust enemy base ATT according to difficulty.
; If DIFFICULTY_FACTORS is enabled, adjust DEF and AGI as well.
;
;   In: d0.b = combatant index


AdjustEnemyBaseAttForDifficulty:
                
            if (STANDARD_BUILD&DIFFICULTY_FACTORS=1)
                
@capEnemyStat:  macro
                cmpi.w #255,d1
                ble.s  @Continue\@
                move.w #255,d1
@Continue\@:
                endm
                
                move.l  d1,-(sp)
                jsr     GetDifficulty
                beq.w   @Done                   ; no adjustments if Normal Difficulty

                ; Hard Difficulty
                jsr     GetBaseATT
                mulu.w  #NORMAL_TO_HARD_ATT,d1  ; default: base ATT * 1.25
                lsr.w   #2,d1
                @capEnemyStat
                jsr     SetBaseATT
                jsr     GetBaseDEF
                mulu.w  #NORMAL_TO_HARD_DEF,d1  ; default: base DEF * 1
                lsr.w   #2,d1
                @capEnemyStat
                jsr     SetBaseDEF
                jsr     GetBaseAGI
                mulu.w  #NORMAL_TO_HARD_AGI,d1  ; default: base AGI * 1
                lsr.w   #2,d1
                @capEnemyStat
                jsr     SetBaseAGI
                jsr     GetDifficulty
                cmpi.w  #DIFFICULTY_HARD,d1
                beq.w   @Done
                
                ; Super Difficulty
                jsr     GetBaseATT
                mulu.w  #HARD_TO_SUPER_ATT,d1   ; default: base ATT * 1.25
                lsr.w   #2,d1
                @capEnemyStat
                jsr     SetBaseATT
                jsr     GetBaseDEF
                mulu.w  #HARD_TO_SUPER_DEF,d1   ; default: base DEF * 1
                lsr.w   #2,d1
                @capEnemyStat
                jsr     SetBaseDEF
                jsr     GetBaseAGI
                mulu.w  #HARD_TO_SUPER_AGI,d1   ; default: base AGI * 1
                lsr.w   #2,d1
                @capEnemyStat
                jsr     SetBaseAGI
                jsr     GetDifficulty
                cmpi.w  #DIFFICULTY_SUPER,d1
                beq.s   @Done

                ; Ouch Difficulty
                jsr     GetBaseATT
                mulu.w  #SUPER_TO_OUCH_ATT,d1   ; default: base ATT * 1
                lsr.w   #2,d1
                @capEnemyStat
                jsr     SetBaseATT
                jsr     GetBaseDEF
                mulu.w  #SUPER_TO_OUCH_DEF,d1   ; default: base DEF * 1
                lsr.w   #2,d1
                @capEnemyStat
                jsr     SetBaseDEF
                jsr     GetBaseAGI
                mulu.w  #SUPER_TO_OUCH_AGI,d1   ; default: base AGI * 1.5
                lsr.w   #2,d1
                @capEnemyStat
                jsr     SetBaseAGI
@Done:          move.l  (sp)+,d1
                rts
            else
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
            endif

    ; End of function AdjustEnemyBaseAttForDifficulty

