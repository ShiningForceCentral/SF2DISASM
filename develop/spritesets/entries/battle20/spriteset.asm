; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 12
; # AI Regions
	dc.b 0
; # AI Points
	dc.b 0
	
	allyCombatant 0, 6, 8
	allyFillA
	allyCombatant 1, 7, 8
	allyFillA
	allyCombatant 2, 5, 8
	allyFillA
	allyCombatant 3, 6, 9
	allyFillA
	allyCombatant 4, 8, 8
	allyFillA
	allyCombatant 5, 7, 9
	allyFillA
	allyCombatant 6, 5, 9
	allyFillA
	allyCombatant 7, 4, 9
	allyFillA
	allyCombatant 8, 5, 10
	allyFillA
	allyCombatant 9, 6, 10
	allyFillA
	allyCombatant 10, 8, 7
	allyFillA
	allyCombatant 11, 9, 7
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
	
	enemyCombatant HARPY, 15, 23
	enemyAIandItem SWARM, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_MADAM, 9, 22
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|3, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HIGH_PRIEST, 10, 21
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|1, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ORC, 9, 19
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ARROW_LAUNCHER, 4, 20
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|5, $F, NONE, $F, $0, STARTING
	
	enemyCombatant ORC, 5, 19
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HARPY, 1, 16
	enemyAIandItem SWARM, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HIGH_PRIEST, 6, 15
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|8, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_MADAM, 8, 13
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HARPY, 11, 17
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HARPY, 14, 3
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HARPY, 4, 1
	enemyAIandItem SWARM, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	
	; AI point