
; GAME SECTION 13 :
; 0x1AC000..0x1B8000 : Battle setup functions, battle terrains, battle entity setups, end kiss graphics
; FREE SPACE : 133 bytes.


                include "code\common\tech\jumpinterfaces\s13_jumpinterface.asm"    ; Game Section 13 Jump Interface
                includeIfVanilla "code\common\tech\pointers\s13_pointers.asm"    ; Game Section 13 Pointers
                include "code\common\scripting\endcredits.asm"    ; Ending credits functions
                include "code\gameflow\battle\battle_s13_1.asm"    ; Battle init, terrain, AI stuff to split more properly
                include "data\battles\global\laserbattles.asm"    ; Laser battles data
                include "code\gameflow\battle\battle_s13_2.asm"    ; Battle init, terrain, AI stuff to split more properly
                includeIfVanilla "data\battles\terrainentries.asm"    ; Battle terrain data
                includeIfVanilla "code\gameflow\battle\battledebugfunction1B120A.asm"    ; unused
                include "code\gameflow\battle\battle_s13_3.asm"    ; Battle init, terrain, AI stuff to split more properly
                includeIfVanilla "data\stats\enemies\enemydefs.asm"    ; Enemy definitions
                includeIfVanilla "data\battles\spritesets\entries.asm"    ; Battle Spritesets
                include "data\battles\global\randombattles.asm"    ; Random battles list, and data related to UpgradeEnemyIndex function
                includeIfVanilla "code\specialscreens\endkiss\graphics.asm"    ; End Kiss Graphics
                alignIfVanilla $1B8000
