
; ASM FILE data\stats\items\specialbattleanimations-standard.asm :

; Classes that have an additional chance to perform a critical hit for which a special animation is used.
table_SpecialCriticalHitsForClasses:
                
                ; Class index, n/256 chance to crit, ally animation index
                dc.w CLASS_MMNK, 16, ALLYBATTLEANIMATION_SPECIAL_MMNK
                dc.w CLASS_RBT, 16, ALLYBATTLEANIMATION_SPECIAL_RBT
                
                tableEnd


; Same as above, but for enemies.
table_SpecialCriticalHitsForEnemies:
                
                ; Enemy index, n/256 chance to crit, enemy animation index
                
                tableEnd


; Classes that use a special animation when attacking without a weapon equipped.
table_UnarmedAttackAnimationsForClasses:
                
                ; Class index, spell animation index, ally animation index
                dc.w CLASS_BRGN, SPELLANIMATION_NONE, ALLYBATTLEANIMATION_SPECIAL_BRGN
                
                tableEnd


table_UnarmedAttackAnimationsForEnemies:
                
                ; Enemy index, spell animation index, enemy animation index
                
                tableEnd


; Classes that use a special animation when casting spells.
table_SpellcastAnimationsForClasses:
                
                dc.w CLASS_MNST, ALLYBATTLEANIMATION_SPECIAL_MNST
                
                tableEnd


table_SpellcastAnimationsForEnemies:
                
                dc.w ENEMY_HELL_HOUND, ENEMYBATTLEANIMATION_SPECIAL_HELL_HOUND
                dc.w ENEMY_CERBERUS, ENEMYBATTLEANIMATION_SPECIAL_HELL_HOUND
                dc.w ENEMY_DEVIL_GRIFFIN, ENEMYBATTLEANIMATION_SPECIAL_DEVIL_GRIFFIN
                dc.w ENEMY_ODD_EYE, ENEMYBATTLEANIMATION_SPECIAL_ODD_EYE
                
                tableEnd


; Classes that use a special animation when using items.
table_UseItemAnimationsForClasses:
                
                tableEnd


table_UseItemAnimationsForEnemies:
                
                tableEnd
