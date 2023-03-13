; Battle spriteset form

; # Force members
	dc.b 4
; # Enemies
	dc.b 6
; # AI Regions
	dc.b 0
; # AI Points
	dc.b 1
	
	allyCombatant 0, 13, 12
	allyFillB
	allyCombatant 1, 12, 12
	allyFillB
	allyCombatant 2, 13, 13
	allyFillB
	allyCombatant 3, 12, 13
	allyFillB
	
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
	
	enemyCombatant HUGE_RAT, 3, 5
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant OOZE, 5, 6
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant OOZE, 4, 10
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HUGE_RAT, 5, 14
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant OOZE, 7, 16
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|3, $F, NONE, $F, $0, STARTING
	
	enemyCombatant OOZE, 13, 6
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	
	; AI point
	dc.b 3, 5	; X offset, Y offset