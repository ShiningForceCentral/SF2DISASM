
; ASM FILE data\stats\spells\specialspellproperties-standard.asm :

; Spells targeting all allies or enemies
table_AllTargetingSpells:
                
                ; Spell entry (index|level), target opponents toggle (0 = same side, -1 = opponents)
                dc.b SPELL_AURA|SPELL_LV4, 0
                dc.b SPELL_SHINE, 0
                
                tableEnd.b


; Spells targeting both teammates and opponents
table_FriendlyFireSpells:
                
                ; Spell entry (index|level), target self toggle (0 = false, -1 = true)
                dc.b SPELL_B_ROCK, 0
                
                tableEnd.b
