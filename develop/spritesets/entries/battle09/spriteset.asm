; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 11
; # AI Regions
	dc.b 2
; # AI Points
	dc.b 0
	
	allyCombatant 0, 6, 2
	allyFillA
	allyCombatant 1, 6, 1
	allyFillA
	allyCombatant 2, 5, 1
	allyFillA
	allyCombatant 3, 5, 2
	allyFillA
	allyCombatant 4, 4, 2
	allyFillA
	allyCombatant 5, 4, 1
	allyFillA
	allyCombatant 6, 5, 3
	allyFillA
	allyCombatant 7, 7, 1
	allyFillA
	allyCombatant 8, 4, 3
	allyFillA
	allyCombatant 9, 3, 2
	allyFillA
	allyCombatant 10, 2, 3
	allyFillA
	allyCombatant 11, 3, 3
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
	
	enemyCombatant VAMPIRE_BAT, 30, 13
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant WITCH, 29, 15
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $1, NONE, $1, $0, STARTING
	
	enemyCombatant GOBLIN, 27, 10
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant WITCH, 21, 19
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant GREEN_OOZE, 19, 21
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant VAMPIRE_BAT, 19, 11
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant GOBLIN, 14, 15
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant HUNTER_GOBLIN, 13, 16
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant HUNTER_GOBLIN, 15, 7
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GOBLIN, 13, 10
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GREEN_OOZE, 9, 11
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 20	; x1, y1
	dc.b 14, 31	; x2, y2
	dc.b 38, 0	; x3, y3
	dc.b 18, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 26	; x1, y1
	dc.b 41, 26	; x2, y2
	dc.b 41, 0	; x3, y3
	dc.b 26, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point