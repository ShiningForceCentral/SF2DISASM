
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


j_GetAiSpecialMoveOrderCoordinates:
                
                jmp     GetAiSpecialMoveOrderCoordinates(pc)

    ; End of function j_GetAiSpecialMoveOrderCoordinates


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


sub_1AC024:
                
                jmp     sub_1AC38E(pc)  

    ; End of function sub_1AC024


; =============== S U B R O U T I N E =======================================

; AI-related


sub_1AC028:
                
                jmp     sub_1AC69A(pc)  

    ; End of function sub_1AC028


; =============== S U B R O U T I N E =======================================


j_AdjustObstructionFlagsForAiWithSecondaryCharacteristic1:
                
                jmp     AdjustObstructionFlagsForAiWithSecondaryCharacteristic1(pc)

    ; End of function j_AdjustObstructionFlagsForAiWithSecondaryCharacteristic1


; =============== S U B R O U T I N E =======================================


j_AdjustObstructionFlagsForAiWithSecondaryCharacteristic2:
                
                jmp     AdjustObstructionFlagsForAiWithSecondaryCharacteristic2(pc)

    ; End of function j_AdjustObstructionFlagsForAiWithSecondaryCharacteristic2


; =============== S U B R O U T I N E =======================================


j_ClearBattleTerrainArrayObstructionFlags:
                
                jmp     ClearBattleTerrainArrayObstructionFlags(pc)

    ; End of function j_ClearBattleTerrainArrayObstructionFlags


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


j_RegionTriggeredSpawn:
                
                jmp     RegionTriggeredSpawn(pc)

    ; End of function j_RegionTriggeredSpawn


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

