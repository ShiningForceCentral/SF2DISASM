
; ASM FILE data\battles\spritesets\spriteset15.asm :
; 0x1B416C..0x1B42DA : Battle Spritesets 15
BattleSpriteset15:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 16
                ; # AI Regions
                dc.b 2
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 14, 20
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 13, 21
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 15, 21
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 13, 20
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 15, 20
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 14, 21
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 12, 21
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 16, 21
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 16, 20
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 12, 20
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 14, 22
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 11, 21
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant ARROW_LAUNCHER, 14, 5
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant GOLEM, 13, 4
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant GARGOYLE, 16, 5
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant MASTER_MAGE, 5, 3
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant BLACK_MONK, 7, 4
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|3, 0, NONE, 15, 0, STARTING
                
                enemyCombatant GOLEM, 8, 9
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant GARGOYLE, 2, 10
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant MASTER_MAGE, 21, 5
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant BLACK_MONK, 21, 9
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|9, 0, NONE, 15, 0, STARTING
                
                enemyCombatant GOLEM, 22, 10
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant GOLEM, 21, 17
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GOLEM, 12, 12
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GARGOYLE, 7, 15
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GARGOYLE, 26, 15
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant ARROW_LAUNCHER, 21, 13
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GOLEM, 2, 8
                combatantAiAndItem ATTACKER1, POWER_WATER
                combatantBehavior NONE, 15, NONE, 15, 0, HIDDEN
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 14
                dc.b 31, 14
                dc.b 31, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 9
                dc.b 31, 9
                dc.b 31, 0
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 14, 4
                
