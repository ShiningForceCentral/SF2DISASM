
; ASM FILE code\specialscreens\suspend\graphics.asm :
; 0x1EF4BA..0x1EF5A6 : Suspend String Graphics
plt_SuspendString:
                incbin "data/graphics/specialscreens/suspendscreen/suspendstringpalette.bin"
SuspendStringTiles:
                incbin "data/graphics/specialscreens/suspendscreen/suspendstringtiles.bin"
