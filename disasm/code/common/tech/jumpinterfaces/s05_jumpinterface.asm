
; ASM FILE code\common\tech\jumpinterfaces\s05_jumpinterface.asm :
; 0x20000..0x20064 : Game Section 05 Jump Interface

; =============== S U B R O U T I N E =======================================


j_ShopMenuActions:
                
                jmp     ShopMenuActions(pc)

    ; End of function j_ShopMenuActions


; =============== S U B R O U T I N E =======================================


j_ChurchMenuActions:
                
                jmp     ChurchMenuActions(pc)

    ; End of function j_ChurchMenuActions


; =============== S U B R O U T I N E =======================================


j_MainMenuActions:
                
                jmp     MainMenuActions(pc)

    ; End of function j_MainMenuActions


; =============== S U B R O U T I N E =======================================


j_BlacksmithActions:
                
                jmp     BlacksmithActions(pc)

    ; End of function j_BlacksmithActions


; =============== S U B R O U T I N E =======================================


j_CaravanActions:
                
                jmp     CaravanMenuActions(pc)

    ; End of function j_CaravanActions


; =============== S U B R O U T I N E =======================================


j_LevelUpCutscene:
                
                jmp     FieldItem_LevelUp(pc)

    ; End of function j_LevelUpCutscene


; =============== S U B R O U T I N E =======================================


j_ExplorationLoop:
                
                jmp     ExplorationLoop(pc)

    ; End of function j_ExplorationLoop


; =============== S U B R O U T I N E =======================================


j_LoadUnitCursorTileData:
                
                jmp     LoadUnitCursorTileData(pc)

    ; End of function j_LoadUnitCursorTileData


; =============== S U B R O U T I N E =======================================


j_UpdateUnitCursorSprites:
                
                jmp     UpdateUnitCursorSprites(pc)

    ; End of function j_UpdateUnitCursorSprites


; =============== S U B R O U T I N E =======================================


sub_20024:
                
                jmp     sub_2364C(pc)

    ; End of function sub_20024


; =============== S U B R O U T I N E =======================================


j_ControlUnitCursor:
                
                jmp     ControlUnitCursor(pc)

    ; End of function j_ControlUnitCursor


; =============== S U B R O U T I N E =======================================


j_SetUnitCursorDestinationToNextBattleEntity:
                
                jmp     SetUnitCursorDestinationToNextBattleEntity(pc)

    ; End of function j_SetUnitCursorDestinationToNextBattleEntity


; =============== S U B R O U T I N E =======================================


j_SetCameraDestInTiles:
                
                jmp     SetCameraDestInTiles(pc)

    ; End of function j_SetCameraDestInTiles


; =============== S U B R O U T I N E =======================================


j_BattleLoop:
                
                jmp     BattleLoop(pc)  

    ; End of function j_BattleLoop


; =============== S U B R O U T I N E =======================================


j_BattleLoop_Unused:
                
                jmp     BattleLoop(pc)  

    ; End of function j_BattleLoop_Unused


; =============== S U B R O U T I N E =======================================


j_GetEntityEventIndex:
                
                jmp     GetEntityEventIndex(pc)

    ; End of function j_GetEntityEventIndex


; =============== S U B R O U T I N E =======================================


j_GetEntityIndexForCombatant:
                
                jmp     GetEntityIndexForCombatant(pc)

    ; End of function j_GetEntityIndexForCombatant


; =============== S U B R O U T I N E =======================================


j_FadeOut_WaitForP1Input:
                
                jmp     FadeOut_WaitForP1Input(pc)

    ; End of function j_FadeOut_WaitForP1Input


; =============== S U B R O U T I N E =======================================


j_SetEntityPosition:
                
                jmp     SetEntityPosition(pc)

    ; End of function j_SetEntityPosition


; =============== S U B R O U T I N E =======================================


j_CheckArea:
                
                jmp     CheckArea(pc)   

    ; End of function j_CheckArea


; =============== S U B R O U T I N E =======================================


j_UpdateSpecialSprites:
                
                jmp     UpdateSpecialSprites(pc)

    ; End of function j_UpdateSpecialSprites


; =============== S U B R O U T I N E =======================================


j_LoadSpecialSprite:
                
                jmp     LoadSpecialSprite(pc)

    ; End of function j_LoadSpecialSprite


; =============== S U B R O U T I N E =======================================


sub_20058:
                
                jmp     sub_25CB6(pc)

    ; End of function sub_20058


; =============== S U B R O U T I N E =======================================


j_EndGame:
                
                jmp     EndGame(pc)

    ; End of function j_EndGame


; =============== S U B R O U T I N E =======================================


j_SuspendGame:
                
                jmp     SuspendGame(pc)

    ; End of function j_SuspendGame

