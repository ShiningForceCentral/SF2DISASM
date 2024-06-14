
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


j_ResetEnemyStatsForRespawn:
                
                jmp     ResetEnemyStatsForRespawn(pc)

    ; End of function j_ResetEnemyStatsForRespawn


; =============== S U B R O U T I N E =======================================


j_InitializeEnemyList:
                
                jmp     InitializeEnemyList(pc)

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


sub_1AC038:
                
                jmp     sub_1AC9FC(pc)  

    ; End of function sub_1AC038


; =============== S U B R O U T I N E =======================================


j_UpdateTriggeredRegionsAndAi:
                
                jmp     UpdateTriggeredRegionsAndAi(pc)

    ; End of function j_UpdateTriggeredRegionsAndAi


; =============== S U B R O U T I N E =======================================


j_PopulateTargetsListWithRespawningEnemies:
                
                jmp     PopulateTargetsListWithRespawningEnemies(pc)

    ; End of function j_PopulateTargetsListWithRespawningEnemies


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


sub_1AC054:
                
                jmp     sub_1B16FE(pc)  

    ; End of function sub_1AC054


; =============== S U B R O U T I N E =======================================


j_CheckTriggerRegionFlag:
                
                jmp     CheckTriggerRegionFlag(pc)

    ; End of function j_CheckTriggerRegionFlag


; =============== S U B R O U T I N E =======================================

; AI-related


j_GetLaserFacing:
                
                jmp     GetLaserFacing(pc)

    ; End of function j_GetLaserFacing

