
; ASM FILE data\battles\spritesets\spriteset29.asm :
; 0x1B5480..0x1B55FC : Battle Spritesets 29
BattleSpriteset29:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 15
                ; # AI Regions
                dc.b 4
                ; # AI Points
                dc.b 2
                
                ; Allies
                allyCombatant 0, 14, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 15, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 13, 31
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 16, 31
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 13, 32
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 16, 32
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 14, 32
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 15, 32
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 14, 31
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 15, 31
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 14, 33
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 15, 33
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant DARK_KNIGHT, 14, 13
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ORC_LORD, 15, 13
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior MOVE_TO|1, 15, NONE, 15, 0, STARTING
                
                enemyCombatant MASTER_MONK, 14, 12
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WORM, 11, 14
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant WIZARD, 15, 14
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant WYVERN, 6, 16
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 2, NONE, 15, 0, STARTING
                
                enemyCombatant WYVERN, 25, 17
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 3, NONE, 15, 0, STARTING
                
                enemyCombatant ORC_LORD, 18, 19
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 3, NONE, 15, 0, STARTING
                
                enemyCombatant MASTER_MONK, 19, 19
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|7, 3, NONE, 15, 0, STARTING
                
                enemyCombatant WIZARD, 11, 21
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|11, 0, NONE, 15, 0, STARTING
                
                enemyCombatant MASTER_MONK, 11, 22
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|9, 0, NONE, 15, 0, STARTING
                
                enemyCombatant WORM, 10, 22
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant WORM, 19, 27
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WORM, 20, 27
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WYVERN, 6, 29
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 4, 37
                dc.b 31, 13
                dc.b 31, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 22
                dc.b 14, 22
                dc.b 31, 9
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 25
                dc.b 28, 13
                dc.b 28, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 14
                dc.b 31, 36
                dc.b 31, 0
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 14, 13
                dc.b 15, 13
                
