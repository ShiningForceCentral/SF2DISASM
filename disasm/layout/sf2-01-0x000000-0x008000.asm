
; GAME SECTION 01 :
; 0x000000..0x008000 : Technical Layer, Low Level Game Engine, Map/Exploration Engine, Entity Script Commands, Witch Functions
; FREE SPACE : 90 bytes.


                include "code\romheader.asm"    ; ROM Header
                
                ; Relocated pointers
                includeIfStandard "code\common\tech\pointers\s00_pointers-standard.asm"                 ; 
                includeIfStandard "code\common\tech\pointers\s02_pointers.asm"                          ; Game Section 02 Pointers
                includeIfStandard "code\common\tech\pointers\s03_pointers.asm"                          ; Game Section 03 Pointers
                includeIfStandard "code\common\tech\pointers\s03_memberstatuswindowlayoutpointer.asm"   ; Game Section 03 Member Status Window Layout Pointer
                includeIfStandard "code\common\tech\pointers\s04_backgroundlayoutpointer-standard.asm"  ; 
                includeIfStandard "code\common\tech\pointers\s06_textbankspointer.asm"                  ; Game Section 06 Text Banks Pointer
                includeIfStandard "code\common\tech\pointers\s06_pointers.asm"                          ; Game Section 06 Pointers
                includeIfStandard "code\common\tech\pointers\s06_gamestaffpointer.asm"                  ; Game Section 06 Game Staff Pointer
                includeIfStandard "code\common\tech\pointers\s07_mapsetupspointer-standard.asm"         ; 
                includeIfStandard "code\common\tech\pointers\s08_pointers.asm"                          ; Game Section 08 Pointers
                includeIfStandard "code\common\tech\pointers\s10_pointers.asm"                          ; Game Section 10 Pointers
                includeIfStandard "code\common\tech\pointers\s11_enemybattlespritespointer.asm"         ; Game Section 11 Enemy Battlesprites Pointer
                includeIfStandard "code\common\tech\pointers\s12_pointers.asm"                          ; Game Section 12 Pointers
                includeIfStandard "code\common\tech\pointers\s13_pointers.asm"                          ; Game Section 13 Pointers
                includeIfStandard "code\common\tech\pointers\s14_pointers.asm"                          ; Game Section 14 Pointers
                includeIfStandard "code\common\tech\pointers\s15_portraitspointer.asm"                  ; Game Section 15 Portraits Pointer
                includeIfStandard "code\common\tech\pointers\s16_iconspointer.asm"                      ; Game Section 16 Icons Pointer
                includeIfStandard "code\common\tech\pointers\s17_pointers.asm"                          ; Game Section 17 Pointers
                
                include "code\gameflow\start\systeminit.asm"    ; System init functions
                include "code\gameflow\start\gamestart.asm"    ; Start function
                includeIfStandard "code\gameflow\start\z80init-standard.asm"
                includeIfVanilla "code\gameflow\start\z80init.asm"    ; Z80 init function
                include "code\common\tech\interrupts\trap0_soundcommand.asm"    ; Trap 0 - Sound Command
                include "code\common\tech\interrupts\errors.asm"    ; Error interrupts
                include "code\common\tech\interrupts\trap5_textbox.asm"    ; Trap 5 - Text Box
                include "code\common\tech\interrupts\trap6_mapscript.asm"    ; Trap 6 - Map Script
                include "code\common\tech\interrupts\hint.asm"    ; Horizontal Interrupt - Triggered at each line display
                includeIfStandard "code\common\tech\interrupts\vint-standard.asm"
                includeIfVanilla "code\common\tech\interrupts\vint.asm"    ; Vertical Interrupt - Triggered at each frame display
                include "code\common\tech\interrupts\trap9_contextualfunctions.asm"    ; Vertical Interrupt Engine - Main Technical Engine - Triggered at each frame display
                includeIfStandard "code\common\tech\interrupts\applyfadingeffectandz80busupdate-standard.asm"
                includeIfVanilla "code\common\tech\interrupts\applyfadingeffectandz80busupdate.asm"    ; Vertical Interrupt Engine
                include "data\tech\fadingdata.asm"    ; Fading data table
                include "code\common\tech\interrupts\vdpcontrol.asm"    ; Vertical Interrupt Engine - VDP control functions
                includeIfStandard "code\common\tech\interrupts\fadingcommands-standard.asm"
                includeIfVanilla "code\common\tech\interrupts\unused_palettecopy.asm"    ; Unused palette copy function
                includeIfVanilla "code\common\tech\interrupts\fadingcommands.asm"    ; Commands used in scripts to fade screen in or out of white or black
                include "code\common\tech\interrupts\vintengine_1.asm"    ; Vertical Interrupt Engine - Main Technical Engine - Triggered at each frame display,part 1
                includeIfVanilla "code\common\tech\interrupts\unused_vint_1.asm"    ; Unused Vertical Interrupt engine functions
                includeIfVanilla "code\common\tech\interrupts\enabledmaqueueprocessing.asm"    ; Set DMA Request bit function
                includeIfVanilla "code\common\tech\interrupts\unused_vint_2.asm"    ; Unused Vertical Interrupt engine functions
                include "code\common\tech\interrupts\vintengine_2.asm"    ; Vertical Interrupt Engine - Main Technical Engine - Triggered at each frame display, part 2
                includeIfStandard "code\common\tech\interrupts\updatescrolldata-standard.asm"
                includeIfVanilla "code\common\tech\interrupts\updatescrolldata.asm"    ; Horizontal and Vertical Scroll data update functions
                include "code\common\tech\interrupts\vintengine_3.asm"    ; Vertical Interrupt Engine - Main Technical Engine - Triggered at each frame display, part 3
                includeIfVanilla "code\common\tech\interrupts\unused_vint_3.asm"    ; Unused Vertical Interrupt engine functions
                includeIfVanilla "code\common\tech\interrupts\applyvramdmafill.asm"    ; VRAM DMA filler function
                include "code\common\scripting\text\asciinumber.asm"    ; ASCII number function
                includeIfStandard "code\common\tech\input-standard.asm"
                includeIfStandard "code\common\tech\randomnumbergenerator-standard.asm"
                includeIfVanilla "code\common\tech\input.asm"    ; Input functions
                includeIfVanilla "code\common\tech\randomnumbergenerator.asm"    ; RNG functions
                include "code\common\tech\sound\music.asm"    ; Sound function
                include "code\common\tech\bytecopy.asm"    ; Byte-copy function
                include "code\common\tech\interrupts\trap1-4_flags.asm"    ; Trap 1-4 - Flag Functions
                include "code\common\tech\graphics\graphics_1.asm"    ; Graphics functions, part 1
                include "data\tech\spellanimations.asm"    ; Spell animations data
                includeIfVanilla "code\common\tech\graphics\unused_graphics.asm"    ; Unused graphics functions
                include "code\common\tech\graphics\graphics_2.asm"    ; Graphics functions, part 2
                includeIfVanilla "code\common\tech\graphics\updatefadingpalette.asm"    ; Palette update during fading function
                include "code\common\tech\graphics\decompression.asm"    ; Graphics decompression and loading functions
                include "code\common\maps\mapload.asm"    ; Map loading functions
                includeIfVanilla "code\common\maps\unused_mapload.asm"    ; Unused map loading functions
                include "data\tech\displaydata.asm"    ; Display data tables
                include "code\common\tech\graphics\displayinit.asm"    ; Display initialization
                includeIfVanilla "code\common\tech\graphics\unused_display.asm"    ; Unused display function
                include "code\common\tech\graphics\display.asm"    ; Display functions
                include "code\gameflow\exploration\exploration.asm"    ; Exploration functions
                includeIfVanilla "code\gameflow\battle\battlemusic.asm"    ; Battle music function
                includeIfVanilla "code\common\scripting\map\bbcs_11_function.asm"    ; Specific to before battle 11 cutscene function
                include "code\common\maps\camerafunctions.asm"    ; Camera function
                include "code\common\maps\animations.asm"    ; Map animation function
                include "code\common\windows\windowengine.asm"    ; Window engine
                include "code\common\scripting\entity\entityscriptengine_1.asm"    ; Entity script engine, part 1
                includeIfVanilla "code\common\scripting\entity\unused_entityscriptfunction.asm"
                include "code\common\scripting\entity\entityscriptengine_2.asm"    ; Entity script engine, part 2
                include "code\common\scripting\text\textfunctions.asm"    ; Text functions
                includeIfStandard "code\common\scripting\text\displayuncompressedtext-standard.asm"
                includeIfStandard "code\common\tech\findspecialproperties-standard.asm"
                includeIfVanilla "code\common\scripting\text\unused_textfunctionsdata.asm"    ; Unused text functions data
            if (MEMORY_MAPPER=1)
                includeIfStandard "code\common\tech\mapperfunctions-standard.asm"   ; Memory mapper functions
            endif
                includeIfStandard "code\common\tech\sram\sramfunctions-standard.asm"
                includeIfVanilla "code\common\tech\sram\sramfunctions.asm"   ; SRAM functions
                include "code\specialscreens\suspend\witchsuspend.asm"    ; Witch suspend function
                include "code\specialscreens\witchend\witchendinit.asm"    ; Witch end function
                includeIfVanilla "code\gameflow\start\gameinit.asm"    ; Game init
                includeIfVanilla "data\maps\global\debugmodemaps.asm"    ; Debug mode maps
                alignIfVanilla
                includeIfVanilla "code\gameflow\start\gameintro.asm"    ; Game intro
                includeIfVanilla "code\specialscreens\witch\witchstart.asm"    ; Start witch screen
                include "code\gameflow\mainloop.asm"    ; Main loop
                include "code\common\maps\egressinit.asm"    ; Egress map init function
                include "code\gameflow\start\basetiles.asm"    ; Base tiles loading
                includeIfVanilla "code\gameflow\special\battletest.asm"    ; Battle test functions
                include "code\common\maps\mapinit_0.asm"    ; Map init functions
                includeIfVanilla "data\maps\global\flagswitchedmaps.asm"    ; Flag-switched maps
                include "code\common\maps\getbattle.asm"    ; GetNextBattleOnMap function
                includeIfVanilla "data\battles\global\battlemapcoords.asm"    ; Battle map coords
                includeIfVanilla "data\maps\global\savepointmapcoords.asm"    ; Save point map coords
                includeIfVanilla "data\maps\global\raftresetmapcoords.asm"    ; Raft reset map coords
                alignIfVanilla
                include "code\specialscreens\witch\witchfunctions.asm"    ; Witch functions
                includeIfVanilla "code\gameflow\special\configurationmode.asm"    ; Configuration mode function
                includeIfVanilla "code\gameflow\start\regioncheck.asm"    ; Region check function
                includeIfVanilla "code\specialscreens\witch\soundtest.asm"    ; Sound Test function missing in US version
                alignIfVanilla $8000
