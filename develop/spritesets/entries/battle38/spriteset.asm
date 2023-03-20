; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 20
; # AI Regions
	dc.b 3
; # AI Points
	dc.b 1
	
	allyCombatant 0, 13, 11
	allyFillA
	allyCombatant 1, 14, 11
	allyFillA
	allyCombatant 2, 14, 10
	allyFillA
	allyCombatant 3, 13, 10
	allyFillA
	allyCombatant 4, 14, 9
	allyFillA
	allyCombatant 5, 13, 9
	allyFillA
	allyCombatant 6, 12, 9
	allyFillA
	allyCombatant 7, 11, 9
	allyFillA
	allyCombatant 8, 12, 11
	allyFillA
	allyCombatant 9, 11, 10
	allyFillA
	allyCombatant 10, 12, 10
	allyFillA
	allyCombatant 11, 11, 11
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
	
	enemyCombatant GESHP, 7, 27
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_GUNNER, 7, 26
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WHITE_DRAGON, 8, 26
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CYCLOPS, 8, 27
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant MIST_DEMON, 12, 19
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|5, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CHAOS_WIZARD, 13, 20
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant EVIL_BISHOP, 15, 20
	enemyAIandItem HEALER4, FAIRY_TEAR|USABLE_BY_AI
	enemyBehavior FOLLOW_DEVIL|5, $F, FOLLOW_DEVIL|0, $F, $0, STARTING
	
	enemyCombatant HELL_HOUND, 19, 14
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant MINOTAUR, 19, 15
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_GUNNER, 20, 15
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WHITE_DRAGON, 6, 17
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BURST_ROCK, 14, 15
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, HIDDEN
	
	enemyCombatant BURST_ROCK, 10, 12
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, HIDDEN
	
	enemyCombatant BURST_ROCK, 11, 14
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, HIDDEN
	
	enemyCombatant BURST_ROCK, 12, 16
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, NONE, $F, $0, HIDDEN
	
	enemyCombatant BURST_ROCK, 15, 18
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, NONE, $F, $0, HIDDEN
	
	enemyCombatant BURST_ROCK, 12, 20
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, NONE, $F, $0, HIDDEN
	
	enemyCombatant BURST_ROCK, 12, 22
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $2, NONE, $F, $0, HIDDEN
	
	enemyCombatant BURST_ROCK, 9, 24
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $2, NONE, $F, $0, HIDDEN
	
	enemyCombatant BURST_ROCK, 10, 26
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $2, NONE, $F, $0, HIDDEN
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 13	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 31, 31	; x3, y3
	dc.b 31, 13	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 19	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 31, 31	; x3, y3
	dc.b 31, 19	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 24	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 31, 31	; x3, y3
	dc.b 31, 24	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 7, 27	; X offset, Y offset