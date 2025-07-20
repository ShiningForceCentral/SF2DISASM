
; GAME SECTION 01 :
; 0x000000..0x008000 : Technical Layer, Low Level Game Engine, Map/Exploration Engine, Entity Script Commands, Witch Functions
; FREE SPACE : 90 bytes.


                include "code\romheader.asm"    ; ROM Header
                include "code\gameflow\start\systeminit.asm"    ; System initialization functions
                include "code\gameflow\start\gamestart.asm"    ; Start function
                include "code\gameflow\start\z80init.asm"    ; Z80 initialization function
                include "code\common\tech\interrupts\trap0_soundcommand.asm"    ; Trap 0 - Sound Command
                include "code\common\tech\interrupts\errors.asm"    ; Error interrupts
                include "code\common\tech\interrupts\trap5_textbox.asm"    ; Trap 5 - Text Box
                include "code\common\tech\interrupts\trap6_mapscript.asm"    ; Trap 6 - Map Script
                include "code\common\tech\interrupts\hint.asm"    ; Horizontal Interrupt - Triggered at each line display
                include "code\common\tech\interrupts\vint.asm"    ; Vertical Interrupt - Triggered at each frame display
                include "code\common\tech\interrupts\trap9_contextualfunctions.asm"    ; Trap 9 - Contextual Functions Management
                include "code\common\tech\interrupts\applyfadingeffectandz80busupdate.asm"    ; Vertical Interrupt Engine
                include "data\tech\fadingdata.asm"    ; Fading data table
                include "code\common\tech\interrupts\vdpcontrol.asm"    ; Vertical Interrupt Engine - VDP control functions
                include "code\common\tech\interrupts\unused_palettecopy.asm"    ; Unused palette copy function
                include "code\common\tech\interrupts\fadingcommands.asm"    ; Commands used in scripts to fade screen in or out of white or black
                include "code\common\tech\interrupts\vintengine_1.asm"    ; Vertical Interrupt Engine - Main Technical Engine - Triggered at each frame display, part 1
                include "code\common\tech\interrupts\unused_vint_1.asm"    ; Unused Vertical Interrupt engine functions
                include "code\common\tech\interrupts\enabledmaqueueprocessing.asm"    ; Vertical Interrupt Engine - DMA Request bit setter function
                include "code\common\tech\interrupts\unused_vint_2.asm"    ; Unused Vertical Interrupt engine functions
                include "code\common\tech\interrupts\vintengine_2.asm"    ; Vertical Interrupt Engine - Main Technical Engine - Triggered at each frame display, part 2
                include "code\common\tech\interrupts\updatescrolldata.asm"    ; Horizontal and Vertical Scroll data update functions
                include "code\common\tech\interrupts\vintengine_3.asm"    ; Vertical Interrupt Engine - Main Technical Engine - Triggered at each frame display, part 3
                include "code\common\tech\interrupts\unused_vint_3.asm"    ; Unused Vertical Interrupt engine functions
                include "code\common\tech\interrupts\applyvramdmafill.asm"    ; Vertical Interrupt Engine - VRAM DMA filler function
                include "code\common\scripting\text\asciinumber.asm"    ; ASCII number function
                include "code\common\tech\input.asm"    ; Input functions
                include "code\common\tech\randomnumbergenerator.asm"    ; RNG functions
                include "code\common\tech\sound\music.asm"    ; Sound function
                include "code\common\tech\bytecopy.asm"    ; Byte-copy function
                include "code\common\tech\interrupts\trap1-4_flags.asm"    ; Trap 1-4 - Flag Functions
                include "code\common\tech\graphics\graphics_1.asm"    ; Graphics functions, part 1
                include "data\tech\spellanimations.asm"    ; Spell animations data
                include "code\common\tech\graphics\unused_graphics.asm"    ; Unused graphics functions
                include "code\common\tech\graphics\graphics_2.asm"    ; Graphics functions, part 2
                include "code\common\tech\graphics\updatefadingpalette.asm"    ; Palette update during fading function
                include "code\common\tech\graphics\decompression.asm"    ; Graphics decompression and loading functions
                include "code\common\maps\mapload.asm"    ; Map loading functions
                include "code\common\maps\unused_mapload.asm"    ; Unused map loading functions
                include "data\tech\displaydata.asm"    ; Display data tables
                include "code\common\tech\graphics\displayinit.asm"    ; Display initialization
                include "code\common\tech\graphics\unused_display.asm"    ; Unused display function
                include "code\common\tech\graphics\display.asm"    ; Display functions
                include "code\gameflow\exploration\exploration.asm"    ; Exploration functions
                include "code\gameflow\battle\battlemusic.asm"    ; Battle music function
                include "code\common\scripting\map\bbcs_11_function.asm"    ; Specific to before battle 11 cutscene function
                include "code\common\maps\camerafunctions.asm"    ; Camera function
                include "code\common\maps\animations.asm"    ; Map animation function
                include "code\common\windows\windowengine.asm"    ; Window engine
                include "code\common\scripting\entity\entityscriptengine_1.asm"    ; Entity script engine, part 1
                include "code\common\scripting\entity\unused_entityscriptfunction.asm"    ; Unused entity script function
                include "code\common\scripting\entity\entityscriptengine_2.asm"    ; Entity script engine, part 2
                include "code\common\scripting\text\textfunctions.asm"    ; Text functions
                include "code\common\scripting\text\unused_textfunctionsdata.asm"    ; Unused text functions data
                include "code\common\tech\sram\sramfunctions.asm"    ; SRAM functions
                include "code\specialscreens\suspend\witchsuspend.asm"    ; Witch suspend function
                include "code\specialscreens\witchend\witchendinit.asm"    ; Witch end function
                include "code\gameflow\start\gameinit.asm"    ; Game initialization
                include "data\maps\global\debugmodemaps.asm"    ; Debug mode maps
                align                   
                include "code\gameflow\start\gameintro.asm"    ; Game intro
                include "code\specialscreens\witch\witchstart.asm"    ; Start witch screen
                include "code\gameflow\mainloop.asm"    ; Main loop
                include "code\common\maps\egressinit.asm"    ; Egress map initialization function
                include "code\gameflow\start\basetiles.asm"    ; Base tiles loading
                include "code\gameflow\special\battletest.asm"    ; Battle test functions
                include "code\common\maps\mapinit_0.asm"    ; Map initialization functions
                include "data\maps\global\flagswitchedmaps.asm"    ; Flag-switched maps
                include "code\common\maps\getbattle.asm"    ; GetNextBattleOnMap function
                include "data\battles\global\battlemapcoords.asm"    ; Battle map coords
                include "data\maps\global\savepointmapcoords.asm"    ; Save point map coords
                include "data\maps\global\raftresetmapcoords.asm"    ; Raft reset map coords
                align
                include "code\specialscreens\witch\witchfunctions.asm"    ; Witch functions
                include "code\gameflow\special\configurationmode.asm"    ; Configuration mode function
                include "code\gameflow\start\regioncheck.asm"    ; Region check function
                include "code\specialscreens\witch\soundtest.asm"    ; Sound Test function missing in US version
                align $8000
