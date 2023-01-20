; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 12
; # AI Regions
	dc.b 3
; # AI Points
	dc.b 1
	
	allyCombatant 0, 2, 9
	allyFillA
	allyCombatant 1, 3, 8
	allyFillA
	allyCombatant 2, 1, 8
	allyFillA
	allyCombatant 3, 2, 8
	allyFillA
	allyCombatant 4, 3, 7
	allyFillA
	allyCombatant 5, 2, 7
	allyFillA
	allyCombatant 6, 1, 7
	allyFillA
	allyCombatant 7, 1, 9
	allyFillA
	allyCombatant 8, 4, 7
	allyFillA
	allyCombatant 9, 3, 6
	allyFillA
	allyCombatant 10, 2, 6
	allyFillA
	allyCombatant 11, 1, 6
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
	
	enemyCombatant DARK_DWARF, 27, 25
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior MOVE_TO|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant WITCH, 28, 24
	enemyAIandItem ATTACKER3, POWER_RING|EQUIPPED|UNUSED_ITEM_DROP
	enemyBehavior MOVE_TO|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant VAMPIRE_BAT, 23, 19
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior MOVE_TO|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant GOBLIN, 20, 28
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant HUNTER_GOBLIN, 22, 29
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant VAMPIRE_BAT, 5, 29
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant WITCH, 16, 16
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant VAMPIRE_BAT, 15, 7
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $2, NONE, $F, $0, STARTING
	
	enemyCombatant GOBLIN, 10, 10
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HUNTER_GOBLIN, 8, 14
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GOBLIN, 7, 15
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|9, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_DWARF, 18, 15
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|6, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 20, 0	; x1, y1
	dc.b 6, 31	; x2, y2
	dc.b 30, 31	; x3, y3
	dc.b 30, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 24, 0	; x1, y1
	dc.b 11, 31	; x2, y2
	dc.b 30, 31	; x3, y3
	dc.b 30, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 16, 0	; x1, y1
	dc.b 2, 31	; x2, y2
	dc.b 30, 31	; x3, y3
	dc.b 30, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 17, 25	; X offset, Y offset