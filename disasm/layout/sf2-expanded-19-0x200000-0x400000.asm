
; GAME SECTION 19 : ROM EXPANSION.

		include "data\battles\global\spritesetentries.asm"
		align $210000
SuspendStringTiles:
		incbin "data/graphics/specialscreens/suspendscreen/suspendstringtiles.bin"
		align $211000
		
		
		align $380000
		include "data\maps\entries\mapentries.asm"		; Map entries table
		align $400000
						
