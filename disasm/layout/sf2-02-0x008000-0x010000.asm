
; GAME SECTION 02 :
; 0x008000..0x010000 : Character Stats Engine, Battle engine, Item Effects Engine, Enemy AI Engine
; FREE SPACE : 121 bytes.


                include "code\common\stats\statsengine_1.asm"    ; Character stats engine
                include "data\stats\allies\classes\classtypes.asm"    ; Class types table
                include "code\common\stats\statsengine_2.asm"    ; Character stats engine
                include "code\common\stats\levelup.asm"    ; Level up function
                include "code\common\stats\initcharacterstats.asm"    ; Init character stats function
                include "code\common\stats\calculatestatgain.asm"    ; Calculate stat gain function
                include "code\common\stats\statsengine_3.asm"    ; Character stats engine
                include "code\gameflow\special\debugmodebattleactions.asm"    ; Debug mode battle actions
                include "code\gameflow\battle\battleactionsengine_1.asm"    ; Battle actions engine
                include "code\gameflow\battle\determineineffectiveattack.asm"    ; Determine ineffective attack function
                include "code\gameflow\battle\battleactionsengine_2.asm"    ; Battle actions engine
                include "code\gameflow\battle\createbattlesceneanimation.asm"    ; Create battlescene animation function
                include "code\gameflow\battle\battleactionsengine_3.asm"    ; Battle actions engine
                include "code\gameflow\battle\getspellanimation.asm"    ; Get spell animation function
                include "code\gameflow\battle\battleactionsengine_4.asm"    ; Battle actions engine
                include "data\battles\global\halvedexpearnedbattles.asm"    ; Halved EXP earned battles table
                include "code\gameflow\battle\battleactionsengine_5.asm"    ; Battle actions engine
                include "data\stats\allies\classes\criticalhitsettings.asm"    ; Critical hit settings
                include "code\gameflow\battle\battleactionsengine_6.asm"    ; Battle actions engine
                include "data\stats\items\itembreakmessages.asm"    ; Item break messages
                include "code\gameflow\battle\battleactionsengine_7.asm"    ; Battle actions engine
                include "data\battles\global\enemyitemdrops.asm"    ; Enemy item drops
                include "data\stats\enemies\enemygold.asm"    ; Enemy gold amounts
                include "code\gameflow\battle\battleactionsengine_8.asm"    ; Battle actions engine
                include "code\gameflow\battle\battlefieldengine_1.asm"    ; Battlefield engine
                include "data\stats\spells\spellelements.asm"    ; Spell elements table
                wordAlign
                include "code\gameflow\battle\battlefieldengine_2.asm"    ; Battlefield engine
                include "data\battles\global\landeffectsettingsandmovecosts.asm"    ; Land effect settings and move costs table
                include "code\gameflow\battle\battlefieldengine_3.asm"    ; Battlefield engine
                include "code\gameflow\battle\aiengine.asm"    ; AI engine
                include "data\battles\global\krakenmovecosts.asm"    ; Kraken move costs table
                if (ITEMS_AND_SPELLS_EXPANSION=0)
                    if (EXTENDED_SPELL_NAMES=1)
                        include "data\stats\spells\extendedspellnames.asm"
                    else
                        include "data\stats\spells\spellnames.asm"    ; Spell names
                    endif
                endif
                
                if (CAPITALIZED_CHARACTER_NAMES=1)
                include "data\stats\allies\allynames-capitalized.asm"
                include "data\stats\enemies\enemynames-capitalized.asm"
                else
                include "data\stats\allies\allynames.asm"    ; Ally names
                include "data\stats\enemies\enemynames.asm"    ; Enemy names
                endif

algn_FF87:      align $8000
