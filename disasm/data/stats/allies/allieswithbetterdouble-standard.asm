
; ASM FILE data\stats\allies\allieswithbetterdouble-standard.asm :

; Allies whose base double attack prowess increases by 1 during initialization.
table_AlliesWithBetterDouble:
                
            if (STANDARD_BUILD&FIX_KARNA_INCREASED_DOUBLE>=2)
                dc.b ALLY_SHEELA
            endif
                
                tableEnd.b
