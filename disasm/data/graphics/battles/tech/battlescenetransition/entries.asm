
; ASM FILE data\graphics\battles\tech\battlescenetransition\entries.asm :
; 0x1AA316..0x1AA8CA : Battlescene transition tiles
pt_tiles_BattlesceneTransition:
                dc.l tiles_BattlesceneTransition0
                dc.l tiles_BattlesceneTransition1
tiles_BattlesceneTransition0:
                incbin "data/graphics/battles/tech/battlescenetransition/battlescenetransitiontiles0.bin"
tiles_BattlesceneTransition1:
                incbin "data/graphics/battles/tech/battlescenetransition/battlescenetransitiontiles1.bin"
