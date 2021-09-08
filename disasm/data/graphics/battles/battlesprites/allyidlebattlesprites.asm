
; ASM FILE data\graphics\battles\battlesprites\allyidlebattlesprites.asm :
; 0x1FAD6..0x1FADD : Ally Idle Battle Sprites
tbl_AllyBattleSpriteIdleAnimate:
                
; Ally battle sprites which do not animate while idle.
                
; Syntax        allyBattleSprite [ALLYBATTLESPRITE_]enum (or index)
                
                allyBattleSprite PRST
                allyBattleSprite MAGE
                allyBattleSprite SORC_MALE
                allyBattleSprite WIZ
                allyBattleSprite GLM
                allyBattleSprite VICR
                
                tableEnd.b
