
; This table is used when ENABLE_CUSTOM_AI_PROBABILITY patch is enabled.
;
; In the original game, the AI uses identical probabilities for every character when it decides between attacking, casting spells and using items.
; There is only 1 hardcoded exception: the AI will always cast AQUA 1 if it's the spell chosen for consideration (you can observe this in Kraken fight).
;
; In the original game:
;	If the enemy can use a spell only:
;		always cast the spell if it is AQUA 1
;		40% chance of casting the spell
;		20% chance of attacking if an enemy is within range, cast the spell otherwise
;	If the enemy can use an item only:
;		40% chance of using the item
;		20% chance of attacking if an enemy is within range, use the item otherwise
;   If the enemy can both use a spell and item (notice the enemy will never pick attack here):
;		50% chance of casting the spell
;		50% chance of using the item
;
; To give much more freedom in ROM hacks, the code described above has been redone with two flexible tables.
; You will now be able to have mages cast their spells much more often if you like!
;
; Now, action probability will work using 1/64 increments, using a standardized 0..63 single random number roll.
; The random number roll will be compared to various threshold chances as described below. The threshold is satisfied if (random number < threshold).
; The thresholds are evaluated from left to right, and the first one satisfied will be the action picked by AI.
; This means the threshold values must be cumulative.
;   Example: if you want 20% chance to attack, 40% chance to cast spell, and 20% chance to use item, you must set up the thresholds like so: 13, 39, 52
;
; You can define two tables:
;	- Per movement type (for broad tuning)
;	- Per enemy type (very useful to customize boss behavior or unique enemies)
;
; Table layout:
;	Byte 0 = Table index (either a movement type, or an enemy type)
; Case 1: the enemy can use a spell only:
; 	Byte 1 = Threshold chance of attacking if an enemy is within range, otherwise cast the spell [A]
; 	Byte 2 = Threshold chance of casting spell [S]
; Case 2: the enemy can use an item only:
; 	Byte 3 = Threshold chance of attacking if an enemy is within range, otherwise use the item [A]
; 	Byte 4 = Threshold chance of using the item [I]
; Case 3: the enemy can both use a spell and item:
;	Byte 5 = Threshold chance of attacking if an enemy is within range (this is new compared to original game!) [A]
;	Byte 6 = Threshold chance of casting the spell [S]
;	Byte 7 = Threshold chance of using the item [I]

table_AIProbabilityPerMoveType:
				;                                A/S      |      A/I      |      A/S/I
				;                             A       S   |   A       I   |   A    S    I
                dc.b MOVETYPE_MAGE,          13,     39,     13,     39,      0,  32,  64
                dc.b MOVETYPE_HEALER,        13,     39,     13,     39,      0,  32,  64
                tableEnd.b
				
table_AIProbabilityPerEnemyType:
				;                                A/S      |      A/I      |      A/S/I
				;                             A       S   |   A       I   |   A    S    I
				dc.b ENEMY_KRAKEN_HEAD,       0,     64,      0,     64,      0,  64,  64
                tableEnd.b
				
table_AIProbabilityDefault:
				;                                A/S      |      A/I      |      A/S/I
				;                             A       S   |   A       I   |   A    S    I
				dc.b 					     13,     39,     13,     39,      0,  32,  64
                tableEnd.b