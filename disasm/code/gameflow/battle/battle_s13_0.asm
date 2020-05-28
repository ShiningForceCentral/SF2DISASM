
; ASM FILE code\gameflow\battle\battle_s13_0.asm :
; 0x1AC000..0x1AC068 : Jump interface for section functions

; =============== S U B R O U T I N E =======================================

j_LoadBattleTerrainData:
                
                jmp     LoadBattleTerrainData(pc)

    ; End of function j_LoadBattleTerrainData


; =============== S U B R O U T I N E =======================================

j_InitAllForceBattlePositions:
                
                jmp     InitAllForceBattlePositions(pc)

    ; End of function j_InitAllForceBattlePositions


; =============== S U B R O U T I N E =======================================

j_InitAllEnemyBattlePositions:
                
                jmp     InitAllEnemyBattlePositions(pc)

    ; End of function j_InitAllEnemyBattlePositions


; =============== S U B R O U T I N E =======================================

j_RespawnEnemyIfOpen:
                
                jmp     UpdateEnemyStatsForRespawn(pc)

    ; End of function j_RespawnEnemyIfOpen


; =============== S U B R O U T I N E =======================================

j_InitEnemyList:
                
                jmp     InitEnemyList(pc)

    ; End of function j_InitEnemyList


; =============== S U B R O U T I N E =======================================

j_getEnemyAITargetPos:
                
                jmp     GetEnemyAITargetPos(pc)

    ; End of function j_getEnemyAITargetPos


; =============== S U B R O U T I N E =======================================

j_GetBattleSpriteSetSubsection:
                
                jmp     GetBattleSpriteSetSubsection(pc)

    ; End of function j_GetBattleSpriteSetSubsection


; =============== S U B R O U T I N E =======================================

j_BattleDebugFunction1B120A:
                
                jmp     BattleDebugFunction1B120A(pc)

    ; End of function j_BattleDebugFunction1B120A


; =============== S U B R O U T I N E =======================================

j_GetCombatantStartPos:
                
                jmp     GetCombatantStartPos(pc)

    ; End of function j_GetCombatantStartPos


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

j_getMoveListForEnemyTarget:
                
                jmp     GetEnemyAITargetMoveList(pc)

    ; End of function j_getMoveListForEnemyTarget


; =============== S U B R O U T I N E =======================================

; AI-related

sub_1AC030:
                
                jmp     sub_1AC4F0(pc)  

    ; End of function sub_1AC030


; =============== S U B R O U T I N E =======================================

j_clearTerrainListObstructions:
                
                jmp     ClearTerrainListObstructions(pc)

    ; End of function j_clearTerrainListObstructions


; =============== S U B R O U T I N E =======================================

; AI-related

sub_1AC038:
                
                jmp     sub_1AC9FC(pc)  

    ; End of function sub_1AC038


; =============== S U B R O U T I N E =======================================

j_UpdateTriggeredRegionsAndAI:
                
                jmp     UpdateTriggeredRegionsAndAI(pc)

    ; End of function j_UpdateTriggeredRegionsAndAI


; =============== S U B R O U T I N E =======================================

j_GetListOfSpawningEnemies:
                
                jmp     GetListOfSpawningEnemies(pc)

    ; End of function j_GetListOfSpawningEnemies


; =============== S U B R O U T I N E =======================================

j_randomUnderD6:
                
                jmp     RandomUnderD6(pc)

    ; End of function j_randomUnderD6


; =============== S U B R O U T I N E =======================================

j_IsSpecialBattle:
                
                jmp     DoesBattleUpgrade(pc)

    ; End of function j_IsSpecialBattle


; =============== S U B R O U T I N E =======================================

j_UpgradeBattle:
                
                jmp     UpgradeBattle(pc)

    ; End of function j_UpgradeBattle


; =============== S U B R O U T I N E =======================================

j_ShouldBattleUpgrade:
                
                jmp     ShouldBattleUpgrade(pc)

    ; End of function j_ShouldBattleUpgrade


; =============== S U B R O U T I N E =======================================

; Battle-related

sub_1AC054:
                
                jmp     sub_1B16FE(pc)  

    ; End of function sub_1AC054


; =============== S U B R O U T I N E =======================================

j_CheckTriggerRegionFlag:
                
                jmp     CheckTriggerRegionFlag(pc)

    ; End of function j_CheckTriggerRegionFlag


; =============== S U B R O U T I N E =======================================

; AI-related

sub_1AC05C:
                
                jmp     sub_1AC8A0(pc)  

    ; End of function sub_1AC05C

p_plt_endKiss:  dc.l plt_EndKiss
p_endKissPicture:
                dc.l EndKissPicture
