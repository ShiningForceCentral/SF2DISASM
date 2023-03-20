; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 17
; # AI Regions
	dc.b 6
; # AI Points
	dc.b 1
	
	allyCombatant 0, 28, 29
	allyFillA
	allyCombatant 1, 29, 29
	allyFillA
	allyCombatant 2, 29, 30
	allyFillA
	allyCombatant 3, 30, 29
	allyFillA
	allyCombatant 4, 30, 30
	allyFillA
	allyCombatant 5, 28, 30
	allyFillA
	allyCombatant 6, 27, 30
	allyFillA
	allyCombatant 7, 27, 29
	allyFillA
	allyCombatant 8, 27, 28
	allyFillA
	allyCombatant 9, 28, 28
	allyFillA
	allyCombatant 10, 29, 28
	allyFillA
	allyCombatant 11, 30, 28
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
	
	enemyCombatant CAMEELA, 11, 5
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $4, MOVE_TO|0, $5, $0, STARTING
	
	enemyCombatant NECROMANCER, 10, 4
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant SHAMAN, 12, 4
	enemyAIandItem HEALER5, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CERBERUS, 18, 17
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|4, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PEGASUS_KNIGHT, 17, 17
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BOW_MASTER, 17, 18
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|4, $F, NONE, $F, $0, STARTING
	
	enemyCombatant MUD_MAN, 16, 10
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|7, $0, FOLLOW_DEVIL|7, $3, $0, STARTING
	
	enemyCombatant DRAGONEWT, 14, 14
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, FOLLOW_TARGET|0, $3, $0, STARTING
	
	enemyCombatant MUD_MAN, 10, 16
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|7, $0, FOLLOW_DEVIL|7, $3, $0, STARTING
	
	enemyCombatant MUD_MAN, 17, 6
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, FOLLOW_TARGET|0, $3, $0, STARTING
	
	enemyCombatant CERBERUS, 17, 8
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|9, $1, FOLLOW_DEVIL|9, $3, $0, STARTING
	
	enemyCombatant PEGASUS_KNIGHT, 12, 14
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|10, $1, FOLLOW_DEVIL|10, $3, $0, STARTING
	
	enemyCombatant BOW_MASTER, 14, 12
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, FOLLOW_TARGET|0, $3, $0, STARTING
	
	enemyCombatant DRAGONEWT, 6, 17
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|12, $1, FOLLOW_DEVIL|12, $3, $0, STARTING
	
	enemyCombatant PEGASUS_KNIGHT, 4, 17
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|13, $1, FOLLOW_DEVIL|13, $3, $0, STARTING
	
	enemyCombatant DRAGONEWT, 17, 4
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DRAGONEWT, 8, 17
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $2, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 31, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 15, 31	; x3, y3
	dc.b 31, 15	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 31, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 7, 31	; x3, y3
	dc.b 31, 7	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 9, 31	; x3, y3
	dc.b 25, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 3		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 31, 0	; x3, y3
	dc.b 0, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 19	; x2, y2
	dc.b 8, 19	; x3, y3
	dc.b 8, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 8, 0	; x1, y1
	dc.b 8, 19	; x2, y2
	dc.b 22, 5	; x3, y3
	dc.b 22, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 7, 7	; X offset, Y offset