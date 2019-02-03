
; GAME SECTION 02 :
; 0x008000..0x010000 : Character Stats Engine, Battle engine, Item Effects Engine, Enemy AI Engine
; FREE SPACE : 121 bytes.


                include "code\common\stats\statsengine.asm"    ; Character stats engine
                include "code\gameflow\special\debugmodebattleactions.asm"    ; Debug mode battle actions
                include "code\gameflow\battle\battleactionsengine.asm"    ; Battle actions engine
                include "code\gameflow\battle\battlefieldengine.asm"    ; Battlefield engine
                include "code\gameflow\battle\aiengine.asm"    ; AI engine
SpellNames:     incbin "data/stats/spells/spellnames.bin"
AllyNames:      incbin "data/stats/allies/allynames.bin"
EnemyNames:     incbin "data/stats/enemies/enemynames.bin"
                align $8000
