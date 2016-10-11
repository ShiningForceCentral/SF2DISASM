
; GAME SECTION 13 :
; 0x1AC000 : Battle setup functions, battle terrains, battle entity setups, end kiss graphics

; FREE SPACE : 133 bytes.


										include "system\battles\battle_s13_0.asm"		; Jump interface for section functions
										include "system\scripting\endcredits.asm"		; Ending credits functions
										include "system\battles\battle_s13_1.asm"		; Battle init, terrain, AI stuff to split more properly
										include "battles\global\terrainentries.asm"		; Battle terrain data
										include "system\battles\battle_s13_2.asm"		; Battle init, terrain, AI stuff to split more properly
EnemyData:          incbin "battles/global/enemydata.bin"
										include "battles\global\spritesetentries.asm"		; Battle sprite sets
										include "system\battles\battle_s13_3.asm"		; Data related to UpgradeUnitIdx function
plt_EndKiss:        incbin "graphics/specialscreens/endingkiss/endingkisspalette.bin"
EndKissPicture:     incbin "graphics/specialscreens/endingkiss/endingkisstiles.bin"
										align $4000
