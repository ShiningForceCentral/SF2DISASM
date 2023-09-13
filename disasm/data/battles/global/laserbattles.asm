
; ASM FILE data\battles\global\laserbattles.asm :
; 0x1AC9B8..0x1AC9FC : Laser battles data
tbl_BattlesWithLasers:
                battles VERSUS_PRISM_FLOWERS, VERSUS_ZEON, VERSUS_ALL_BOSSES
                
pt_LaserEnemyFacingForBattle:
                dc.l tbl_LaserEnemyFacingForBattle_VersusPrismFlowers
                dc.l tbl_LaserEnemyFacingForBattle_VersusZeon
                dc.l tbl_LaserEnemyFacingForBattle_VersusAllBosses
                
tbl_LaserEnemyFacingForBattle_VersusPrismFlowers:
                enemyFacing NONE
                enemyFacing DOWN
                enemyFacing RIGHT
                enemyFacing RIGHT
                enemyFacing UP
                enemyFacing LEFT
                enemyFacing UP
                enemyFacing LEFT
                enemyFacing UP
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                
tbl_LaserEnemyFacingForBattle_VersusZeon:
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing RIGHT
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing LEFT
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                
tbl_LaserEnemyFacingForBattle_VersusAllBosses:
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing NONE
                enemyFacing RIGHT
                enemyFacing LEFT
