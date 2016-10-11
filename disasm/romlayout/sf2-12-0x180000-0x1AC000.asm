
; GAME SECTION 12 :
; 0x180000 : Ally battle sprites, status anim tiles, battlescene transition tiles, bolt graphics, ally and enemy animations

; FREE SPACE : 871 bytes.


p_pt_AllyBattleSprites:
										dc.l pt_AllyBattleSprites
p_statusAnimationTiles:
										dc.l StatusAnimationTiles
p_pt_battlesceneTransitionTiles:
										dc.l pt_battlesceneTransitionTiles
p_BoltAnimData_A:   dc.l BoltAnimData_A
p_BoltAnimData_B:   dc.l BoltAnimData_B
p_pt_AllyAnimations:dc.l pt_AlliesAnimations
p_pt_EnemyAnimations:
										dc.l pt_EnemyAnimations
										include "graphics\battles\battlesprites\allies\entries.asm"		; Ally battlesprites
StatusAnimationTiles:
										incbin "graphics/technical/statusanimationtiles.bin"
pt_battlesceneTransitionTiles:
										dc.l BattlesceneTransitionTilesA
										dc.l BattlesceneTransitionTilesB
BattlesceneTransitionTilesA:
										incbin "graphics/technical/battlescenetransitiontilesa.bin"
BattlesceneTransitionTilesB:
										incbin "graphics/technical/battlescenetransitiontilesb.bin"
BoltAnimData_A:     incbin "graphics/battles/spells/animations/boltanimdataa.bin"
BoltAnimData_B:     incbin "graphics/battles/spells/animations/boltanimdatab.bin"
										include "graphics\battles\battlesprites\allies\animations\entries.asm"		; Ally animations
										include "graphics\battles\battlesprites\enemies\animations\entries.asm"		; Enemy animations
										align $4000
