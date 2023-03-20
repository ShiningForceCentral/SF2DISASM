; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 12
; # AI Regions
	dc.b 4
; # AI Points
	dc.b 1
	
	allyCombatant 0, 5, 21
	allyFillA
	allyCombatant 1, 4, 21
	allyFillA
	allyCombatant 2, 3, 21
	allyFillA
	allyCombatant 3, 4, 22
	allyFillA
	allyCombatant 4, 3, 22
	allyFillA
	allyCombatant 5, 2, 22
	allyFillA
	allyCombatant 6, 4, 23
	allyFillA
	allyCombatant 7, 3, 23
	allyFillA
	allyCombatant 8, 2, 21
	allyFillA
	allyCombatant 9, 2, 23
	allyFillA
	allyCombatant 10, 1, 22
	allyFillA
	allyCombatant 11, 1, 23
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
	
	enemyCombatant DEATH_ARCHER, 22, 8
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant EVIL_CLOUD, 15, 3
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $3, $0, STARTING
	
	enemyCombatant DEATH_MONK, 24, 9
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WITCH, 25, 15
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $0, NONE, $1, $0, STARTING
	
	enemyCombatant DEATH_MONK, 18, 14
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant HOBGOBLIN, 20, 12
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant WITCH, 18, 19
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HOBGOBLIN, 19, 18
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEATH_MONK, 23, 21
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant HOBGOBLIN, 24, 17
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $0, NONE, $1, $0, STARTING
	
	enemyCombatant HOBGOBLIN, 11, 19
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HOBGOBLIN, 8, 18
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 16, 22	; x1, y1
	dc.b 14, 27	; x2, y2
	dc.b 31, 27	; x3, y3
	dc.b 31, 17	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 7, 5	; x1, y1
	dc.b 7, 11	; x2, y2
	dc.b 21, 19	; x3, y3
	dc.b 21, 5	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 7, 0	; x1, y1
	dc.b 7, 19	; x2, y2
	dc.b 21, 19	; x3, y3
	dc.b 21, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 14, 0	; x1, y1
	dc.b 14, 16	; x2, y2
	dc.b 31, 16	; x3, y3
	dc.b 31, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 22, 8	; X offset, Y offset