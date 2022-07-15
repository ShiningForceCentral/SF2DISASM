
; GAME SECTION 10 :
; 0x100000..0x130000 : Backgrounds, invocation sprites, title screen
; FREE SPACE : 432 bytes.


                include "code\common\tech\pointers\s10_pointers.asm"    ; Game Section 10 Pointers
                include "code\specialscreens\title\title.asm"    ; Title screen functions
                include "code\specialscreens\title\graphics.asm"    ; Title Screen Graphics
                include "data\graphics\battles\backgrounds\entries.asm"    ; Battlescene Backgrounds
                include "data\graphics\battles\spells\invocations\entries.asm"    ; Invocation sprites
                align $130000
