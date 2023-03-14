
; ASM FILE data\battles\spritesets\spriteset22.asm :
; 0x1B4AA4..0x1B4BFA : Battle Spritesets 22
BattleSpriteset22:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 16
                ; # AI Regions
                dc.b 0
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 18, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 21, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 15, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 20, 17
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 16, 17
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 13, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 23, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 22, 17
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 14, 17
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 18, 17
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 19, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 17, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant KING, 15, 5
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant QUEEN, 17, 5
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BISHOP, 13, 5
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BISHOP, 19, 5
                combatantAiAndItem HEALER4, NOTHING
                combatantBehavior FOLLOW_ENEMY|9, 15, FOLLOW_ENEMY|0, 15, 0, STARTING
                
                enemyCombatant KNIGHT, 11, 5
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant KNIGHT, 21, 5
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior FOLLOW_ENEMY|8, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ROOK, 9, 5
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ROOK, 23, 5
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior FOLLOW_ENEMY|4, 15, NONE, 15, 0, STARTING
                
                enemyCombatant QUEEN, 15, 6
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant QUEEN, 17, 6
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant PAWN, 13, 6
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior FOLLOW_ENEMY|9, 15, NONE, 15, 0, STARTING
                
                enemyCombatant PAWN, 19, 6
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior FOLLOW_ENEMY|4, 15, NONE, 15, 0, STARTING
                
                enemyCombatant PAWN, 11, 6
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior FOLLOW_ENEMY|6, 15, NONE, 15, 0, STARTING
                
                enemyCombatant PAWN, 21, 6
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior FOLLOW_ENEMY|8, 15, NONE, 15, 0, STARTING
                
                enemyCombatant PAWN, 9, 6
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior FOLLOW_ENEMY|8, 15, NONE, 15, 0, STARTING
                
                enemyCombatant PAWN, 23, 6
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior FOLLOW_ENEMY|6, 15, NONE, 15, 0, STARTING
                
                ; AI Points
                dc.b 15, 5
                
