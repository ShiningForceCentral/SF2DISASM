; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 16
; # AI Regions
	dc.b 3
; # AI Points
	dc.b 1
	
	allyCombatant 0, 5, 6
	allyFillA
	allyCombatant 1, 4, 8
	allyFillA
	allyCombatant 2, 4, 7
	allyFillA
	allyCombatant 3, 3, 7
	allyFillA
	allyCombatant 4, 3, 8
	allyFillA
	allyCombatant 5, 4, 6
	allyFillA
	allyCombatant 6, 5, 7
	allyFillA
	allyCombatant 7, 2, 7
	allyFillA
	allyCombatant 8, 5, 8
	allyFillA
	allyCombatant 9, 2, 8
	allyFillA
	allyCombatant 10, 6, 7
	allyFillA
	allyCombatant 11, 6, 6
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
	
	enemyCombatant WIZARD, 11, 24
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant MASTER_MONK, 12, 26
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SOLDIER, 13, 23
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 14, 1
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant LIZARDMAN, 11, 7
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SNIPER, 12, 7
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 2, 16
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WYVERN, 5, 18
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WYVERN, 6, 17
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant WORM, 13, 13
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WORM, 12, 17
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WORM, 11, 22
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WORM, 11, 25
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 17, 12
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant WYVERN, 19, 20
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 6, 26
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 19	; x1, y1
	dc.b 0, 37	; x2, y2
	dc.b 25, 37	; x3, y3
	dc.b 25, 2	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 25	; x1, y1
	dc.b 0, 37	; x2, y2
	dc.b 25, 37	; x3, y3
	dc.b 25, 11	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 14	; x1, y1
	dc.b 0, 37	; x2, y2
	dc.b 25, 37	; x3, y3
	dc.b 25, 14	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 12, 24	; X offset, Y offset