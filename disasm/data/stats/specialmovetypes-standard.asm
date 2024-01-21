
; ASM FILE data\stats\specialmovetypes-standard.asm :
;

; Movetypes that have a higher chance to dodge non-archer attacks.
table_AirborneMovetypes:
                
                dc.b MOVETYPE_LOWER_FLYING
                dc.b MOVETYPE_LOWER_HOVERING
                
                tableEnd.b


; Movetypes that ignore airborne targets' higher chance to dodge, and also inflict additional damage to them.
table_ArcherMovetypes:
                
                dc.b MOVETYPE_LOWER_BRASS_GUNNER
                dc.b MOVETYPE_LOWER_ARCHER
                dc.b MOVETYPE_LOWER_CENTAUR_ARCHER
                dc.b MOVETYPE_LOWER_STEALTH_ARCHER
                
                tableEnd.b
