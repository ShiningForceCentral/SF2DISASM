
; ASM FILE data\stats\items\specialcounterattackenemies-standard.asm :

; Enemies that are unable to counter attack
tbl_UnableToCounterEnemies:
                
                dc.b ENEMY_TAROS
                
                tableEnd.b


; Enemies that cannot be counter attacked
tbl_CannotBeCounteredEnemies:
                
                dc.b ENEMY_BURST_ROCK
                dc.b ENEMY_KRAKEN_HEAD
                dc.b ENEMY_PRISM_FLOWER
                dc.b ENEMY_ZEON_GUARD
                
                tableEnd.b
