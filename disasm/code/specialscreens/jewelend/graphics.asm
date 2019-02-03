
; ASM FILE code\specialscreens\jewelend\graphics.asm :
; 0x1EE930..0x1EF4BA : Jewel End Graphics
JewelsEndScreenLayout:
                incbin "data/graphics/specialscreens/endingjewels/endingjewelslayout.bin"
plt_JewelsEndScreen:
                incbin "data/graphics/specialscreens/endingjewels/endingjewelspalette.bin"
JewelsEndScreenTiles:
                incbin "data/graphics/specialscreens/endingjewels/endingjewelstiles.bin"
