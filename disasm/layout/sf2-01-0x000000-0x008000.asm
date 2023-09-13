
; GAME SECTION 01 :
; 0x000000..0x008000 : Technical Layer, Low Level Game Engine, Map/Exploration Engine, Entity Script Commands, Witch Functions
; FREE SPACE : 90 bytes.


                include "code\romheader.asm"    ; ROM Header
                include "code\gameflow\start\systeminit.asm"    ; System init functions
                include "code\gameflow\start\gamestart.asm"    ; Start function
                include "code\common\tech\interrupts\trap0_soundcommand.asm"    ; Trap 0 - Sound Command
                include "code\common\tech\interrupts\errors.asm"    ; Error interrupts
                include "code\common\tech\interrupts\trap5_textbox.asm"    ; Trap 5 - Text Box
                include "code\common\tech\interrupts\trap6_mapscript.asm"    ; Trap 6 - Map Script
                include "code\common\tech\interrupts\hint.asm"    ; Horizontal Interrupt - Triggered at each line display
                include "code\common\tech\interrupts\vintengine.asm"    ; Vertical Interrupt Engine - Main Technical Engine - Triggered at each frame display
                include "code\common\scripting\text\asciinumber.asm"    ; ASCII number function
                include "code\common\tech\input.asm"    ; Input functions
                include "code\common\tech\randomnumbergenerator.asm"    ; RNG functions
                include "code\common\tech\sound\music.asm"    ; Sound function
                include "code\common\tech\bytecopy.asm"    ; Byte-copy function
                include "code\common\tech\interrupts\trap1-4_flags.asm"    ; Trap 1-4 - Flag Functions
                include "code\common\tech\graphics\graphics.asm"    ; Graphics functions
                include "code\common\maps\mapload.asm"    ; Map loading functions
                include "code\common\tech\graphics\display.asm"    ; Display function
                include "code\gameflow\exploration\exploration.asm"    ; Exploration functions
            if (STANDARD_BUILD=0)
                include "code\gameflow\battle\battlemusic.asm"    ; Battle music function
            endif
                include "code\common\scripting\map\bbcs_11_function.asm"    ; Specific to before battle 11 cutscene function
                include "code\common\maps\camerafunctions.asm"    ; Camera function
                include "code\common\maps\animations.asm"    ; Map animation function
                include "code\common\windows\windowengine.asm"    ; Window engine
                include "code\common\scripting\entity\entityscriptengine.asm"    ; Entity script engine
                include "code\common\scripting\text\textfunctions.asm"    ; Text functions
            if (STANDARD_BUILD=1)
                include "code\common\tech\sram\sramfunctions-standard.asm"
            else
                include "code\common\tech\sram\sramfunctions.asm"   ; SRAM functions
            endif
                include "code\specialscreens\suspend\witchsuspend.asm"    ; Witch suspend function
                include "code\specialscreens\witchend\witchendinit.asm"    ; Witch end function
                include "code\gameflow\start\gameinit.asm"    ; Game init
                include "data\maps\global\debugmodemaps.asm"    ; Debug mode maps
                include "code\gameflow\start\gameintro.asm"    ; Game intro
                include "code\specialscreens\witch\witchactions.asm"    ; Witch actions
                include "code\gameflow\mainloop.asm"    ; Main loop
                include "code\common\maps\egressinit.asm"    ; Egress map init function
                include "code\gameflow\start\basetiles.asm"    ; Base tiles loading
                include "code\gameflow\special\battletest.asm"    ; Battle test functions
                include "code\common\maps\mapinit_0.asm"    ; Map init functions
                include "data\maps\global\flagswitchedmaps.asm"    ; Flag-switched maps
                include "code\common\maps\getbattle.asm"    ; GetNextBattleOnMap function
                includeIfVanillaRom "data\battles\global\battlemapcoords.asm"    ; Battle map coords
                includeIfVanillaRom "data\maps\global\savepointmapcoords.asm"    ; Save point map coords
                includeIfVanillaRom "data\maps\global\raftresetmapcoords.asm"    ; Raft reset map coords
                align
                include "code\specialscreens\witch\witchfunctions.asm"    ; Witch functions
                include "code\gameflow\special\configurationmode.asm"    ; Configuration mode function
            if (regionFreeRom=0)
                include "code\gameflow\start\regioncheck.asm"    ; Region check function
            endif
            if (STANDARD_BUILD&SOUND_TEST_RESTORATION=1)
            else
                include "code\specialscreens\witch\soundtest.asm"    ; Sound Test function missing in US version
            endif
            if (STANDARD_BUILD=1)
                include "code\common\tech\findspecialproperties-standard.asm"
            endif
            if (STANDARD_BUILD&MEMORY_MAPPER=1)
                include "code\common\tech\mapperfunctions-standard.asm"   ; Memory mapper functions
            endif
                
                ; Relocated pointers
                alignIfOptimizedLayout $7F10
                includeIfOptimizedLayout "code\common\tech\pointers\s02_pointers.asm"                           ; Game Section 02 Pointers
                includeIfOptimizedLayout "code\common\tech\pointers\s03_pointers.asm"                           ; Game Section 03 Pointers
                includeIfOptimizedLayout "code\common\tech\pointers\s03_memberstatuswindowlayoutpointer.asm"    ; Game Section 03 Member Status Window Layout Pointer
                includeIfOptimizedLayout "code\common\tech\pointers\s06_textbankspointer.asm"                   ; Game Section 06 Text Banks Pointer
                includeIfOptimizedLayout "code\common\tech\pointers\s06_pointers.asm"                           ; Game Section 06 Pointers
                includeIfOptimizedLayout "code\common\tech\pointers\s06_gamestaffpointer.asm"                   ; Game Section 06 Game Staff Pointer
                includeIfOptimizedLayout "code\common\tech\pointers\s08_pointers.asm"                           ; Game Section 08 Pointers
                includeIfOptimizedLayout "code\common\tech\pointers\s10_pointers.asm"                           ; Game Section 10 Pointers
                includeIfOptimizedLayout "code\common\tech\pointers\s11_enemybattlespritespointer.asm"          ; Game Section 11 Enemy Battlesprites Pointer
                includeIfOptimizedLayout "code\common\tech\pointers\s12_pointers.asm"                           ; Game Section 12 Pointers
                includeIfOptimizedLayout "code\common\tech\pointers\s13_pointers.asm"                           ; Game Section 13 Pointers
                includeIfOptimizedLayout "code\common\tech\pointers\s14_pointers.asm"                           ; Game Section 14 Pointers
                includeIfOptimizedLayout "code\common\tech\pointers\s15_portraitspointer.asm"                   ; Game Section 15 Portraits Pointer
                includeIfOptimizedLayout "code\common\tech\pointers\s16_iconspointer.asm"                       ; Game Section 16 Icons Pointer
                includeIfOptimizedLayout "code\common\tech\pointers\s17_pointers.asm"                           ; Game Section 17 Pointers
                alignIfVanillaLayout $8000
