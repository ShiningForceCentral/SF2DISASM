
; GAME SECTION 10 :
; 0x100000 : Backgrounds, invocation sprites, title screen

; FREE SPACE : 432 bytes.


p_pt_Backgrounds:   dc.l pt_Backgrounds
p_pt_InvocationSprites:
										dc.l pt_InvocationSprites
										include "system\specialscreens\title\title.asm"		; Title screen functions
plt_TitleScreen:    incbin "graphics/specialscreens/titlescreen/titlepalettes.bin"
TitleScreenTiles:   incbin "graphics/specialscreens/titlescreen/titletiles.bin"
TitleScreenLayoutA: incbin "graphics/specialscreens/titlescreen/titlelayoutA.bin"
TitleScreenLayoutB: incbin "graphics/specialscreens/titlescreen/titlelayoutB.bin"
										include "graphics\battles\backgrounds\entries.asm"		; Backgrounds
										include "graphics\battles\spells\invocations\entries.asm"		; Invocation sprites
										align $8000
