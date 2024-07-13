
; ASM FILE data\stats\spells\specialspellproperties-standard.asm :

; Spells targeting all allies or enemies
table_AllTargetingSpells:
                
                ; Spell entry (index|level), target opponents toggle (0 = same side, -1 = opponents)
                dc.b SPELL_AURA|SPELL_LV4, 0
                dc.b SPELL_SHINE, 0
                
                tableEnd.b


; Spells that are disallowed from targeting the caster
table_SelfTargetingSpells:
                
                ; Spell entry (index|level)
                dc.b SPELL_B_ROCK
                
                tableEnd.b
