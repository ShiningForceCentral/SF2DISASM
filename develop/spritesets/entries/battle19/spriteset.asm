; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 15
; # AI Regions
	dc.b 3
; # AI Points
	dc.b 1
	
	allyCombatant 0, 40, 12
	allyFillA
	allyCombatant 1, 40, 13
	allyFillA
	allyCombatant 2, 40, 11
	allyFillA
	allyCombatant 3, 41, 11
	allyFillA
	allyCombatant 4, 41, 12
	allyFillA
	allyCombatant 5, 41, 13
	allyFillA
	allyCombatant 6, 42, 13
	allyFillA
	allyCombatant 7, 42, 12
	allyFillA
	allyCombatant 8, 43, 13
	allyFillA
	allyCombatant 9, 43, 12
	allyFillA
	allyCombatant 10, 42, 11
	allyFillA
	allyCombatant 11, 40, 10
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
	
	enemyCombatant ORC, 14, 19
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HIGH_PRIEST, 15, 18
	enemyAIandItem HEALER3, SHINING_BALL|USABLE_BY_AI|UNUSED_ITEM_DROP
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant SOULSOWER, 16, 21
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GARGOYLE, 13, 18
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant HIGH_PRIEST, 16, 12
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|5, $1, NONE, $F, $0, STARTING
	
	enemyCombatant ORC, 17, 13
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_MADAM, 26, 14
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|7, $0, NONE, $F, $0, STARTING
	
	enemyCombatant SOULSOWER, 24, 16
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant GARGOYLE, 26, 21
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant ORC, 23, 27
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant ARROW_LAUNCHER, 30, 13
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|11, $F, NONE, $F, $0, STARTING
	
	enemyCombatant SOULSOWER, 32, 15
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant SOULSOWER, 38, 21
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ARROW_LAUNCHER, 40, 22
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|12, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GARGOYLE, 38, 3
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 35, 31	; x3, y3
	dc.b 35, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 28, 31	; x3, y3
	dc.b 28, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 23, 31	; x3, y3
	dc.b 23, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 14, 19	; X offset, Y offset