
; GAME SECTION 07 :
; 0x044000..0x064000 : Entity ActScripts, CutScene Scripts, Battle CutScenes, Intro cutscene, End cutscene, Map Setups
; FREE SPACE : 2931 bytes.


                include "code\common\tech\jumpinterfaces\s07_jumpinterface.asm"    ; Game Section 07 Jump Interface
                include "code\common\scripting\map\mapfunctions.asm"    ; Map functions
                include "data\maps\global\overworldmaps.asm"    ; Overworld maps
                include "code\common\scripting\map\followersfunctions_1.asm"    ; Follower functions, part 1
                includeIfStandard "data\scripting\map\mapswithnofollowers-standard.asm"
                alignIfStandard
                include "data\scripting\entity\followers.asm"    ; Follower declarations
                include "code\common\scripting\map\followersfunctions_2.asm"    ; Follower functions, part 2
                include "code\common\scripting\entity\entityfunctions_1.asm"    ; Entity functions
                include "data\battles\global\battleneutralentities.asm"    ; Battle entities which are not force members or enemies
                include "data\scripting\entity\eas_battleneutralentities.asm"    ; Entity actscripts for battle entities which are not force members or enemies
                includeIfStandard "code\common\scripting\entity\getallymapsprite-standard.asm"
                includeIfStandard "data\stats\allies\allymapsprites-standard.asm"
                alignIfStandard
                includeIfStandard "code\common\scripting\entity\getcombatantmapsprite-standard.asm"
                includeIfVanilla "code\common\scripting\entity\getallymapsprite.asm"    ; Get ally map sprite index function
                includeIfVanilla "data\stats\allies\allymapsprites.asm"    ; Ally map sprite indexes table
                includeIfVanilla "code\common\scripting\entity\getcombatantmapsprite.asm"    ; Get combatant map sprite index function
                include "data\stats\enemies\enemymapsprites.asm"    ; Enemy map sprite indexes table
                align
                include "code\common\scripting\entity\entityfunctions_2.asm"    ; Entity functions
                include "data\scripting\entity\eas_main.asm"    ; Main entity actscripts
                include "code\common\scripting\entity\entityfunctions_3.asm"    ; Entity functions
                include "code\common\scripting\map\vehiclefunctions.asm"    ; Mapscripts and functions for Caravan and Raft
                includeIfStandard "code\common\scripting\entity\getentityportaitandspeechsfx-standard.asm"
                includeIfStandard "data\stats\allies\allydialogproperties-standard.asm"
                includeIfStandard "data\spritedialogproperties-standard.asm"
                includeIfVanilla "code\common\scripting\entity\getentityportaitandspeechsfx.asm"    ; Get entity portrait and speech sfx indexes function
                includeIfVanilla "data\spritedialogproperties.asm"    ; Sprite dialog properties
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
                includeIfStandard "code\common\scripting\map\bbcs_11_function.asm"
                include "code\gameflow\battle\beforebattlecutscenesend.asm"    ; Before battle cutscenes function end
                include "code\gameflow\battle\battlestartcutscenesstart.asm"    ; Battle start cutscenes function start
                include "data\battles\battlestartcutscenes.asm"    ; Battle start cutscenes
                include "code\gameflow\battle\battlestartcutscenesend.asm"    ; Battle start cutscenes function end
                include "code\gameflow\battle\battleendcutscenesstart.asm"    ; Battle end cutscenes function start
                include "data\battles\battleendcutscenes.asm"    ; Enemy defeated cutscenes
                include "code\gameflow\battle\battleendcutscenesend.asm"    ; Battle end cutscenes function end
                include "data\battles\global\enemyleaderpresence.asm"    ; Enemy leader presence table
                align
                include "code\gameflow\battle\afterbattlecutscenesstart.asm"    ; After battle cutscenes function start
                include "data\battles\afterbattlecutscenes.asm"    ; After battle cutscenes
                include "code\gameflow\battle\afterbattlecutscenesend.asm"    ; After battle cutscenes function end
                include "data\battles\global\afterbattlejoins.asm"    ; After battle joins (unused)
                include "code\gameflow\battle\afterenemyleaderdeathpositions.asm"    ; After-battlescene listener used to prepare entity positions for end cutscene before the enemy leader dies. Only used in battle 5.
                include "data\battles\afterbattlepositions.asm"    ; After battle positions
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
                include "data\battles\entries\battlecutscenesstorage.asm"
                include "code\common\stats\items\itemfunctions_s7_0.asm"    ; Unidentified item functions
                include "data\maps\mapsetups.asm"    ; Map setups table
                include "data\maps\mapsetupsstorage.asm"
                alignIfVanilla $64000
