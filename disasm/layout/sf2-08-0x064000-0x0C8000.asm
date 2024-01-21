
; GAME SECTION 08 :
; 0x064000..0x0C8000 : Map Tiles, Map Palettes, Map Data
; FREE SPACE : 953 bytes.


                includeIfVanilla "code\common\tech\pointers\s08_pointers.asm"    ; Game Section 08 Pointers
                includeIfVanilla "data\graphics\maps\maptilesets\entries.asm"    ; Map Tilesets
                includeIfVanilla "data\graphics\maps\mappalettes\entries.asm"    ; Map palettes
                includeIfVanilla "data\maps\entries.asm"    ; Map entries
                alignIfVanilla $C8000
