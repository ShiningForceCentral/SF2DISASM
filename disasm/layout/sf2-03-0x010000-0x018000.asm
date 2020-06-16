
; GAME SECTION 03 :
; 0x010000..0x018000 : Menu Engine
; FREE SPACE : 38 bytes.


                include "code\common\menus\menuengine_1.asm"    ; Menu engine
                include "code\common\menus\getcombatantportrait.asm"    ; Get combatant portrait index function
WindowBorderTiles:
                incbin "data/graphics/tech/windowbordertiles.bin" ; compressed
                include "data\graphics\tech\windowlayouts\portraitwindowlayout.asm"    ; Member screen portrait window layout
                include "data\graphics\tech\windowlayouts\allykilldefeatwindowlayout.asm"    ; Member screen kills and defeat window layout
                include "data\graphics\tech\windowlayouts\goldwindowlayout.asm"    ; Member screen gold window layout
                include "code\common\menus\menuengine_2.asm"    ; Menu engine
                include "code\common\menus\getallyportrait.asm"    ; Get ally portrait index function
                include "code\common\menus\menuengine_3.asm"    ; Menu engine
                include "data\graphics\tech\windowlayouts\alphabetwindowlayout.asm"    ; Alphabet window layout
                include "data\graphics\tech\windowlayouts\namecharacterentrywindowlayout.asm"    ; Name character entry window layout
                include "code\common\menus\menuengine_4.asm"    ; Menu engine
                include "data\graphics\tech\windowlayouts\memberstatswindowlayout.asm"    ; Member stats window layout
                include "data\stats\items\itemdefs.asm"    ; Item definitions
                include "data\stats\spells\spelldefs.asm"    ; Spell definitions
                include "data\stats\items\itemnames.asm"    ; Item names
                wordAlign
                
                include "data\stats\allies\classes\classnames.asm"    ; Class names
                align $18000
