; Battle spriteset form

; # Force members
	dc.b 13
; # Enemies
	dc.b 11
; # AI Regions
	dc.b 4
; # AI Points
	dc.b 1
	
	allyCombatant 0, 3, 18
	allyFillA
	allyCombatant 1, 3, 19
	allyFillA
	allyCombatant 2, 2, 19
	allyFillA
	allyCombatant 3, 3, 17
	allyFillA
	allyCombatant 4, 2, 17
	allyFillA
	allyCombatant 5, 2, 18
	allyFillA
	allyCombatant 6, 1, 18
	allyFillA
	allyCombatant 7, 1, 17
	allyFillA
	allyCombatant 8, 1, 19
	allyFillA
	allyCombatant 9, 1, 20
	allyFillA
	allyCombatant 10, 1, 16
	allyFillA
	allyCombatant 11, 2, 16
	allyFillA
	allyCombatant 12, 1, 15
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
	
	enemyCombatant HUNTER_GOBLIN, 11, 5
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $0, NONE, $1, $0, STARTING
	
	enemyCombatant WITCH, 10, 6
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $0, NONE, $1, $0, STARTING
	
	enemyCombatant GOBLIN, 17, 8
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $2, NONE, $3, $0, STARTING
	
	enemyCombatant GREEN_OOZE, 19, 9
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $2, NONE, $3, $0, STARTING
	
	enemyCombatant HUNTER_GOBLIN, 22, 18
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, NONE, $2, $0, STARTING
	
	enemyCombatant GOBLIN, 16, 14
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $1, $0, STARTING
	
	enemyCombatant GREEN_OOZE, 9, 21
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WITCH, 10, 21
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GOBLIN, 11, 22
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GOBLIN, 7, 10
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HUNTER_GOBLIN, 8, 12
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 8, 3	; x1, y1
	dc.b 0, 11	; x2, y2
	dc.b 7, 18	; x3, y3
	dc.b 15, 10	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 16, 11	; x1, y1
	dc.b 8, 19	; x2, y2
	dc.b 18, 29	; x3, y3
	dc.b 27, 16	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 11, 0	; x1, y1
	dc.b 2, 9	; x2, y2
	dc.b 10, 16	; x3, y3
	dc.b 18, 7	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 21, 6	; x1, y1
	dc.b 12, 15	; x2, y2
	dc.b 22, 25	; x3, y3
	dc.b 27, 16	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 11, 5	; X offset, Y offset