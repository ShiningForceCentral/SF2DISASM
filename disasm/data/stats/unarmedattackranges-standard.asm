
; ASM FILE data\stats\items\unarmedattackranges-standard.asm :

; Classes that use a special attack range when attacking without a weapon equipped.
table_UnarmedAttackRangesForClasses:
                
                ; Class index, min range, max range
                dc.b CLASS_BRGN, 1, 2
                
                tableEnd.b


; Same as above, but for enemies.
table_UnarmedAttackRangesForEnemies:
                
                dc.b ENEMY_KRAKEN_ARM, 1, 2
                dc.b ENEMY_KRAKEN_HEAD, 1, 3
                
                tableEnd.b
