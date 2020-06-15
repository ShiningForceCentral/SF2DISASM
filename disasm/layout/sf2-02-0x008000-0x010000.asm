
; GAME SECTION 02 :
; 0x008000..0x010000 : Character Stats Engine, Battle engine, Item Effects Engine, Enemy AI Engine
; FREE SPACE : 121 bytes.


                include "code\common\stats\statsengine_1.asm"    ; Character stats engine
                include "data\stats\allies\classes\classtypes.asm"    ; Class types table
                include "code\common\stats\statsengine_2.asm"    ; Character stats engine
                include "code\gameflow\special\debugmodebattleactions.asm"    ; Debug mode battle actions
                include "code\gameflow\battle\battleactionsengine_1.asm"    ; Battle actions engine
                include "data\stats\allies\classes\criticalhitsettings.asm"    ; Critical hit settings
                include "code\gameflow\battle\battleactionsengine_2.asm"    ; Battle actions engine
                include "data\stats\items\itembreakmessages.asm"    ; Item break messages
                include "code\gameflow\battle\battleactionsengine_3.asm"    ; Battle actions engine
                include "data\battles\global\enemyitemdrops.asm"    ; Enemy item drops
                include "data\stats\enemies\enemygold.asm"    ; Enemy gold amounts
                include "code\gameflow\battle\battleactionsengine_4.asm"    ; Battle actions engine
                include "code\gameflow\battle\battlefieldengine_1.asm"    ; Battlefield engine
                include "data\stats\spells\spellelements.asm"    ; Spell elements table
                wordAlign
                include "code\gameflow\battle\battlefieldengine_2.asm"    ; Battlefield engine
                include "code\gameflow\battle\aiengine.asm"    ; AI engine
                include "data\stats\spells\spellnames.asm"    ; Spell names
                include "data\stats\allies\allynames.asm"    ; Ally names
                include "data\stats\enemies\enemynames.asm"    ; Enemy names
algn_FF87:      align $8000
