
; GAME SECTION 13 :
; 0x1AC000..0x1B8000 : Battle setup functions, battle terrains, battle entity setups, end kiss graphics
; FREE SPACE : 133 bytes.


                include "code\common\tech\jumpinterfaces\s13_jumpinterface.asm"    ; Game Section 13 Jump Interface
                includeIfVanilla "code\common\tech\pointers\s13_pointers.asm"    ; Game Section 13 Pointers
                include "code\common\scripting\endcredits.asm"    ; Ending credits functions
                include "code\gameflow\battle\battle_s13_1.asm"    ; Battle initialization, terrain, AI stuff to split more properly
                include "data\battles\global\laserbattles.asm"    ; Laser battles data
                includeIfVanilla "code\gameflow\battle\battleloop\triggerregions.asm"    ; AI regions trigger update functions
                includeIfVanilla "code\gameflow\battle\battleloop\populateenemyspawns.asm"    ; Enemy respawn functions
                includeIfVanilla "code\common\tech\thinkingairng.asm"    ; Thinking AI RNG
                includeIfVanilla "code\gameflow\battle\battleloop\loadbattleterraindata.asm"    ; Load battle terrain data function
                includeIfVanilla "data\battles\terrainentries.asm"    ; Battle terrain data
                includeIfVanilla "code\gameflow\battle\battledebugfunction1B120A.asm"    ; unused
                includeIfVanilla "code\gameflow\battle\battleloop\initializecombatants.asm"    ; Battle loop functions
                include "code\gameflow\battle\battle_s13_3.asm"    ; Battle initialization, terrain, AI stuff to split more properly
                includeIfVanilla "code\gameflow\battle\battleloop\upgradeenemies.asm"    ; Upgrade random battle enemies to stronger ones
                includeIfVanilla "code\gameflow\battle\battleloop\hasjarojoined.asm"    ; Battle loop function
                includeIfVanilla "data\stats\enemies\enemydefs.asm"    ; Enemy definitions
                includeIfVanilla "data\battles\spritesets\entries.asm"    ; Battle Spritesets
                includeIfVanilla "data\battles\global\randombattles.asm"    ; Random battles list, and data related to enemy upgrade functions
                includeIfVanilla "code\specialscreens\endkiss\graphics.asm"    ; End Kiss Graphics
                alignIfVanilla $1B8000
