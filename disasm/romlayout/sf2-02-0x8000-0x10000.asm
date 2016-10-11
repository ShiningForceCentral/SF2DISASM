
; GAME SECTION 02 :
; 0x008000 : Character Stats Engine, Battle engine, Item Effects Engine, Enemy AI Engine

; FREE SPACE : 121 bytes.


										include "system\stats\statsengine.asm"		; Character stats engine
										include "system\debug\debugmodebattleactions.asm"		; Debug mode battle actions
										include "system\battles\battleactionsengine.asm"		; Battle actions engine
										include "system\battles\battlefieldengine.asm"		; Battlefield engine
										include "system\battles\aiengine.asm"		; AI engine
SpellNames:         incbin "data/spells/spellnames.bin"
AllyNames:          incbin "data/allies/allynames.bin"
EnemyNames:         incbin "data/enemies/enemynames.bin"
algn_FF87:          align $8000
