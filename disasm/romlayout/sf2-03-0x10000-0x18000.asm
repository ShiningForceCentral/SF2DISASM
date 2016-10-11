
; GAME SECTION 03 :
; 0x010000 : Menu Engine

; FREE SPACE : 38 bytes.


										include "system\menus\menuengine.asm"		; Menu engine
ItemDefs:           incbin "data/items/itemdefs.bin"
SpellDefs:          incbin "data/spells/spelldefs.bin"
ItemNames:          incbin "data/items/itemnames.bin"
ClassNames:         incbin "data/allies/classes/classnames.bin"
										align $8000
