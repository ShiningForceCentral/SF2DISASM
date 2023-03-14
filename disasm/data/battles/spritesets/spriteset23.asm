
; ASM FILE data\battles\spritesets\spriteset23.asm :
; 0x1B4BFA..0x1B4D2C : Battle Spritesets 23
BattleSpriteset23:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 12
                ; # AI Regions
                dc.b 1
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 4, 5
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 4, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 3, 5
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 3, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 3, 6
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 3, 7
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 2, 6
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 4, 6
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 4, 3
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 2, 7
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 3, 8
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 3, 3
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant WILLARD, 18, 7
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant RAT, 20, 6
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant RAT, 20, 8
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BUBBLING_OOZE, 17, 1
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant RAT, 16, 2
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant BUBBLING_OOZE, 15, 2
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant RAT, 21, 12
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant BUBBLING_OOZE, 22, 13
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant BUBBLING_OOZE, 20, 14
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant RAT, 10, 11
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BUBBLING_OOZE, 9, 10
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|9, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BUBBLING_OOZE, 5, 12
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 9, 0
                dc.b 9, 15
                dc.b 26, 15
                dc.b 26, 0
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 22, 3
                
