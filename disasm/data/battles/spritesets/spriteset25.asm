; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 15
; # AI Regions
	dc.b 3
; # AI Points
	dc.b 0
	
	allyCombatant 0, 25, 26
	allyFillA
	allyCombatant 1, 26, 26
	allyFillA
	allyCombatant 2, 27, 26
	allyFillA
	allyCombatant 3, 26, 27
	allyFillA
	allyCombatant 4, 27, 27
	allyFillA
	allyCombatant 5, 28, 27
	allyFillA
	allyCombatant 6, 27, 25
	allyFillA
	allyCombatant 7, 26, 25
	allyFillA
	allyCombatant 8, 28, 26
	allyFillA
	allyCombatant 9, 28, 25
	allyFillA
	allyCombatant 10, 27, 28
	allyFillA
	allyCombatant 11, 28, 24
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
	
	enemyCombatant DARK_SOLDIER, 24, 7
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_BISHOP, 21, 10
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 19, 9
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_BISHOP, 6, 6
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|4, $1, NONE, $1, $0, STARTING
	
	enemyCombatant DARK_SNIPER, 7, 9
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|5, $1, NONE, $1, $0, STARTING
	
	enemyCombatant SKELETON, 5, 10
	enemyAIandItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI|UNUSED_ITEM_DROP
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 14, 12
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, STARTING
	
	enemyCombatant SKELETON, 10, 16
	enemyAIandItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SNIPER, 8, 17
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant LESSER_DEMON, 6, 28
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SNIPER, 13, 28
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|11, $F, NONE, $F, $0, STARTING
	
	enemyCombatant SKELETON, 14, 27
	enemyAIandItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant SKELETON, 15, 19
	enemyAIandItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_SNIPER, 18, 21
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|14, $F, NONE, $F, $0, STARTING
	
	enemyCombatant SKELETON, 20, 22
	enemyAIandItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI|UNUSED_ITEM_DROP
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 14	; x2, y2
	dc.b 31, 14	; x3, y3
	dc.b 31, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 7, 31	; x3, y3
	dc.b 31, 7	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 18, 31	; x3, y3
	dc.b 18, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point