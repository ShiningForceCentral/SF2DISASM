
; SCRIPT SECTION system\scripting\functionjumps :
; Scripting functions jump list

; =============== S U B R O U T I N E =======================================

sub_44000:
										
										jmp     sub_440D4(pc)

	; End of function sub_44000


; =============== S U B R O U T I N E =======================================

j_InitMapEntities:
										
										jmp     InitMapEntities(pc)

	; End of function j_InitMapEntities


; =============== S U B R O U T I N E =======================================

j_MoveEntitiesToBattlePositions:
										
										jmp     MoveEntitiesToBattlePositions(pc)

	; End of function j_MoveEntitiesToBattlePositions


; =============== S U B R O U T I N E =======================================

sub_4400C:
										
										jmp     sub_45634(pc)

	; End of function sub_4400C


; =============== S U B R O U T I N E =======================================

j_WaitForEntityToStopMoving:
										
										jmp     WaitForEntityToStopMoving(pc)

	; End of function j_WaitForEntityToStopMoving


; =============== S U B R O U T I N E =======================================

j_SetControlledEntityActScript:
										
										jmp     SetControlledEntityActScript(pc)

	; End of function j_SetControlledEntityActScript


; =============== S U B R O U T I N E =======================================

j_MakeEntityIdle:
										
										jmp     MakeEntityIdle(pc)

	; End of function j_MakeEntityIdle


; =============== S U B R O U T I N E =======================================

; set entity D0's movescript to 0x460ce (default? don't move?)

sub_4401C:
										
										jmp     sub_44C02(pc)   

	; End of function sub_4401C


; =============== S U B R O U T I N E =======================================

j_SetEntityMovescriptToIdle:
										
										jmp     SetEntityMovescriptToIdle(pc)

	; End of function j_SetEntityMovescriptToIdle


; =============== S U B R O U T I N E =======================================

sub_44024:
										
										jmp     sub_44B94(pc)

	; End of function sub_44024


; =============== S U B R O U T I N E =======================================

j_SetUnitCursorActscript:
										
										jmp     SetUnitCursorActscript(pc)

	; End of function j_SetUnitCursorActscript


; =============== S U B R O U T I N E =======================================

sub_4402C:
										
										jmp     sub_44BC0(pc)

	; End of function sub_4402C


; =============== S U B R O U T I N E =======================================

sub_44030:
										
										jmp     sub_44BD6(pc)

	; End of function sub_44030


; =============== S U B R O U T I N E =======================================

j_ExecuteDebugMapScript:
										
										jmp     ExecuteDebugMapScript(pc)

	; End of function j_ExecuteDebugMapScript


; =============== S U B R O U T I N E =======================================

j_nullsub_14:
										
										jmp     nullsub_14(pc)

	; End of function j_nullsub_14


; =============== S U B R O U T I N E =======================================

j_ExecuteMapScript:
										
										jmp     ExecuteMapScript(pc)

	; End of function j_ExecuteMapScript


; =============== S U B R O U T I N E =======================================

j_ExecuteBattleCutscene_Intro:
										
										jmp     j_ExecuteBattleCutscene_Intro_0(pc)

	; End of function j_ExecuteBattleCutscene_Intro


; =============== S U B R O U T I N E =======================================

j_ExecuteBattleCutscene_Start:
										
										jmp     ExecuteBattleCutscene_Start(pc)

	; End of function j_ExecuteBattleCutscene_Start


; =============== S U B R O U T I N E =======================================

j_ExecuteBattleCutscene_Defeated:
										
										jmp     ExecuteBattleCutscene_Defeated(pc)

	; End of function j_ExecuteBattleCutscene_Defeated


; =============== S U B R O U T I N E =======================================

j_ExecuteAfterBattleCutscene:
										
										jmp     ExecuteAfterBattleCutscene(pc)

	; End of function j_ExecuteAfterBattleCutscene


; =============== S U B R O U T I N E =======================================

j_ApplyPositionsAfterEnemyLeaderDies:
										
										jmp     ApplyPositionsAfterEnemyLeaderDies(pc)

	; End of function j_ApplyPositionsAfterEnemyLeaderDies


; =============== S U B R O U T I N E =======================================

j_ExecuteBattleCutscene_Region:
										
										jmp     ExecuteBattleCutscene_Region(pc)

	; End of function j_ExecuteBattleCutscene_Region


; =============== S U B R O U T I N E =======================================

j_LaunchFading:
										
										jmp     LaunchFading(pc)

	; End of function j_LaunchFading


; =============== S U B R O U T I N E =======================================

sub_4405C:
										
										jmp     sub_45858(pc)

	; End of function sub_4405C


; =============== S U B R O U T I N E =======================================

sub_44060:
										
										jmp     sub_45858(pc)

	; End of function sub_44060


; =============== S U B R O U T I N E =======================================

sub_44064:
										
										jmp     sub_45974(pc)

	; End of function sub_44064


; =============== S U B R O U T I N E =======================================

sub_44068:
										
										jmp     sub_45BBE(pc)

	; End of function sub_44068


; =============== S U B R O U T I N E =======================================

sub_4406C:
										
										jmp     sub_45C94(pc)

	; End of function sub_4406C


; =============== S U B R O U T I N E =======================================

sub_44070:
										
										jmp     sub_45C82(pc)

	; End of function sub_44070


; =============== S U B R O U T I N E =======================================

sub_44074:
										
										jmp     sub_45B84(pc)

	; End of function sub_44074


; =============== S U B R O U T I N E =======================================

sub_44078:
										
										jmp     sub_474EE(pc)

	; End of function sub_44078


; =============== S U B R O U T I N E =======================================

j_ExecuteEntityEvent:
										
										jmp     ExecuteEntityEvent(pc)

	; End of function j_ExecuteEntityEvent


; =============== S U B R O U T I N E =======================================

j_RunMapSetupZoneEvent:
										
										jmp     RunMapSetupZoneEvent(pc)

	; End of function j_RunMapSetupZoneEvent


; =============== S U B R O U T I N E =======================================

j_ExecuteEntityEvent_0:
										
										jmp     ExecuteEntityEvent(pc)

	; End of function j_ExecuteEntityEvent_0


; =============== S U B R O U T I N E =======================================

; triggers a map setup function according to up to 4 criterias in d1-d4

sub_44088:
										
										jmp     sub_47586(pc)

	; End of function sub_44088


; =============== S U B R O U T I N E =======================================

j_GetMapSetupEntities:
										
										jmp     GetMapSetupEntityList(pc)

	; End of function j_GetMapSetupEntities


; =============== S U B R O U T I N E =======================================

sub_44090:
										
										jmp     sub_453C6(pc)

	; End of function sub_44090


; =============== S U B R O U T I N E =======================================

sub_44094:
										
										jmp     sub_45440(pc)

	; End of function sub_44094


; =============== S U B R O U T I N E =======================================

; related to followers maybe

sub_44098:
										
										jmp     sub_45268(pc)   

	; End of function sub_44098


; =============== S U B R O U T I N E =======================================

sub_4409C:
										
										jmp     sub_45322(pc)

	; End of function sub_4409C


; =============== S U B R O U T I N E =======================================

j_ShrinkInBowieAndFollowers:
										
										jmp     ShrinkIntoCaravanBowieAndFollowers(pc)

	; End of function j_ShrinkInBowieAndFollowers


; =============== S U B R O U T I N E =======================================

j_GrowOutBowieAndFollowoers:
										
										jmp     GrowOutBowieAndFollowoers(pc)

	; End of function j_GrowOutBowieAndFollowoers


; =============== S U B R O U T I N E =======================================

j_RunMapSetupInitFunction:
										
										jmp     RunMapSetupInitFunction(pc)

	; End of function j_RunMapSetupInitFunction


; =============== S U B R O U T I N E =======================================

sub_440AC:
										
										jmp     sub_441AA(pc)

	; End of function sub_440AC


; =============== S U B R O U T I N E =======================================

j_GetCharacterSpriteIdx:
										
										jmp     GetCharacterSpriteIdx(pc)

	; End of function j_GetCharacterSpriteIdx


; =============== S U B R O U T I N E =======================================

j_RunMapSetupFunction:
										
										jmp     RunMapSetupFunction(pc)

	; End of function j_RunMapSetupFunction


; =============== S U B R O U T I N E =======================================

sub_440B8:
										
										jmp     sub_444A2(pc)

	; End of function sub_440B8


; =============== S U B R O U T I N E =======================================

j_PlayIntroOrEndCutscene:
										
										jmp     PlayIntroOrEndCutscene(pc)

	; End of function j_PlayIntroOrEndCutscene


; =============== S U B R O U T I N E =======================================

j_ExecuteFlashScreenScript:
										
										jmp     ExecuteFlashScreenScript(pc)

	; End of function j_ExecuteFlashScreenScript


; =============== S U B R O U T I N E =======================================

j_GetEntityPortaitAndSpeechSound:
										
										jmp     GetEntityPortraitAndSpeechSfx(pc)

	; End of function j_GetEntityPortaitAndSpeechSound


; =============== S U B R O U T I N E =======================================

j_ClearEntities:
										
										jmp     ClearEntities(pc)

	; End of function j_ClearEntities

