
; GAME SECTION 10 :
; 0x100000..0x130000 : Backgrounds, invocation sprites, title screen
; FREE SPACE : 432 bytes.


                include "code\common\tech\pointers\s10_pointers.asm"    ; Game Section 10 Pointers
                include "code\specialscreens\title\title.asm"    ; Title screen functions
                includeIfVanillaRom "code\specialscreens\title\graphics.asm"    ; Title Screen Graphics
                includeIfVanillaRom "data\graphics\specialscreens\titlescreen\titlescreenlayouts.asm"    ; Title Screen Layouts
                includeIfVanillaRom "data\graphics\battles\backgrounds\entries.asm"    ; Battlescene Backgrounds
                includeIfExpandedRom "data\graphics\portraits\entries.asm"    ; Portraits
                include "data\graphics\battles\spells\invocations\entries.asm"    ; Invocation sprites
                align $130000
