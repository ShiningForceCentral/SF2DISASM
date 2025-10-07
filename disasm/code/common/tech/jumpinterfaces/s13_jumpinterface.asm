
; ASM FILE code\common\tech\jumpinterfaces\s13_jumpinterface.asm :
; 0x1AC000..0x1AC060 : Game Section 13 Jump Interface

; =============== S U B R O U T I N E =======================================


j_LoadBattleTerrainData:
                
                jmp     LoadBattleTerrainData(pc)

    ; End of function j_LoadBattleTerrainData


; =============== S U B R O U T I N E =======================================


j_InitializeAllAlliesBattlePositions:
                
                jmp     InitializeAllAlliesBattlePositions(pc)

    ; End of function j_InitializeAllAlliesBattlePositions


; =============== S U B R O U T I N E =======================================


j_InitializeAllEnemiesBattlePositions:
                
                jmp     InitializeAllEnemiesBattlePositions(pc)

    ; End of function j_InitializeAllEnemiesBattlePositions


; =============== S U B R O U T I N E =======================================


j_ResetSpawningEnemyStats:
                
                jmp     ResetSpawningEnemyStats(pc)

    ; End of function j_ResetSpawningEnemyStats


; =============== S U B R O U T I N E =======================================


j_InitializeEnemyList:
                
                jmp     InitializeEnemyList(pc)

    ; End of function j_InitializeEnemyList


; =============== S U B R O U T I N E =======================================


j_GetAiMoveOrderPosition:
                
                jmp     GetAiMoveOrderPosition(pc)

    ; End of function j_GetAiMoveOrderPosition


; =============== S U B R O U T I N E =======================================


j_GetBattleSpritesetSubsection:
                
                jmp     GetBattleSpritesetSubsection(pc)

    ; End of function j_GetBattleSpritesetSubsection


; =============== S U B R O U T I N E =======================================


j_BattleDebugFunction1B120A:
                
                jmp     BattleDebugFunction1B120A(pc)

    ; End of function j_BattleDebugFunction1B120A


; =============== S U B R O U T I N E =======================================


j_GetCombatantStartingPosition:
                
                jmp     GetCombatantStartingPosition(pc)

    ; End of function j_GetCombatantStartingPosition


; =============== S U B R O U T I N E =======================================

; AI-related


j_DetermineAiMoveOrderQuadrant:
                
                jmp     DetermineAiMoveOrderQuadrant(pc)  

    ; End of function j_DetermineAiMoveOrderQuadrant


; =============== S U B R O U T I N E =======================================

; AI-related


j_ApplyQuadrantTerrainMarking:
                
                jmp     ApplyQuadrantTerrainMarking(pc)  

    ; End of function j_ApplyQuadrantTerrainMarking


; =============== S U B R O U T I N E =======================================


j_BlockNonMovableSpacesAroundDestination:
                
                jmp     BlockNonMovableSpacesAroundDestination(pc)

    ; End of function j_BlockNonMovableSpacesAroundDestination


; =============== S U B R O U T I N E =======================================


j_BlockAndCarveAroundDestination:
                
                jmp     BlockAndCarveAroundDestination(pc)

    ; End of function j_BlockAndCarveAroundDestination


; =============== S U B R O U T I N E =======================================


j_ClearAllTemporaryObstructionFlags:
                
                jmp     ClearAllTemporaryObstructionFlags(pc)

    ; End of function j_ClearAllTemporaryObstructionFlags


; =============== S U B R O U T I N E =======================================

; AI-related


j_IsRegionTriggered:
                
                jmp     IsRegionTriggered(pc)

    ; End of function j_IsRegionTriggered


; =============== S U B R O U T I N E =======================================


j_TriggerRegionsAndActivateEnemies:
                
                jmp     TriggerRegionsAndActivateEnemies(pc)

    ; End of function j_TriggerRegionsAndActivateEnemies


; =============== S U B R O U T I N E =======================================


j_PopulateTargetsListWithSpawningEnemies:
                
                jmp     PopulateTargetsListWithSpawningEnemies(pc)

    ; End of function j_PopulateTargetsListWithSpawningEnemies


; =============== S U B R O U T I N E =======================================


j_GenerateRandomNumberUnderD6:
                
                jmp     GenerateRandomNumberUnderD6(pc)

    ; End of function j_GenerateRandomNumberUnderD6


; =============== S U B R O U T I N E =======================================


j_IsBattleUpgradable:
                
                jmp     IsBattleUpgradable(pc)

    ; End of function j_IsBattleUpgradable


; =============== S U B R O U T I N E =======================================


j_UpgradeBattle:
                
                jmp     UpgradeBattle(pc)

    ; End of function j_UpgradeBattle


; =============== S U B R O U T I N E =======================================


j_DetermineBattleUpgrade:
                
                jmp     DetermineBattleUpgrade(pc)

    ; End of function j_DetermineBattleUpgrade


; =============== S U B R O U T I N E =======================================


j_CheckForTrappedChest:
                
                jmp     CheckForTrappedChest(pc)  

    ; End of function j_CheckForTrappedChest


; =============== S U B R O U T I N E =======================================


j_CheckTriggerRegionFlag:
                
                jmp     CheckTriggerRegionFlag(pc)

    ; End of function j_CheckTriggerRegionFlag


; =============== S U B R O U T I N E =======================================

; AI-related


j_GetLaserFacing:
                
                jmp     GetLaserFacing(pc)

    ; End of function j_GetLaserFacing

