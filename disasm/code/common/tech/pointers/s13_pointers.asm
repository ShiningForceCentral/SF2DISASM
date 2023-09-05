
; ASM FILE code\common\tech\pointers\s13_pointers.asm :
; 0x1AC060..0x1AC068 : Game Section 13 Pointers
p_plt_EndKiss:  dc.l plt_EndKiss
p_EndKissPicture:dc.l EndKissPicture
    if (STANDARD_BUILD=1)
p_pt_BattleTerrainData: dc.l pt_BattleTerrainData
p_table_EnemyDefs: dc.l table_EnemyDefs
p_pt_BattleSpriteSets: dc.l pt_BattleSpriteSets
    endif
