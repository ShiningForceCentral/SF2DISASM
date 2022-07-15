
; ASM FILE data\battles\global\laserbattles.asm :
; 0x1AC9B8..0x1AC9FC : Laser battles data
tbl_BattlesWithLasers:
                battles VERSUS_PRISM_FLOWERS, VERSUS_ZEON, VERSUS_ALL_BOSSES
                
pt_LaserEnemyFacingForBattle:
                dc.l tbl_LaserEnemyFacingForBattle_VersusPrismFlowers
                dc.l tbl_LaserEnemyFacingForBattle_VersusZeon
                dc.l tbl_LaserEnemyFacingForBattle_VersusAllBosses
                
tbl_LaserEnemyFacingForBattle_VersusPrismFlowers:
                dc.b $FF
                dc.b DOWN
                dc.b RIGHT
                dc.b RIGHT
                dc.b UP
                dc.b LEFT
                dc.b UP
                dc.b LEFT
                dc.b UP
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                
tbl_LaserEnemyFacingForBattle_VersusZeon:
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b RIGHT
                dc.b $FF
                dc.b $FF
                dc.b LEFT
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                
tbl_LaserEnemyFacingForBattle_VersusAllBosses:
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b $FF
                dc.b RIGHT
                dc.b LEFT
