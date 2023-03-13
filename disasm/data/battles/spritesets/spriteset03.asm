; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 6
; # AI Regions
	dc.b 1
; # AI Points
	dc.b 0
	
	allyCombatant 0, 17, 20
	allyFillA
	allyCombatant 1, 18, 20
	allyFillA
	allyCombatant 2, 17, 21
	allyFillA
	allyCombatant 3, 18, 21
	allyFillA
	allyCombatant 4, 16, 22
	allyFillA
	allyCombatant 5, 16, 23
	allyFillA
	allyCombatant 6, 16, 21
	allyFillA
	allyCombatant 7, 17, 19
	allyFillA
	allyCombatant 8, 15, 21
	allyFillA
	allyCombatant 9, 15, 22
	allyFillA
	allyCombatant 10, 15, 23
	allyFillA
	allyCombatant 11, 16, 24
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
	
	enemyCombatant HUGE_RAT, 6, 7
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant OOZE, 5, 8
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant HUGE_BAT, 8, 26
	enemyAIandItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI|UNUSED_ITEM_DROP
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HUGE_RAT, 13, 12
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant OOZE, 9, 14
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant OOZE, 14, 16
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 15	; x2, y2
	dc.b 19, 15	; x3, y3
	dc.b 19, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point