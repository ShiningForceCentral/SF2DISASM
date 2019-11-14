
; GAME SECTION 03 :
; 0x010000..0x018000 : Menu Engine
; FREE SPACE : 38 bytes.


                include "code\common\menus\menuengine_1.asm"    ; Menu engine
                includeIfVanillaRom "code\common\menus\getcombatantportrait.asm"    ; Get combatant portrait index function
                includeIfExpandedRom "code\common\menus\getcombatantportrait-expanded.asm"
                include "code\common\menus\menuengine_2.asm"    ; Menu engine
                includeIfVanillaRom "code\common\menus\getallyportrait.asm"    ; Get ally portrait index function
                includeIfExpandedRom "code\common\menus\getallyportrait-expanded.asm"
                include "code\common\menus\menuengine_3.asm"    ; Menu engine
                include "data\graphics\tech\windowlayouts\namecharacterentrywindowlayout.asm"    ; Name character entry window layout
                include "code\common\menus\menuengine_4.asm"    ; Menu engine
                include "data\graphics\tech\windowlayouts\memberstatswindowlayout.asm"    ; Member stats window layout
                include "data\stats\items\itemdefs.asm"    ; Item definitions
                include "data\stats\spells\spelldefs.asm"    ; Spell definitions
                include "data\stats\items\itemnames.asm"    ; Item names
                wordAlign
                include "data\stats\allies\classes\classnames.asm"    ; Class names
                align $18000
