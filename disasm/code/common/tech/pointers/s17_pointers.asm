
; ASM FILE code\common\tech\pointers\s17_pointers.asm :
; 0x1EE000..0x1EE02C : Game Section 17 Pointers
p_table_StatGrowthCurves:
                dc.l table_StatGrowthCurves
p_pt_AllyStats: dc.l pt_AllyStats       
p_table_AllyStartDefinitions:
                dc.l table_AllyStartDefinitions
p_table_ClassDefinitions:
                dc.l table_ClassDefinitions
p_tiles_JewelEndScreen:
                dc.l tiles_EndingJewels
p_layout_JewelEndScreen:
                dc.l layout_EndingJewels
p_palette_JewelsEndScreen:
                dc.l palette_EndingJewels
p_palette_SuspendString:
                dc.l palette_SuspendString
p_tiles_SuspendString:
                dc.l tiles_SuspendString
p_palette_UnusedBase:
            if (VANILLA_BUILD=1)
                dc.l palette_UnusedBase 
            endif
p_tiles_Base:   dc.l tiles_Base
