
; ASM FILE data\battles\spritesets\spriteset18.asm :
; 0x1B4546..0x1B46BE : Battle Spritesets 18
BattleSpriteset18:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 14
                ; # AI Regions
                dc.b 5
                ; # AI Points
                dc.b 0
                
                ; Allies
                allyCombatant 0, 12, 27
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 11, 28
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 13, 28
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 11, 27
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 13, 27
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 12, 28
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 11, 29
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 12, 29
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 13, 29
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 12, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 13, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 11, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant TAROS, 12, 8
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant MASTER_MAGE, 11, 9
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BLACK_MONK, 13, 9
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GARGOYLE, 14, 10
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ARROW_LAUNCHER, 7, 11
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 3, NONE, 4, 0, STARTING
                
                enemyCombatant GOLEM, 3, 10
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 3, NONE, 4, 0, STARTING
                
                enemyCombatant SOULSOWER, 15, 8
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant GOLEM, 18, 9
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant GOLEM, 20, 17
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|9, 1, NONE, 2, 0, STARTING
                
                enemyCombatant MASTER_MAGE, 21, 15
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 2, 0, STARTING
                
                enemyCombatant ARROW_LAUNCHER, 16, 19
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GARGOYLE, 19, 21
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant SOULSOWER, 5, 24
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GARGOYLE, 4, 16
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 3, NONE, 4, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 16
                dc.b 24, 16
                dc.b 24, 0
                dc.b 0
                dc.b 0
                
                dc.b 3
                dc.b 0
                dc.b 10, 18
                dc.b 23, 31
                dc.b 23, 18
                dc.b 0, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 4
                dc.b 11, 17
                dc.b 24, 17
                dc.b 24, 0
                dc.b 0
                dc.b 0
                
                dc.b 3
                dc.b 0
                dc.b 1, 18
                dc.b 1, 31
                dc.b 14, 18
                dc.b 0, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 4
                dc.b 0, 17
                dc.b 12, 17
                dc.b 24, 4
                dc.b 0
                
                dc.b 0
                
