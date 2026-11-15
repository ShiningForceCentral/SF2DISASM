
   cpu z80
   listing off
   phase	0
   include "..\macros.asm"
   include "..\enums.asm"
   org 08000h

		dw Music_64
		dw Music_64
		dw Music_64
		dw Music_64
		include "music64.asm"
