
; GAME SECTION 16 :
; 0x1D8000..0x1E0000 : Icons
; FREE SPACE : 126 bytes.


p_IconTiles:    dc.l IconTiles
IconTiles:      incbin "data/graphics/icons/icons.bin"
                align $1E0000
