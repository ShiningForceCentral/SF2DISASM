
; ASM FILE data\battles\swarmbattleslist.asm :
; 0xE25B..0xE25F : List of battles implementing swarm AI
table_SwarmBattlesList:
                
; List of battles prefixed with length.
;
; Syntax        battles [BATTLE_]enum,..[BATTLE_]enum
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                battles VERSUS_KRAKEN, HARPIES_POND, CHESSBOARD
                
