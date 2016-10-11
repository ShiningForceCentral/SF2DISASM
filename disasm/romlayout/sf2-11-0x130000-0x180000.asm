
; GAME SECTION 11 :
; 0x130000 : Enemy battle sprites

; FREE SPACE : 429 bytes.


p_pt_EnemyBattleSprites:
										dc.l pt_EnemyBattleSprites
										include "graphics\battles\battlesprites\enemies\entries.asm"		; Enemy battle sprites
										align $8000
