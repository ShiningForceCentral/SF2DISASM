
; ASM FILE code\specialscreens\title\graphics.asm :
; 0x1002BE..0x101EE0 : Title Screen Graphics
plt_TitleScreen:incbin "data/graphics/specialscreens/titlescreen/titlepalettes.bin"
TitleScreenTiles:
                incbin "data/graphics/specialscreens/titlescreen/titletiles.bin"
TitleScreenLayoutA:
                incbin "data/graphics/specialscreens/titlescreen/titlelayoutA.bin"
TitleScreenLayoutB:
                incbin "data/graphics/specialscreens/titlescreen/titlelayoutB.bin"
