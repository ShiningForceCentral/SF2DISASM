
; GAME SECTION 04 :
; 0x018000..0x020000 : BattleScene Engine
; FREE SPACE : 532 bytes.


		include "code\gameflow\battle\battlescenes\battlesceneengine_0.asm"		; Battlescene engine
		include "data\battles\global\custombackgrounds.asm"		; Battle custom backgrounds table
		include "code\gameflow\battle\battlescenes\battlesceneengine_1.asm"		; Battlescene engine
		dc.b $FF
		align $20000
