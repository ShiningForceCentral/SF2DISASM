
; ASM FILE data\battles\spritesets\spriteset13.asm :
; 0x1B3E86..0x1B4000 : Battle Spritesets 13
BattleSpriteset13:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 16
                ; # AI Regions
                dc.b 3
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 22, 9
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 23, 9
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 24, 8
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 23, 8
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 22, 8
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 21, 9
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 21, 8
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 23, 7
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 22, 7
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 20, 8
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 20, 9
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 24, 7
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant MASTER_MAGE, 9, 24
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BLACK_MONK, 10, 25
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DEATH_ARCHER, 9, 23
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant EVIL_CLOUD, 16, 28
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant DEATH_ARCHER, 15, 29
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant ZOMBIE, 14, 29
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant HOBGOBLIN, 8, 22
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|7, 2, NONE, 2, 0, STARTING
                
                enemyCombatant DEATH_ARCHER, 6, 23
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant ZOMBIE, 5, 22
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|7, 2, NONE, 2, 0, STARTING
                
                enemyCombatant ZOMBIE, 26, 19
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                enemyCombatant EVIL_CLOUD, 25, 20
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                enemyCombatant HOBGOBLIN, 10, 9
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant DEATH_ARCHER, 8, 13
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant ZOMBIE, 11, 17
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant HOBGOBLIN, 15, 12
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ZOMBIE, 16, 14
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 31
                dc.b 26, 31
                dc.b 12, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 12
                dc.b 0, 31
                dc.b 31, 31
                dc.b 31, 12
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 11
                dc.b 0, 31
                dc.b 31, 31
                dc.b 31, 23
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 9, 24
                
