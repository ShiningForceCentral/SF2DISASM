; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 12
; # AI Regions
	dc.b 4
; # AI Points
	dc.b 0
	
	allyCombatant 0, 27, 23
	allyFillA
	allyCombatant 1, 27, 24
	allyFillA
	allyCombatant 2, 27, 25
	allyFillA
	allyCombatant 3, 28, 26
	allyFillA
	allyCombatant 4, 28, 25
	allyFillA
	allyCombatant 5, 28, 22
	allyFillA
	allyCombatant 6, 28, 23
	allyFillA
	allyCombatant 7, 28, 24
	allyFillA
	allyCombatant 8, 29, 24
	allyFillA
	allyCombatant 9, 29, 23
	allyFillA
	allyCombatant 10, 30, 23
	allyFillA
	allyCombatant 11, 30, 24
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
	
	enemyCombatant SKELETON, 7, 23
	enemyAIandItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_MADAM, 8, 22
	enemyAIandItem ATTACKER3, PROTECT_RING|EQUIPPED|UNUSED_ITEM_DROP
	enemyBehavior FOLLOW_DEVIL|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant HIGH_PRIEST, 9, 24
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_MADAM, 13, 18
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant HIGH_PRIEST, 15, 19
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|3, $0, NONE, $F, $0, STARTING
	
	enemyCombatant ORC, 23, 14
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ORC, 19, 16
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|7, $F, NONE, $F, $0, STARTING
	
	enemyCombatant SKELETON, 21, 17
	enemyAIandItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HARPY, 15, 25
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant HARPY, 13, 31
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior NONE, $3, NONE, $F, $0, STARTING
	
	enemyCombatant ORC, 20, 29
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ARROW_LAUNCHER, 26, 33
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 40	; x2, y2
	dc.b 31, 15	; x3, y3
	dc.b 31, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 21	; x1, y1
	dc.b 9, 32	; x2, y2
	dc.b 20, 23	; x3, y3
	dc.b 11, 13	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 15	; x1, y1
	dc.b 0, 41	; x2, y2
	dc.b 23, 41	; x3, y3
	dc.b 23, 15	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 1	; x1, y1
	dc.b 0, 41	; x2, y2
	dc.b 31, 41	; x3, y3
	dc.b 31, 37	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point