
; GAME SECTION 15 :
; 0x1C8000 : Portraits

; FREE SPACE : 1467 bytes.


p_pt_Portraits:     dc.l pt_Portraits
										include "graphics\portraits\entries.asm"		; Portraits
										align $8000
