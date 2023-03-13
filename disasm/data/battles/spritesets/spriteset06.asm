; Battle spriteset form

; # Force members
	dc.b 6
; # Enemies
	dc.b 9
; # AI Regions
	dc.b 1
; # AI Points
	dc.b 0
	
	allyCombatant 0, 11, 6
	allyFillA
	allyCombatant 1, 10, 6
	allyFillA
	allyCombatant 2, 9, 6
	allyFillA
	allyCombatant 3, 11, 7
	allyFillA
	allyCombatant 4, 10, 7
	allyFillA
	allyCombatant 5, 9, 7
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
	
	enemyCombatant DARK_CLERIC, 7, 29
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior  FOLLOW_DEVIL|1, $0, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_MAGE, 6, 28
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior  NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_SOLDIER, 15, 12
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior  NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_KNIGHT, 7, 13
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior  NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_ARCHER, 16, 13
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior  NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_KNIGHT, 8, 18
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior  NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_MAGE, 10, 20
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior  NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_SOLDIER, 6, 25
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior  NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_SOLDIER, 8, 29
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior  NONE, $0, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 15	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 19, 31	; x3, y3
	dc.b 19, 15	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point