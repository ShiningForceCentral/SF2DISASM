
; ASM FILE data\battles\spritesets\spriteset16.asm :
; 0x1B42DA..0x1B43F2 : Battle Spritesets 16
BattleSpriteset16:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 11
                ; # AI Regions
                dc.b 0
                ; # AI Points
                dc.b 0
                
                ; Allies
                allyCombatant 0, 15, 15
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 15, 17
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 14, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 13, 17
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 13, 14
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 15, 14
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 15, 16
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 14, 13
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 15, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 13, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 15, 13
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 13, 13
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant KRAKEN_HEAD, 26, 9
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant KRAKEN_ARM, 25, 17
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior FOLLOW_ENEMY|7, 15, NONE, 15, 0, STARTING
                
                enemyCombatant KRAKEN_ARM, 6, 11
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior FOLLOW_ENEMY|3, 15, NONE, 15, 0, STARTING
                
                enemyCombatant KRAKEN_LEG, 6, 15
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant KRAKEN_LEG, 7, 18
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant KRAKEN_LEG, 10, 20
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant KRAKEN_LEG, 21, 11
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant KRAKEN_LEG, 20, 15
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant KRAKEN_LEG, 23, 20
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant KRAKEN_LEG, 13, 5
                combatantAiAndItem SWARM, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant KRAKEN_LEG, 16, 26
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
