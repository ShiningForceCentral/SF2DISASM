; Battle spriteset form

; # Force members
	dc.b 5
; # Enemies
	dc.b 8
; # AI Regions
	dc.b 3
; # AI Points
	dc.b 1
	
	allyCombatant 0, 6, 6
	allyFillA
	allyCombatant 1, 6, 7
	allyFillA
	allyCombatant 2, 5, 6
	allyFillA
	allyCombatant 3, 5, 7
	allyFillA
	allyCombatant 4, 4, 7
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
	
	enemyCombatant GALAM_ARCHER, 17, 21
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $2, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_SOLDIER, 8, 12
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HUGE_BAT, 7, 14
	enemyAIandItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI|UNUSED_ITEM_DROP
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HUGE_BAT, 8, 23
	enemyAIandItem ATTACKER3, MEDICAL_HERB|USABLE_BY_AI|UNUSED_ITEM_DROP
	enemyBehavior FOLLOW_TARGET|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant GALAM_SOLDIER, 14, 10
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $2, $0, STARTING
	
	enemyCombatant GALAM_ARCHER, 13, 12
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $2, $0, STARTING
	
	enemyCombatant GALAM_SOLDIER, 11, 18
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant HUGE_BAT, 15, 20
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $0, NONE, $1, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 7, 0	; x1, y1
	dc.b 7, 29	; x2, y2
	dc.b 19, 29	; x3, y3
	dc.b 19, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4
	dc.b 0
	dc.b 0, 13
	dc.b 0, 29
	dc.b 21, 29
	dc.b 21, 13
	dc.b 0
	dc.b 0
	
	dc.b 4
	dc.b 0
	dc.b 0, 20
	dc.b 0, 29
	dc.b 20, 29
	dc.b 20, 0
	dc.b 0
	dc.b 0
	
	; AI point
	dc.b 17, 21	; X offset, Y offset