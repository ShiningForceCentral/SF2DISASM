; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 20
; # AI Regions
	dc.b 4
; # AI Points
	dc.b 1
	
	allyCombatant 0, 15, 35
	allyFillA
	allyCombatant 1, 16, 35
	allyFillA
	allyCombatant 2, 15, 36
	allyFillA
	allyCombatant 3, 16, 36
	allyFillA
	allyCombatant 4, 15, 37
	allyFillA
	allyCombatant 5, 16, 37
	allyFillA
	allyCombatant 6, 15, 38
	allyFillA
	allyCombatant 7, 16, 38
	allyFillA
	allyCombatant 8, 14, 36
	allyFillA
	allyCombatant 9, 17, 36
	allyFillA
	allyCombatant 10, 14, 37
	allyFillA
	allyCombatant 11, 17, 37
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
	
	enemyCombatant ODD_EYE, 16, 5
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $2, NONE, $F, $0, STARTING
	
	enemyCombatant DEMON_MASTER, 15, 5
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $2, NONE, $F, $0, STARTING
	
	enemyCombatant EVIL_BISHOP, 16, 3
	enemyAIandItem HEALER5, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $2, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_GUNNER, 15, 8
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|5, $1, NONE, $1, $0, STARTING
	
	enemyCombatant HYDRA, 13, 9
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|5, $1, NONE, $1, $0, STARTING
	
	enemyCombatant CHAOS_WARRIOR, 16, 9
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant DEMON, 18, 3
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant WHITE_DRAGON, 12, 4
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant DEMON, 5, 27
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_GUNNER, 8, 14
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|10, $3, NONE, $3, $0, STARTING
	
	enemyCombatant CHAOS_WIZARD, 10, 12
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|11, $3, NONE, $3, $0, STARTING
	
	enemyCombatant CHAOS_WARRIOR, 12, 13
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $3, NONE, $F, $0, STARTING
	
	enemyCombatant CYCLOPS, 12, 22
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant CHAOS_WIZARD, 9, 22
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|15, $0, NONE, $0, $0, STARTING
	
	enemyCombatant EVIL_BISHOP, 5, 23
	enemyAIandItem HEALER3, FAIRY_TEAR|USABLE_BY_AI|UNUSED_ITEM_DROP
	enemyBehavior FOLLOW_DEVIL|15, $0, NONE, $0, $0, STARTING
	
	enemyCombatant CYCLOPS, 24, 17
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant CHAOS_WARRIOR, 18, 21
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant CYCLOPS, 22, 22
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant HYDRA, 15, 17
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WHITE_DRAGON, 21, 28
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 24	; x1, y1
	dc.b 0, 32	; x2, y2
	dc.b 31, 32	; x3, y3
	dc.b 31, 24	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 23	; x2, y2
	dc.b 31, 23	; x3, y3
	dc.b 31, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 16	; x2, y2
	dc.b 31, 16	; x3, y3
	dc.b 31, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 22	; x2, y2
	dc.b 17, 22	; x3, y3
	dc.b 27, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 16, 5	; X offset, Y offset