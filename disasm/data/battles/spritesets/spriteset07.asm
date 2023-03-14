
; ASM FILE data\battles\spritesets\spriteset07.asm :
; 0x1B3720..0x1B3822 : Battle Spritesets 07
BattleSpriteset07:
                ; # Allies
                dc.b 7
                ; # Enemies
                dc.b 10
                ; # AI Regions
                dc.b 4
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 13, 33
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 13, 34
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 13, 35
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 12, 34
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 14, 34
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 12, 35
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 14, 35
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant DARK_SMOKE, 10, 14
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SMOKE, 16, 16
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_MAGE, 22, 17
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|1, 2, FOLLOW_ENEMY|1, 3, 0, STARTING
                
                enemyCombatant DARK_CLERIC, 23, 18
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|1, 2, FOLLOW_ENEMY|1, 3, 0, STARTING
                
                enemyCombatant GALAM_ARCHER, 18, 22
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_KNIGHT, 9, 24
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_ARCHER, 7, 25
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|5, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_ARCHER, 19, 30
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|8, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_KNIGHT, 22, 31
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_KNIGHT, 7, 29
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 29
                dc.b 26, 29
                dc.b 26, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 25
                dc.b 26, 25
                dc.b 26, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 27
                dc.b 26, 27
                dc.b 26, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 17
                dc.b 0, 29
                dc.b 12, 29
                dc.b 26, 17
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 13, 16
                
