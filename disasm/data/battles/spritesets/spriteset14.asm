; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 15
; # AI Regions
	dc.b 3
; # AI Points
	dc.b 0
	
	allyCombatant 0, 4, 25
	allyFillA
	allyCombatant 1, 4, 24
	allyFillA
	allyCombatant 2, 3, 25
	allyFillA
	allyCombatant 3, 4, 23
	allyFillA
	allyCombatant 4, 3, 23
	allyFillA
	allyCombatant 5, 3, 24
	allyFillA
	allyCombatant 6, 2, 23
	allyFillA
	allyCombatant 7, 2, 24
	allyFillA
	allyCombatant 8, 2, 25
	allyFillA
	allyCombatant 9, 1, 24
	allyFillA
	allyCombatant 10, 1, 25
	allyFillA
	allyCombatant 11, 1, 23
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
	
	enemyCombatant GOLEM, 22, 11
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $0, NONE, $1, $0, STARTING
	
	enemyCombatant GOLEM, 23, 12
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $0, NONE, $1, $0, STARTING
	
	enemyCombatant EVIL_CLOUD, 24, 9
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $0, NONE, $1, $0, STARTING
	
	enemyCombatant MASTER_MAGE, 10, 28
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ZOMBIE, 9, 29
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant EVIL_CLOUD, 10, 19
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEATH_ARCHER, 12, 22
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BLACK_MONK, 11, 25
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ZOMBIE, 10, 12
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DEATH_ARCHER, 11, 16
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GOLEM, 15, 20
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ZOMBIE, 14, 18
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ZOMBIE, 19, 17
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|13, $2, NONE, $F, $0, STARTING
	
	enemyCombatant BLACK_MONK, 16, 15
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|14, $2, NONE, $F, $0, STARTING
	
	enemyCombatant GOLEM, 15, 13
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 4, 12	; x1, y1
	dc.b 22, 28	; x2, y2
	dc.b 31, 18	; x3, y3
	dc.b 14, 1	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 3		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 16, 31	; x1, y1
	dc.b 31, 31	; x2, y2
	dc.b 31, 17	; x3, y3
	dc.b 0, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 12, 0	; x1, y1
	dc.b 0, 12	; x2, y2
	dc.b 18, 31	; x3, y3
	dc.b 31, 18	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point