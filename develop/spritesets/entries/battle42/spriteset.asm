; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 19
; # AI Regions
	dc.b 4
; # AI Points
	dc.b 1
	
	allyCombatant 0, 13, 32
	allyFillA
	allyCombatant 1, 14, 33
	allyFillA
	allyCombatant 2, 13, 33
	allyFillA
	allyCombatant 3, 12, 33
	allyFillA
	allyCombatant 4, 11, 33
	allyFillA
	allyCombatant 5, 14, 32
	allyFillA
	allyCombatant 6, 12, 32
	allyFillA
	allyCombatant 7, 11, 32
	allyFillA
	allyCombatant 8, 14, 34
	allyFillA
	allyCombatant 9, 13, 34
	allyFillA
	allyCombatant 10, 12, 34
	allyFillA
	allyCombatant 11, 11, 34
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
	
	enemyCombatant GALAM, 13, 18
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $0, NONE, $1, $0, STARTING
	
	enemyCombatant BLUE_SHAMAN, 12, 17
	enemyAIandItem HEALER5, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $0, NONE, $1, $0, STARTING
	
	enemyCombatant DEMON_MASTER, 14, 17
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $0, NONE, $1, $0, STARTING
	
	enemyCombatant DEVIL_GRIFFIN, 9, 13
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEVIL_GRIFFIN, 17, 17
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $3, NONE, $F, $0, HIDDEN
	
	enemyCombatant REAPER, 16, 18
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior NONE, $3, NONE, $F, $0, HIDDEN
	
	enemyCombatant EVIL_BEAST, 9, 17
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, HIDDEN
	
	enemyCombatant HORSEMAN, 8, 18
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, HIDDEN
	
	enemyCombatant REAPER, 10, 20
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant EVIL_BEAST, 12, 21
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEMON_MASTER, 3, 19
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|12, $0, NONE, $F, $0, STARTING
	
	enemyCombatant EVIL_BEAST, 6, 20
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|12, $0, NONE, $F, $0, STARTING
	
	enemyCombatant CHAOS_WARRIOR, 4, 21
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant HORSEMAN, 19, 19
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|15, $1, NONE, $F, $0, STARTING
	
	enemyCombatant REAPER, 18, 20
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|15, $1, NONE, $F, $0, STARTING
	
	enemyCombatant CHAOS_DRAGON, 21, 21
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant REAPER, 11, 26
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CHAOS_WARRIOR, 13, 26
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HORSEMAN, 12, 27
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 25, 22	; x3, y3
	dc.b 25, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 21	; x2, y2
	dc.b 25, 32	; x3, y3
	dc.b 25, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 7, 15	; x1, y1
	dc.b 7, 18	; x2, y2
	dc.b 11, 20	; x3, y3
	dc.b 18, 15	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 11, 15	; x1, y1
	dc.b 11, 20	; x2, y2
	dc.b 18, 18	; x3, y3
	dc.b 18, 15	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 13, 18	; X offset, Y offset