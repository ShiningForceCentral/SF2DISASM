
; GAME SECTION 10 :
; 0x100000..0x130000 : Backgrounds, invocation sprites, title screen
; FREE SPACE : 432 bytes.


p_pt_Backgrounds:
		dc.l pt_Backgrounds
p_pt_InvocationSprites:
		dc.l pt_InvocationSprites
		include "code\specialscreens\title\title.asm"		; Title screen functions
plt_TitleScreen:
		incbin "data/graphics/specialscreens/titlescreen/titlepalettes.bin"
TitleScreenTiles:
		incbin "data/graphics/specialscreens/titlescreen/titletiles.bin"
TitleScreenLayoutA:
		incbin "data/graphics/specialscreens/titlescreen/titlelayoutA.bin"
TitleScreenLayoutB:
		incbin "data/graphics/specialscreens/titlescreen/titlelayoutB.bin"
		include "data\graphics\battles\backgrounds\entries.asm"		; Backgrounds
		include "data\graphics\battles\spells\invocations\entries.asm"		; Invocation sprites
		align $8000
