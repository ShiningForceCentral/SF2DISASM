; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 16
; # AI Regions
	dc.b 3
; # AI Points
	dc.b 1
	
	allyCombatant 0, 22, 9
	allyFillA
	allyCombatant 1, 23, 9
	allyFillA
	allyCombatant 2, 24, 8
	allyFillA
	allyCombatant 3, 23, 8
	allyFillA
	allyCombatant 4, 22, 8
	allyFillA
	allyCombatant 5, 21, 9
	allyFillA
	allyCombatant 6, 21, 8
	allyFillA
	allyCombatant 7, 23, 7
	allyFillA
	allyCombatant 8, 22, 7
	allyFillA
	allyCombatant 9, 20, 8
	allyFillA
	allyCombatant 10, 20, 9
	allyFillA
	allyCombatant 11, 24, 7
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
	
	enemyCombatant MASTER_MAGE, 9, 24
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BLACK_MONK, 10, 25
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEATH_ARCHER, 9, 23
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant EVIL_CLOUD, 16, 28
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant DEATH_ARCHER, 15, 29
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant ZOMBIE, 14, 29
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant HOBGOBLIN, 8, 22
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|7, $2, NONE, $2, $0, STARTING
	
	enemyCombatant DEATH_ARCHER, 6, 23
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant ZOMBIE, 5, 22
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|7, $2, NONE, $2, $0, STARTING
	
	enemyCombatant ZOMBIE, 26, 19
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant EVIL_CLOUD, 25, 20
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant HOBGOBLIN, 10, 9
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant DEATH_ARCHER, 8, 13
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant ZOMBIE, 11, 17
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant HOBGOBLIN, 15, 12
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ZOMBIE, 16, 14
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 26, 31	; x3, y3
	dc.b 12, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 12	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 31, 31	; x3, y3
	dc.b 31, 12	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 11	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 31, 31	; x3, y3
	dc.b 31, 23	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 9, 24	; X offset, Y offset