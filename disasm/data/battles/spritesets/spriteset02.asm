
; ASM FILE data\battles\spritesets\spriteset02.asm :
; 0x1B3376..0x1B33F4 : Battle Spritesets 02
BattleSpriteset02:
                ; # Allies
                dc.b 4
                ; # Enemies
                dc.b 6
                ; # AI Regions
                dc.b 0
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 13, 12
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 0, NONE, 0, 0, STARTING
                
                allyCombatant 1, 12, 12
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 0, NONE, 0, 0, STARTING
                
                allyCombatant 2, 13, 13
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 0, NONE, 0, 0, STARTING
                
                allyCombatant 3, 12, 13
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 0, NONE, 0, 0, STARTING
                
                ; Enemies
                enemyCombatant HUGE_RAT, 3, 5
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant OOZE, 5, 6
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant OOZE, 4, 10
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HUGE_RAT, 5, 14
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant OOZE, 7, 16
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|3, 15, NONE, 15, 0, STARTING
                
                enemyCombatant OOZE, 13, 6
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Points
                dc.b 3, 5
                
