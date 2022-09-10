
; GAME SECTION 08 :
; 0x064000..0x0C8000 : Map Tiles, Map Palettes, Map Data
; FREE SPACE : 953 bytes.


                include "code\common\tech\pointers\s08_pointers.asm"    ; Game Section 08 Pointers
                include "data\graphics\maps\maptilesets\entries.asm"    ; Map Tilesets
                include "data\graphics\maps\mappalettes\entries.asm"    ; Map palettes
                include "data\maps\entries.asm"    ; Map entries
                align $C8000
