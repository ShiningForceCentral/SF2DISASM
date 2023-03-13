; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 11
; # AI Regions
	dc.b 0
; # AI Points
	dc.b 0
	
	allyCombatant 0, 15, 15
	allyFillA
	allyCombatant 1, 15, 17
	allyFillA
	allyCombatant 2, 14, 18
	allyFillA
	allyCombatant 3, 13, 17
	allyFillA
	allyCombatant 4, 13, 14
	allyFillA
	allyCombatant 5, 15, 14
	allyFillA
	allyCombatant 6, 15, 16
	allyFillA
	allyCombatant 7, 14, 13
	allyFillA
	allyCombatant 8, 15, 18
	allyFillA
	allyCombatant 9, 13, 18
	allyFillA
	allyCombatant 10, 15, 13
	allyFillA
	allyCombatant 11, 13, 13
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
	
	enemyCombatant KRAKEN_HEAD, 26, 9
	enemyAIandItem SWARM, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant KRAKEN_ARM, 25, 17
	enemyAIandItem SWARM, NOTHING
	enemyBehavior FOLLOW_DEVIL|7, $F, NONE, $F, $0, STARTING
	
	enemyCombatant KRAKEN_ARM, 6, 11
	enemyAIandItem SWARM, NOTHING
	enemyBehavior FOLLOW_DEVIL|3, $F, NONE, $F, $0, STARTING
	
	enemyCombatant KRAKEN_LEG, 6, 15
	enemyAIandItem SWARM, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant KRAKEN_LEG, 7, 18
	enemyAIandItem SWARM, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant KRAKEN_LEG, 10, 20
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant KRAKEN_LEG, 21, 11
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant KRAKEN_LEG, 20, 15
	enemyAIandItem SWARM, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant KRAKEN_LEG, 23, 20
	enemyAIandItem SWARM, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant KRAKEN_LEG, 13, 5
	enemyAIandItem SWARM, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant KRAKEN_LEG, 16, 26
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	
	; AI point