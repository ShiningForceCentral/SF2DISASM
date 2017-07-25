
; GAME SECTION 19 : ROM EXPANSION.

		include "data\battles\global\spritesetentries.asm"
		align $210000
		include "code\specialscreens\title\graphics.asm"		; Title Screen Graphics
		include "code\specialscreens\witch\graphics.asm"		; Witch Screen
		include "code\specialscreens\suspend\graphics.asm"		; Suspend String Graphics
		include "code\specialscreens\endkiss\graphics.asm"		; End Kiss Graphics
		include "code\specialscreens\credits\gamestaff.asm"		; Game Staff						
		include "code\specialscreens\witchend\graphics.asm"		; Witch End Screen
		include "code\specialscreens\jewelend\graphics.asm"		; Jewel End Graphics
		align $220000
		include "data\graphics\mapsprites\entries.asm"		; Map sprites
		align $268000
		include "code\common\tech\graphics\specialspritesentries.asm"		; Special Sprites Entries
		align $270000
		include "data\graphics\battles\battlesprites\enemies\entries.asm"		; Enemy battle sprites
		align $2E0000
		include "data\graphics\battles\battlesprites\allies\entries.asm"		; Ally battlesprites
		align $320000
		include "data\graphics\battles\backgrounds\entries.asm"		; Backgrounds
		align $360000
		include "data\graphics\portraits\entries.asm"		; Portraits
		align $380000
		include "data\maps\entries\mapentries.asm"		; Map entries table
		align $400000
						
