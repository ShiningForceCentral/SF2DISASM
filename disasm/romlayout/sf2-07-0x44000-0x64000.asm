
; GAME SECTION 07 :
; 0x044000 : Entity ActScripts, CutScene Scripts, Battle CutScenes, Intro cutscene, End cutscene, Map Setups

; FREE SPACE : 2931 bytes.


										include "system\scripting\functionjumps.asm"		; Scripting functions jump list
										include "system\scripting\map\mapfunctions.asm"		; Map functions
										include "system\scripting\map\followersfunctions.asm"		; Followers functions
										include "system\scripting\entity\entityfunctions_1.asm"		; Entity functions
										include "battles\global\battleneutralentities.asm"		; Battle entities which are not force members or enemies
										include "scripting\entityactscripts\eas_battleneutralentities.asm"		; Entity actscripts for battle entities which are not force members or enemies
										include "system\scripting\entity\entityfunctions_2.asm"		; Entity functions
										include "scripting\entityactscripts\eas_main.asm"		; Main entity actscripts
										include "system\scripting\entity\entityfunctions_3.asm"		; Entity functions
										include "system\scripting\map\vehiclefunctions.asm"		; Mapscripts and functions for Caravan and Raft
										include "system\scripting\entity\entityfunctions_4.asm"		; Entity functions
										include "scripting\entityactscripts\eas_actions.asm"		; Entity scripts for cutscene actions
										include "system\scripting\map\mapscriptengine_1.asm"		; Mapscript engine, part 1
										include "system\scripting\map\debugmapscripts.asm"		; Debug mapscript function
										include "system\scripting\map\nullsub_4712A.asm"		; Unused empty function
										include "system\scripting\map\mapscriptengine_2.asm"		; Mapscript engine, part 2
										include "system\scripting\map\mapsetupsfunctions_1.asm"		; Map setups functions
										include "system\scripting\map\resetalliesstats.asm"		; CSC 55 function
										include "system\text\headquarters.asm"		; Headquarters quote function
										include "maps\entries\map37\mapsetups\s6_47948.asm"		; Map 37 init function
										include "maps\entries\map46\mapsetups\s6_47992.asm"		; Map 46 init function
										include "system\scripting\map\ms_empty.asm"		; Empty mapscript
										include "system\battles\beforebattlecutscenesstart.asm"		; Before battle cutscenes function start
										include "battles\global\beforebattlecutscenes.asm"		; Before battle cutscenes
										include "system\battles\beforebattlecutscenesend.asm"		; Before battle cutscenes function end
										include "system\battles\battlestartcutscenesstart.asm"		; Battle start cutscenes function start
										include "battles\global\battlestartcutscenes.asm"		; Battle start cutscenes
										include "system\battles\battlestartcutscenesend.asm"		; Battle start cutscenes function end
										include "system\battles\battleendcutscenesstart.asm"		; Battle end cutscenes function start
										include "battles\global\battleendcutscenes.asm"		; Enemy defeated cutscenes
										include "system\battles\battleendcutscenesend.asm"		; Battle end cutscenes function end
										include "system\battles\afterbattlecutscenesstart.asm"		; After battle cutscenes function start
										include "battles\global\afterbattlecutscenes.asm"		; After battle cutscenes
										include "system\battles\afterbattlecutscenesend.asm"		; After battle cutscenes function end
										include "battles\global\afterbattlejoins.asm"		; After battle joins (unused)
										include "system\battles\afterenemyleaderdeathpositions.asm"		; After-battlescene listener used to prepare entity positions for end cutscene before the enemy leader dies. Only used in battle 5.
										include "system\battles\regionactivatedcutscenes.asm"		; Region-activated cutscenes functions
										include "battles\global\regionactivatedcutscenes.asm"		; Region-activated cutscenes data
										include "system\graphics\flashwhite.asm"		; Flash white function and script
										include "scripting\cutscenes\cs_introendroutine.asm"		; Subroutine launching intro and end cutscenes
										include "scripting\cutscenes\cs_intro1.asm"		; Intro cutscene 1
										include "scripting\cutscenes\cs_intro2.asm"		; Intro cutscene 2
										include "scripting\cutscenes\cs_intro3.asm"		; Intro cutscene 3
										include "scripting\cutscenes\cs_intro4.asm"		; Intro cutscene 4
										include "scripting\cutscenes\cs_intro_stormeffect.asm"		; Storm Effect
										include "scripting\cutscenes\cs_end.asm"		; End cutscene
										include battles\global\battlecutscenesstorage.asm
										include "system\items\itemfunctions_s7_0.asm"		; Unidentified item functions
										include "maps\global\mapsetups.asm"		; Map setups table
										include maps\global\mapsetupsstorage.asm
										align $4000
