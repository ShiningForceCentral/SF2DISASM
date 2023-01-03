
; GAME SECTION 06 :
; 0x028000..0x044000 : Fonts, Menu Tiles, Text Decoding Functions, SEGA Logo, Game Staff, Conf/Debug modes, End Kiss Sequence, Text Huffman Trees, Textbanks
; FREE SPACE : 6681 bytes.


                include "code\common\tech\pointers\s06_textbankspointer.asm"    ; Game Section 06 Text Banks Pointer
                include "code\common\tech\jumpinterfaces\s06_jumpinterface_1.asm"    ; Game Section 06 Jump Interface, part 1
                include "code\common\tech\pointers\s06_pointers.asm"    ; Game Section 06 Pointers
                include "code\common\tech\jumpinterfaces\s06_jumpinterface_2.asm"    ; Game Section 06 Jump Interface, part 2
                include "code\common\tech\pointers\s06_gamestaffpointer.asm"    ; Game Section 06 Game Staff Pointer
                include "code\common\tech\jumpinterfaces\s06_jumpinterface_3.asm"    ; Game Section 06 Jump Interface, part 3
                include "code\specialscreens\segalogo\segalogo_0.asm"    ; SEGA logo functions
                include "data\tech\configurationmodeinputsequence.asm"    ; Configuration mode input sequence
                align
                include "code\specialscreens\segalogo\segalogo_1.asm"    ; SEGA logo functions
                include "data\tech\debugmodeinputsequence.asm"    ; Debug mode input sequence
                align
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
                include "code\specialscreens\endkiss\endkissfunctions_0.asm"    ; End kiss function
                include "code\specialscreens\title\loadfont.asm"    ; Title screen font loading function
UnusedCloudTiles:
                incbin "data/graphics/tech/unusedcloudtiles.bin" ; looks like compressed tiles but no idea of what they represent (32x8 tiles)
StaticWidthFont:incbin "data/graphics/tech/fonts/staticwidthfont.bin" 
                                                        ; used for title screen
TitleScreenPalettes:
                incbin "data/graphics/specialscreens/titlescreen/titlescreenpalettes.bin"
                include "code\common\scripting\text\decoding.asm"    ; Text decoding functions
TextBankTreeOffsets:
                incbin "data/scripting/text/huffmantreeoffsets.bin"
TextBankTreeData:
                incbin "data/scripting/text/huffmantrees.bin"
                includeIfVanillaRom "data\scripting\text\entries.asm"    ; Textbank entries
                alignIfExpandedRom $30000
                includeIfExpandedRom "data\graphics\battles\grounds\entries.asm"    ; Grounds
                alignIfExpandedRom $38000
                includeIfExpandedRom "data\graphics\battles\weapons\entries.asm"    ; Weapons
                includeIfExpandedRom "data\graphics\battles\weapons\palettes\entries.asm"    ; WeaponPalettes
                includeIfVanillaRom "code\specialscreens\credits\gamestaff.asm"    ; Game Staff
                align
                alignIfExpandedRom $43800
                includeIfExpandedRom "data\battles\global\battlemapcoords.asm"    ; Battle map coords
                includeIfExpandedRom "data\maps\global\savepointmapcoords.asm"    ; Save point map coords
                includeIfExpandedRom "data\maps\global\raftresetmapcoords.asm"    ; Raft reset map coords
                alignIfExpandedRom $43C00
                align $44000
