   include "romlayout\sf2-01-0x0-0x8000.asm"		; 0x000000 : Technical Layer, Low Level Game Engine, Map/Exploration Engine, Entity Script Commands, Witch Functions
   include "romlayout\sf2-02-0x8000-0x10000.asm"		; 0x008000 : Character Stats Engine, Battle engine, Item Effects Engine, Enemy AI Engine
   include "romlayout\sf2-03-0x10000-0x18000.asm"		; 0x010000 : Menu Engine
   include "romlayout\sf2-04-0x18000-0x20000.asm"		; 0x018000 : BattleScene Engine
   include "romlayout\sf2-05-0x20000-0x28000.asm"		; 0x020000 : Battle Engine, Special Sprites, Shop/Church/Blacksmith/Caravan engine, Battle Engine, Exploration Engine, Special Sprites
   include "romlayout\sf2-06-0x28000-0x44000.asm"		; 0x028000 : Fonts, Menu Tiles, Text Decoding Functions, SEGA Logo, Game Staff, Conf/Debug modes, End Kiss Sequence, Text Huffman Trees, Textbanks
   include "romlayout\sf2-07-0x44000-0x64000.asm"		; 0x044000 : Entity ActScripts, CutScene Scripts, Battle CutScenes, Intro cutscene, End cutscene, Map Setups
   include "romlayout\sf2-08-0x64000-0xC8000.asm"		; 0x064000 : Map Tiles, Map Palettes, Map Data
   include "romlayout\sf2-09-0xC8000-0x100000.asm"		; 0x0C8000 : Entity Sprites
   include "romlayout\sf2-10-0x100000-0x130000.asm"		; 0x100000 : Backgrounds, invocation sprites, title screen
   include "romlayout\sf2-11-0x130000-0x180000.asm"		; 0x130000 : Enemy battle sprites
   include "romlayout\sf2-12-0x180000-0x1AC000.asm"		; 0x180000 : Ally battle sprites, status anim tiles, battlescene transition tiles, bolt graphics, ally and enemy animations
   include "romlayout\sf2-13-0x1AC000-0x1B8000.asm"		; 0x1AC000 : Battle setup functions, battle terrains, battle entity setups, end kiss graphics
   include "romlayout\sf2-14-0x1B8000-0x1C8000.asm"		; 0x1B8000 : Battlescene grounds, weapons, spell graphics, witch screens
   include "romlayout\sf2-15-0x1C8000-0x1D8000.asm"		; 0x1C8000 : Portraits
   include "romlayout\sf2-16-0x1D8000-0x1E0000.asm"		; 0x1D8000 : Icons
   include "romlayout\sf2-17-0x1E0000-0x1F0000.asm"		; 0x1E0000 : PCM Banks, YM Instruments, sound driver, char stats, witch screens
   include "romlayout\sf2-18-0x1F0000-0x200000.asm"		; 0x1F0000 : Music banks 1 and 0
