; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 15
; # AI Regions
	dc.b 3
; # AI Points
	dc.b 1
	
	allyCombatant 0, 7, 25
	allyFillA
	allyCombatant 1, 6, 25
	allyFillA
	allyCombatant 2, 5, 25
	allyFillA
	allyCombatant 3, 4, 25
	allyFillA
	allyCombatant 4, 6, 26
	allyFillA
	allyCombatant 5, 5, 26
	allyFillA
	allyCombatant 6, 4, 26
	allyFillA
	allyCombatant 7, 6, 27
	allyFillA
	allyCombatant 8, 5, 27
	allyFillA
	allyCombatant 9, 4, 27
	allyFillA
	allyCombatant 10, 7, 26
	allyFillA
	allyCombatant 11, 7, 27
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
	
	enemyCombatant LIZARDMAN, 22, 7
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WIZARD, 21, 8
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_BISHOP, 24, 7
	enemyAIandItem HEALER3, BLACK_RING|EQUIPPED|USABLE_BY_AI|UNUSED_ITEM_DROP
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 17, 3
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $1, NONE, $1, $0, STARTING
	
	enemyCombatant DARK_SOLDIER, 22, 9
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SNIPER, 23, 11
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SNIPER, 15, 12
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|7, $2, NONE, $2, $0, STARTING
	
	enemyCombatant DARK_SOLDIER, 17, 13
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 4, 6
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SOLDIER, 24, 17
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|10, $0, NONE, $0, $0, STARTING
	
	enemyCombatant DARK_SOLDIER, 23, 18
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 24, 27
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 9, 19
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_BISHOP, 13, 20
	enemyAIandItem HEALER4, NOTHING
	enemyBehavior FOLLOW_DEVIL|14, $F, FOLLOW_DEVIL|12, $F, $0, STARTING
	
	enemyCombatant DARK_SNIPER, 14, 23
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 21, 0	; x1, y1
	dc.b 12, 31	; x2, y2
	dc.b 35, 31	; x3, y3
	dc.b 35, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 3		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 4, 0	; x1, y1
	dc.b 34, 31	; x2, y2
	dc.b 34, 0	; x3, y3
	dc.b 0, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 21	; x2, y2
	dc.b 35, 21	; x3, y3
	dc.b 35, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 23, 7	; X offset, Y offset