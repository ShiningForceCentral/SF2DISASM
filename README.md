SF2DISASM
=========

A disassembly of the game "Shining Force II" for documentation and fan-project purposes, which can be assembled back into a bit-perfect replica of the original rom file.


The purpose of this project will be to provide a disassembly of Shining Force II with the following goals in mind : 
- Documenting as much content of the game as possible, to get a perfect understanding of how it works.
- Being able to re-assemble the game and obtain the same rom file as the original game.
- Giving fan-projects the ability to start from this disassembly by editing the game's code and assets.


Documentation : 
Providing documentation of the game will be done mainly in two ways : 
- Commenting the disassembly's ASM code, proper formatting and splitting of binary data.
- A wiki is attached to the project for everything else : rom map, ram map, data indexes, data formats, algorithms ...


Re-assembly : 
By providing the original US rom file of the game, one will be able to use the provided tools in order to :
- with split/split.bat, split the original rom file into a lot of small binary data files, to extract data chunks which are not included in the disassembly
- with build/build.bat, assemble the game from its disassembly and the extracted data chunks
The assembled game will be perfectly identical to the original one. 


Starting point for fan projects :
It should be possible to start from this disassembly to modify the game's data and mechanics. 
- The game data obtained with split.bat can be edited individually before being included in the game with build.bat.
- The game's code can be edited in the disassembly. Beware : ASM 68k writing skills required !


Naming conventions :
- Functions : DoSomethingLikeThis
- Rom Data Locations : DataChunkLikeThat
Disambiguation is made by the way they are accessed : functions are
branched or jumped into while data is pointed to, moved, etc.
- Enums : ENUM_VALUE_LIKE_THIS
- RAM locations : RAM_LOCATION_LIKE_THAT
Once again, disambiguation is obvious since enums are used as immediate
values while RAM locations are pointed to, moved, etc.


Disasm folder organization :
The main goal is to clarify the game's data organization and creation
process by reflecting them in the folder structure.
- Most data is considered as assets and are gathered by type for a
bottom-up approach : graphics, sound, scripting, etc., need to be
created first in order to use them in maps, battles, cutscenes.
- In an opposite top-down approach, battles and maps are organized in an
"entry-oriented" way, to make each entry contain all that is specific to
the entry.
Editors can then edit assets individually, and point to them while
editing battle or map entries.

