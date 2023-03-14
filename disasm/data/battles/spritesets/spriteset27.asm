
; ASM FILE data\battles\spritesets\spriteset27.asm :
; 0x1B5180..0x1B5306 : Battle Spritesets 27
BattleSpriteset27:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 16
                ; # AI Regions
                dc.b 4
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 14, 44
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 15, 44
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 14, 45
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 15, 45
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 14, 46
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 15, 46
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 16, 46
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 17, 46
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 16, 45
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 17, 45
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 16, 44
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 17, 44
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant LIZARDMAN, 15, 19
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 3, NONE, 3, 0, STARTING
                
                enemyCombatant WYVERN, 17, 17
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 3, NONE, 3, 0, STARTING
                
                enemyCombatant DARK_BISHOP, 13, 19
                combatantAiAndItem HEALER5, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 3, NONE, 3, 0, STARTING
                
                enemyCombatant DARK_SOLDIER, 19, 33
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|9, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SOLDIER, 8, 34
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SOLDIER, 17, 38
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WYVERN, 24, 25
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SNIPER, 24, 28
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|8, 2, NONE, 2, 0, STARTING
                
                enemyCombatant LIZARDMAN, 25, 29
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SNIPER, 18, 36
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|5, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WIZARD, 7, 33
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|4, 0, NONE, 0, 0, STARTING
                
                enemyCombatant DARK_SNIPER, 9, 32
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|4, 0, NONE, 0, 0, STARTING
                
                enemyCombatant DARK_BISHOP, 7, 25
                combatantAiAndItem HEALER4, NOTHING
                combatantBehavior FOLLOW_ENEMY|10, 0, FOLLOW_ENEMY|0, 15, 0, STARTING
                
                enemyCombatant DARK_BISHOP, 16, 27
                combatantAiAndItem HEALER4, NOTHING
                combatantBehavior FOLLOW_ENEMY|14, 1, FOLLOW_ENEMY|0, 15, 0, STARTING
                
                enemyCombatant LIZARDMAN, 15, 28
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SNIPER, 16, 21
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 2, NONE, 2, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 3, 0
                dc.b 3, 47
                dc.b 31, 22
                dc.b 31, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 37
                dc.b 31, 37
                dc.b 31, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 18
                dc.b 28, 47
                dc.b 28, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 29
                dc.b 31, 29
                dc.b 31, 0
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 15, 23
                
