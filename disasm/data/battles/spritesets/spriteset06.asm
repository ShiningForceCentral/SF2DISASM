
; ASM FILE data\battles\spritesets\spriteset06.asm :
; 0x1B365C..0x1B3720 : Battle Spritesets 06
BattleSpriteset06:
                ; # Allies
                dc.b 6
                ; # Enemies
                dc.b 9
                ; # AI Regions
                dc.b 1
                ; # AI Points
                dc.b 0
                
                ; Allies
                allyCombatant 0, 11, 6
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 10, 6
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 9, 6
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 11, 7
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 10, 7
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 9, 7
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant DARK_CLERIC, 7, 29
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|1, 0, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_MAGE, 6, 28
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_SOLDIER, 15, 12
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_KNIGHT, 7, 13
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_ARCHER, 16, 13
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_KNIGHT, 8, 18
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_MAGE, 10, 20
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_SOLDIER, 6, 25
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM_SOLDIER, 8, 29
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 15
                dc.b 0, 31
                dc.b 19, 31
                dc.b 19, 15
                dc.b 0
                
                dc.b 0
                
