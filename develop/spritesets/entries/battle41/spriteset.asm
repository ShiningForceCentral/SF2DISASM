; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 20
; # AI Regions
	dc.b 5
; # AI Points
	dc.b 1
	
	allyCombatant 0, 16, 26
	allyFillA
	allyCombatant 1, 17, 26
	allyFillA
	allyCombatant 2, 15, 25
	allyFillA
	allyCombatant 3, 16, 24
	allyFillA
	allyCombatant 4, 17, 24
	allyFillA
	allyCombatant 5, 17, 25
	allyFillA
	allyCombatant 6, 15, 26
	allyFillA
	allyCombatant 7, 15, 24
	allyFillA
	allyCombatant 8, 14, 25
	allyFillA
	allyCombatant 9, 14, 26
	allyFillA
	allyCombatant 10, 16, 25
	allyFillA
	allyCombatant 11, 14, 24
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
	
	enemyCombatant REAPER, 16, 8
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BLUE_SHAMAN, 15, 5
	enemyAIandItem HEALER5, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEMON_MASTER, 17, 6
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HYDRA, 23, 6
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|4, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CHAOS_WARRIOR, 24, 5
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEMON, 18, 12
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CHAOS_WARRIOR, 18, 13
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEMON_MASTER, 20, 13
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|5, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HYDRA, 13, 12
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CHAOS_WARRIOR, 13, 13
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEMON_MASTER, 9, 12
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|11, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEMON, 7, 11
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CHAOS_WARRIOR, 15, 19
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|13, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HYDRA, 18, 18
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HYDRA, 18, 19
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HYDRA, 22, 18
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|16, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEMON, 23, 17
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEMON, 3, 18
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $4, $0, STARTING
	
	enemyCombatant CHAOS_DRAGON, 28, 9
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $3, $0, STARTING
	
	enemyCombatant CHAOS_DRAGON, 5, 3
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 22	; x2, y2
	dc.b 19, 22	; x3, y3
	dc.b 19, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 17	; x2, y2
	dc.b 18, 17	; x3, y3
	dc.b 18, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 12, 0	; x1, y1
	dc.b 12, 11	; x2, y2
	dc.b 31, 11	; x3, y3
	dc.b 31, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 26, 12	; x1, y1
	dc.b 26, 19	; x2, y2
	dc.b 31, 19	; x3, y3
	dc.b 31, 12	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 24	; x1, y1
	dc.b 0, 28	; x2, y2
	dc.b 5, 28	; x3, y3
	dc.b 5, 24	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 17, 7	; X offset, Y offset