
; ASM FILE data\battles\spritesets\spriteset11.asm :
; 0x1B3BF2..0x1B3D30 : Battle Spritesets 11
BattleSpriteset11:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 10
                ; # AI Regions
                dc.b 4
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 15, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 14, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 14, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 13, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 16, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 15, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 13, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 16, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 12, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 16, 22
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 12, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 11, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant HOBGOBLIN, 15, 4
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WITCH, 16, 5
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant VAMPIRE_BAT, 17, 3
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant VAMPIRE_BAT, 5, 7
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HUNTER_GOBLIN, 12, 14
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_DWARF, 13, 15
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_DWARF, 8, 16
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant WITCH, 18, 10
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                enemyCombatant HUNTER_GOBLIN, 20, 9
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                enemyCombatant VAMPIRE_BAT, 11, 4
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 3, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 21
                dc.b 25, 21
                dc.b 25, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 16
                dc.b 26, 16
                dc.b 26, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 13
                dc.b 26, 13
                dc.b 26, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 11
                dc.b 17, 11
                dc.b 26, 0
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 15, 4
                
