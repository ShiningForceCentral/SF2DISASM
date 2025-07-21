
; ASM FILE code\common\tech\pointers\s13_pointers.asm :
; 0x1AC060..0x1AC068 : Game Section 13 Pointers
p_palette_EndingKiss:
                dc.l palette_EndingKissPicture
p_tiles_EndingKiss:
                dc.l tiles_EndingKissPicture
    if (STANDARD_BUILD=1)
p_table_ChestGoldAmounts: dc.l table_ChestGoldAmounts
p_pt_BattleTerrainData: dc.l pt_BattleTerrainData
p_table_EnemyDefinitions: dc.l table_EnemyDefinitions
p_pt_BattleSpritesets: dc.l pt_BattleSpritesets
p_list_RandomBattles: dc.l list_RandomBattles
p_table_MeleeTypeEnemyUpgradeDefinition: dc.l table_MeleeTypeEnemyUpgradeDefinition
p_table_AirborneTypeEnemyUpgradeDefinition: dc.l table_AirborneTypeEnemyUpgradeDefinition 
p_table_RangedTypeEnemyUpgradeDefinition: dc.l table_RangedTypeEnemyUpgradeDefinition
p_table_MageTypeEnemyUpgradeDefinition: dc.l table_MageTypeEnemyUpgradeDefinition
p_table_HealerTypeEnemyUpgradeDefinition: dc.l table_HealerTypeEnemyUpgradeDefinition
    endif
