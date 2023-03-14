
; ASM FILE data\battles\spritesets\spriteset26.asm :
; 0x1B5012..0x1B5180 : Battle Spritesets 26
BattleSpriteset26:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 15
                ; # AI Regions
                dc.b 3
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 7, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 6, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 5, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 4, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 6, 26
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 5, 26
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 4, 26
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 6, 27
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 5, 27
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 4, 27
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 7, 26
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 7, 27
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant LIZARDMAN, 22, 7
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WIZARD, 21, 8
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_BISHOP, 24, 7
                combatantAiAndItem HEALER3, BLACK_RING|EQUIPPED|USABLE_BY_AI|UNUSED_ITEM_DROP
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant LESSER_DEMON, 17, 3
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 1, NONE, 1, 0, STARTING
                
                enemyCombatant DARK_SOLDIER, 22, 9
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SNIPER, 23, 11
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SNIPER, 15, 12
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|7, 2, NONE, 2, 0, STARTING
                
                enemyCombatant DARK_SOLDIER, 17, 13
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant LESSER_DEMON, 4, 6
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SOLDIER, 24, 17
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|10, 0, NONE, 0, 0, STARTING
                
                enemyCombatant DARK_SOLDIER, 23, 18
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant LESSER_DEMON, 24, 27
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant LESSER_DEMON, 9, 19
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_BISHOP, 13, 20
                combatantAiAndItem HEALER4, NOTHING
                combatantBehavior FOLLOW_ENEMY|14, 15, FOLLOW_ENEMY|12, 15, 0, STARTING
                
                enemyCombatant DARK_SNIPER, 14, 23
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 21, 0
                dc.b 12, 31
                dc.b 35, 31
                dc.b 35, 0
                dc.b 0
                dc.b 0
                
                dc.b 3
                dc.b 0
                dc.b 4, 0
                dc.b 34, 31
                dc.b 34, 0
                dc.b 0, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 21
                dc.b 35, 21
                dc.b 35, 0
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 23, 7
                
