
; ASM FILE data\battles\spritesets\spriteset12.asm :
; 0x1B3D30..0x1B3E86 : Battle Spritesets 12
BattleSpriteset12:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 12
                ; # AI Regions
                dc.b 4
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 5, 21
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 4, 21
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 3, 21
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 4, 22
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 3, 22
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 2, 22
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 4, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 3, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 2, 21
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 2, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 1, 22
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 1, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant DEATH_ARCHER, 22, 8
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant EVIL_CLOUD, 15, 3
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 3, 0, STARTING
                
                enemyCombatant DEATH_MONK, 24, 9
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WITCH, 25, 15
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 0, NONE, 1, 0, STARTING
                
                enemyCombatant DEATH_MONK, 18, 14
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant HOBGOBLIN, 20, 12
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant WITCH, 18, 19
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HOBGOBLIN, 19, 18
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DEATH_MONK, 23, 21
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant HOBGOBLIN, 24, 17
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 0, NONE, 1, 0, STARTING
                
                enemyCombatant HOBGOBLIN, 11, 19
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HOBGOBLIN, 8, 18
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 16, 22
                dc.b 14, 27
                dc.b 31, 27
                dc.b 31, 17
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 7, 5
                dc.b 7, 11
                dc.b 21, 19
                dc.b 21, 5
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 7, 0
                dc.b 7, 19
                dc.b 21, 19
                dc.b 21, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 14, 0
                dc.b 14, 16
                dc.b 31, 16
                dc.b 31, 0
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 22, 8
                
