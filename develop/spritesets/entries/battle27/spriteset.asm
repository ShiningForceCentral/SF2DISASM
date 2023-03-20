; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 16
; # AI Regions
	dc.b 4
; # AI Points
	dc.b 1
	
	allyCombatant 0, 14, 44
	allyFillA
	allyCombatant 1, 15, 44
	allyFillA
	allyCombatant 2, 14, 45
	allyFillA
	allyCombatant 3, 15, 45
	allyFillA
	allyCombatant 4, 14, 46
	allyFillA
	allyCombatant 5, 15, 46
	allyFillA
	allyCombatant 6, 16, 46
	allyFillA
	allyCombatant 7, 17, 46
	allyFillA
	allyCombatant 8, 16, 45
	allyFillA
	allyCombatant 9, 17, 45
	allyFillA
	allyCombatant 10, 16, 44
	allyFillA
	allyCombatant 11, 17, 44
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
	
	enemyCombatant LIZARDMAN, 15, 19
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $3, NONE, $3, $0, STARTING
	
	enemyCombatant WYVERN, 17, 17
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $3, NONE, $3, $0, STARTING
	
	enemyCombatant DARK_BISHOP, 13, 19
	enemyAIandItem HEALER5, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $3, NONE, $3, $0, STARTING
	
	enemyCombatant DARK_SOLDIER, 19, 33
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|9, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SOLDIER, 8, 34
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SOLDIER, 17, 38
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WYVERN, 24, 25
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SNIPER, 24, 28
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|8, $2, NONE, $2, $0, STARTING
	
	enemyCombatant LIZARDMAN, 25, 29
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SNIPER, 18, 36
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|5, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WIZARD, 7, 33
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|4, $0, NONE, $0, $0, STARTING
	
	enemyCombatant DARK_SNIPER, 9, 32
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|4, $0, NONE, $0, $0, STARTING
	
	enemyCombatant DARK_BISHOP, 7, 25
	enemyAIandItem HEALER4, NOTHING
	enemyBehavior FOLLOW_DEVIL|10, $0, FOLLOW_DEVIL|0, $F, $0, STARTING
	
	enemyCombatant DARK_BISHOP, 16, 27
	enemyAIandItem HEALER4, NOTHING
	enemyBehavior FOLLOW_DEVIL|14, $1, FOLLOW_DEVIL|0, $F, $0, STARTING
	
	enemyCombatant LIZARDMAN, 15, 28
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SNIPER, 16, 21
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $2, NONE, $2, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 3, 0	; x1, y1
	dc.b 3, 47	; x2, y2
	dc.b 31, 22	; x3, y3
	dc.b 31, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 37	; x2, y2
	dc.b 31, 37	; x3, y3
	dc.b 31, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 18	; x2, y2
	dc.b 28, 47	; x3, y3
	dc.b 28, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 29	; x2, y2
	dc.b 31, 29	; x3, y3
	dc.b 31, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 15, 23	; X offset, Y offset