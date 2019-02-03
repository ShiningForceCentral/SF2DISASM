
; ROM LAYOUT FILE
;
; Original ROM layout results in a 2MB ROM.
; Sections can be moved to get more free space by changing declaration order and by using align directives to pad section ends until desired end offset.
; (beware : ROMs over 2MB imply to manage SRAM bankswitching first)

                include "layout\sf2-01-0x000000-0x008000.asm"    ; 0x000000..0x008000 : Technical Layer, Low Level Game Engine, Map/Exploration Engine, Entity Script Commands, Witch Functions
                include "layout\sf2-02-0x008000-0x010000.asm"    ; 0x008000..0x010000 : Character Stats Engine, Battle engine, Item Effects Engine, Enemy AI Engine
                include "layout\sf2-03-0x010000-0x018000.asm"    ; 0x010000..0x018000 : Menu Engine
                include "layout\sf2-04-0x018000-0x020000.asm"    ; 0x018000..0x020000 : BattleScene Engine
                include "layout\sf2-05-0x020000-0x028000.asm"    ; 0x020000..0x028000 : Battle Engine, Special Sprites, Shop/Church/Blacksmith/Caravan engine, Battle Engine, Exploration Engine, Special Sprites
                include "layout\sf2-06-0x028000-0x044000.asm"    ; 0x028000..0x044000 : Fonts, Menu Tiles, Text Decoding Functions, SEGA Logo, Game Staff, Conf/Debug modes, End Kiss Sequence, Text Huffman Trees, Textbanks
                include "layout\sf2-07-0x044000-0x064000.asm"    ; 0x044000..0x064000 : Entity ActScripts, CutScene Scripts, Battle CutScenes, Intro cutscene, End cutscene, Map Setups
                include "layout\sf2-08-0x064000-0x0C8000.asm"    ; 0x064000..0x0C8000 : Map Tiles, Map Palettes, Map Data
                include "layout\sf2-09-0x0C8000-0x100000.asm"    ; 0x0C8000..0x100000 : Entity Sprites
                include "layout\sf2-10-0x100000-0x130000.asm"    ; 0x100000..0x130000 : Backgrounds, invocation sprites, title screen
                include "layout\sf2-11-0x130000-0x180000.asm"    ; 0x130000..0x180000 : Enemy battle sprites
                include "layout\sf2-12-0x180000-0x1AC000.asm"    ; 0x180000..0x1AC000 : Ally battle sprites, status anim tiles, battlescene transition tiles, bolt graphics, ally and enemy animations
                include "layout\sf2-13-0x1AC000-0x1B8000.asm"    ; 0x1AC000..0x1B8000 : Battle setup functions, battle terrains, battle entity setups, end kiss graphics
                include "layout\sf2-14-0x1B8000-0x1C8000.asm"    ; 0x1B8000..0x1C8000 : Battlescene grounds, weapons, spell graphics, witch screens
                include "layout\sf2-15-0x1C8000-0x1D8000.asm"    ; 0x1C8000..0x1D8000 : Portraits
                include "layout\sf2-16-0x1D8000-0x1E0000.asm"    ; 0x1D8000..0x1E0000 : Icons
                include "layout\sf2-17-0x1E0000-0x1F0000.asm"    ; 0x1E0000..0x1F0000 : PCM Banks, YM Instruments, sound driver, char stats, witch screens
                include "layout\sf2-18-0x1F0000-0x200000.asm"    ; 0x1F0000..0x200000 : Music banks 1 and 0
                conditionalRomExpand    ; if EXPANDED_ROM = 1, then include next layout file to fill the ROM up to 0x3FFFFF