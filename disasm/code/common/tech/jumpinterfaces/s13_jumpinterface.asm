
; ASM FILE code\common\tech\jumpinterfaces\s13_jumpinterface.asm :
; 0x1AC000..0x1AC060 : Game Section 13 Jump Interface

; =============== S U B R O U T I N E =======================================


j_LoadBattleTerrainData:
                
            if (VANILLA_BUILD=1)
                jmp     LoadBattleTerrainData(pc)
            endif

    ; End of function j_LoadBattleTerrainData


; =============== S U B R O U T I N E =======================================


j_InitializeAllAlliesBattlePositions:
                
            if (VANILLA_BUILD=1)
                jmp     InitializeAllAlliesBattlePositions(pc)
            endif

    ; End of function j_InitializeAllAlliesBattlePositions


; =============== S U B R O U T I N E =======================================


j_InitializeAllEnemiesBattlePositions:
                
            if (VANILLA_BUILD=1)
                jmp     InitializeAllEnemiesBattlePositions(pc)
            endif

    ; End of function j_InitializeAllEnemiesBattlePositions


; =============== S U B R O U T I N E =======================================


j_ResetSpawningEnemyStats:
                
            if (VANILLA_BUILD=1)
                jmp     ResetSpawningEnemyStats(pc)
            endif

    ; End of function j_ResetSpawningEnemyStats


; =============== S U B R O U T I N E =======================================


j_InitializeEnemyList:
                
            if (VANILLA_BUILD=1)
                jmp     InitializeEnemyList(pc)
            endif
                

    ; End of function j_InitializeEnemyList


; =============== S U B R O U T I N E =======================================


j_GetMoveOrderPosition:
                
                jmp     GetMoveOrderPosition(pc)

    ; End of function j_GetMoveOrderPosition


; =============== S U B R O U T I N E =======================================


j_GetBattleSpritesetSubsection:
                
                jmp     GetBattleSpritesetSubsection(pc)

    ; End of function j_GetBattleSpritesetSubsection


; =============== S U B R O U T I N E =======================================


j_BattleDebugFunction1B120A:
            if (VANILLA_BUILD=1)
                jmp     BattleDebugFunction1B120A(pc)
            endif

    ; End of function j_BattleDebugFunction1B120A


; =============== S U B R O U T I N E =======================================


j_GetCombatantStartingPosition:
                
                jmp     GetCombatantStartingPosition(pc)

    ; End of function j_GetCombatantStartingPosition


; =============== S U B R O U T I N E =======================================

; AI-related


j_DetermineMoveOrderQuadrant:
                
                jmp     DetermineMoveOrderQuadrant(pc)  

    ; End of function j_DetermineMoveOrderQuadrant


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
                
            if (VANILLA_BUILD=1)
                jmp     IsRegionTriggered(pc)
            endif

    ; End of function j_IsRegionTriggered


; =============== S U B R O U T I N E =======================================


j_TriggerRegionsAndActivateEnemies:
                
            if (VANILLA_BUILD=1)
                jmp     TriggerRegionsAndActivateEnemies(pc)
            endif

    ; End of function j_TriggerRegionsAndActivateEnemies


; =============== S U B R O U T I N E =======================================


j_PopulateTargetsListWithSpawningEnemies:
                
            if (VANILLA_BUILD=1)
                jmp     PopulateTargetsListWithSpawningEnemies(pc)
            endif

    ; End of function j_PopulateTargetsListWithSpawningEnemies


; =============== S U B R O U T I N E =======================================


j_GenerateRandomNumberUnderD6:
                
            if (VANILLA_BUILD=1)
                jmp     GenerateRandomNumberUnderD6(pc)
            endif

    ; End of function j_GenerateRandomNumberUnderD6


; =============== S U B R O U T I N E =======================================


j_IsBattleUpgradable:
                
            if (VANILLA_BUILD=1)
                jmp     IsBattleUpgradable(pc)
            endif

    ; End of function j_IsBattleUpgradable


; =============== S U B R O U T I N E =======================================


j_UpgradeBattle:
                
            if (VANILLA_BUILD=1)
                jmp     UpgradeBattle(pc)
            endif

    ; End of function j_UpgradeBattle


; =============== S U B R O U T I N E =======================================


j_DetermineBattleUpgrade:
                
            if (VANILLA_BUILD=1)
                jmp     DetermineBattleUpgrade(pc)
            endif

    ; End of function j_DetermineBattleUpgrade


; =============== S U B R O U T I N E =======================================


j_CheckForTrappedChest:
                
                jmp     CheckForTrappedChest(pc)  

    ; End of function j_CheckForTrappedChest


; =============== S U B R O U T I N E =======================================


j_CheckTriggerRegionFlag:
                
            if (VANILLA_BUILD=1)
                jmp     CheckTriggerRegionFlag(pc)
            endif

    ; End of function j_CheckTriggerRegionFlag


; =============== S U B R O U T I N E =======================================

; AI-related


j_GetLaserFacing:
                
                jmp     GetLaserFacing(pc)

    ; End of function j_GetLaserFacing

