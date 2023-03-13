; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 14
; # AI Regions
	dc.b 2
; # AI Points
	dc.b 0
	
	allyCombatant 0, 24, 23
	allyFillA
	allyCombatant 1, 24, 24
	allyFillA
	allyCombatant 2, 24, 22
	allyFillA
	allyCombatant 3, 24, 25
	allyFillA
	allyCombatant 4, 25, 24
	allyFillA
	allyCombatant 5, 25, 23
	allyFillA
	allyCombatant 6, 25, 22
	allyFillA
	allyCombatant 7, 26, 22
	allyFillA
	allyCombatant 8, 26, 23
	allyFillA
	allyCombatant 9, 27, 23
	allyFillA
	allyCombatant 10, 27, 22
	allyFillA
	allyCombatant 11, 26, 21
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
	
	enemyCombatant SOULSOWER, 1, 10
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|1, $F, NONE, $F, $0, STARTING
	
	enemyCombatant MASTER_MAGE, 4, 15
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|1, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BLACK_MONK, 3, 19
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior FOLLOW_TARGET|1, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GARGOYLE, 6, 6
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GARGOYLE, 6, 17
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GARGOYLE, 13, 9
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ARROW_LAUNCHER, 16, 10
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GOLEM, 11, 19
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant SOULSOWER, 9, 21
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant MASTER_MAGE, 18, 15
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GOLEM, 17, 20
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BLACK_MONK, 14, 22
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|13, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ARROW_LAUNCHER, 15, 23
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GARGOYLE, 15, 26
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 17, 31	; x3, y3
	dc.b 17, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 12, 31	; x3, y3
	dc.b 12, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point