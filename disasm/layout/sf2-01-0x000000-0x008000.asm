
; GAME SECTION 01 :
; 0x000000..0x008000 : Technical Layer, Low Level Game Engine, Map/Exploration Engine, Entity Script Commands, Witch Functions
; FREE SPACE : 90 bytes.


		include "code\romheader.asm"		; ROM Header
		include "code\gameflow\start\systeminit.asm"		; System init functions
		include "code\gameflow\start\gamestart.asm"		; Start function
		include "code\common\tech\interrupts\interruptsengine.asm"		; Interrupts engine
		include "code\common\scripting\text\asciinumber.asm"		; ASCII number function
		include "code\common\tech\input.asm"		; Input functions
		include "code\common\tech\randomizing.asm"		; Randomizing function
		include "code\common\tech\sound\music.asm"		; Sound function
		include "code\common\tech\bytecopy.asm"		; Byte-copy function
		include "code\common\tech\interrupts\flags.asm"		; Flag function
		include "code\common\tech\graphics\graphics.asm"		; Graphics functions
		include "code\common\maps\mapload.asm"		; Map loading functions
		include "code\common\tech\graphics\display.asm"		; Display function
		include "code\gameflow\exploration\exploration.asm"		; Exploration functions
		include "code\gameflow\battle\battlemusic.asm"		; Battle music function
		include "code\common\scripting\map\bbcs_11_function.asm"		; Specific to before battle 11 cutscene function
		include "code\common\maps\camerafunctions.asm"		; Camera function
		include "code\common\maps\animations.asm"		; Map animation function
		include "code\common\windows\windowengine.asm"		; Window engine
		include "code\common\scripting\entity\entityscriptengine.asm"		; Entity script engine
		include "code\common\scripting\text\textfunctions.asm"		; Text functions
		include "code\common\tech\sram\sramfunctions.asm"		; SRAM functions
		include "code\specialscreens\suspend\witchsuspend.asm"		; Witch suspend function
		include "code\specialscreens\witchend\witchendinit.asm"		; Witch end function
		include "code\gameflow\start\gameinit.asm"		; Game init
		include "code\gameflow\start\gameintro.asm"		; Game intro
		include "code\specialscreens\witch\witchactions.asm"		; Witch actions
		include "code\gameflow\mainloop.asm"		; Main loop
		include "code\common\maps\egressinit.asm"		; Egress map init function
		include "code\gameflow\start\basetiles.asm"		; Base tiles loading
		include "code\gameflow\special\battletest.asm"		; Battle test functions
		include "code\common\maps\mapinit_0.asm"		; Map init functions
		include "code\specialscreens\witch\witchfunctions.asm"		; Witch functions
		include "code\gameflow\special\configurationmode.asm"		; Configuration mode function
		include "code\gameflow\start\regioncheck.asm"		; Region check function
nullsub_17:		
		rts
		align $8000
