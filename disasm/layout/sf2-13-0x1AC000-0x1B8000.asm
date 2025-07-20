
; GAME SECTION 13 :
; 0x1AC000..0x1B8000 : Battle setup functions, battle terrains, battle entity setups, end kiss graphics
; FREE SPACE : 133 bytes.


                include "code\common\tech\jumpinterfaces\s13_jumpinterface.asm"    ; Game Section 13 Jump Interface
                include "code\common\tech\pointers\s13_pointers.asm"    ; Game Section 13 Pointers
                include "code\common\scripting\endcredits.asm"    ; Ending credits functions
                include "code\gameflow\battle\battle_s13_1.asm"    ; Battle initialization, terrain, AI stuff to split more properly
                include "data\battles\global\laserbattles.asm"    ; Laser battles data
                include "code\gameflow\battle\battleloop\triggerregions.asm"    ; AI regions trigger update functions
                include "code\gameflow\battle\battleloop\populateenemyspawns.asm"    ; Enemy respawn functions
                include "code\common\tech\thinkingairng.asm"    ; Thinking AI RNG
                include "code\gameflow\battle\battleloop\loadbattleterraindata.asm"    ; Load battle terrain data function
                includeIfVanillaRom "data\battles\terrainentries.asm"    ; Battle terrain data
                include "code\gameflow\battle\battledebugfunction1B120A.asm"    ; unused
                include "code\gameflow\battle\battleloop\initializecombatants.asm"    ; Battle loop functions
                include "code\gameflow\battle\battle_s13_3.asm"    ; Battle initialization, terrain, AI stuff to split more properly
                include "code\gameflow\battle\battleloop\upgradeenemies.asm"    ; Upgrade random battle enemies to stronger ones
                include "code\gameflow\battle\battleloop\hasjarojoined.asm"    ; Battle loop function
                include "data\stats\enemies\enemydefs.asm"    ; Enemy definitions
                includeIfVanillaRom "data\battles\spritesets\entries.asm"    ; Battle Spritesets
                include "data\battles\global\randombattles.asm"    ; Random battles list, and data related to enemy upgrade functions
                includeIfVanillaRom "code\specialscreens\endkiss\graphics.asm"    ; End Kiss Graphics
                align $1B8000
