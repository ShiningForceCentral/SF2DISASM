
; ASM FILE data\graphics\battles\battlesprites\allyidlebattlesprites.asm :
; 0x1FAD6..0x1FADD : Ally Idle Battle Sprites
tbl_AllyBattleSpriteIdleAnimate:
                
; Indexes of ally battle sprites which do not animate while idle
                
; Syntax        allyBattleSprite [ALLYBATTLESPRITE_]index
                
                allyBattleSprite PRST
                allyBattleSprite MAGE
                allyBattleSprite SORC_MALE
                allyBattleSprite WIZ
                allyBattleSprite GLM
                allyBattleSprite VICR
                
                tableEnd.b
