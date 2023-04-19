; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 15
; # AI Regions
	dc.b 4
; # AI Points
	dc.b 1
	
	allyCombatant 0, 21, 4
	allyFillA
	allyCombatant 1, 21, 3
	allyFillA
	allyCombatant 2, 22, 3
	allyFillA
	allyCombatant 3, 20, 3
	allyFillA
	allyCombatant 4, 22, 4
	allyFillA
	allyCombatant 5, 23, 3
	allyFillA
	allyCombatant 6, 20, 4
	allyFillA
	allyCombatant 7, 19, 3
	allyFillA
	allyCombatant 8, 21, 2
	allyFillA
	allyCombatant 9, 23, 4
	allyFillA
	allyCombatant 10, 20, 2
	allyFillA
	allyCombatant 11, 22, 2
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
	
	enemyCombatant DEVIL_SOLDIER, 23, 27
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $2, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_BISHOP, 21, 19
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant NECROMANCER, 15, 20
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant HARPY_QUEEN, 23, 26
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HARPY_QUEEN, 32, 23
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $2, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_KNIGHT, 25, 20
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ORC_LORD, 22, 18
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant MASTER_MONK, 19, 18
	enemyAIandItem HEALER4, NOTHING
	enemyBehavior FOLLOW_DEVIL|6, $1, FOLLOW_DEVIL|0, $F, $0, STARTING
	
	enemyCombatant HARPY_QUEEN, 10, 16
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_KNIGHT, 17, 11
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ORC_LORD, 29, 11
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant MASTER_MONK, 31, 10
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|10, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ORC_LORD, 37, 4
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|13, $0, FOLLOW_DEVIL|13, $3, $0, STARTING
	
	enemyCombatant DARK_KNIGHT, 39, 2
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $0, NONE, $3, $0, STARTING
	
	enemyCombatant HARPY_QUEEN, 23, 15
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 29, 0	; x1, y1
	dc.b 29, 31	; x2, y2
	dc.b 47, 31	; x3, y3
	dc.b 47, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 7	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 47, 31	; x3, y3
	dc.b 47, 7	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 14	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 47, 31	; x3, y3
	dc.b 47, 14	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 11	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 47, 31	; x3, y3
	dc.b 47, 11	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 23, 27	; X offset, Y offset