; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 16
; # AI Regions
	dc.b 1
; # AI Points
	dc.b 2
	
	allyCombatant 0, 13, 16
	allyFillA
	allyCombatant 1, 14, 16
	allyFillA
	allyCombatant 2, 12, 16
	allyFillA
	allyCombatant 3, 13, 17
	allyFillA
	allyCombatant 4, 14, 17
	allyFillA
	allyCombatant 5, 12, 17
	allyFillA
	allyCombatant 6, 11, 16
	allyFillA
	allyCombatant 7, 11, 17
	allyFillA
	allyCombatant 8, 11, 18
	allyFillA
	allyCombatant 9, 13, 18
	allyFillA
	allyCombatant 10, 12, 18
	allyFillA
	allyCombatant 11, 14, 18
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
	
	enemyCombatant ZEON, 13, 6
	enemyAIandItem LEADER, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEMON_MASTER, 10, 8
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant PYROHYDRA, 16, 8
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant HORSEMAN, 8, 9
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|4, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ZEON_GUARD, 7, 9
	enemyAIandItem LEADER, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEMON_MASTER, 4, 10
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|4, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PYROHYDRA, 7, 12
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|4, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ZEON_GUARD, 19, 7
	enemyAIandItem LEADER, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PYROHYDRA, 20, 8
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|7, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ARCH_DEMON, 19, 9
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|7, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEMON_MASTER, 16, 13
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PYROHYDRA, 17, 14
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|10, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PYROHYDRA, 15, 21
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ARCH_DEMON, 4, 22
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEVIL_GRIFFIN, 19, 26
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BLUE_SHAMAN_0, 12, 7
	enemyAIandItem HEALER5, HEALING_RAIN|USABLE_BY_AI|UNUSED_ITEM_DROP
	enemyBehavior MOVE_TO|1, $0, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 2, 4	; x1, y1
	dc.b 10, 12	; x2, y2
	dc.b 16, 12	; x3, y3
	dc.b 19, 4	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 16, 13	; X offset, Y offset
	dc.b 15, 8