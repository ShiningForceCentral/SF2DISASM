
; GAME SECTION 03 :
; 0x010000..0x018000 : Menu Engine
; FREE SPACE : 38 bytes.


                include "code\common\menus\menuengine.asm"    ; Menu engine
ItemDefs:       incbin "data/stats/items/itemdefs.bin"
SpellDefs:      incbin "data/stats/spells/spelldefs.bin"
ItemNames:      incbin "data/stats/items/itemnames.bin"
ClassNames:     incbin "data/stats/allies/classes/classnames.bin"
                align $18000
