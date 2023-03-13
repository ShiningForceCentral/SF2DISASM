; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 14
; # AI Regions
	dc.b 5
; # AI Points
	dc.b 0
	
	allyCombatant 0, 12, 27
	allyFillA
	allyCombatant 1, 11, 28
	allyFillA
	allyCombatant 2, 13, 28
	allyFillA
	allyCombatant 3, 11, 27
	allyFillA
	allyCombatant 4, 13, 27
	allyFillA
	allyCombatant 5, 12, 28
	allyFillA
	allyCombatant 6, 11, 29
	allyFillA
	allyCombatant 7, 12, 29
	allyFillA
	allyCombatant 8, 13, 29
	allyFillA
	allyCombatant 9, 12, 30
	allyFillA
	allyCombatant 10, 13, 30
	allyFillA
	allyCombatant 11, 11, 30
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
	
	enemyCombatant TAROS, 12, 8
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant MASTER_MAGE, 11, 9
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BLACK_MONK, 13, 9
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GARGOYLE, 14, 10
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ARROW_LAUNCHER, 7, 11
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $3, NONE, $4, $0, STARTING
	
	enemyCombatant GOLEM, 3, 10
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $3, NONE, $4, $0, STARTING
	
	enemyCombatant SOULSOWER, 15, 8
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant GOLEM, 18, 9
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant GOLEM, 20, 17
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|9, $1, NONE, $2, $0, STARTING
	
	enemyCombatant MASTER_MAGE, 21, 15
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $2, $0, STARTING
	
	enemyCombatant ARROW_LAUNCHER, 16, 19
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GARGOYLE, 19, 21
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant SOULSOWER, 5, 24
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GARGOYLE, 4, 16
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $3, NONE, $4, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 16	; x2, y2
	dc.b 24, 16	; x3, y3
	dc.b 24, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 3		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 10, 18	; x1, y1
	dc.b 23, 31	; x2, y2
	dc.b 23, 18	; x3, y3
	dc.b 0, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 4	; x1, y1
	dc.b 11, 17	; x2, y2
	dc.b 24, 17	; x3, y3
	dc.b 24, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 3		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 1, 18	; x1, y1
	dc.b 1, 31	; x2, y2
	dc.b 14, 18	; x3, y3
	dc.b 0, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 4	; x1, y1
	dc.b 0, 17	; x2, y2
	dc.b 12, 17	; x3, y3
	dc.b 24, 4	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point