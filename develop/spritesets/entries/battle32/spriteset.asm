; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 16
; # AI Regions
	dc.b 2
; # AI Points
	dc.b 1
	
	allyCombatant 0, 15, 44
	allyFillA
	allyCombatant 1, 14, 45
	allyFillA
	allyCombatant 2, 15, 45
	allyFillA
	allyCombatant 3, 16, 45
	allyFillA
	allyCombatant 4, 14, 46
	allyFillA
	allyCombatant 5, 15, 46
	allyFillA
	allyCombatant 6, 16, 46
	allyFillA
	allyCombatant 7, 17, 46
	allyFillA
	allyCombatant 8, 17, 45
	allyFillA
	allyCombatant 9, 13, 45
	allyFillA
	allyCombatant 10, 14, 44
	allyFillA
	allyCombatant 11, 16, 44
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
	
	enemyCombatant BOW_MASTER, 14, 21
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant NECROMANCER, 12, 21
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant MASTER_MONK, 13, 20
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PEGASUS_KNIGHT, 16, 22
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEVIL_SOLDIER, 17, 33
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CERBERUS, 19, 33
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|4, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PEGASUS_KNIGHT, 20, 34
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEVIL_SOLDIER, 9, 39
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CERBERUS, 10, 39
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|7, $F, NONE, $F, $0, STARTING
	
	enemyCombatant MASTER_MONK, 6, 33
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|9, $0, FOLLOW_DEVIL|9, $1, $0, STARTING
	
	enemyCombatant PEGASUS_KNIGHT, 23, 26
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant PEGASUS_KNIGHT, 24, 26
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant DEVIL_SOLDIER, 14, 24
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant CERBERUS, 16, 24
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|12, $0, NONE, $0, $0, STARTING
	
	enemyCombatant NECROMANCER, 18, 23
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|12, $0, NONE, $0, $0, STARTING
	
	enemyCombatant JAR, 8, 31
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $1, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 34	; x2, y2
	dc.b 31, 34	; x3, y3
	dc.b 31, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 1, 0	; x1, y1
	dc.b 1, 47	; x2, y2
	dc.b 31, 17	; x3, y3
	dc.b 31, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 14, 21	; X offset, Y offset