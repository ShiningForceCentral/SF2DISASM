
; ASM FILE code\gameflow\battle\battleloop-standard\initializecombatantsforbattle.asm :
;

; =============== S U B R O U T I N E =======================================


InitializeCombatantsForBattle:
                
                pea     InitializeAllEnemiesBattlePositions(pc)
InitializeAllAlliesBattlePositions:
                
                movem.l d0-a6,-(sp)
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #-1,d1
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@ResetPositions_Loop:
                
                jsr     SetCombatantX
                addq.b  #1,d0
                dbf     d7,@ResetPositions_Loop
                
                jsr     UpdateForce
                lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a1
                move.w  ((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w,d6
                subq.w  #1,d6
                moveq   #BATTLESPRITESET_SUBSECTION_SIZES,d1
                jsr     GetBattleSpritesetSubsection
                clr.w   d7
                move.b  (a0),d7
                subq.w  #1,d7
                blo.s   @Done
                
                lea     BATTLESPRITESET_OFFSET_ALLY_ENTRIES(a0),a0
@InitPositions_Loop:
                
                move.b  (a1),d0         ; D0 = ally index from battle party members table
                jsr     GetCurrentHp
                beq.s   @Skip           ; skip positioning if ally is dead
                
                clr.w   d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_X(a0),d1
                jsr     SetCombatantX
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_Y(a0),d1
                jsr     SetCombatantY
                lea     NEXT_BATTLESPRITESET_ENTITY(a0),a0
@Skip:
                
                addq.w  #1,a1
                subq.w  #1,d6
                blo.s   @Done
                
                dbf     d7,@InitPositions_Loop
@LeaveBattleParty_Loop:
                
                move.b  (a1)+,d0
                jsr     LeaveBattleParty
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
                
                bsr.s   InitializeEnemyBattlePosition
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
                bne.s   @loc_1
                
                cmpi.b  #COMBATANT_ENEMY_INDEX_15,d0
                bne.s   @loc_1
                
                bsr.s   HasJaroJoinedTheForce ; HARDCODED check for Jaro in battle 32
                bne.s   @loc_3          ; skip positioning enemy 15 in battle 32 if Jaro has joined the Force
@loc_1:
                
                moveq   #BATTLESPRITESET_SUBSECTION_ENEMIES,d1
                jsr     GetBattleSpritesetSubsection
                move.w  d1,d2
                bset    #COMBATANT_BIT_ENEMY,d2
                clr.w   d1
                cmp.b   d2,d0
                bhs.s   @loc_2
                
                move.b  d0,d1
                andi.l  #COMBATANT_MASK_INDEX_AND_SORT_BIT,d1
                mulu.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,d1
                adda.w  d1,a0
                move.w  BATTLESPRITESET_ENTITYOFFSET_AI_ACTIVATION_FLAG(a0),d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                cmpi.w  #2,d1
                bge.s   @loc_2
                
                bsr.s   InitializeEnemyStats
                bra.s   @loc_3
@loc_2:
                
                lsl.w   #BYTE_SHIFT_COUNT,d1
                jsr     SetActivationBitfield
                clr.w   d1
                jsr     SetMaxHp
                jsr     SetCurrentHp
                moveq   #-1,d1
                jsr     SetCombatantX
                clr.w   d1
                clr.w   d2
                move.b  BATTLESPRITESET_ENTITYOFFSET_AI_TRIGGER_REGION(a0),d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_9(a0),d2
                jsr     SetAiRegion
@loc_3:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function InitializeEnemyBattlePosition


; =============== S U B R O U T I N E =======================================

; Has Jaro joined the Force? Return d1.w = -1 if true.


HasJaroJoinedTheForce:
                
                movem.l d0/d2-a6,-(sp)
                jsr     UpdateForce
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  (a0),d7
                subq.w  #1,d7
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.l   d6
@Loop:
                
                clr.w   d0
                move.b  (a0,d6.w),d0
                cmpi.b  #ALLY_JARO,d0
                bne.s   @Next           ; keep checking force members until we either find Jaro or reach end of the list
                
                moveq   #-1,d1
                bra.s   @Found          ; Jaro is found, so we're done
@Next:
                
                addq.w  #1,d6
                dbf     d7,@Loop
                clr.w   d1              ; reached end of the list without finding Jaro
@Found:
                
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function HasJaroJoinedTheForce


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
                getPointer p_table_EnemyDefinitions, a1
                adda.w  d1,a1
                
                move.l  a0,-(sp)
                jsr     GetCombatantEntryAddress
                moveq   #13,d7
@Loop:
                
                move.l  (a1)+,d1
                setSavedLongWithPostIncrement d1, a0
                dbf     d7,@Loop
                
                movea.l (sp)+,a0
                
                jsr     GetMaxHp
                jsr     SetCurrentHp
                jsr     GetMaxMp
                jsr     SetCurrentMp
                clr.w   d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_X(a0),d1
                jsr     SetCombatantX
                move.b  BATTLESPRITESET_ENTITYOFFSET_STARTING_Y(a0),d1
                jsr     SetCombatantY
                jsr     GetMoveType
                lsl.w   #NIBBLE_SHIFT_COUNT,d1
                andi.w  #BYTE_UPPER_NIBBLE_MASK,d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_AI_COMMANDSET(a0),d2
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d2
                or.w    d2,d1
                jsr     SetMoveType
                move.b  d6,d1
                jsr     SetEnemyIndex
                move.b  BATTLESPRITESET_ENTITYOFFSET_AI_TRIGGER_REGION(a0),d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_9(a0),d2
                jsr     SetAiRegion
                move.b  BATTLESPRITESET_ENTITYOFFSET_ENTITY_TO_FOLLOW(a0),d1
                move.b  BATTLESPRITESET_ENTITYOFFSET_MOVE_TO_POSITION(a0),d2
                jsr     SetAiSpecialMoveOrders
                move.w  BATTLESPRITESET_ENTITYOFFSET_ITEMS(a0),d1
                bsr.s   InitializeEnemyItems
                jsr     GetActivationBitfield
                move.w  d1,d2
                andi.w  #WORD_UPPER_NIBBLE_MASK,d2
                move.w  BATTLESPRITESET_ENTITYOFFSET_AI_ACTIVATION_FLAG(a0),d1
                ror.w   #8,d1
                andi.w  #$FFF,d1
                or.w    d2,d1
                jsr     SetActivationBitfield
                bsr.s   AdjustEnemyBaseAttForDifficulty
                jsr     UpdateCombatantStats
                movem.l (sp)+,d0-a1
                rts

    ; End of function InitializeEnemyStats


; =============== S U B R O U T I N E =======================================


InitializeEnemyItems:
                
                movem.l d0-a0,-(sp)
                cmpi.w  #ITEM_NOTHING,d1
                beq.s   @Done
                
                jsr     AddItem
                btst    #ITEMENTRY_BIT_EQUIPPED,d1
                beq.s   @Done
                
                move.w  d1,d3
                clr.w   d1
                jsr     GetItemBySlotAndHeldItemsNumber
                subq.w  #1,d2
                move.w  d2,d4
                clr.w   d5
@Loop:
                
                move.w  d5,d1
                jsr     GetItemBySlotAndHeldItemsNumber
                cmp.b   d1,d3
                bne.s   @Next
                
                move.w  d5,d1
                jsr     EquipItemBySlot
                bra.s   @Done
@Next:
                
                addq.w  #1,d5
                dbf     d4,@Loop
@Done:
                
                movem.l (sp)+,d0-a0
                rts

    ; End of function InitializeEnemyItems


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

