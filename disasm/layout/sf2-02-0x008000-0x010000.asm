
; GAME SECTION 02 :
; 0x008000..0x010000 : Character Stats Engine, Battle engine, Item Effects Engine, Enemy AI Engine
; FREE SPACE : 121 bytes.


                include "code\common\tech\jumpinterfaces\s02_jumpinterface.asm"    ; Game Section 02 Jump Interface
                include "code\common\tech\pointers\s02_pointers.asm"    ; Game Section 02 Pointers
                
                ; Stats engine
                include "code\common\stats\combatantstats_1.asm"    ; Read combatant stats
                include "code\common\stats\getcombatanttype.asm"    ; Combatant type getter function
                include "data\stats\allies\classes\classtypes.asm"    ; Class types table
                include "code\common\stats\combatantstats_2.asm"    ; Modify combatant stats
                include "code\common\stats\findname.asm"    ; Find an item, spell, or class name
                include "code\common\stats\gold.asm"    ; Gold management functions
                include "code\common\stats\updatecombatantstats.asm"    ; Functions to apply equip and status effects on stats
                include "code\common\stats\itemstats.asm"    ; Item stats management functions
                include "code\common\stats\spellstats.asm"    ; Spell stats management functions
                include "code\common\stats\combatantstats_3.asm"    ; Manage combatant stats
                include "code\common\stats\unusedsub_9482.asm"    ; Unused nullsub
                include "code\common\stats\levelup.asm"    ; Level Up functions
                include "code\common\stats\newgame.asm"    ; New game initialization functions
                include "code\common\stats\gameflags.asm"    ; Game progression flags management functions
                include "code\common\stats\battleparty.asm"    ; Join or Leave Force and battle party management functions
                include "code\common\stats\dealsinventory.asm"    ; Deals inventory management functions
                include "code\common\stats\caravaninventory.asm"    ; Caravan inventory management functions
                
                ; Battleactions engine
                include "code\gameflow\special\debugmodebattleactions.asm"    ; Debug mode battle actions
                include "code\gameflow\battle\battleactions\battleactionsengine_1.asm"    ; Battleactions Engine, part 1
                include "code\gameflow\battle\battleactions\determineineffectiveattack.asm"    ; Determine ineffective attack function
                include "code\gameflow\battle\battleactions\initbattlesceneproperties.asm"    ; Init Battlescene Properties function
                include "code\gameflow\battle\battleactions\createbattlescenemessage.asm"    ; Create Battlescene Message function
                include "code\gameflow\battle\battleactions\createbattlesceneanimation.asm"    ; Create battlescene animation function
                include "code\gameflow\battle\battleactions\battleactionsengine_2.asm"    ; Battleactions Engine, part 2
                include "code\gameflow\battle\battleactions\isabletocounterattack.asm"    ; Is Able To Counter Attack function
                include "code\gameflow\battle\battleactions\getspellanimation.asm"    ; Get spell animation function
                include "code\gameflow\battle\battleactions\animateaction.asm"    ; Battlescene animation functions
                include "code\gameflow\battle\battleactions\giveexpandgold.asm"    ; Give EXP and gold function
                include "data\battles\global\halvedexpearnedbattles.asm"    ; Halved EXP earned battles table
                align
                include "code\gameflow\battle\battleactions\earnexp.asm"    ; EXP earning functions
                include "code\gameflow\battle\battleactions\sorttargets.asm"    ; Sort targets list function
                include "code\gameflow\battle\battleactions\unused_battleactions.asm"    ; Unused battleactions functions
                include "code\gameflow\battle\battleactions\attack.asm"    ; Write Battlescene Script : Attack
                include "code\gameflow\battle\battleactions\determinedodge.asm"    ; Determine dodge function
                include "code\gameflow\battle\battleactions\calculatedamage.asm"    ; Calculate attack damage function
                include "code\gameflow\battle\battleactions\determinecriticalhit.asm"    ; Determine critical hit function
                include "data\stats\allies\classes\criticalhitdefs.asm"    ; Critical hit settings definitions
                include "code\gameflow\battle\battleactions\inflictdamage.asm"    ; Write Battlescene Command : Inflict Damage function
                include "code\gameflow\battle\battleactions\inflictailment.asm"    ; Write Battlescene Command : Inflict Ailment function
                include "code\gameflow\battle\battleactions\inflictcursedamage.asm"    ; Write Battlescene Command : Inflict Curse Damage function
                include "code\gameflow\battle\battleactions\determinedoubleandcounter.asm"    ; Write Battlescene Command : Determine Double And Counter function
                include "code\gameflow\battle\battleactions\displaydeathmessage.asm"    ; Write Battlescene Command : Display Death Message function
                include "code\gameflow\battle\battleactions\castspell.asm"    ; Write Battlescene Script : Cast Spell
                include "code\gameflow\battle\battleactions\calculatespelldamage.asm"    ; Calculate Spell Damage function
                include "code\gameflow\battle\battleactions\useitem.asm"    ; Write Battlescene Script : Use Item
                include "code\gameflow\battle\battleactions\nullsub_BBE4.asm"    ; Unused nullsub
                include "code\gameflow\battle\battleactions\breakuseditem.asm"    ; Write Battlescene Script : Break Used Item
                include "data\stats\items\itembreakmessages.asm"    ; Item break messages
                include "code\gameflow\battle\battleactions\dropenemyitem.asm"    ; Write Battlescene Command : Drop Enemy Item function
                include "data\battles\global\enemyitemdrops.asm"    ; Enemy item drops
                include "data\stats\enemies\enemygold.asm"    ; Enemy gold amounts
                
                ; Battlefield engine
                include "code\gameflow\battle\battlefield\getmovestringdestination.asm"    ; Battlefield engine
                include "code\gameflow\battle\battleloop\clearaimemory.asm"    ; Battle loop function
                include "code\gameflow\battle\battlefield\battlefieldengine.asm"    ; Battlefield engine general functions
                include "code\gameflow\battle\battleactions\getresistancetospell.asm"    ; Resistance to spell element getter function
                include "data\stats\spells\spellelements.asm"    ; Spell elements table
                align
                include "code\gameflow\battle\ai\command\attack\determinemuddledbattleaction.asm"    ; Determine battleaction for AI controlled combatant afflicted with Muddle 2
                include "code\gameflow\battle\battlefield\initializemovementarrays.asm"    ; Movement arrays initialization function
                include "code\gameflow\battle\battlefield\getactionrange.asm"    ; Action (attack, cast spell, use item) range getter functions
                include "code\gameflow\battle\ai\iscombatantconfused.asm"    ; Is combatant afflicted with Muddle 2 checker function
                include "code\gameflow\battle\battlefield\buildactionrangegrids.asm"    ; Action range grids builder functions
                include "data\stats\spells\spellranges.asm"    ; Spell range tables
                include "code\gameflow\battle\battlefield\populatetargetslist.asm"    ; Populate targets list functions
                include "code\gameflow\battle\battlefield\determineattackposition.asm"    ; Determine attack position function
                include "code\gameflow\battle\battlefield\buildtargetsarray.asm"    ; Targets array builder functions
                include "code\gameflow\battle\battlefield\updateoccupiedterrainfunctions.asm"    ; Occupied terrain update functions
                include "code\gameflow\battle\battlefield\updatemovablegrid.asm"    ; Movable-grid array update function
                include "code\gameflow\battle\ai\command\attack\prioritizetargets.asm"    ; Prioritize reachable targets functions
                include "code\gameflow\battle\ai\command\heal\determinehealingspelllevel.asm"    ; Determine healing spell level function
                include "code\gameflow\battle\ai\command\heal\calculatehealtargetpriority.asm"    ; Calculate heal target priority function
                include "code\gameflow\battle\ai\command\attack\adjusttargetpriority.asm"    ; Adjust target priority function
                include "code\gameflow\battle\battlefield\determineattackpositionformoveorder.asm"    ; Determine attack postion for move order function
                include "code\gameflow\battle\ai\gethighestusablespelllevel.asm"    ; Highest usable spell level getter function
                include "code\gameflow\battle\ai\unusedfunctions_CF0E.asm"    ; Unused AI engine functions
                include "code\gameflow\battle\ai\getnextuseableaiaction.asm"    ; Usable AI actions getter functions
                include "code\gameflow\battle\battlefield\getreachabletargets.asm"    ; Reachable targets getter functions
                include "code\gameflow\battle\ai\command\heal\iscombatantatlessthanhalfhp.asm"    ; Is combatant at less than half HP checker function
                include "code\gameflow\battle\ai\command\attack\targetprioritizationhelperfunctions.asm"    ; Target prioritization helper functions
                include "code\gameflow\battle\ai\command\heal\doescombatantrequirehealing.asm"    ; Does combatant require healing checker function
                include "code\gameflow\battle\ai\command\heal\unusedfunctions_D3CA.asm"    ; Unused AI engine functions
                include "code\gameflow\battle\getdifficulty.asm"    ; Difficulty getter function
                include "code\gameflow\battle\battlefield\getcurrentterraintypeformoveorder.asm"    ; Current terrain type for move order getter function
                include "code\gameflow\battle\ai\command\support\prioritizetargetsforsupportspells.asm"    ; Populate priority list for spell functions
                include "data\battles\global\landeffectsettingsandmovecosts.asm"    ; Land effect settings and move costs table
                include "data\battles\global\aipriority.asm"    ; AI priority data
                include "code\gameflow\battle\battlefield\buildmovementarrays.asm"    ; Build movement arrays function
                include "code\gameflow\battle\battlefield\buildmovestringfunctions.asm"    ; Move string builder functions
                
                ; AI engine
                include "code\gameflow\battle\ai\startaicontrol.asm"    ; AI engine : preparatory phase
                include "data\battles\global\aicommandsets.asm"    ; AI commands data
                include "data\battles\global\swarmbattles.asm"    ; Parameters for battles implementing swarm AI
                include "code\gameflow\battle\ai\executeaicommand.asm"    ; Handle AI Command function
                include "code\gameflow\battle\ai\command\heal.asm"    ; AI command : Heal
                include "code\gameflow\battle\ai\command\attack.asm"    ; AI command : Attack
                include "code\gameflow\battle\ai\command\moveorder.asm"    ; AI command : Move order
                include "code\gameflow\battle\ai\command\support.asm"    ; AI command : Support
                include "code\gameflow\battle\ai\command\attack\determinebattleaction.asm"    ; AI engine : Determine AI Battleaction function
                include "code\gameflow\battle\ai\command\move.asm"    ; AI command : Move
                include "code\gameflow\battle\ai\determineaistandbymovement_1.asm"    ; AI engine : Determine standby movement function, part 1
                include "data\battles\global\aistandbymovements.asm"    ; AI standby movements table
                include "code\gameflow\battle\ai\command\moveorder\buildmovestringformoveorder.asm"    ; AI engine : Build move string for Move Order function
                include "code\gameflow\battle\ai\determineaistandbymovement_2.asm"    ; AI engine : Determine standby movement function, part 2
                include "data\battles\global\krakenmovecosts.asm"    ; Kraken move costs table
                
                include "data\stats\spells\spellnames.asm"    ; Spell names
                include "data\stats\allies\allynames.asm"    ; Ally names
                include "data\stats\enemies\enemynames.asm"    ; Enemy names
                align $10000
