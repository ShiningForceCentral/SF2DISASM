; Battle spriteset form

; # Force members
	dc.b 7
; # Enemies
	dc.b 10
; # AI Regions
	dc.b 4
; # AI Points
	dc.b 1
	
	allyCombatant 0, 13, 33
	allyFillA
	allyCombatant 1, 13, 34
	allyFillA
	allyCombatant 2, 13, 35
	allyFillA
	allyCombatant 3, 12, 34
	allyFillA
	allyCombatant 4, 14, 34
	allyFillA
	allyCombatant 5, 12, 35
	allyFillA
	allyCombatant 6, 14, 35
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
	
	enemyCombatant DARK_SMOKE, 10, 14
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior  NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SMOKE, 16, 16
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior  NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_MAGE, 22, 17
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior  FOLLOW_DEVIL|1, $2, FOLLOW_DEVIL|1, $3, $0, STARTING
	
	enemyCombatant DARK_CLERIC, 23, 18
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior  FOLLOW_DEVIL|1, $2, FOLLOW_DEVIL|1, $3, $0, STARTING
	
	enemyCombatant GALAM_ARCHER, 18, 22
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior  NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_KNIGHT, 9, 24
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior  NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_ARCHER, 7, 25
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior  FOLLOW_DEVIL|5, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_ARCHER, 19, 30
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior  FOLLOW_DEVIL|8, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_KNIGHT, 22, 31
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior  NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_KNIGHT, 7, 29
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior  NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 29	; x2, y2
	dc.b 26, 29	; x3, y3
	dc.b 26, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 25	; x2, y2
	dc.b 26, 25	; x3, y3
	dc.b 26, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 27	; x2, y2
	dc.b 26, 27	; x3, y3
	dc.b 26, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 17	; x1, y1
	dc.b 0, 29	; x2, y2
	dc.b 12, 29	; x3, y3
	dc.b 26, 17	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 13, 16	; X offset, Y offset