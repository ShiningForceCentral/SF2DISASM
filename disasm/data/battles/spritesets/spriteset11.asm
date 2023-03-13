; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 10
; # AI Regions
	dc.b 4
; # AI Points
	dc.b 1
	
	allyCombatant 0, 15, 23
	allyFillA
	allyCombatant 1, 14, 23
	allyFillA
	allyCombatant 2, 14, 24
	allyFillA
	allyCombatant 3, 13, 23
	allyFillA
	allyCombatant 4, 16, 23
	allyFillA
	allyCombatant 5, 15, 24
	allyFillA
	allyCombatant 6, 13, 24
	allyFillA
	allyCombatant 7, 16, 24
	allyFillA
	allyCombatant 8, 12, 24
	allyFillA
	allyCombatant 9, 16, 22
	allyFillA
	allyCombatant 10, 12, 23
	allyFillA
	allyCombatant 11, 11, 23
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
	
	enemyCombatant HOBGOBLIN, 15, 4
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WITCH, 16, 5
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant VAMPIRE_BAT, 17, 3
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant VAMPIRE_BAT, 5, 7
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HUNTER_GOBLIN, 12, 14
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_DWARF, 13, 15
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_DWARF, 8, 16
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant WITCH, 18, 10
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant HUNTER_GOBLIN, 20, 9
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant VAMPIRE_BAT, 11, 4
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $3, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 21	; x2, y2
	dc.b 25, 21	; x3, y3
	dc.b 25, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 16	; x2, y2
	dc.b 26, 16	; x3, y3
	dc.b 26, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 13	; x2, y2
	dc.b 26, 13	; x3, y3
	dc.b 26, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 11	; x2, y2
	dc.b 17, 11	; x3, y3
	dc.b 26, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 15, 4	; X offset, Y offset