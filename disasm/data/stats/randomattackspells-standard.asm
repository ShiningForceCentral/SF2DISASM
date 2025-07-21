
; ASM FILE data\stats\randomattackspells-standard.asm :

; Classes that have a chance to cast a spell when attacking.
table_RandomAttackSpellsForWeapons:
                
                ; Item index, n/256 (0 = 256) chance to cast, upgrade levels 1, 2, 3 (effective level), spell index
                
                ; Attack is replaced with Bolt level 2 with 100% chance while the Taros Sword is equipped.
                ;dc.b ITEM_TAROS_SWORD, 0, 0, -1, -1, SPELL_BOLT
                
                tableEnd.b


; Classes that have a chance to cast a spell when attacking.
table_RandomAttackSpellsForClasses:
                
                ; Class index, n/256 (0 = 256) chance to cast, upgrade levels 1, 2, 3 (effective level), spell index
                
                ; Kiwi's flame breath replaces Kiwi's attack with 25% chance, upgrading at promoted levels 12, 20, and 30.
                dc.b CLASS_MNST, 64, 32, 40, 50, SPELL_KIWI
                
                tableEnd.b


; Same as above, but for enemies.
table_RandomAttackSpellsForEnemies:
                
                ; Enemy index, n/256 (0 = 256) chance to cast, upgrade levels 1, 2, 3 (effective level), spell index
                
                ; Odd Eye Beam level 1 replaces Odd Eye's attack with 50% chance.
                ;dc.b ENEMY_ODD_EYE, 128, -1, -1, -1, SPELL_ODDEYE
                
                tableEnd.b
