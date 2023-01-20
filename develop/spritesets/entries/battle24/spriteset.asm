; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 16
; # AI Regions
	dc.b 3
; # AI Points
	dc.b 1
	
	allyCombatant 0, 4, 18
	allyFillA
	allyCombatant 1, 3, 17
	allyFillA
	allyCombatant 2, 3, 18
	allyFillA
	allyCombatant 3, 2, 18
	allyFillA
	allyCombatant 4, 3, 19
	allyFillA
	allyCombatant 5, 2, 17
	allyFillA
	allyCombatant 6, 2, 19
	allyFillA
	allyCombatant 7, 2, 16
	allyFillA
	allyCombatant 8, 3, 16
	allyFillA
	allyCombatant 9, 1, 16
	allyFillA
	allyCombatant 10, 1, 17
	allyFillA
	allyCombatant 11, 1, 18
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
	
	enemyCombatant DARK_BISHOP, 25, 7
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SNIPER, 25, 5
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant SKELETON, 24, 8
	enemyAIandItem ATTACKER3, MEDICAL_HERB|USABLE_BY_AI
	enemyBehavior FOLLOW_DEVIL|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 28, 10
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SNIPER, 18, 13
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $0, $0, STARTING
	
	enemyCombatant SKELETON, 21, 14
	enemyAIandItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI|UNUSED_ITEM_DROP
	enemyBehavior NONE, $1, NONE, $0, $0, STARTING
	
	enemyCombatant SKELETON, 17, 18
	enemyAIandItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_BISHOP, 18, 19
	enemyAIandItem HEALER3, BLIZZARD|USABLE_BY_AI|UNUSED_ITEM_DROP
	enemyBehavior FOLLOW_DEVIL|6, $F, NONE, $F, $0, STARTING
	
	enemyCombatant SKELETON, 18, 20
	enemyAIandItem HEALER3, MEDICAL_HERB|USABLE_BY_AI
	enemyBehavior FOLLOW_DEVIL|6, $F, NONE, $F, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 22, 25
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $1, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 21, 26
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $1, $0, STARTING
	
	enemyCombatant SKELETON, 11, 21
	enemyAIandItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant SKELETON, 9, 25
	enemyAIandItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI|UNUSED_ITEM_DROP
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SNIPER, 8, 24
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|12, $F, NONE, $F, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 14, 3
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $2, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 8, 8
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, NONE, $2, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 9, 18	; x1, y1
	dc.b 13, 29	; x2, y2
	dc.b 31, 29	; x3, y3
	dc.b 31, 18	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 19, 0	; x1, y1
	dc.b 10, 18	; x2, y2
	dc.b 31, 18	; x3, y3
	dc.b 31, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 10	; x2, y2
	dc.b 10, 17	; x3, y3
	dc.b 19, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 25, 7	; X offset, Y offset