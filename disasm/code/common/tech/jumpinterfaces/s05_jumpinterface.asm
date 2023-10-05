
; ASM FILE code\common\tech\jumpinterfaces\s05_jumpinterface.asm :
; 0x20000..0x20064 : Game Section 05 Jump Interface

; =============== S U B R O U T I N E =======================================


j_ShopMenu:
                
                jmp     ShopMenu(pc)

    ; End of function j_ShopMenu


; =============== S U B R O U T I N E =======================================


j_ChurchMenu:
                
                jmp     ChurchMenu(pc)

    ; End of function j_ChurchMenu


; =============== S U B R O U T I N E =======================================


j_FieldMenu:
                
                jmp     FieldMenu(pc)

    ; End of function j_FieldMenu


; =============== S U B R O U T I N E =======================================


j_BlacksmithMenu:
                
                jmp     BlacksmithMenu(pc)

    ; End of function j_BlacksmithMenu


; =============== S U B R O U T I N E =======================================


j_CaravanMenu:
                
                jmp     CaravanMenu(pc)

    ; End of function j_CaravanMenu


; =============== S U B R O U T I N E =======================================


j_FieldItem_LevelUp:
                
                jmp     fieldItem_LevelUp(pc)

    ; End of function j_FieldItem_LevelUp


; =============== S U B R O U T I N E =======================================


j_ExplorationLoop:
                
                jmp     ExplorationLoop(pc)

    ; End of function j_ExplorationLoop


; =============== S U B R O U T I N E =======================================


j_DmaCursorTiles:
                
                jmp     DmaCursorTiles(pc)

    ; End of function j_DmaCursorTiles


; =============== S U B R O U T I N E =======================================


j_UpdateCursorSprites:
                
                jmp     UpdateCursorSprites(pc)

    ; End of function j_UpdateCursorSprites


; =============== S U B R O U T I N E =======================================


j_UpdateSpritesHelper:
                
                jmp     UpdateSpritesHelper(pc)

    ; End of function j_UpdateSpritesHelper


; =============== S U B R O U T I N E =======================================


j_ControlCursorEntity:
                
                jmp     ControlCursorEntity(pc)

    ; End of function j_ControlCursorEntity


; =============== S U B R O U T I N E =======================================


j_SetCursorDestinationToNextBattleEntity:
                
                jmp     SetCursorDestinationToNextBattleEntity(pc)

    ; End of function j_SetCursorDestinationToNextBattleEntity


; =============== S U B R O U T I N E =======================================


j_SetCameraDestination:
                
                jmp     SetCameraDestination(pc)

    ; End of function j_SetCameraDestination


; =============== S U B R O U T I N E =======================================


j_BattleLoop:
                
                jmp     BattleLoop(pc)  

    ; End of function j_BattleLoop


; =============== S U B R O U T I N E =======================================

; unused


j_BattleLoop_0:
                
                jmp     BattleLoop(pc)  

    ; End of function j_BattleLoop_0


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


j_UpdateSpecialSprite:
                
                jmp     UpdateSpecialSprite(pc)

    ; End of function j_UpdateSpecialSprite


; =============== S U B R O U T I N E =======================================


j_LoadSpecialSprite:
                
                jmp     LoadSpecialSprite(pc)

    ; End of function j_LoadSpecialSprite


; =============== S U B R O U T I N E =======================================


j_AnimateSpecialSprite:
                
                jmp     AnimateSpecialSprite(pc)

    ; End of function j_AnimateSpecialSprite


; =============== S U B R O U T I N E =======================================


j_EndGame:
            if (VANILLA_BUILD=1)
                jmp     EndGame(pc)
            endif

    ; End of function j_EndGame


; =============== S U B R O U T I N E =======================================


j_SuspendGame:
            if (VANILLA_BUILD=1)
                jmp     SuspendGame(pc)
            endif

    ; End of function j_SuspendGame

