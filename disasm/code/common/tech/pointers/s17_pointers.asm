
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
            if (STANDARD_BUILD=1)
p_table_ConfigurationNames:     dc.l table_ConfigurationNames
p_table_MapNames:               dc.l table_MapNames
p_table_BattleNames:            dc.l table_BattleNames
p_table_MenuNames:              dc.l table_MenuNames
p_table_ShopNames:              dc.l table_ShopNames
p_table_PartySelectNames:       dc.l table_PartySelectNames
p_table_DifficultyNames:        dc.l table_DifficultyNames
p_table_ActionTypeNames:        dc.l table_ActionTypeNames
p_table_SideNames:              dc.l table_SideNames
p_table_EffectNames:            dc.l table_EffectNames
p_table_BackgroundNames:        dc.l table_BackgroundNames
p_table_SavedDataNames:         dc.l table_SavedDataNames
p_table_ConfigurationMessages:  dc.l table_ConfigurationMessages
            else
p_palette_UnusedBase:
                dc.l palette_UnusedBase 
            endif
p_tiles_Base:   dc.l tiles_Base
