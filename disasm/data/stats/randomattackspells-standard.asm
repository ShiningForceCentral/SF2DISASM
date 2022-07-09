
; ASM FILE data\stats\items\randomattackspells-standard.asm :

; Classes that have a chance to cast a spell when attacking.
tbl_RandomAttackSpellsForClasses:
                
                ; Class index, n/256 chance to cast, upgrade levels 1, 2, 3, spell index
                dc.b CLASS_MNST, 64, 32, 40, 50, SPELL_KIWI
                
                tableEnd.b


; Same as above, but for enemies.
tbl_RandomAttackSpellsForEnemies:
                
                tableEnd.b
