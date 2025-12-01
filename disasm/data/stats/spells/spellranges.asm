
; ASM FILE data\stats\spells\spellranges.asm :
; 0xC590..0xC5D6 : Spell range tables
pt_SpellRanges: dc.l SpellRange0
                dc.l SpellRange1
                dc.l SpellRange2
                dc.l SpellRange3
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
