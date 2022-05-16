
; GAME SECTION 02 :
; 0x008000..0x010000 : Character Stats Engine, Battle engine, Item Effects Engine, Enemy AI Engine
; FREE SPACE : 121 bytes.


                include "code\common\stats\statsengine_1.asm"    ; Character stats engine
                include "data\stats\allies\classes\classtypes.asm"    ; Class types table
                include "code\common\stats\statsengine_2.asm"    ; Character stats engine
                include "code\common\stats\levelup.asm"    ; Level Up functions
                include "code\common\stats\statsengine_3.asm"    ; Character stats engine
                include "code\gameflow\special\debugmodebattleactions.asm"    ; Debug mode battle actions
                include "code\gameflow\battle\battleactionsengine_1.asm"    ; Battle actions engine
                include "code\gameflow\battle\determineineffectiveattack.asm"    ; Determine ineffective attack function
                include "code\gameflow\battle\initbattlesceneproperties.asm"    ; Init Battlescene Properties function
                include "code\gameflow\battle\createbattlescenemessage.asm"    ; Create Battlescene Message function
                include "code\gameflow\battle\createbattlesceneanimation.asm"    ; Create battlescene animation function
                include "code\gameflow\battle\battleactionsengine_2.asm"    ; Battle actions engine
                include "code\gameflow\battle\isabletocounterattack.asm"    ; Is Able To Counter Attack function
                include "code\gameflow\battle\getspellanimation.asm"    ; Get spell animation function
                include "code\gameflow\battle\battleactionsengine_3.asm"    ; Battle actions engine
                include "data\battles\global\halvedexpearnedbattles.asm"    ; Halved EXP earned battles table
                align
                include "code\gameflow\battle\battleactionsengine_4.asm"    ; Battle actions engine
                include "data\stats\allies\classes\criticalhitsettings.asm"    ; Critical hit settings
                include "code\gameflow\battle\battleactionsengine_5.asm"    ; Battle actions engine
                include "data\stats\items\itembreakmessages.asm"    ; Item break messages
                include "code\gameflow\battle\writebattlescenecommanddropenemyitem.asm"    ; Write Battlescene Command : Drop Enemy Item function
                include "data\battles\global\enemyitemdrops.asm"    ; Enemy item drops
                include "data\stats\enemies\enemygold.asm"    ; Enemy gold amounts
                include "code\gameflow\battle\battleactionsengine_6.asm"    ; Battle actions engine
                include "code\gameflow\battle\battlefieldengine_1.asm"    ; Battlefield engine
                include "data\stats\spells\spellelements.asm"    ; Spell elements table
                align
                include "code\gameflow\battle\battlefieldengine_2.asm"    ; Battlefield engine
                include "code\gameflow\battle\getattackrange.asm"    ; Get Attack Range function
                include "code\gameflow\battle\battlefieldengine_3.asm"    ; Battlefield engine
                include "code\gameflow\battle\determinehealingspelllevel.asm"    ; Determine healing spell level function
                include "code\gameflow\battle\battlefieldengine_4.asm"    ; Battlefield engine
                include "code\gameflow\battle\useableaiactions.asm"    ; Usable AI actions getter functions
                include "code\gameflow\battle\battlefieldengine_5.asm"    ; Battlefield engine
                include "code\gameflow\battle\doescombatantrequirehealing.asm"    ; Does combatant require healing function
                include "code\gameflow\battle\battlefieldengine_6.asm"    ; Battlefield engine
                include "data\battles\global\landeffectsettingsandmovecosts.asm"    ; Land effect settings and move costs table
                include "code\gameflow\battle\battlefieldengine_7.asm"    ; Battlefield engine
                include "code\gameflow\battle\aiengine_1.asm"    ; AI engine
                include "data\battles\aicommandsets.asm"    ; AI commands data
                include "data\battles\swarmbattleslist.asm"    ; List of battles implementing swarm AI
                align
                include "data\battles\swarmbattlesparams.asm"    ; Parameters for battles implementing swarm AI
                align
                include "code\gameflow\battle\handleaicommand.asm"    ; Handle AI Command function
                include "code\gameflow\battle\aicommandheal.asm"    ; AI command : Heal
                include "code\gameflow\battle\aicommandattack.asm"    ; AI command : Attack
                include "code\gameflow\battle\aicommandspecialmove.asm"    ; AI command : Special Move
                include "code\gameflow\battle\aicommandsupport.asm"    ; AI command : Support
                include "code\gameflow\battle\determineaibattleaction.asm"    ; Determine AI Battleaction function
                include "code\gameflow\battle\aicommandmove.asm.asm"    ; AI command : Move
                include "code\gameflow\battle\aiengine_2.asm"    ; AI engine
                include "data\battles\global\krakenmovecosts.asm"    ; Kraken move costs table
                include "data\stats\spells\spellnames.asm"    ; Spell names
                include "data\stats\allies\allynames.asm"    ; Ally names
                include "data\stats\enemies\enemynames.asm"    ; Enemy names
                align $10000
