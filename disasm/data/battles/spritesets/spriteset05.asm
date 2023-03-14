
; ASM FILE data\battles\spritesets\spriteset05.asm :
; 0x1B35A2..0x1B365C : Battle Spritesets 05
BattleSpriteset05:
                ; # Allies
                dc.b 6
                ; # Enemies
                dc.b 8
                ; # AI Regions
                dc.b 1
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 3, 5
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 4, 5
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 2, 5
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 4, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 3, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 2, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant GALAM_KNIGHT, 17, 4
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_ARCHER, 14, 5
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_MAGE, 15, 7
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_SOLDIER, 11, 4
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_ARCHER, 10, 7
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_SOLDIER, 9, 9
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_SOLDIER, 19, 2
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_MAGE, 17, 1
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 0, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 12, 0
                dc.b 12, 13
                dc.b 23, 13
                dc.b 23, 0
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 17, 4
                
