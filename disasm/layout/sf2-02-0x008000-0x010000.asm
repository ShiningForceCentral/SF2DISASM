
; GAME SECTION 02 :
; 0x008000..0x010000 : Character Stats Engine, Battle engine, Item Effects Engine, Enemy AI Engine
; FREE SPACE : 121 bytes.


                include "code\common\tech\jumpinterfaces\s02_jumpinterface.asm"    ; Game Section 02 Jump Interface
                includeIfVanillaLayout "code\common\tech\pointers\s02_pointers.asm"    ; Game Section 02 Pointers
                
                ; Stats engine
                include "code\common\stats\statsengine_1.asm"    ; Character stats engine
            if (STANDARD_BUILD=1)
                include "code\common\stats\getclasstype-standard.asm"
            endif
                include "data\stats\allies\classes\classtypes.asm"    ; Class types table
                include "code\common\stats\statsengine_2.asm"    ; Character stats engine
                include "code\common\stats\levelup.asm"    ; Level Up functions
                include "code\common\stats\statsengine_3.asm"    ; Character stats engine
            if (STANDARD_BUILD=1)
                include "code\common\stats\caravaninventoryfunctions-standard.asm"
            else
                include "code\common\stats\caravaninventoryfunctions.asm"    ; Caravan inventory management functions
            endif
                
                ; Battleactions engine
                include "code\gameflow\special\debugmodebattleactions.asm"    ; Debug mode battle actions
                include "code\gameflow\battle\battleactions\battleactionsengine_1.asm"    ; Battleactions engine
                include "code\gameflow\battle\battleactions\determineineffectiveattack.asm"    ; Determine ineffective attack function
                include "code\gameflow\battle\battleactions\initbattlesceneproperties.asm"    ; Init Battlescene Properties function
            if (STANDARD_BUILD=1)
                include "code\gameflow\battle\battleactions\createbattlescenemessage-standard.asm"
                include "code\gameflow\battle\battleactions\createbattlesceneanimation-standard.asm"
                include "data\stats\spells\spellcastmessages-standard.asm"
                include "data\graphics\battles\specialbattleanimations-standard.asm"
                align
            else
                include "code\gameflow\battle\battleactions\createbattlescenemessage.asm"    ; Create Battlescene Message function
                include "code\gameflow\battle\battleactions\createbattlesceneanimation.asm"    ; Create battlescene animation function
            endif
                include "code\gameflow\battle\battleactions\battleactionsengine_2.asm"    ; Battleactions engine
            if (STANDARD_BUILD=1)
                include "code\gameflow\battle\battleactions\isabletocounterattack-standard.asm"
                include "code\gameflow\battle\battleactions\getspellanimation-standard.asm"
                include "data\stats\enemies\specialcounterattackenemies-standard.asm"
                include "data\graphics\battles\attackspellanimations-standard.asm"
                align
            else
                include "code\gameflow\battle\battleactions\isabletocounterattack.asm"    ; Is Able To Counter Attack function
                include "code\gameflow\battle\battleactions\getspellanimation.asm"    ; Get spell animation function
            endif
                include "code\gameflow\battle\battleactions\battleactionsengine_3.asm"    ; Battleactions engine
                include "data\battles\global\halvedexpearnedbattles.asm"    ; Halved EXP earned battles table
                align
                include "code\gameflow\battle\battleactions\battleactionsengine_4.asm"    ; Battleactions engine
            if (STANDARD_BUILD=1)
                include "code\gameflow\battle\battleactions\determinedodge-standard.asm"
                include "code\gameflow\battle\battleactions\calculatedamage-standard.asm"
                include "data\battles\global\landeffectdamagemultipliers-standard.asm"
                include "data\stats\specialmovetypes-standard.asm"
                align
            else
                include "code\gameflow\battle\battleactions\determinedodge.asm"    ; Determine dodge function
                include "code\gameflow\battle\battleactions\calculatedamage.asm"    ; Calculate attack damage function
            endif
                include "code\gameflow\battle\battleactions\determinecriticalhit.asm"    ; Determine critical hit function
                include "data\stats\allies\classes\criticalhitdefs.asm"    ; Critical hit settings definitions
                include "code\gameflow\battle\battleactions\battleactionsengine_5.asm"    ; Battleactions engine
                include "code\gameflow\battle\battleactions\castspell.asm"    ; Write Battlescene Script : Cast Spell
            if (STANDARD_BUILD=1)
                include "code\gameflow\battle\battleactions\calculatespelldamage-standard.asm"
            else
                include "code\gameflow\battle\battleactions\calculatespelldamage.asm"    ; Calculate Spell Damage function
            endif
                include "code\gameflow\battle\battleactions\useitem.asm"    ; Write Battlescene Script : Use Item
            if (STANDARD_BUILD=1)
                include "code\gameflow\battle\battleactions\breakuseditem-standard.asm"
            else
                include "code\gameflow\battle\battleactions\nullsub_BBE4.asm"    ; Unused nullsub
                include "code\gameflow\battle\battleactions\breakuseditem.asm"    ; Write Battlescene Script : Break Used Item
            endif
                include "data\stats\items\itembreakmessages.asm"    ; Item break messages
            if (STANDARD_BUILD=1)
                include "code\gameflow\battle\battleactions\dropenemyitem-standard.asm"
            else
                include "code\gameflow\battle\battleactions\dropenemyitem.asm"    ; Write Battlescene Command : Drop Enemy Item function
            endif
                include "data\battles\global\enemyitemdrops.asm"    ; Enemy item drops
                align
                include "data\stats\enemies\enemygold.asm"    ; Enemy gold amounts
                include "code\gameflow\battle\battleactions\battleactionsengine_6.asm"    ; Battleactions engine
            if (STANDARD_BUILD=1)
                include "data\stats\allies\classes\healerclasses-standard.asm"
                include "data\stats\items\cutoffweapons-standard.asm"
                include "data\stats\spells\invocations-standard.asm"
                align
            endif
                
                ; Battlefield engine
                include "code\gameflow\battle\battlefield\battlefieldengine_1.asm"    ; Battlefield engine
                include "data\stats\spells\spellelements.asm"    ; Spell elements table
                align
                include "code\gameflow\battle\battlefield\battlefieldengine_2.asm"    ; Battlefield engine
            if (STANDARD_BUILD=1)
                include "code\gameflow\battle\battlefield\getattackrange-standard.asm"
                include "data\stats\unarmedattackranges-standard.asm"
                align
            else
                include "code\gameflow\battle\battlefield\getattackrange.asm"    ; Get Attack Range function
            endif
                include "code\gameflow\battle\battlefield\battlefieldengine_3.asm"    ; Battlefield engine
                if (STANDARD_BUILD&HEALER_AI_ENHANCEMENTS=1)
                    include "code\gameflow\battle\battlefield\determinehealingspelllevel-aienhancements.asm"
                else
                    include "code\gameflow\battle\battlefield\determinehealingspelllevel.asm"    ; Determine healing spell level function
                endif
                include "code\gameflow\battle\battlefield\battlefieldengine_4.asm"    ; Battlefield engine
            if (STANDARD_BUILD=1)
                include "code\gameflow\battle\battlefield\useableaiactions-standard.asm"
                include "data\battles\global\aiexcludedactions-standard.asm"
                align
            else
                include "code\gameflow\battle\battlefield\useableaiactions.asm"    ; Usable AI actions getter functions
            endif
                include "code\gameflow\battle\battlefield\battlefieldengine_5.asm"    ; Battlefield engine
                if (STANDARD_BUILD&HEALER_AI_ENHANCEMENTS=1)
                    include "code\gameflow\battle\battlefield\doescombatantrequirehealing-aienhancements.asm"
                else
                    include "code\gameflow\battle\battlefield\doescombatantrequirehealing.asm"    ; Does combatant require healing function
                endif
                include "code\gameflow\battle\battlefield\battlefieldengine_6.asm"    ; Battlefield engine
                include "data\battles\global\landeffectsettingsandmovecosts.asm"    ; Land effect settings and move costs table
                include "data\battles\global\aipriority.asm"    ; AI priority data
                include "code\gameflow\battle\battlefield\battlefieldengine_7.asm"    ; Battlefield engine
                
                ; AI engine
                include "code\gameflow\battle\ai\aiengine_1.asm"    ; AI engine
                include "data\battles\global\aicommandsets.asm"    ; AI commands data
                include "data\battles\global\swarmbattles.asm"    ; Parameters for battles implementing swarm AI
                include "code\gameflow\battle\ai\handleaicommand.asm"    ; Handle AI Command function
                if (STANDARD_BUILD&HEALER_AI_ENHANCEMENTS=1)
                    include "code\gameflow\battle\ai\aicommandheal-aienhancements.asm"
                else
                    include "code\gameflow\battle\ai\aicommandheal.asm"    ; AI command : Heal
                endif
                include "code\gameflow\battle\ai\aicommandattack.asm"    ; AI command : Attack
                include "code\gameflow\battle\ai\aicommandspecialmove.asm"    ; AI command : Special Move
                include "code\gameflow\battle\ai\aicommandsupport.asm"    ; AI command : Support
                include "code\gameflow\battle\ai\determineaibattleaction.asm"    ; Determine AI Battleaction function
                include "code\gameflow\battle\ai\aicommandmove.asm"    ; AI command : Move
                include "code\gameflow\battle\ai\aiengine_2.asm"    ; AI engine
                include "data\battles\global\krakenmovecosts.asm"    ; Kraken move costs table
                
            if (STANDARD_BUILD&EXTENDED_SPELL_NAMES=1)
                includeIfVanillaRom "data\stats\spells\extendedspellnames.asm"
            else
                includeIfVanillaRom "data\stats\spells\spellnames.asm"    ; Spell names
            endif
            if (STANDARD_BUILD&CAPITALIZED_CHARACTER_NAMES=1)
                include "data\stats\allies\allynames-capitalized.asm"
                include "data\stats\enemies\enemynames-capitalized.asm"
            else
                include "data\stats\allies\allynames.asm"    ; Ally names
                include "data\stats\enemies\enemynames.asm"    ; Enemy names
            endif
                alignIfVanillaLayout $10000
