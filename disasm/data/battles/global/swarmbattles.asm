
; ASM FILE data\battles\global\swarmbattles.asm :
; 0xE25B..0xE294 : Parameters for battles implementing swarm AI
tbl_SwarmBattlesList:
                
; List of battles prefixed with length.
;
; Syntax        battles [BATTLE_]enum,..[BATTLE_]enum
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                battles VERSUS_KRAKEN, HARPIES_POND, CHESSBOARD
                
                align
pt_SwarmBattlesParams:
                dc.l SwarmBattleParams0
                dc.l SwarmBattleParams1
                dc.l SwarmBattleParams2
SwarmBattleParams0:
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
SwarmBattleParams1:
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
SwarmBattleParams2:
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
