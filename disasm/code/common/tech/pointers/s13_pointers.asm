
; ASM FILE code\common\tech\pointers\s13_pointers.asm :
; 0x1AC060..0x1AC068 : Game Section 13 Pointers
p_palette_EndingKiss:
                dc.l palette_EndingKissPicture
p_tiles_EndingKiss:
                dc.l tiles_EndingKissPicture
    if (STANDARD_BUILD=1)
p_pt_BattleTerrainData: dc.l pt_BattleTerrainData
p_table_EnemyDefinitions: dc.l table_EnemyDefinitions
p_pt_BattleSpritesets: dc.l pt_BattleSpritesets
    endif
