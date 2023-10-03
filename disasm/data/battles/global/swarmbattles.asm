
; ASM FILE data\battles\global\swarmbattles.asm :
; 0xE25B..0xE294 : Parameters for battles implementing swarm AI
list_SwarmBattles:
                
; List of battles prefixed with length.
;
; Syntax        battles [BATTLE_]enum,..[BATTLE_]enum
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                battles VERSUS_KRAKEN, HARPIES_POND, CHESSBOARD
                
                align
pt_SwarmAiEnemyCounts:
                dc.l table_SwarmAiEnemyCounts0
                dc.l table_SwarmAiEnemyCounts1
                dc.l table_SwarmAiEnemyCounts2
table_SwarmAiEnemyCounts0:
                dc.b 5
                dc.b 4
                dc.b 2
                dc.b 2
                dc.b 3
                dc.b 0
                dc.b 0
                dc.b 4
                dc.b 1
                dc.b 3
                dc.b 0
table_SwarmAiEnemyCounts1:
                dc.b 3
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 1
table_SwarmAiEnemyCounts2:
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 6
                dc.b 1
                dc.b 3
                dc.b 0
                dc.b 1
                dc.b 3
                dc.b 6
                dc.b 6
                dc.b 1
                dc.b 0
                dc.b 3
                dc.b 3
                dc.b 0
                
                align
