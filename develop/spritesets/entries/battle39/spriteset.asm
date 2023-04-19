; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 14
; # AI Regions
	dc.b 0
; # AI Points
	dc.b 1
	
	allyCombatant 0, 8, 9
	allyFillA
	allyCombatant 1, 7, 9
	allyFillA
	allyCombatant 2, 6, 9
	allyFillA
	allyCombatant 3, 5, 8
	allyFillA
	allyCombatant 4, 6, 8
	allyFillA
	allyCombatant 5, 7, 8
	allyFillA
	allyCombatant 6, 5, 7
	allyFillA
	allyCombatant 7, 6, 7
	allyFillA
	allyCombatant 8, 7, 7
	allyFillA
	allyCombatant 9, 8, 7
	allyFillA
	allyCombatant 10, 8, 8
	allyFillA
	allyCombatant 11, 5, 9
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
	
	enemyCombatant HYDRA, 8, 24
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CHAOS_WIZARD, 7, 23
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant EVIL_BISHOP, 9, 23
	enemyAIandItem HEALER5, EVIL_RING|EQUIPPED|USABLE_BY_AI|UNUSED_ITEM_DROP
	enemyBehavior FOLLOW_DEVIL|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_GUNNER, 6, 22
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CYCLOPS, 10, 22
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WHITE_DRAGON, 2, 29
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WHITE_DRAGON, 9, 28
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant HELL_HOUND, 7, 19
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|8, $F, NONE, $F, $0, STARTING
	
	enemyCombatant MINOTAUR, 8, 19
	enemyAIandItem SENTRY, HOLY_THUNDER|USABLE_BY_AI|UNUSED_ITEM_DROP
	enemyBehavior FOLLOW_TARGET|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_GUNNER, 11, 18
	enemyAIandItem SENTRY, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DARK_GUNNER, 11, 15
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant MINOTAUR, 11, 2
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|12, $F, NONE, $F, $0, STARTING
	
	enemyCombatant CYCLOPS, 12, 2
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	enemyCombatant WHITE_DRAGON, 17, 9
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $F, NONE, $F, $0, STARTING
	
	; AI Regions
	
	; AI point
	dc.b 8, 24	; X offset, Y offset