
; GAME SECTION 10 :
; 0x100000..0x130000 : Backgrounds, invocation sprites, title screen
; FREE SPACE : 432 bytes.


                includeIfVanilla "code\common\tech\pointers\s10_pointers.asm"    ; Game Section 10 Pointers
                include "code\specialscreens\title\title.asm"    ; Title screen functions
                includeIfStandard "code\specialscreens\title\loadfont.asm"    ; Title screen font loading function
                includeIfStandard "code\common\tech\incbins\s06_incbins_titlescreen.asm"    ; Game Section 06 Incbin Directives, part 2
                include "code\specialscreens\title\graphics.asm"    ; Title Screen Graphics
                includeIfVanilla "data\graphics\battles\backgrounds\entries.asm"    ; Battlescene Backgrounds
                includeIfVanilla "data\graphics\battles\spells\invocations\entries.asm"    ; Invocation sprites
                alignIfVanilla $130000
