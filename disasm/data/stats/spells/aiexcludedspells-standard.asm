
; ASM FILE data\stats\spells\aiexcludedspells-standard.asm :

; Attack type spells which are disallowed from being cast by AI-controlled combatants when they are confused (i.e., Muddle 2).
table_AiExcludedWhenConfusedAttackSpells:
                
                dc.b SPELL_DESOUL
                dc.b SPELL_FLAME
                dc.b SPELL_SNOW
                dc.b SPELL_DEMON
                dc.b SPELL_B_ROCK
                dc.b SPELL_LASER
                dc.b SPELL_DAO
                dc.b SPELL_APOLLO
                dc.b SPELL_NEPTUN
                dc.b SPELL_ATLAS
                dc.b SPELL_FBALL
                dc.b SPELL_BREZAD
                dc.b SPELL_THUNDR
                dc.b SPELL_AQUA
                dc.b SPELL_KIWI
                dc.b SPELL_ODDEYE
                
                tableEnd.b


; Attack type Item Use Spells which are disallowed from being used by AI-controlled combatants when they are confused (i.e., Muddle 2).
table_AiExcludedWhenConfusedItemUseAttackSpells:
                
                dc.b SPELL_DESOUL
                dc.b SPELL_FLAME
                dc.b SPELL_SNOW
                dc.b SPELL_DEMON
                dc.b SPELL_B_ROCK
                dc.b SPELL_LASER
                dc.b SPELL_KATON
                dc.b SPELL_RAIJIN
                dc.b SPELL_DAO
                dc.b SPELL_APOLLO
                dc.b SPELL_NEPTUN
                dc.b SPELL_ATLAS
                dc.b SPELL_FBALL
                dc.b SPELL_BREZAD
                dc.b SPELL_THUNDR
                dc.b SPELL_AQUA
                dc.b SPELL_KIWI
                dc.b SPELL_ODDEYE
                
                tableEnd.b
