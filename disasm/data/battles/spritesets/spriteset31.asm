
; ASM FILE data\battles\spritesets\spriteset31.asm :
; 0x1B5782..0x1B58FC : Battle Spritesets 31
BattleSpriteset31:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 15
                ; # AI Regions
                dc.b 4
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 21, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 21, 3
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 22, 3
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 20, 3
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 22, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 23, 3
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 20, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 19, 3
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 21, 2
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 23, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 20, 2
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 22, 2
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant DEVIL_SOLDIER, 23, 27
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 2, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_BISHOP, 21, 19
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant NECROMANCER, 15, 20
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant HARPY_QUEEN, 23, 26
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HARPY_QUEEN, 32, 23
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 2, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_KNIGHT, 25, 20
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ORC_LORD, 22, 18
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant MASTER_MONK, 19, 18
                combatantAiAndItem HEALER4, NOTHING
                combatantBehavior FOLLOW_ENEMY|6, 1, FOLLOW_ENEMY|0, 15, 0, STARTING
                
                enemyCombatant HARPY_QUEEN, 10, 16
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_KNIGHT, 17, 11
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ORC_LORD, 29, 11
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant MASTER_MONK, 31, 10
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|10, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ORC_LORD, 37, 4
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|13, 0, FOLLOW_ENEMY|13, 3, 0, STARTING
                
                enemyCombatant DARK_KNIGHT, 39, 2
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 0, NONE, 3, 0, STARTING
                
                enemyCombatant HARPY_QUEEN, 23, 15
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 29, 0
                dc.b 29, 31
                dc.b 47, 31
                dc.b 47, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 7
                dc.b 0, 31
                dc.b 47, 31
                dc.b 47, 7
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 14
                dc.b 0, 31
                dc.b 47, 31
                dc.b 47, 14
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 11
                dc.b 0, 31
                dc.b 47, 31
                dc.b 47, 11
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 23, 27
                
