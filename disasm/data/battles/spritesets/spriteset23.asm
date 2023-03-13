; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 12
; # AI Regions
	dc.b 1
; # AI Points
	dc.b 1
	
	allyCombatant 0, 4, 5
	allyFillA
	allyCombatant 1, 4, 4
	allyFillA
	allyCombatant 2, 3, 5
	allyFillA
	allyCombatant 3, 3, 4
	allyFillA
	allyCombatant 4, 3, 6
	allyFillA
	allyCombatant 5, 3, 7
	allyFillA
	allyCombatant 6, 2, 6
	allyFillA
	allyCombatant 7, 4, 6
	allyFillA
	allyCombatant 8, 4, 3
	allyFillA
	allyCombatant 9, 2, 7
	allyFillA
	allyCombatant 10, 3, 8
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
	
	enemyCombatant WILLARD, 18, 7
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant RAT, 20, 6
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant RAT, 20, 8
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BUBBLING_OOZE, 17, 1
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant RAT, 16, 2
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant BUBBLING_OOZE, 15, 2
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant RAT, 21, 12
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant BUBBLING_OOZE, 22, 13
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant BUBBLING_OOZE, 20, 14
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant RAT, 10, 11
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BUBBLING_OOZE, 9, 10
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|9, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BUBBLING_OOZE, 5, 12
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 9, 0	; x1, y1
	dc.b 9, 15	; x2, y2
	dc.b 26, 15	; x3, y3
	dc.b 26, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 22, 3	; X offset, Y offset