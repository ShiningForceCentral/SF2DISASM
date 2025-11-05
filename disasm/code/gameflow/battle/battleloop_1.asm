
; ASM FILE code\gameflow\battle\battleloop_1.asm :
; 0x23A84..0x23BB4 : Battle loop main, part 1

; =============== S U B R O U T I N E =======================================

; In: d0.b = map index
;     d1.b = battle index


BattleLoop:
                
                clearSavedByte PLAYER_TYPE
            if (MUSIC_RESUMING&RESUME_BATTLESCENE_MUSIC=1)
                activateMusicResuming
            endif
            if (STANDARD_BUILD&ORIGINAL_TAROS_INVULNERABILITY=1)
                ; Make sure to clear the "invulnerable enemy" flag when initializing a new battle
                clrFlg  112             ; Currently attacking Taros with Achilles Sword
            endif
                setFlg  399             ; Set after first battle's cutscene OR first save? Checked at witch screens
                chkFlg  88              ; checks if a game has been saved for copying purposes ? (or if saved from battle?)
                beq.s   @Initialize
                
                ; Start here if game was suspended mid-battle
                move.l  ((SAVED_SECONDS_COUNTER-$1000000)).w,((SECONDS_COUNTER-$1000000)).w
                clrFlg  88              ; checks if a game has been saved for copying purposes ? (or if saved from battle?)
                jsr     j_ClearAiMemory
                clr.b   ((VIEW_TARGET_ENTITY-$1000000)).w
                bsr.w   LoadBattle      
                bra.w   @ExecuteIndividualTurns_Loop
                bra.w   @Start          ; unreachable
@Initialize:
                
                clr.l   ((SECONDS_COUNTER-$1000000)).w
                
                movem.w d0-d1,-(sp)
                setSavedByte d0, CURRENT_MAP
                setSavedByte d1, CURRENT_BATTLE
                bsr.w   SetBaseVIntFunctions
                jsr     j_ExecuteBeforeBattleCutscene
                movem.w (sp)+,d0-d1
                
                setSavedByte d0, CURRENT_MAP
                setSavedByte d1, CURRENT_BATTLE
                moveq   #BATTLE_REGION_FLAGS_START,d1
@ClearBattleRegionFlags_Loop:
                
                jsr     j_ClearFlag     ; clear battle region flags
                addq.w  #1,d1
                cmpi.w  #BATTLE_REGION_FLAGS_END,d1
                ble.s   @ClearBattleRegionFlags_Loop
                
                bsr.w   HealLivingAndImmortalAllies
                jsr     j_InitializeAllAlliesBattlePositions
                jsr     j_InitializeAllEnemiesBattlePositions
                jsr     j_ClearAiMemory
                clr.w   d0
                bsr.w   LoadBattle      
                jsr     j_ExecuteBattleStartCutscene
@Start:
                
                bsr.w   UpdateAllRegionActivatedEnemiesAi ; start of battle loop
                jsr     j_ExecuteBattleRegionCutscene
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.s   @SpawnEnemies
                
                bsr.w   PrintAllActivatedDefCons
@SpawnEnemies:
                jsr     j_PopulateTargetsListWithSpawningEnemies
                move.w  ((TARGETS_LIST_LENGTH-$1000000)).w,d7
                beq.s   @Call_GenerateBattleTurnOrder
                
                subq.w  #1,d7
                lea     ((TARGETS_LIST-$1000000)).w,a0
@SpawnEnemies_Loop:
                
                clr.w   d0
                move.b  (a0)+,d0
                bsr.w   SpawnEnemyWithCamera
                dbf     d7,@SpawnEnemies_Loop
@Call_GenerateBattleTurnOrder:
                
                bsr.w   GenerateBattleTurnOrder
@ExecuteIndividualTurns_Loop:
                
                getBattleTurnActor d0   ; start of individual turn execution
                cmpi.b  #-1,d0
                beq.s   @Start
                
                bsr.w   ExecuteIndividualTurn
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                beq.s   @Continue
                cmpi.b  #INPUT_UP|INPUT_B|INPUT_C|INPUT_A,((PLAYER_1_INPUT-$1000000)).w
                bne.s   @Continue
                bsr.w   KillRemainingEnemies
@Continue:
                
                jsr     j_ExecuteBattleCutscene_Defeated
                jsr     ProcessKilledCombatants(pc)
                nop
                bsr.w   CountRemainingCombatants
                tst.w   d2
                beq.w   BattleLoop_Defeat
                tst.w   d3
                beq.w   BattleLoop_Victory
                getBattleTurnActor d0
                bsr.w   ProcessAfterTurnEffects
                jsr     ProcessKilledCombatants(pc)
                nop
                bsr.w   CountRemainingCombatants
                tst.w   d2
                beq.w   BattleLoop_Defeat
                tst.w   d3
                beq.w   BattleLoop_Victory
                addQuickToSavedByte #TURN_ORDER_ENTRY_SIZE, CURRENT_BATTLE_TURN
                bra.s   @ExecuteIndividualTurns_Loop

    ; End of function BattleLoop

