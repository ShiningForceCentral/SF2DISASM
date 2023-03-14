
; ASM FILE data\battles\spritesets\spriteset17.asm :
; 0x1B43F2..0x1B4546 : Battle Spritesets 17
BattleSpriteset17:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 14
                ; # AI Regions
                dc.b 2
                ; # AI Points
                dc.b 0
                
                ; Allies
                allyCombatant 0, 24, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 24, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 24, 22
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 24, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 25, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 25, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 25, 22
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 26, 22
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 26, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 27, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 27, 22
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 26, 21
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant SOULSOWER, 1, 10
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior FOLLOW_TARGET|1, 15, NONE, 15, 0, STARTING
                
                enemyCombatant MASTER_MAGE, 4, 15
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|1, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BLACK_MONK, 3, 19
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior FOLLOW_TARGET|1, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GARGOYLE, 6, 6
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GARGOYLE, 6, 17
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GARGOYLE, 13, 9
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ARROW_LAUNCHER, 16, 10
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GOLEM, 11, 19
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant SOULSOWER, 9, 21
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant MASTER_MAGE, 18, 15
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GOLEM, 17, 20
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BLACK_MONK, 14, 22
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|13, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ARROW_LAUNCHER, 15, 23
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GARGOYLE, 15, 26
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 31
                dc.b 17, 31
                dc.b 17, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 31
                dc.b 12, 31
                dc.b 12, 0
                dc.b 0
                
                dc.b 0
                
