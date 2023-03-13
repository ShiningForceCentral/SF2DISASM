; Battle spriteset form

; # Force members
	dc.b 3
; # Enemies
	dc.b 6
; # AI Regions
	dc.b 3
; # AI Points
	dc.b 0
	
	allyCombatant 0, 8, 18
	allyFillB
	allyCombatant 1, 9, 18
	allyFillB
	allyCombatant 2, 7, 18
	allyFillB
	
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
	
	enemyCombatant GIZMO, 7, 3
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $60, STARTING
	
	enemyCombatant GIZMO, 9, 4
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $60, STARTING
	
	enemyCombatant GIZMO, 6, 4
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $2, NONE, $F, $60, STARTING
	
	enemyCombatant GIZMO, 8, 3
	enemyAIandItem ATTACKER1, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $60, STARTING
	
	enemyCombatant GIZMO, 9, 5
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $1, NONE, $F, $70, STARTING
	
	enemyCombatant GIZMO, 6, 5
	enemyAIandItem ATTACKER2, NOTHING
	enemyBehavior NONE, $0, NONE, $F, $70, STARTING
	
	; AI Regions
	dc.b 4		; 04=Type 1, 03=Type 2
	dc.b 0		; 
	dc.b 0, 0	; x1, y1
	dc.b 0, 19	; x2, y2
	dc.b 15, 7	; x3, y3
	dc.b 15, 0	; x4, y4
	dc.b 0		; 
	dc.b 0		; 
	
	dc.b 4
	dc.b 0
	dc.b 0, 0
	dc.b 0, 7
	dc.b 15, 19
	dc.b 15, 0
	dc.b 0
	dc.b 0
	
	dc.b 4
	dc.b 0
	dc.b 0, 0
	dc.b 0, 12
	dc.b 15, 12
	dc.b 15, 0
	dc.b 0
	dc.b 0
	
	; AI point