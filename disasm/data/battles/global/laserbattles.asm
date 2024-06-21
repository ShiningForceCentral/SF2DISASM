
; ASM FILE data\battles\global\laserbattles.asm :
; 0x1AC9B8..0x1AC9FC : Laser battles data
list_BattlesWithLasers:
                battles VERSUS_PRISM_FLOWERS, VERSUS_ZEON, VERSUS_ALL_BOSSES
                
pt_LaserEnemyFacingForBattle:
                dc.l table_LaserEnemyFacingForBattle_VersusPrismFlowers
                dc.l table_LaserEnemyFacingForBattle_VersusZeon
                dc.l table_LaserEnemyFacingForBattle_VersusAllBosses
                
table_LaserEnemyFacingForBattle_VersusPrismFlowers:
                dc.b LASER_NONE
                dc.b LASER_DOWN
                dc.b LASER_RIGHT
                dc.b LASER_RIGHT
                dc.b LASER_UP
                dc.b LASER_LEFT
                dc.b LASER_UP
                dc.b LASER_LEFT
                dc.b LASER_UP
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                
table_LaserEnemyFacingForBattle_VersusZeon:
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_RIGHT
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_LEFT
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                
table_LaserEnemyFacingForBattle_VersusAllBosses:
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_NONE
                dc.b LASER_RIGHT
                dc.b LASER_LEFT
