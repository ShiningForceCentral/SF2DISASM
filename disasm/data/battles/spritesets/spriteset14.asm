
; ASM FILE data\battles\spritesets\spriteset14.asm :
; 0x1B4000..0x1B416C : Battle Spritesets 14
BattleSpriteset14:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 15
                ; # AI Regions
                dc.b 3
                ; # AI Points
                dc.b 0
                
                ; Allies
                allyCombatant 0, 4, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 4, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 3, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 4, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 3, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 3, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 2, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 2, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 2, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 1, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 1, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 1, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant GOLEM, 22, 11
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 0, NONE, 1, 0, STARTING
                
                enemyCombatant GOLEM, 23, 12
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 0, NONE, 1, 0, STARTING
                
                enemyCombatant EVIL_CLOUD, 24, 9
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 1, 0, STARTING
                
                enemyCombatant MASTER_MAGE, 10, 28
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ZOMBIE, 9, 29
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant EVIL_CLOUD, 10, 19
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DEATH_ARCHER, 12, 22
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BLACK_MONK, 11, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ZOMBIE, 10, 12
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DEATH_ARCHER, 11, 16
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GOLEM, 15, 20
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ZOMBIE, 14, 18
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ZOMBIE, 19, 17
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|13, 2, NONE, 15, 0, STARTING
                
                enemyCombatant BLACK_MONK, 16, 15
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|14, 2, NONE, 15, 0, STARTING
                
                enemyCombatant GOLEM, 15, 13
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 4, 12
                dc.b 22, 28
                dc.b 31, 18
                dc.b 14, 1
                dc.b 0
                dc.b 0
                
                dc.b 3
                dc.b 0
                dc.b 16, 31
                dc.b 31, 31
                dc.b 31, 17
                dc.b 0, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 12, 0
                dc.b 0, 12
                dc.b 18, 31
                dc.b 31, 18
                dc.b 0
                
                dc.b 0
                
