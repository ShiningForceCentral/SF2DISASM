
; GAME SECTION 16 :
; 0x1D8000..0x1E0000 : Icons
; FREE SPACE : 126 bytes.


p_Icons:        dc.l Icon000
                include "data\graphics\icons\entries.asm"    ; Icons
                align $1E0000
