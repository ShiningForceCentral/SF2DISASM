; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 16
; # AI Regions
	dc.b 0
; # AI Points
	dc.b 1
	
	allyCombatant 0, 18, 18
	allyFillA
	allyCombatant 1, 21, 18
	allyFillA
	allyCombatant 2, 15, 18
	allyFillA
	allyCombatant 3, 20, 17
	allyFillA
	allyCombatant 4, 16, 17
	allyFillA
	allyCombatant 5, 13, 18
	allyFillA
	allyCombatant 6, 23, 18
	allyFillA
	allyCombatant 7, 22, 17
	allyFillA
	allyCombatant 8, 14, 17
	allyFillA
	allyCombatant 9, 18, 17
	allyFillA
	allyCombatant 10, 19, 18
	allyFillA
	allyCombatant 11, 17, 18
	allyFillA
	
	; Enemy members
	;dc.b 	; Character index
	;dc.b 	; relative x position
	;dc.b 	; relative y position
	;dc.b 	; AI code
	;dc.w 	; Unique Item
	;dc.b 	; Move order 1 $FF=No order $0X=Follow Force Member X $4X=Move towards point X $8X=Follow enemy X
	;dc.b 	; Trigger Region
	;dc.b 	; Order
	;dc.b 	; Trigger Region
	;dc.b 	; 
	;dc.b 	; Spawn code 01=Continuous respawn 02=Region-triggered spawn
	
	enemyCombatant KING, 15, 5
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant QUEEN, 17, 5
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BISHOP, 13, 5
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BISHOP, 19, 5
	enemyAIandItem HEALER4, NOTHING
	enemyBehavior FOLLOW_DEVIL|9, $F, FOLLOW_DEVIL|0, $F, $0, STARTING
	
	enemyCombatant KNIGHT, 11, 5
	enemyAIandItem SWARM, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant KNIGHT, 21, 5
	enemyAIandItem SWARM, NOTHING
	enemyBehavior FOLLOW_DEVIL|8, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ROOK, 9, 5
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ROOK, 23, 5
	enemyAIandItem SWARM, NOTHING
	enemyBehavior FOLLOW_DEVIL|4, $F, NONE, $F, $0, STARTING
	
	enemyCombatant QUEEN, 15, 6
	enemyAIandItem SWARM, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant QUEEN, 17, 6
	enemyAIandItem SWARM, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PAWN, 13, 6
	enemyAIandItem SWARM, NOTHING
	enemyBehavior FOLLOW_DEVIL|9, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PAWN, 19, 6
	enemyAIandItem SWARM, NOTHING
	enemyBehavior FOLLOW_DEVIL|4, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PAWN, 11, 6
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_DEVIL|6, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PAWN, 21, 6
	enemyAIandItem SWARM, NOTHING
	enemyBehavior FOLLOW_DEVIL|8, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PAWN, 9, 6
	enemyAIandItem SWARM, NOTHING
	enemyBehavior FOLLOW_DEVIL|8, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PAWN, 23, 6
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_DEVIL|6, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	
	; AI point
	dc.b 15, 5	; X offset, Y offset