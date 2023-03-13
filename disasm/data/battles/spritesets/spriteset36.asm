; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 20
; # AI Regions
	dc.b 3
; # AI Points
	dc.b 1
	
	allyCombatant 0, 19, 5
	allyFillA
	allyCombatant 1, 19, 4
	allyFillA
	allyCombatant 2, 20, 3
	allyFillA
	allyCombatant 3, 18, 3
	allyFillA
	allyCombatant 4, 20, 4
	allyFillA
	allyCombatant 5, 17, 3
	allyFillA
	allyCombatant 6, 18, 4
	allyFillA
	allyCombatant 7, 19, 3
	allyFillA
	allyCombatant 8, 16, 3
	allyFillA
	allyCombatant 9, 21, 4
	allyFillA
	allyCombatant 10, 21, 5
	allyFillA
	allyCombatant 11, 17, 4
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
	
	enemyCombatant EXECUTIONER, 8, 27
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant PRISM_FLOWER, 11, 7
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PRISM_FLOWER, 6, 11
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PRISM_FLOWER, 12, 16
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PRISM_FLOWER, 13, 17
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PRISM_FLOWER, 14, 19
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PRISM_FLOWER, 15, 20
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PRISM_FLOWER, 18, 23
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PRISM_FLOWER, 7, 26
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CHAOS_WIZARD, 7, 27
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant SHAMAN, 9, 28
	enemyAIandItem HEALER5, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DRAGONEWT, 14, 10
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GRIFFIN, 14, 12
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BOW_RIDER, 16, 12
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PURPLE_WORM, 12, 15
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|15, $0, FOLLOW_DEVIL|15, $2, $0, STARTING
	
	enemyCombatant BOW_RIDER, 9, 14
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, FOLLOW_TARGET|0, $2, $0, STARTING
	
	enemyCombatant MIST_DEMON, 17, 20
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant BOW_RIDER, 18, 21
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|16, $1, NONE, $F, $0, STARTING
	
	enemyCombatant BOW_RIDER, 6, 21
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant MIST_DEMON, 8, 22
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 27, 21	; x3, y3
	dc.b 6, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 10	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 27, 31	; x3, y3
	dc.b 27, 10	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 22	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 27, 31	; x3, y3
	dc.b 27, 22	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 8, 27	; X offset, Y offset