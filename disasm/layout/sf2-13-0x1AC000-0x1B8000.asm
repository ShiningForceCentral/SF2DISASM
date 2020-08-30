
; GAME SECTION 13 :
; 0x1AC000..0x1B8000 : Battle setup functions, battle terrains, battle entity setups, end kiss graphics
; FREE SPACE : 133 bytes.


                include "code\gameflow\battle\battle_s13_0.asm"    ; Jump interface for section functions
                include "code\common\scripting\endcredits.asm"    ; Ending credits functions
                include "code\gameflow\battle\battle_s13_1.asm"    ; Battle init, terrain, AI stuff to split more properly
                includeIfVanillaRom "data\battles\terrainentries.asm"    ; Battle terrain data
                include "code\gameflow\battle\battle_s13_2.asm"    ; Battle init, terrain, AI stuff to split more properly
                include "data\stats\enemies\enemydefs.asm"    ; Enemy definitions
                includeIfVanillaRom "data\battles\spritesetentries.asm"    ; Battle sprite sets
                include "data\battles\global\randombattles.asm"    ; Random battles table
                includeIfVanillaRom "code\specialscreens\endkiss\graphics.asm"    ; End Kiss Graphics
                align $1B8000
