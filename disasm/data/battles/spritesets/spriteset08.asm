
; ASM FILE data\battles\spritesets\spriteset08.asm :
; 0x1B3822..0x1B3978 : Battle Spritesets 08
BattleSpriteset08:
                ; # Allies
                dc.b 13
                ; # Enemies
                dc.b 11
                ; # AI Regions
                dc.b 4
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 3, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 3, 19
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 2, 19
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 3, 17
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 2, 17
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 2, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 1, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 1, 17
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 1, 19
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 1, 20
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 1, 16
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 2, 16
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 12, 1, 15
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant HUNTER_GOBLIN, 11, 5
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 0, NONE, 1, 0, STARTING
                
                enemyCombatant WITCH, 10, 6
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 0, NONE, 1, 0, STARTING
                
                enemyCombatant GOBLIN, 17, 8
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 2, NONE, 3, 0, STARTING
                
                enemyCombatant GREEN_OOZE, 19, 9
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 2, NONE, 3, 0, STARTING
                
                enemyCombatant HUNTER_GOBLIN, 22, 18
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 1, NONE, 2, 0, STARTING
                
                enemyCombatant GOBLIN, 16, 14
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 1, 0, STARTING
                
                enemyCombatant GREEN_OOZE, 9, 21
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WITCH, 10, 21
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GOBLIN, 11, 22
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GOBLIN, 7, 10
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HUNTER_GOBLIN, 8, 12
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 8, 3
                dc.b 0, 11
                dc.b 7, 18
                dc.b 15, 10
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 16, 11
                dc.b 8, 19
                dc.b 18, 29
                dc.b 27, 16
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 11, 0
                dc.b 2, 9
                dc.b 10, 16
                dc.b 18, 7
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 21, 6
                dc.b 12, 15
                dc.b 22, 25
                dc.b 27, 16
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 11, 5
                
