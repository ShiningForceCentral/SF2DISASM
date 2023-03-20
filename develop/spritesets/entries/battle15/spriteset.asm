; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 16
; # AI Regions
	dc.b 2
; # AI Points
	dc.b 1
	
	allyCombatant 0, 14, 20
	allyFillA
	allyCombatant 1, 13, 21
	allyFillA
	allyCombatant 2, 15, 21
	allyFillA
	allyCombatant 3, 13, 20
	allyFillA
	allyCombatant 4, 15, 20
	allyFillA
	allyCombatant 5, 14, 21
	allyFillA
	allyCombatant 6, 12, 21
	allyFillA
	allyCombatant 7, 16, 21
	allyFillA
	allyCombatant 8, 16, 20
	allyFillA
	allyCombatant 9, 12, 20
	allyFillA
	allyCombatant 10, 14, 22
	allyFillA
	allyCombatant 11, 11, 21
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
	
	enemyCombatant ARROW_LAUNCHER, 14, 5
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant GOLEM, 13, 4
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant GARGOYLE, 16, 5
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $1, NONE, $F, $0, STARTING
	
	enemyCombatant MASTER_MAGE, 5, 3
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant BLACK_MONK, 7, 4
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|3, $0, NONE, $F, $0, STARTING
	
	enemyCombatant GOLEM, 8, 9
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant GARGOYLE, 2, 10
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant MASTER_MAGE, 21, 5
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant BLACK_MONK, 21, 9
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|9, $0, NONE, $F, $0, STARTING
	
	enemyCombatant GOLEM, 22, 10
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant GOLEM, 21, 17
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GOLEM, 12, 12
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GARGOYLE, 7, 15
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GARGOYLE, 26, 15
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $0, STARTING
	
	enemyCombatant ARROW_LAUNCHER, 21, 13
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GOLEM, 2, 8
	enemyAIandItem ATTACKER1, POWER_WATER
	enemyBehavior NONE, $F, NONE, $F, $0, HIDDEN
	
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
	dc.b 0, 9	; x2, y2
	dc.b 31, 9	; x3, y3
	dc.b 31, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 14, 4	; X offset, Y offset