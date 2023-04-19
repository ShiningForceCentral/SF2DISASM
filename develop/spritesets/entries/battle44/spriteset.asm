; Battle spriteset form

; # Force members
	dc.b 12
; # Enemies
	dc.b 15
; # AI Regions
	dc.b 14
; # AI Points
	dc.b 1
	
	allyCombatant 0, 11, 28
	allyFillA
	allyCombatant 1, 11, 29
	allyFillA
	allyCombatant 2, 11, 30
	allyFillA
	allyCombatant 3, 10, 30
	allyFillA
	allyCombatant 4, 12, 30
	allyFillA
	allyCombatant 5, 12, 29
	allyFillA
	allyCombatant 6, 10, 29
	allyFillA
	allyCombatant 7, 9, 30
	allyFillA
	allyCombatant 8, 13, 30
	allyFillA
	allyCombatant 9, 13, 29
	allyFillA
	allyCombatant 10, 9, 29
	allyFillA
	allyCombatant 11, 14, 30
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
	
	enemyCombatant BUBBLING_OOZE, 9, 2
	enemyAIandItem LEADER, NOTHING
	enemyBehavior MOVE_TO|0, $F, NONE, $F, $0, STARTING
	
	enemyCombatant BLUE_SHAMAN_0, 5, 2
	enemyAIandItem HEALER5, NOTHING
	enemyBehavior FOLLOW_DEVIL|0, $0, NONE, $F, $0, HIDDEN|RESPAWN
	
	enemyCombatant ZOMBIE, 14, 4
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $0, HIDDEN|RESPAWN
	
	enemyCombatant MIST_DEMON, 9, 6
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $0, HIDDEN|RESPAWN
	
	enemyCombatant MIST_DEMON, 4, 6
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $3, NONE, $F, $0, HIDDEN
	
	enemyCombatant LESSER_DEMON, 13, 8
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $4, NONE, $F, $0, HIDDEN
	
	enemyCombatant LESSER_DEMON, 6, 10
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $5, NONE, $F, $0, HIDDEN
	
	enemyCombatant ORC_LORD, 4, 13
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $6, NONE, $F, $0, HIDDEN|RESPAWN
	
	enemyCombatant MIST_DEMON, 9, 12
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $7, NONE, $F, $0, HIDDEN|RESPAWN
	
	enemyCombatant MASTER_MONK, 15, 11
	enemyAIandItem HEALER1, NOTHING
	enemyBehavior NONE, $8, NONE, $F, $0, HIDDEN
	
	enemyCombatant DARK_SOLDIER, 10, 16
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $9, NONE, $F, $0, HIDDEN
	
	enemyCombatant DARK_MADAM, 14, 16
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $A, NONE, $F, $0, HIDDEN|RESPAWN
	
	enemyCombatant HARPY, 5, 20
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $B, NONE, $F, $0, HIDDEN|RESPAWN
	
	enemyCombatant MIST_DEMON, 12, 21
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $C, NONE, $F, $0, HIDDEN|RESPAWN
	
	enemyCombatant LESSER_DEMON, 9, 23
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $D, NONE, $F, $0, HIDDEN|RESPAWN
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 6, 6	; x2, y2
	dc.b 11, 2	; x3, y3
	dc.b 11, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 14, 2	; x1, y1
	dc.b 12, 4	; x2, y2
	dc.b 14, 6	; x3, y3
	dc.b 16, 4	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 6, 0	; x1, y1
	dc.b 6, 5	; x2, y2
	dc.b 9, 8	; x3, y3
	dc.b 17, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 1	; x1, y1
	dc.b 0, 9	; x2, y2
	dc.b 6, 9	; x3, y3
	dc.b 6, 6	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 13, 6	; x1, y1
	dc.b 11, 8	; x2, y2
	dc.b 13, 10	; x3, y3
	dc.b 15, 8	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 6, 7	; x1, y1
	dc.b 3, 10	; x2, y2
	dc.b 6, 13	; x3, y3
	dc.b 9, 10	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 4, 10	; x1, y1
	dc.b 1, 13	; x2, y2
	dc.b 4, 16	; x3, y3
	dc.b 7, 13	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 9, 9	; x1, y1
	dc.b 6, 12	; x2, y2
	dc.b 9, 15	; x3, y3
	dc.b 12, 12	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 3		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 17, 8	; x1, y1
	dc.b 12, 13	; x2, y2
	dc.b 17, 13	; x3, y3
	dc.b 0, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 10, 13	; x1, y1
	dc.b 7, 16	; x2, y2
	dc.b 10, 19	; x3, y3
	dc.b 13, 16	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 14, 13	; x1, y1
	dc.b 11, 16	; x2, y2
	dc.b 14, 19	; x3, y3
	dc.b 17, 16	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 5, 16	; x1, y1
	dc.b 1, 20	; x2, y2
	dc.b 5, 24	; x3, y3
	dc.b 9, 20	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 12, 17	; x1, y1
	dc.b 8, 21	; x2, y2
	dc.b 12, 25	; x3, y3
	dc.b 16, 21	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 9, 20	; x1, y1
	dc.b 6, 23	; x2, y2
	dc.b 9, 26	; x3, y3
	dc.b 12, 23	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	; AI point
	dc.b 9, 2	; X offset, Y offset