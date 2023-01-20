; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 16
; # AI Regions
	dc.b 1
; # AI Points
	dc.b 1
	
	allyCombatant 0, 28, 28
	allyFillA
	allyCombatant 1, 28, 29
	allyFillA
	allyCombatant 2, 27, 29
	allyFillA
	allyCombatant 3, 28, 30
	allyFillA
	allyCombatant 4, 27, 30
	allyFillA
	allyCombatant 5, 26, 30
	allyFillA
	allyCombatant 6, 27, 28
	allyFillA
	allyCombatant 7, 26, 29
	allyFillA
	allyCombatant 8, 25, 30
	allyFillA
	allyCombatant 9, 29, 30
	allyFillA
	allyCombatant 10, 25, 29
	allyFillA
	allyCombatant 11, 26, 28
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
	
	enemyCombatant SHAMAN, 10, 11
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant DEVIL_SOLDIER, 9, 10
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant DEVIL_SOLDIER, 11, 10
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant MUD_MAN, 10, 17
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant MUD_MAN, 7, 19
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant CERBERUS, 5, 18
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|3, $0, NONE, $F, $0, STARTING
	
	enemyCombatant DEVIL_SOLDIER, 18, 26
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant NECROMANCER_0, 16, 31
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|8, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BOW_MASTER, 16, 32
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BOW_MASTER, 14, 14
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CERBERUS, 13, 15
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PEGASUS_KNIGHT, 14, 15
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PEGASUS_KNIGHT, 19, 14
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant NECROMANCER, 21, 16
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|14, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BOW_MASTER, 22, 16
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|12, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CERBERUS, 12, 22
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 38	; x2, y2
	dc.b 18, 38	; x3, y3
	dc.b 18, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 10, 11	; X offset, Y offset