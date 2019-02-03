
; GAME SECTION 08 :
; 0x064000..0x0C8000 : Map Tiles, Map Palettes, Map Data
; FREE SPACE : 953 bytes.


p_pt_MapTiles:  dc.l pt_MapTilesets
p_pt_MapPalettes:
                dc.l pt_MapPalettes
p_pt_MapData:   dc.l pt_MapData
                include "data\graphics\maps\maptilesets\entries.asm"    ; Map Tilesets
                alignIfExpandedRom $C7000
                include "data\graphics\maps\mappalettes\entries.asm"    ; Map palettes
                includeIfVanillaRom "data\maps\entries.asm"    ; Map entries
                align $C8000
