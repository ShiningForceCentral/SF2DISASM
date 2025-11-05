
; ASM FILE data\stats\spells\spellranges.asm :
; 0xC590..0xC5D6 : Spell range tables
pt_SpellRanges: dc.l SpellRange0
                dc.l SpellRange1
                dc.l SpellRange2
                dc.l SpellRange3
            if (STANDARD_BUILD&EXPANDED_RANGES=1)
                dc.l SpellRange4
                dc.l SpellRange5
                dc.l SpellRange6
                dc.l SpellRange7
            endif
SpellRange0:    dc.b 1
                dc.b  0,  0
SpellRange1:    dc.b 4
                dc.b  0,  1
                dc.b  1,  0
                dc.b  0, -1
                dc.b -1,  0
SpellRange2:    dc.b 8
                dc.b  0, -2
                dc.b -1, -1
                dc.b -2,  0
                dc.b -1,  1
                dc.b  0,  2
                dc.b  1,  1
                dc.b  2,  0
                dc.b  1, -1
SpellRange3:    dc.b 12
                dc.b  0,  3
                dc.b  1,  2
                dc.b  2,  1
                dc.b  3,  0
                dc.b  2, -1
                dc.b  1, -2
                dc.b  0, -3
                dc.b -1, -2
                dc.b -2, -1
                dc.b -3,  0
                dc.b -2,  1
                dc.b -1,  2
                
            if (STANDARD_BUILD&EXPANDED_RANGES=1)
SpellRange4:    dc.b 16
                dc.b  0, -4
                dc.b -1, -3
                dc.b -2, -2
                dc.b -3, -1
                dc.b -4,  0
                dc.b -3,  1
                dc.b -2,  2
                dc.b -1,  3
                dc.b  0,  4
                dc.b  1,  3
                dc.b  2,  2
                dc.b  3,  1
                dc.b  4,  0
                dc.b  3, -1
                dc.b  2, -2
                dc.b  1, -3
                
SpellRange5:    dc.b 20
                dc.b  0, -5
                dc.b -1, -4
                dc.b -2, -3
                dc.b -3, -2
                dc.b -4, -1
                dc.b -5,  0
                dc.b -4,  1
                dc.b -3,  2
                dc.b -2,  3
                dc.b -1,  4
                dc.b  0,  5
                dc.b  1,  4
                dc.b  2,  3
                dc.b  3,  2
                dc.b  4,  1
                dc.b  5,  0
                dc.b  4, -1
                dc.b  3, -2
                dc.b  2, -3
                dc.b  1, -4
                
SpellRange6:    dc.b 24
                dc.b  0, -6
                dc.b -1, -5
                dc.b -2, -4
                dc.b -3, -3
                dc.b -4, -2
                dc.b -5, -1
                dc.b -6,  0
                dc.b -5,  1
                dc.b -4,  2
                dc.b -3,  3
                dc.b -2,  4
                dc.b -1,  5
                dc.b  0,  6
                dc.b  1,  5
                dc.b  2,  4
                dc.b  3,  3
                dc.b  4,  2
                dc.b  5,  1
                dc.b  6,  0
                dc.b  5, -1
                dc.b  4, -2
                dc.b  3, -3
                dc.b  2, -4
                dc.b  1, -5
                
SpellRange7:    dc.b 28
                dc.b  0, -7
                dc.b -1, -6
                dc.b -2, -5
                dc.b -3, -4
                dc.b -4, -3
                dc.b -5, -2
                dc.b -6, -1
                dc.b -7,  0
                dc.b -6,  1
                dc.b -5,  2
                dc.b -4,  3
                dc.b -3,  4
                dc.b -2,  5
                dc.b -1,  6
                dc.b  0,  7
                dc.b  1,  6
                dc.b  2,  5
                dc.b  3,  4
                dc.b  4,  3
                dc.b  5,  2
                dc.b  6,  1
                dc.b  7,  0
                dc.b  6, -1
                dc.b  5, -2
                dc.b  4, -3
                dc.b  3, -4
                dc.b  2, -5
                dc.b  1, -6
            endif
