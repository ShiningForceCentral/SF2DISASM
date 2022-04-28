
; GAME SECTION 10 :
; 0x100000..0x130000 : Backgrounds, invocation sprites, title screen
; FREE SPACE : 432 bytes.


p_pt_Backgrounds:
                dc.l pt_Backgrounds
p_pt_InvocationSprites:
                dc.l pt_InvocationSprites
                include "code\specialscreens\title\title.asm"    ; Title screen functions
                include "code\specialscreens\title\graphics.asm"    ; Title Screen Graphics
                includeIfVanillaRom "data\graphics\battles\backgrounds\entries.asm"    ; Battlescene Backgrounds
                includeIfVanillaRom "data\graphics\battles\spells\invocations\entries.asm"    ; Invocation sprites
                includeIfExpandedRom "data\graphics\portraits\entries.asm"    ; Portraits
                alignIfOriginalRomLayout $130000
