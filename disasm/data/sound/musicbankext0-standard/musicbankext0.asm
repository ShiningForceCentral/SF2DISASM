
   cpu z80
   listing off
   phase	0
   include "..\macros.asm"
   include "..\enums.asm"
   org 08000h

		dw Music_50
		dw Music_50
		dw Music_50
		dw Music_50
		dw Music_50
		dw Music_50
		include "music50.asm"
