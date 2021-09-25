
; GAME SECTION 15 :
; 0x1C8000..0x1D8000 : Portraits
; FREE SPACE : 1467 bytes.


p_pt_Portraits: dc.l pt_Portraits
                includeIfVanillaRom "data\graphics\portraits\entries.asm"    ; Portraits
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    include "data\graphics\icons\entries.asm"    ; Icons
                endif
                align $1D8000
