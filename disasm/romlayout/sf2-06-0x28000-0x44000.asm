
; GAME SECTION 06 :
; 0x028000 : Fonts, Menu Tiles, Text Decoding Functions, SEGA Logo, Game Staff, Conf/Debug modes, End Kiss Sequence, Text Huffman Trees, Textbanks

; FREE SPACE : 6681 bytes.


p_pt_ScriptBanks:   dc.l pt_TextBanks

; =============== S U B R O U T I N E =======================================

j_InitDecoder:
										
										jmp     InitDecoder(pc) 

	; End of function j_InitDecoder


; =============== S U B R O U T I N E =======================================

j_HuffmanDecode:
										
										jmp     HuffmanDecode(pc)

	; End of function j_HuffmanDecode

p_VariableWidthFont:dc.l VariableWidthFont
p_MainMenuTiles:    dc.l MenuTiles_Uncompressed
p_MenuTiles_Item:   dc.l MenuTiles_Item
p_MenuTiles_BattleField:
										dc.l MenuTiles_BattleField
p_Menutiles_Church: dc.l MenuTiles_Church
p_MenuTiles_Shop:   dc.l MenuTiles_Shop
p_MenuTiles_Caravan:dc.l MenuTiles_Caravan
p_MenuTiles_Depot:  dc.l MenuTiles_Depot
p_MenuTiles_YesNo:  dc.l MenuTiles_YesNo
p_plt_WitchChoice:  dc.l plt_WitchChoice
p_WitchBubbleAnimation:
										dc.l WitchBubbleAnimation
p_SpeechBalloonTiles:
										dc.l SpeechBalloonTiles

; =============== S U B R O U T I N E =======================================

j_DisplaySegaLogo:
										
										jmp     DisplaySegaLogo(pc)

	; End of function j_DisplaySegaLogo

p_GameStaff:        dc.l GameStaff

; =============== S U B R O U T I N E =======================================

j_EndKissPictureSequence:
										
										jmp     EndKissPictureSequence(pc)

	; End of function j_EndKissPictureSequence


; =============== S U B R O U T I N E =======================================

j_LoadTitleScreenFont:
										
										jmp     LoadTitleScreenFont(pc)

	; End of function j_LoadTitleScreenFont

										include "system\specialscreens\segalogo\segalogo.asm"		; SEGA logo functions
VariableWidthFont:  incbin "graphics/technical/fonts/variablewidthfont.bin"
MenuTiles_Uncompressed:
										incbin "graphics/technical/menus/mainmenutiles.bin"
																						; uncompressed
MenuTiles_Item:     incbin "graphics/technical/menus/menutilesitem.bin"
MenuTiles_BattleField:
										incbin "graphics/technical/menus/menutilesbattlefield.bin"
MenuTiles_Church:   incbin "graphics/technical/menus/menutileschurch.bin"
MenuTiles_Shop:     incbin "graphics/technical/menus/menutilesshop.bin"
MenuTiles_Caravan:  incbin "graphics/technical/menus/menutilescaravan.bin"
MenuTiles_Depot:    incbin "graphics/technical/menus/menutilesdepot.bin"
MenuTiles_YesNo:    incbin "graphics/technical/menus/menutilesyesno.bin"
plt_WitchChoice:    incbin "graphics/specialscreens/witchscreen/witchchoicepalette.bin"
WitchBubbleAnimation:
										incbin "graphics/specialscreens/witchscreen/witchbubbleanimation.bin"
SpeechBalloonTiles: incbin "graphics/specialscreens/witchscreen/speechballoontiles.bin"
										include "system\specialscreens\endkiss\endkissfunctions_0.asm"		; End kiss function
										include "system\specialscreens\title\loadfont.asm"		; Title screen font loading function
UnusedCloudTiles:   incbin "graphics/technical/unusedcloudtiles.bin"
																						; no reference to that ? looks like compressed tiles but no idea of what they represent (32x8 tiles)
StaticWidthFont:    incbin "graphics/technical/fonts/staticwidthfont.bin"
																						; used for title screen
TitleScreenPalettes:incbin "graphics/specialscreens/titlescreen/titlescreenpalettes.bin"
										include "system\text\decoding.asm"		; Text decoding functions
TextBankTreeOffsets:incbin "scripting/textbanks/huffmantreeoffsets.bin"
TextBankTreeData:   incbin "scripting/textbanks/huffmantrees.bin"
										include "scripting\textbanks\entries.asm"		; Textbank entries
GameStaff:          incbin "scripting/gamestaff.bin"
										align $4000
