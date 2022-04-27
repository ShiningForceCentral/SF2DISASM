
; GAME SECTION 12 :
; 0x180000..0x1AC000 : Ally battle sprites, status anim tiles, battlescene transition tiles, bolt graphics, ally and enemy animations
; FREE SPACE : 871 bytes.


p_pt_AllyBattleSprites:
                dc.l pt_AllyBattleSprites
p_StatusAnimationTiles:
                dc.l StatusAnimationTiles
p_pt_BattlesceneTransitionTiles:
                dc.l pt_BattlesceneTransitionTiles
p_BoltAnimData_A:
                dc.l BoltAnimData_A
p_BoltAnimData_B:
                dc.l BoltAnimData_B
p_pt_AllyAnimations:
                dc.l pt_AllyAnimations
p_pt_EnemyAnimations:
                dc.l pt_EnemyAnimations
                include "data\graphics\battles\battlesprites\allies\entries.asm"    ; Ally battlesprites
                include "data\graphics\battles\tech\statusanimation\entries.asm"    ; Status effect animation tiles
                include "data\graphics\battles\tech\battlescenetransition\entries.asm"    ; Battlescene transition tiles
                include "data\graphics\battles\spells\animations\boltanimdata.asm"    ; Bolt spell animation data
                include "data\graphics\battles\battlesprites\allies\animations\entries.asm"    ; Ally animations
                include "data\graphics\battles\battlesprites\enemies\animations\entries.asm"    ; Enemy animations
                align $4000
