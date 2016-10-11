
; GAME SECTION 01 :
; 0x000000 : Technical Layer, Low Level Game Engine, Map/Exploration Engine, Entity Script Commands, Witch Functions

; FREE SPACE : 90 bytes.


										include "system\romheader.asm"		; ROM Header
										include "system\init\systeminit.asm"		; System init functions
										include "system\init\start.asm"		; Start function
										include "system\interrupts\interruptsengine.asm"		; Interrupts engine
										include "system\text\asciinumber.asm"		; ASCII number function
										include "system\tech\inputfunctions.asm"		; Input functions
										include "system\randomizingfunctions.asm"		; Randomizing function
										include "system\sound\musicfunctions.asm"		; Sound function
										include "system\tech\bytecopy.asm"		; Byte-copy function
										include "system\interrupts\flagfunctions.asm"		; Flag function
										include "system\graphics\graphicsfunctions_0.asm"		; Graphics functions
										include "system\maps\maploading.asm"		; Map loading functions
										include "system\graphics\displayfunctions.asm"		; Display function
										include "system\exploration\exploration.asm"		; Exploration functions
										include "system\sound\battlemusic.asm"		; Battle music function
										include "battles\entries\battle11\bbcs_11_function.asm"		; Specific to before battle 11 cutscene function
										include "system\maps\camerafunctions.asm"		; Camera function
										include "system\maps\animations.asm"		; Map animation function
										include "system\windows\windowengine.asm"		; Window engine
										include "system\scripting\entity\entityscriptengine.asm"		; Entity script engine
										include "system\text\textfunctions.asm"		; Text functions
										include "system\sram\sramfunctions.asm"		; SRAM functions
										include "system\specialscreens\suspend\witchsuspend.asm"		; Witch suspend function
										include "system\specialscreens\witchend\witchendinit.asm"		; Witch end function
										include "system\init\gameinit.asm"		; Game init
										include "system\gameintro.asm"		; Game intro
										include "system\specialscreens\witch\witchactions.asm"		; Witch actions
										include "system\mainloop.asm"		; Main loop
										include "system\maps\egresseinit.asm"		; Egress map init function
										include "system\init\basetiles.asm"		; Base tiles loading
										include "system\debug\battletest.asm"		; Battle test functions
										include "system\maps\mapinit_0.asm"		; Map init functions
										include "system\specialscreens\witch\witchfunctions.asm"		; Witch functions
										include "system\debug\configurationmode.asm"		; Configuration mode function
										include "system\init\regioncheck.asm"		; Region check function

; =============== S U B R O U T I N E =======================================

nullsub_17:
										
										rts

	; End of function nullsub_17

										align $8000
