; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 18
; # AI Regions
	dc.b 4
; # AI Points
	dc.b 1
	
	allyCombatant 0, 45, 8
	allyFillA
	allyCombatant 1, 45, 7
	allyFillA
	allyCombatant 2, 44, 7
	allyFillA
	allyCombatant 3, 43, 7
	allyFillA
	allyCombatant 4, 45, 6
	allyFillA
	allyCombatant 5, 44, 6
	allyFillA
	allyCombatant 6, 43, 6
	allyFillA
	allyCombatant 7, 44, 8
	allyFillA
	allyCombatant 8, 43, 8
	allyFillA
	allyCombatant 9, 42, 6
	allyFillA
	allyCombatant 10, 42, 7
	allyFillA
	allyCombatant 11, 42, 8
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
	
	enemyCombatant BOW_RIDER, 23, 25
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant CHAOS_WIZARD, 22, 24
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant SHAMAN, 23, 27
	enemyAIandItem HEALER5, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $0, NONE, $F, $0, STARTING
	
	enemyCombatant DRAGONEWT, 24, 24
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PURPLE_WORM, 24, 27
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|3, $F, NONE, $F, $0, STARTING
	
	enemyCombatant DRAGONEWT, 23, 26
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|7, $F, NONE, $F, $0, STARTING
	
	enemyCombatant PURPLE_WORM, 24, 25
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|7, $F, NONE, $F, $0, STARTING
	
	enemyCombatant GRIFFIN, 23, 23
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $F, FOLLOW_TARGET|0, $F, $0, STARTING
	
	enemyCombatant DRAGONEWT, 22, 25
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior NONE, $1, NONE, $2, $0, STARTING
	
	enemyCombatant MIST_DEMON, 22, 23
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|8, $1, FOLLOW_DEVIL|8, $2, $0, STARTING
	
	enemyCombatant GRIFFIN, 22, 26
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $1, FOLLOW_TARGET|0, $2, $0, STARTING
	
	enemyCombatant MIST_DEMON, 23, 24
	enemyAIandItem HEALER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|10, $1, FOLLOW_DEVIL|10, $2, $0, STARTING
	
	enemyCombatant PURPLE_WORM, 24, 26
	enemyAIandItem ATTACKER3, NOTHING
	enemyBehavior FOLLOW_DEVIL|10, $1, FOLLOW_DEVIL|10, $2, $0, STARTING
	
	enemyCombatant MUD_MAN, 26, 21
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $3, NONE, $F, $0, HIDDEN
	
	enemyCombatant MUD_MAN, 29, 21
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $3, NONE, $F, $0, HIDDEN
	
	enemyCombatant MUD_MAN, 31, 24
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $3, NONE, $F, $0, HIDDEN
	
	enemyCombatant MUD_MAN, 28, 28
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $3, NONE, $F, $0, HIDDEN
	
	enemyCombatant MUD_MAN, 21, 29
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior FOLLOW_TARGET|0, $3, NONE, $F, $0, HIDDEN
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 20, 20	; x1, y1
	dc.b 20, 31	; x2, y2
	dc.b 31, 31	; x3, y3
	dc.b 31, 20	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 31	; x2, y2
	dc.b 21, 31	; x3, y3
	dc.b 21, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 21, 0	; x1, y1
	dc.b 22, 31	; x2, y2
	dc.b 47, 31	; x3, y3
	dc.b 47, 25	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 19, 21	; x1, y1
	dc.b 19, 28	; x2, y2
	dc.b 29, 28	; x3, y3
	dc.b 29, 21	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 23, 25	; X offset, Y offset