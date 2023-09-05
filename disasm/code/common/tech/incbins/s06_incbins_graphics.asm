
; ASM FILE code\common\tech\pointers\s06_incbins_graphics.asm :
; 0x29002..0x2C576 : Game Section 06 Incbin Directives, part 1
VariableWidthFont:
                incbin "data/graphics/tech/fonts/variablewidthfont.bin"
MenuTiles_Uncompressed:
                incbin "data/graphics/tech/menus/mainmenutiles.bin" ; uncompressed
MenuTiles_Item: incbin "data/graphics/tech/menus/menutilesitem.bin"
MenuTiles_BattleField:
                incbin "data/graphics/tech/menus/menutilesbattlefield.bin"
MenuTiles_Church:
                incbin "data/graphics/tech/menus/menutileschurch.bin"
MenuTiles_Shop: incbin "data/graphics/tech/menus/menutilesshop.bin"
MenuTiles_Caravan:
                incbin "data/graphics/tech/menus/menutilescaravan.bin"
MenuTiles_Depot:incbin "data/graphics/tech/menus/menutilesdepot.bin"
MenuTiles_YesNo:incbin "data/graphics/tech/menus/menutilesyesno.bin"
plt_WitchChoice:incbin "data/graphics/specialscreens/witchscreen/witchchoicepalette.bin"
WitchBubbleAnimation:
                incbin "data/graphics/specialscreens/witchscreen/witchbubbleanimation.bin"
SpeechBalloonTiles:
                incbin "data/graphics/specialscreens/witchscreen/speechballoontiles.bin"
