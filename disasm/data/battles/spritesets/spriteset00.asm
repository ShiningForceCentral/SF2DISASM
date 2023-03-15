
; ASM FILE data\battles\spritesets\spriteset00.asm :
; 0x1B31A2..0x1B32E2 : Battle Spritesets 00
BattleSpriteset00:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 12
                ; # AI Regions
                dc.b 2
                ; # AI Points
                dc.b 2
                
                ; Allies
                allyCombatant 0, 15, 27
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 15, 28
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 14, 29
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 16, 29
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 13, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 17, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 13, 29
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 17, 29
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 14, 28
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 16, 28
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 12, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 18, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant ZEON, 18, 5
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SMOKE, 12, 17
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior MOVE_TO|1, 15, NONE, 15, 0, STARTING
                
                enemyCombatant KING, 22, 19
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WILLARD, 10, 18
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|2, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ZALBARD, 15, 14
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant CAMEELA, 19, 15
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|7, 1, NONE, 15, 0, STARTING
                
                enemyCombatant RED_BARON, 20, 6
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GESHP, 21, 11
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                enemyCombatant ODD_EYE, 12, 11
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|9, 0, NONE, 15, 0, STARTING
                
                enemyCombatant GALAM, 15, 7
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant PRISM_FLOWER, 5, 20
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant PRISM_FLOWER, 27, 13
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 4
                dc.b 0, 22
                dc.b 13, 22
                dc.b 30, 4
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 4
                dc.b 19, 24
                dc.b 30, 24
                dc.b 30, 4
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 18, 5
                dc.b 15, 22
                
