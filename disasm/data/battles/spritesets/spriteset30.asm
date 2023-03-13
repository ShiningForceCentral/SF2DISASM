; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 16
; # AI Regions
	dc.b 4
; # AI Points
	dc.b 1
	
	allyCombatant 0, 11, 28
	allyFillA
	allyCombatant 1, 11, 29
	allyFillA
	allyCombatant 2, 10, 29
	allyFillA
	allyCombatant 3, 12, 29
	allyFillA
	allyCombatant 4, 11, 30
	allyFillA
	allyCombatant 5, 10, 30
	allyFillA
	allyCombatant 6, 12, 30
	allyFillA
	allyCombatant 7, 11, 31
	allyFillA
	allyCombatant 8, 9, 30
	allyFillA
	allyCombatant 9, 13, 30
	allyFillA
	allyCombatant 10, 12, 31
	allyFillA
	allyCombatant 11, 10, 31
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
	
	enemyCombatant ZALBARD, 11, 7
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $3, NONE, $F, $0, STARTING
	
	enemyCombatant MASTER_MONK, 12, 6
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $3, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_KNIGHT, 12, 8
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $3, NONE, $3, $0, STARTING
	
	enemyCombatant GARGOYLE, 8, 7
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|4, $3, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_KNIGHT, 9, 10
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|5, $3, NONE, $F, $0, STARTING
	
	enemyCombatant ORC_LORD, 7, 12
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HARPY_QUEEN, 11, 11
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WIZARD, 17, 10
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|8, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_KNIGHT, 16, 12
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HARPY_QUEEN, 2, 14
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant WYVERN, 18, 16
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_KNIGHT, 7, 18
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_KNIGHT, 17, 21
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ORC_LORD, 5, 22
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WIZARD, 16, 21
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|12, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HARPY_QUEEN, 19, 15
	enemyAIandItem ATTACKER1, MITHRIL|UNUSED_ITEM_DROP
	enemyBehavior NONE, $F, NONE, $F, $0, HIDDEN
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 21	; x2, y2
	dc.b 23, 30	; x3, y3
	dc.b 23, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 29	; x2, y2
	dc.b 23, 20	; x3, y3
	dc.b 23, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 18	; x2, y2
	dc.b 23, 18	; x3, y3
	dc.b 23, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 16	; x2, y2
	dc.b 23, 16	; x3, y3
	dc.b 23, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 11, 13	; X offset, Y offset