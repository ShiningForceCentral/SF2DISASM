
; GAME SECTION 12 :
; 0x180000..0x1AC000 : Ally battle sprites, status anim tiles, battlescene transition tiles, bolt graphics, ally and enemy animations
; FREE SPACE : 871 bytes.


p_pt_AllyBattleSprites:
                dc.l pt_AllyBattleSprites
p_statusAnimationTiles:
                dc.l StatusAnimationTiles
p_pt_battlesceneTransitionTiles:
                dc.l pt_battlesceneTransitionTiles
p_BoltAnimData_A:
                dc.l BoltAnimData_A
p_BoltAnimData_B:
                dc.l BoltAnimData_B
p_pt_AllyAnimations:
                dc.l pt_AlliesAnimations
p_pt_EnemyAnimations:
                dc.l pt_EnemyAnimations
                includeIfExpandedRom "data\scripting\text\entries.asm"    ; Textbank entries
                includeIfVanillaRom "data\graphics\battles\battlesprites\allies\entries.asm"    ; Ally battlesprites
StatusAnimationTiles:
                incbin "data/graphics/tech/statusanimationtiles.bin"
pt_battlesceneTransitionTiles:
                dc.l BattlesceneTransitionTilesA
                dc.l BattlesceneTransitionTilesB
BattlesceneTransitionTilesA:
                incbin "data/graphics/tech/battlescenetransitiontilesa.bin"
BattlesceneTransitionTilesB:
                incbin "data/graphics/tech/battlescenetransitiontilesb.bin"
BoltAnimData_A: incbin "data/graphics/battles/spells/animations/boltanimdataa.bin"
BoltAnimData_B: incbin "data/graphics/battles/spells/animations/boltanimdatab.bin"
                include "data\graphics\battles\battlesprites\allies\animations\entries.asm"    ; Ally animations
                include "data\graphics\battles\battlesprites\enemies\animations\entries.asm"    ; Enemy animations
                align $1AC000
