
   cpu z80
   listing off
   phase	0
   include "..\macros.asm"
   include "..\enums.asm"
   org 08000h

		dw Music_60
		dw Music_60
		dw Music_60
		dw Music_60
		include "music60.asm"
