; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 18
; # AI Regions
	dc.b 3
; # AI Points
	dc.b 1
	
	allyCombatant 0, 39, 6
	allyFillA
	allyCombatant 1, 40, 6
	allyFillA
	allyCombatant 2, 39, 5
	allyFillA
	allyCombatant 3, 40, 5
	allyFillA
	allyCombatant 4, 41, 6
	allyFillA
	allyCombatant 5, 39, 4
	allyFillA
	allyCombatant 6, 41, 5
	allyFillA
	allyCombatant 7, 40, 4
	allyFillA
	allyCombatant 8, 41, 4
	allyFillA
	allyCombatant 9, 42, 6
	allyFillA
	allyCombatant 10, 42, 4
	allyFillA
	allyCombatant 11, 42, 5
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
	
	enemyCombatant RED_BARON, 19, 28
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant EVIL_BISHOP, 17, 28
	enemyAIandItem HEALER5, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CHAOS_WIZARD, 18, 27
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant MINOTAUR, 20, 24
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BOW_RIDER, 20, 25
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|3, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HELL_HOUND, 23, 27
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CHAOS_WIZARD, 24, 18
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $2, NONE, $F, $0, STARTING
	
	enemyCombatant EVIL_BISHOP, 25, 20
	enemyAIandItem HEALER4, NOTHING
	enemyBehavior FOLLOW_DEVIL|6, $2, FOLLOW_DEVIL|0, $F, $0, STARTING
	
	enemyCombatant HELL_HOUND, 26, 20
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|6, $2, NONE, $F, $0, STARTING
	
	enemyCombatant MIST_DEMON, 36, 29
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant HELL_HOUND, 38, 23
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|11, $1, NONE, $F, $0, STARTING
	
	enemyCombatant MINOTAUR, 39, 22
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant MIST_DEMON, 23, 2
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant EXECUTIONER, 31, 9
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BOW_RIDER, 32, 10
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|13, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BOW_RIDER, 31, 13
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HELL_HOUND, 32, 15
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|15, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BOW_RIDER, 33, 15
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|16, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 15	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 30, 31	; x3, y3
	dc.b 30, 15	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 12	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 47, 31	; x3, y3
	dc.b 47, 12	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 47, 31	; x3, y3
	dc.b 18, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 19, 28	; X offset, Y offset