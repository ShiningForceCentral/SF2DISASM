
; ASM FILE data\battles\global\aicommandsets.asm :
; 0xE1AC..0xE25B : AI commands data
pt_AiCommandsets:
                dc.l AiCommandset00     ; HEALER1
                dc.l AiCommandset01     ; HEALER2
                dc.l AiCommandset02     ; HEALER3
                dc.l AiCommandset03     ; HEALER4
                dc.l AiCommandset04     ; HEALER5
                dc.l AiCommandset05     ; HEALER6
                dc.l AiCommandset06     ; ATTACKER1
                dc.l AiCommandset07     ; ATTACKER2
                dc.l AiCommandset08     ; SENTRY
                dc.l AiCommandset09     ; ATTACKER3
                dc.l AiCommandset10     ; INACTIVE1
                dc.l AiCommandset10     ; INACTIVE2 (duplicate of INACTIVE1)
                dc.l AiCommandset12     ; SUPPORT
                dc.l AiCommandset13     ; CRITICAL
                dc.l AiCommandset13     ; LEADER
                dc.l AiCommandset15     ; SWARM
AiCommandset00: 
; Syntax        aiCommandset [AI_COMMAND_]enum,..[AI_COMMAND_]enum
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                aiCommandset HEAL1, &
                             SUPPORT, &
                             ATTACK1, &
                             MOVE1, &
                             STAY
AiCommandset01: 
                aiCommandset MOVE_ORDER1, &
                             HEAL1, &
                             SUPPORT, &
                             ATTACK1, &
                             MOVE2, &
                             STAY
AiCommandset02: 
                aiCommandset HEAL2, &
                             MOVE_ORDER4, &
                             SUPPORT, &
                             ATTACK3, &
                             MOVE2, &
                             STAY
AiCommandset03: 
                aiCommandset HEAL2, &
                             MOVE_ORDER4, &
                             SUPPORT, &
                             ATTACK3, &
                             MOVE1, &
                             STAY
AiCommandset04: 
                aiCommandset HEAL3, &
                             MOVE_ORDER5, &
                             SUPPORT, &
                             ATTACK2, &
                             MOVE3, &
                             STAY
AiCommandset05: 
                aiCommandset HEAL3, &
                             MOVE_ORDER5, &
                             SUPPORT, &
                             ATTACK2, &
                             MOVE3, &
                             STAY
AiCommandset06: 
                aiCommandset ATTACK1, &
                             HEAL1, &
                             SUPPORT, &
                             MOVE1, &
                             STAY
AiCommandset07: 
                aiCommandset MOVE_ORDER1, &
                             ATTACK1, &
                             HEAL1, &
                             SUPPORT, &
                             MOVE1, &
                             STAY
AiCommandset08: 
                aiCommandset ATTACK1, &
                             HEAL1, &
                             SUPPORT, &
                             STAY
AiCommandset10: 
                aiCommandset STAY
AiCommandset09: 
                aiCommandset MOVE_ORDER3, &
                             ATTACK3, &
                             HEAL2, &
                             SUPPORT, &
                             MOVE_ORDER4, &
                             MOVE2, &
                             STAY
AiCommandset12: 
                aiCommandset MOVE_ORDER4, &
                             SUPPORT, &
                             ATTACK3, &
                             HEAL2, &
                             MOVE1, &
                             MOVE2, &
                             STAY
AiCommandset13: 
                aiCommandset MOVE_ORDER5, &
                             ATTACK2, &
                             HEAL3, &
                             SUPPORT, &
                             MOVE_ORDER2, &
                             MOVE3, &
                             STAY
AiCommandset15: 
                aiCommandset MOVE_ORDER1, &
                             ATTACK3, &
                             HEAL2, &
                             SUPPORT, &
                             MOVE_ORDER2, &
                             MOVE2, &
                             STAY
                
table_PathfindingModesForAiCommandset:
                dc.b AI_PATHFINDING_MODE_REGULAR           ; HEALER1
                dc.b AI_PATHFINDING_MODE_REGULAR           ; HEALER2
                dc.b AI_PATHFINDING_MODE_BLOCK_NON_MOVABLE ; HEALER3
                dc.b AI_PATHFINDING_MODE_BLOCK_NON_MOVABLE ; HEALER4
                dc.b AI_PATHFINDING_MODE_BLOCK_AND_CARVE   ; HEALER5
                dc.b AI_PATHFINDING_MODE_BLOCK_AND_CARVE   ; HEALER6
                dc.b AI_PATHFINDING_MODE_REGULAR           ; ATTACKER1
                dc.b AI_PATHFINDING_MODE_REGULAR           ; ATTACKER2
                dc.b AI_PATHFINDING_MODE_REGULAR           ; SENTRY
                dc.b AI_PATHFINDING_MODE_BLOCK_NON_MOVABLE ; ATTACKER3
                dc.b AI_PATHFINDING_MODE_REGULAR           ; INACTIVE1
                dc.b AI_PATHFINDING_MODE_REGULAR           ; INACTIVE2
                dc.b AI_PATHFINDING_MODE_BLOCK_NON_MOVABLE ; SUPPORT
                dc.b AI_PATHFINDING_MODE_BLOCK_AND_CARVE   ; CRITICAL
                dc.b AI_PATHFINDING_MODE_BLOCK_AND_CARVE   ; LEADER
                dc.b AI_PATHFINDING_MODE_REGULAR           ; SWARM
                dc.b AI_PATHFINDING_MODE_REGULAR
                dc.b AI_PATHFINDING_MODE_REGULAR

