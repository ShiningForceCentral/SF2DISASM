
; GAME SECTION 05 :
; 0x020000 : Battle Engine, Special Sprites, Shop/Church/Blacksmith/Caravan engine, Battle Engine, Exploration Engine, Special Sprites

; FREE SPACE : 626 bytes.



; =============== S U B R O U T I N E =======================================

j_ShopActions:
										
										jmp     ShopMenuActions(pc)

	; End of function j_ShopActions


; =============== S U B R O U T I N E =======================================

j_ChurchActions:
										
										jmp     ChurchMenuActions(pc)

	; End of function j_ChurchActions


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
										
										jmp     LevelUpCutscene(pc)

	; End of function j_LevelUpCutscene


; =============== S U B R O U T I N E =======================================

j_ExecuteExplorationLoop:
										
										jmp     ExecuteExplorationLoop(pc)

	; End of function j_ExecuteExplorationLoop


; =============== S U B R O U T I N E =======================================

j_LoadUnitCursorTileData:
										
										jmp     LoadUnitCursorTileData(pc)

	; End of function j_LoadUnitCursorTileData


; =============== S U B R O U T I N E =======================================

sub_20020:
										
										jmp     sub_23554(pc)

	; End of function sub_20020


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

j_ExecuteBattleLoop:
										
										jmp     ExecuteBattleLoop(pc)

	; End of function j_ExecuteBattleLoop


; =============== S U B R O U T I N E =======================================

j_ExecuteBattleLoop_Unused:
										
										jmp     ExecuteBattleLoop(pc)

	; End of function j_ExecuteBattleLoop_Unused


; =============== S U B R O U T I N E =======================================

j_GetEntityEventIdx:
										
										jmp     GetEntityEventIdx(pc)

	; End of function j_GetEntityEventIdx


; =============== S U B R O U T I N E =======================================

j_GetEntityIndex:
										
										jmp     GetEntityNumberOfCombatant(pc)

	; End of function j_GetEntityIndex


; =============== S U B R O U T I N E =======================================

j_FadeOut_WaitForP2Input:
										
										jmp     FadeOut_WaitForP1Input(pc)

	; End of function j_FadeOut_WaitForP2Input


; =============== S U B R O U T I N E =======================================

j_SetEntityPosition:
										
										jmp     SetEntityPosition(pc)

	; End of function j_SetEntityPosition


; =============== S U B R O U T I N E =======================================

sub_2004C:
										
										jmp     sub_23862(pc)

	; End of function sub_2004C


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

										include "system\menus\shop\shopactions.asm"		; Shop functions
										include "system\menus\church\churchactions.asm"		; Church functions
										include "system\menus\main\mainactions.asm"		; Main menu functions
										include "system\menus\blacksmith\blacksmithactions.asm"		; Blacksmith functions
										include "system\menus\caravan\caravanactions.asm"		; Caravan functions
										include "system\items\itemactions.asm"		; Item functions
										include "system\battles\battlefunctions_0.asm"		; Battle functions
										include "system\exploration\explorationfunctions_0.asm"		; Exploration functions
										include "system\battles\battlefunctions_1.asm"		; Battle functions
										include "system\exploration\explorationfunctions_1.asm"		; Exploration functions
										include "system\battles\battlevints.asm"		; Battle VInt functions
										include "system\exploration\explorationvints.asm"		; Exploration VInt functions
										include "system\graphics\specialsprites.asm"		; Special Sprites functions
										include "system\specialscreens\suspend\suepend.asm"		; Suspend functions
										include "system\specialscreens\witchend\witchend.asm"		; Witch end functions
										rts

	; End of function VInt_WitchEndBlink

										align $8000
