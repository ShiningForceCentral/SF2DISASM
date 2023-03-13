; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 12
; # AI Regions
	dc.b 2
; # AI Points
	dc.b 2
	
	allyCombatant 0, 15, 27
	allyFillA
	allyCombatant 1, 15, 28
	allyFillA
	allyCombatant 2, 14, 29
	allyFillA
	allyCombatant 3, 16, 29
	allyFillA
	allyCombatant 4, 13, 30
	allyFillA
	allyCombatant 5, 17, 30
	allyFillA
	allyCombatant 6, 13, 29
	allyFillA
	allyCombatant 7, 17, 29
	allyFillA
	allyCombatant 8, 14, 28
	allyFillA
	allyCombatant 9, 16, 28
	allyFillA
	allyCombatant 10, 12, 30
	allyFillA
	allyCombatant 11, 18, 30
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
	
	enemyCombatant ZEON, 18, 5
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SMOKE, 12, 17
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior MOVE_TO|1, $F, NONE, $F, $0, STARTING
	
	enemyCombatant KING, 22, 19
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WILLARD, 10, 18
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|2, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ZALBARD, 15, 14
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CAMEELA, 19, 15
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|7, $1, NONE, $F, $0, STARTING
	
	enemyCombatant RED_BARON, 20, 6
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GESHP, 21, 11
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant ODD_EYE, 12, 11
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|9, $0, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM, 15, 7
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant PRISM_FLOWER, 5, 20
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PRISM_FLOWER, 27, 13
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 4	; x1, y1
	dc.b 0, 22	; x2, y2
	dc.b 13, 22	; x3, y3
	dc.b 30, 4	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4
	dc.b 0
	dc.b 0, 4
	dc.b 19, 24
	dc.b 30, 24
	dc.b 30, 4
	dc.b 0
	dc.b 0
	
	; AI point
	dc.b 18, 5	; X offset, Y offset
	dc.b 15, 22