
; ASM FILE code\common\tech\incbins\s06_incbins_graphics.asm :
; 0x29002..0x2C576 : Game Section 06 Incbin Directives, part 1
font_VariableWidth:
                incbin "data/graphics/tech/fonts/variablewidthfont.bin"
tiles_MainMenu: incbin "data/graphics/tech/menus/mainmenutiles.bin" ; uncompressed
tiles_ItemMenu: incbin "data/graphics/tech/menus/itemmenutiles.bin"
tiles_BattleFieldMenu:
                incbin "data/graphics/tech/menus/battlefieldmenutiles.bin"
tiles_ChurchMenu:
                incbin "data/graphics/tech/menus/churchmenutiles.bin"
tiles_ShopMenu: incbin "data/graphics/tech/menus/shopmenutiles.bin"
tiles_CaravanMenu:
                incbin "data/graphics/tech/menus/caravanmenutiles.bin"
tiles_DepotMenu:incbin "data/graphics/tech/menus/depotmenutiles.bin"
tiles_YesNoPrompt:
                incbin "data/graphics/tech/menus/yesnoprompttiles.bin"
palette_WitchChoice:
                incbin "data/graphics/specialscreens/witchscreen/witchchoicepalette.bin"
table_WitchBubbleAnimation:
                incbin "data/graphics/specialscreens/witchscreen/witchbubbleanimation.bin"
tiles_SpeechBalloon:
                incbin "data/graphics/specialscreens/witchscreen/speechballoontiles.bin"
