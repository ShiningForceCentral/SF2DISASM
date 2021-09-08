
; ASM FILE data\graphics\battles\battlesprites\enemyidlebattlesprites.asm :
; 0x1FADD..0x1FAEA : Enemy Idle Battle Sprites
tbl_EnemyBattleSpriteIdleAnimate:
                
; Enemy battle sprites which do not animate while idle.
                
; Syntax        enemyBattleSprite [ENEMYBATTLESPRITE_]enum (or index)
                
                enemyBattleSprite BURST_ROCK
                enemyBattleSprite HYDRA
                enemyBattleSprite HUNTER_GOBLIN
                enemyBattleSprite ARROW_LAUNCHER
                enemyBattleSprite MAGE
                enemyBattleSprite WITCH
                enemyBattleSprite WIZARD
                enemyBattleSprite NECROMANCER
                enemyBattleSprite CLERIC
                enemyBattleSprite BISHOP
                enemyBattleSprite SHAMAN
                enemyBattleSprite PRISM_FLOWER
                
                tableEnd.b
