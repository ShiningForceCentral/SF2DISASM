
; ASM FILE code\common\tech\pointers\s03_pointers.asm :
; 0x10084..0x10094 : Game Section 03 Pointers
p_table_ItemNames:
                dc.l table_ItemNames
p_table_ClassNames:
                dc.l table_ClassNames
p_table_FullClassNames
            if (STANDARD_BUILD=1)
                dc.l table_FullClassNames
            endif
p_table_ItemDefinitions:
                dc.l table_ItemDefinitions
p_table_SpellDefinitions:
                dc.l table_SpellDefinitions
