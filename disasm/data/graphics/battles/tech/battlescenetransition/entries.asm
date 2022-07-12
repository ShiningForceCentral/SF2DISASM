
; ASM FILE data\graphics\battles\tech\battlescenetransition\entries.asm :
; 0x1AA316..0x1AA8CA : Battlescene transition tiles
pt_BattlesceneTransitionTiles:
                dc.l BattlesceneTransitionTiles0
                dc.l BattlesceneTransitionTiles1
BattlesceneTransitionTiles0:
                incbin "data/graphics/battles/tech/battlescenetransition/battlescenetransitiontiles0.bin"
BattlesceneTransitionTiles1:
                incbin "data/graphics/battles/tech/battlescenetransition/battlescenetransitiontiles1.bin"
