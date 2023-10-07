
; GAME SECTION 02 :
; 0x008000..0x010000 : Character Stats Engine, Battle engine, Item Effects Engine, Enemy AI Engine
; FREE SPACE : 121 bytes.


                include "code\common\tech\jumpinterfaces\s02_jumpinterface.asm"    ; Game Section 02 Jump Interface
                include "code\common\tech\pointers\s02_pointers.asm"    ; Game Section 02 Pointers
                
                ; Stats engine
                include "code\common\stats\statsengine_1.asm"    ; Character stats engine, part 1
                include "code\common\stats\getcombatanttype.asm"    ; Combatant type getter function
                include "data\stats\allies\classes\classtypes.asm"    ; Class types table
                include "code\common\stats\statsengine_2.asm"    ; Character stats engine, part 2
                include "code\common\stats\levelup.asm"    ; Level Up functions
                include "code\common\stats\statsengine_3.asm"    ; Character stats engine, part 3
                include "code\common\stats\caravaninventoryfunctions.asm"    ; Caravan inventory management functions
                
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
                include "code\gameflow\battle\battleactions\battleactionsengine_3.asm"    ; Battleactions Engine, part 3
                include "data\battles\global\halvedexpearnedbattles.asm"    ; Halved EXP earned battles table
                align
                include "code\gameflow\battle\battleactions\battleactionsengine_4.asm"    ; Battleactions Engine, part 4
                include "code\gameflow\battle\battleactions\attack.asm"    ; Write Battlescene Script : Attack
                include "code\gameflow\battle\battleactions\determinedodge.asm"    ; Determine dodge function
                include "code\gameflow\battle\battleactions\calculatedamage.asm"    ; Calculate attack damage function
                include "code\gameflow\battle\battleactions\determinecriticalhit.asm"    ; Determine critical hit function
                include "data\stats\allies\classes\criticalhitdefs.asm"    ; Critical hit settings definitions
                include "code\gameflow\battle\battleactions\battleactionsengine_5.asm"    ; Battleactions Engine, part 5
                include "code\gameflow\battle\battleactions\castspell.asm"    ; Write Battlescene Script : Cast Spell
                include "code\gameflow\battle\battleactions\calculatespelldamage.asm"    ; Calculate Spell Damage function
                include "code\gameflow\battle\battleactions\useitem.asm"    ; Write Battlescene Script : Use Item
                include "code\gameflow\battle\battleactions\nullsub_BBE4.asm"    ; Unused nullsub
                include "code\gameflow\battle\battleactions\breakuseditem.asm"    ; Write Battlescene Script : Break Used Item
                include "data\stats\items\itembreakmessages.asm"    ; Item break messages
                include "code\gameflow\battle\battleactions\dropenemyitem.asm"    ; Write Battlescene Command : Drop Enemy Item function
                include "data\battles\global\enemyitemdrops.asm"    ; Enemy item drops
                include "data\stats\enemies\enemygold.asm"    ; Enemy gold amounts
                include "code\gameflow\battle\battleactions\battleactionsengine_6.asm"    ; Battleactions Engine, part 6
                
                ; Battlefield engine
                include "code\gameflow\battle\battlefield\battlefieldengine_1.asm"    ; Battlefield engine
                include "data\stats\spells\spellelements.asm"    ; Spell elements table
                align
                include "code\gameflow\battle\battlefield\battlefieldengine_2.asm"    ; Battlefield engine
                include "code\gameflow\battle\battlefield\getattackrange.asm"    ; Get Attack Range function
                include "code\gameflow\battle\battlefield\battlefieldengine_3.asm"    ; Battlefield engine
                include "code\gameflow\battle\battlefield\determinehealingspelllevel.asm"    ; Determine healing spell level function
                include "code\gameflow\battle\battlefield\battlefieldengine_4.asm"    ; Battlefield engine
                include "code\gameflow\battle\battlefield\useableaiactions.asm"    ; Usable AI actions getter functions
                include "code\gameflow\battle\battlefield\battlefieldengine_5.asm"    ; Battlefield engine
                include "code\gameflow\battle\battlefield\doescombatantrequirehealing.asm"    ; Does combatant require healing function
                include "code\gameflow\battle\battlefield\battlefieldengine_6.asm"    ; Battlefield engine
                include "data\battles\global\landeffectsettingsandmovecosts.asm"    ; Land effect settings and move costs table
                include "data\battles\global\aipriority.asm"    ; AI priority data
                include "code\gameflow\battle\battlefield\battlefieldengine_7.asm"    ; Battlefield engine
                
                ; AI engine
                include "code\gameflow\battle\ai\aiengine_1.asm"    ; AI engine
                include "data\battles\global\aicommandsets.asm"    ; AI commands data
                include "data\battles\global\swarmbattles.asm"    ; Parameters for battles implementing swarm AI
                include "code\gameflow\battle\ai\handleaicommand.asm"    ; Handle AI Command function
                include "code\gameflow\battle\ai\aicommandheal.asm"    ; AI command : Heal
                include "code\gameflow\battle\ai\aicommandattack.asm"    ; AI command : Attack
                include "code\gameflow\battle\ai\aicommandspecialmove.asm"    ; AI command : Special Move
                include "code\gameflow\battle\ai\aicommandsupport.asm"    ; AI command : Support
                include "code\gameflow\battle\ai\determineaibattleaction.asm"    ; Determine AI Battleaction function
                include "code\gameflow\battle\ai\aicommandmove.asm"    ; AI command : Move
                include "code\gameflow\battle\ai\aiengine_2.asm"    ; AI engine
                include "data\battles\global\krakenmovecosts.asm"    ; Kraken move costs table
                
                include "data\stats\spells\spellnames.asm"    ; Spell names
                include "data\stats\allies\allynames.asm"    ; Ally names
                include "data\stats\enemies\enemynames.asm"    ; Enemy names
                align $10000
