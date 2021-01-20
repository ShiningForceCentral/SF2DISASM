
; GAME SECTION 07 :
; 0x044000..0x064000 : Entity ActScripts, CutScene Scripts, Battle CutScenes, Intro cutscene, End cutscene, Map Setups
; FREE SPACE : 2931 bytes.


sub_44000:                
                jmp     sub_440D4(pc)
j_InitMapEntities:                
                jmp     InitMapEntities(pc)
j_MoveEntitiesToBattlePositions:                
                jmp     MoveEntitiesToBattlePositions(pc)
sub_4400C:                
                jmp     sub_45634(pc)
j_WaitForEntityToStopMoving:                
                jmp     WaitForEntityToStopMoving(pc)
j_SetControlledEntityActScript:                
                jmp     SetControlledEntityActScript(pc)
j_MakeEntityIdle:                
                jmp     MakeEntityIdle(pc)
j_ApplyInitActscript:                
                jmp     ApplyInitActscript(pc)
j_SetEntityMovescriptToIdle:                
                jmp     SetEntityMovescriptToIdle(pc)
sub_44024:                
                jmp     sub_44B94(pc)
j_SetUnitCursorActscript:                
                jmp     SetUnitCursorActscript(pc)
sub_4402C:                
                jmp     sub_44BC0(pc)
sub_44030:                
                jmp     sub_44BD6(pc)
j_DebugMapScript:                
                jmp     DebugMapScript(pc)
j_nullsub_4712A:                
                jmp     nullsub_4712A(pc)
j_ExecuteMapScript:                
                jmp     ExecuteMapScript(pc)
j_ExecuteBattleCutscene_Intro:                
                jmp     j_ExecuteBattleCutscene_Intro_0(pc)
j_ExecuteBattleCutscene_Start:                
                jmp     ExecuteBattleCutscene_Start(pc)
j_ExecuteBattleCutscene_Defeated:                
                jmp     ExecuteBattleCutscene_Defeated(pc)
j_ExecuteAfterBattleCutscene:                
                jmp     ExecuteAfterBattleCutscene(pc)
j_ApplyPositionsAfterEnemyLeaderDies:                
                jmp     ApplyPositionsAfterEnemyLeaderDies(pc)
j_ExecuteBattleRegionCutscene:                
                jmp     ExecuteBattleRegionCutscene(pc)
j_LaunchFading:                
                jmp     LaunchFading(pc)
j_OrientSpriteLeft_bis:                
                jmp     OrientSpriteLeft(pc)
j_OrientSpriteLeft:                
                jmp     OrientSpriteLeft(pc)
j_OrientSpriteRight:                
                jmp     OrientSpriteRight(pc)
j_ResizeSprite:                
                jmp     ResizeSprite(pc)
j_ApplyMinorSpriteCropEffect:                
                jmp     ApplyMinorSpriteCropEffect(pc)
j_ApplySpriteImmersedEffect:                
                jmp     ApplySpriteImmersedEffect(pc)
j_ApplySpriteGhostEffect:                
                jmp     ApplySpriteGhostEffect(pc)
sub_44078:                
                jmp     sub_474EE(pc)
j_RunMapSetupEntityEvent:                
                jmp     RunMapSetupEntityEvent(pc)
j_RunMapSetupZoneEvent:                
                jmp     RunMapSetupZoneEvent(pc)
j_RunMapSetupEntityEvent_0:                
                jmp     RunMapSetupEntityEvent(pc)
; triggers a map setup function according to up to 4 criterias in d1-d4
j_RunMapSetupItemEvent:                
                jmp     RunMapSetupItemEvent(pc)
j_GetMapSetupEntities:                
                jmp     GetMapSetupEntityList(pc)
j_MapEventType3:                
                jmp     MapEventType3(pc)
j_MapEventType5:                
                jmp     MapEventType5(pc)
; related to followers maybe
j_MapEventType2:                
                jmp     MapEventType2(pc)
j_MapEventType4:                
                jmp     MapEventType4(pc)
j_ShrinkInBowieAndFollowers:                
                jmp     ShrinkIntoCaravanBowieAndFollowers(pc)
j_GrowOutBowieAndFollowers:                
                jmp     GrowOutBowieAndFollowers(pc)
j_RunMapSetupInitFunction:                
                jmp     RunMapSetupInitFunction(pc)
sub_440AC:                
                jmp     sub_441AA(pc)
j_GetAllyMapSprite:                
                jmp     GetAllyMapSprite(pc)
j_RunMapSetupAreaDescription:                
                jmp     RunMapSetupAreaDescription(pc)
sub_440B8:                
                jmp     sub_444A2(pc)
j_PlayIntroOrEndCutscene:                
                jmp     PlayIntroOrEndCutscene(pc)
j_ExecuteFlashScreenScript:                
                jmp     ExecuteFlashScreenScript(pc)
j_GetEntityPortaitAndSpeechSfx:                
                jmp     GetEntityPortaitAndSpeechSfx(pc)
j_ClearEntities:                
                jmp     ClearEntities(pc)
                include "code\common\scripting\map\mapfunctions.asm"    ; Map functions
                include "data\maps\global\overworldmaps.asm"    ; Overworld maps
                include "code\common\scripting\map\followersfunctions_1.asm"    ; Follower functions, part 1
                include "data\scripting\entity\followers.asm"    ; Follower declarations
                include "code\common\scripting\map\followersfunctions_2.asm"    ; Follower functions, part 2
                include "code\common\scripting\entity\entityfunctions_1.asm"    ; Entity functions
                include "data\battles\global\battleneutralentities.asm"    ; Battle entities which are not force members or enemies
                include "data\scripting\entity\eas_battleneutralentities.asm"    ; Entity actscripts for battle entities which are not force members or enemies

                if (FORCE_MEMBERS_EXPANSION=1)
                include "code\common\scripting\entity\getcombatantmapsprite-expanded.asm"
                include "data\stats\allies\allymapsprites-expanded.asm"
                else
                include "code\common\scripting\entity\getallymapsprite.asm"    ; Get ally map sprite index function
                include "data\stats\allies\allymapsprites.asm"    ; Ally map sprite indexes table
                include "code\common\scripting\entity\getcombatantmapsprite.asm"    ; Get combatant map sprite index function
                endif

                include "data\stats\enemies\enemymapsprites.asm"    ; Enemy map sprite indexes table
                wordAlign
                include "code\common\scripting\entity\entityfunctions_2.asm"    ; Entity functions
                include "data\scripting\entity\eas_main.asm"    ; Main entity actscripts
                include "code\common\scripting\entity\entityfunctions_3.asm"    ; Entity functions
                include "code\common\scripting\map\vehiclefunctions.asm"    ; Mapscripts and functions for Caravan and Raft

                if (FORCE_MEMBERS_EXPANSION=1)
                include "code\common\scripting\entity\getentityportaitandspeechsound-expanded.asm"
                include "data\spritedialogproperties-expanded.asm"
                else
                include "code\common\scripting\entity\getentityportaitandspeechsound.asm"    ; Get entity portrait and speech sfx indexes function
                include "data\spritedialogproperties.asm"    ; Sprite dialog properties
                endif

                include "code\common\scripting\entity\entityfunctions_4.asm"    ; Entity functions
                include "data\scripting\entity\eas_actions.asm"    ; Entity scripts for cutscene actions
                include "code\common\scripting\map\mapscriptengine_1.asm"    ; Mapscript engine, part 1
                include "code\common\scripting\map\debugmapscripts.asm"    ; Debug mapscript function
                include "code\common\scripting\map\nullsub_4712A.asm"    ; Unused empty function
                include "code\common\scripting\map\mapscriptengine_2.asm"    ; Mapscript engine, part 2
                include "code\common\scripting\map\mapsetupsfunctions_1.asm"    ; Map setups functions
                include "code\common\scripting\map\resetalliesstats.asm"    ; CSC 55 function
                include "code\common\scripting\map\headquartersfunctions.asm"    ; Headquarters functions
                include "code\common\scripting\map\ms_empty.asm"    ; Empty mapscript
                include "code\gameflow\battle\beforebattlecutscenesstart.asm"    ; Before battle cutscenes function start
                include "data\battles\beforebattlecutscenes.asm"    ; Before battle cutscenes
                include "code\gameflow\battle\beforebattlecutscenesend.asm"    ; Before battle cutscenes function end
                include "code\gameflow\battle\battlestartcutscenesstart.asm"    ; Battle start cutscenes function start
                include "data\battles\battlestartcutscenes.asm"    ; Battle start cutscenes
                include "code\gameflow\battle\battlestartcutscenesend.asm"    ; Battle start cutscenes function end
                include "code\gameflow\battle\battleendcutscenesstart.asm"    ; Battle end cutscenes function start
                include "data\battles\battleendcutscenes.asm"    ; Enemy defeated cutscenes
                include "code\gameflow\battle\battleendcutscenesend.asm"    ; Battle end cutscenes function end
                include "data\battles\global\enemyleaderpresence.asm"    ; Enemy leader presence table
                wordAlign
                include "code\gameflow\battle\afterbattlecutscenesstart.asm"    ; After battle cutscenes function start
                include "data\battles\afterbattlecutscenes.asm"    ; After battle cutscenes
                include "code\gameflow\battle\afterbattlecutscenesend.asm"    ; After battle cutscenes function end
                include "data\battles\global\afterbattlejoins.asm"    ; After battle joins (unused)
                include "code\gameflow\battle\afterenemyleaderdeathpositions.asm"    ; After-battlescene listener used to prepare entity positions for end cutscene before the enemy leader dies. Only used in battle 5.
                include "code\gameflow\battle\regionactivatedcutscenes.asm"    ; Region-activated cutscenes functions
                include "data\battles\global\regionactivatedcutscenes.asm"    ; Region-activated cutscenes data
                include "code\common\tech\graphics\flashwhite.asm"    ; Flash white function and script
                include "data\scripting\map\cs_introendroutine.asm"    ; Subroutine launching intro and end cutscenes
                include "data\scripting\map\cs_intro1.asm"    ; Intro cutscene 1
                include "data\scripting\map\cs_intro2.asm"    ; Intro cutscene 2
                include "data\scripting\map\cs_intro3.asm"    ; Intro cutscene 3
                include "data\scripting\map\cs_intro4.asm"    ; Intro cutscene 4
                include "data\scripting\map\cs_intro_stormeffect.asm"    ; Storm Effect
                include "data\scripting\map\cs_end.asm"    ; End cutscene
                include "data\scripting\map\debugscripts.asm"    ; Debugging scripts
                include data\battles\entries\battlecutscenesstorage.asm
                include "code\common\stats\items\itemfunctions_s7_0.asm"    ; Unidentified item functions
                include "data\maps\mapsetups.asm"    ; Map setups table
                ;includeIfVanillaRom data\maps\mapsetupsstorage.asm
                include data\maps\mapsetupsstorage.asm
                align $64000
