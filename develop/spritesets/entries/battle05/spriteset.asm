; Battle spriteset form

; # Force members
	dc.b 6
; # Enemies
	dc.b 8
; # AI Regions
	dc.b 1
; # AI Points
	dc.b 1
	
	allyCombatant 0, 3, 5
	allyFillA
	allyCombatant 1, 4, 5
	allyFillA
	allyCombatant 2, 2, 5
	allyFillA
	allyCombatant 3, 4, 4
	allyFillA
	allyCombatant 4, 3, 4
	allyFillA
	allyCombatant 5, 2, 4
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
	
	enemyCombatant GALAM_KNIGHT, 17, 4
	enemyAIandItem LEADER, NOTHING
	enemyBehavior  MOVE_TO|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_ARCHER, 14, 5
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior  FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_MAGE, 15, 7
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior  FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_SOLDIER, 11, 4
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior  NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_ARCHER, 10, 7
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior  NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_SOLDIER, 9, 9
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior  NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_SOLDIER, 19, 2
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior  FOLLOW_DEVIL|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_MAGE, 17, 1
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior  FOLLOW_DEVIL|0, $0, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 12, 0	; x1, y1
	dc.b 12, 13	; x2, y2
	dc.b 23, 13	; x3, y3
	dc.b 23, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 17, 4	; X offset, Y offset