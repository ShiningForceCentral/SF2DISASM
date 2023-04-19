; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 15
; # AI Regions
	dc.b 4
; # AI Points
	dc.b 2
	
	allyCombatant 0, 14, 30
	allyFillA
	allyCombatant 1, 15, 30
	allyFillA
	allyCombatant 2, 13, 31
	allyFillA
	allyCombatant 3, 16, 31
	allyFillA
	allyCombatant 4, 13, 32
	allyFillA
	allyCombatant 5, 16, 32
	allyFillA
	allyCombatant 6, 14, 32
	allyFillA
	allyCombatant 7, 15, 32
	allyFillA
	allyCombatant 8, 14, 31
	allyFillA
	allyCombatant 9, 15, 31
	allyFillA
	allyCombatant 10, 14, 33
	allyFillA
	allyCombatant 11, 15, 33
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
	
	enemyCombatant DARK_KNIGHT, 14, 13
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ORC_LORD, 15, 13
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior MOVE_TO|1, $F, NONE, $F, $0, STARTING
	
	enemyCombatant MASTER_MONK, 14, 12
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WORM, 11, 14
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant WIZARD, 15, 14
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant WYVERN, 6, 16
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $2, NONE, $F, $0, STARTING
	
	enemyCombatant WYVERN, 25, 17
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $3, NONE, $F, $0, STARTING
	
	enemyCombatant ORC_LORD, 18, 19
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $3, NONE, $F, $0, STARTING
	
	enemyCombatant MASTER_MONK, 19, 19
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|7, $3, NONE, $F, $0, STARTING
	
	enemyCombatant WIZARD, 11, 21
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|11, $0, NONE, $F, $0, STARTING
	
	enemyCombatant MASTER_MONK, 11, 22
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|9, $0, NONE, $F, $0, STARTING
	
	enemyCombatant WORM, 10, 22
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant WORM, 19, 27
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WORM, 20, 27
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WYVERN, 6, 29
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 4, 37	; x2, y2
	dc.b 31, 13	; x3, y3
	dc.b 31, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 22	; x2, y2
	dc.b 14, 22	; x3, y3
	dc.b 31, 9	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 25	; x2, y2
	dc.b 28, 13	; x3, y3
	dc.b 28, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 14	; x2, y2
	dc.b 31, 36	; x3, y3
	dc.b 31, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 14, 13	; X offset, Y offset
	dc.b 15, 13