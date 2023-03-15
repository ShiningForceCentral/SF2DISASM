
; ASM FILE data\battles\spritesets\spriteset44.asm :
; 0x1B6BBE..0x1B6DB0 : Battle Spritesets 44
BattleSpriteset44:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 15
                ; # AI Regions
                dc.b 14
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 11, 28
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 11, 29
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 11, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 10, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 12, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 12, 29
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 10, 29
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 9, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 13, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 13, 29
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 9, 29
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 14, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant BUBBLING_OOZE, 9, 2
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BLUE_SHAMAN_0, 5, 2
                combatantAiAndItem HEALER5, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 0, NONE, 15, 0, 3
                
                enemyCombatant ZOMBIE, 14, 4
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 0, 3
                
                enemyCombatant MIST_DEMON, 9, 6
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, 3
                
                enemyCombatant MIST_DEMON, 4, 6
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 3, NONE, 15, 0, HIDDEN
                
                enemyCombatant LESSER_DEMON, 13, 8
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 4, NONE, 15, 0, HIDDEN
                
                enemyCombatant LESSER_DEMON, 6, 10
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 5, NONE, 15, 0, HIDDEN
                
                enemyCombatant ORC_LORD, 4, 13
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 6, NONE, 15, 0, 3
                
                enemyCombatant MIST_DEMON, 9, 12
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 7, NONE, 15, 0, 3
                
                enemyCombatant MASTER_MONK, 15, 11
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 8, NONE, 15, 0, HIDDEN
                
                enemyCombatant DARK_SOLDIER, 10, 16
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 9, NONE, 15, 0, HIDDEN
                
                enemyCombatant DARK_MADAM, 14, 16
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 10, NONE, 15, 0, 3
                
                enemyCombatant HARPY, 5, 20
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 11, NONE, 15, 0, 3
                
                enemyCombatant MIST_DEMON, 12, 21
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 12, NONE, 15, 0, 3
                
                enemyCombatant LESSER_DEMON, 9, 23
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 13, NONE, 15, 0, 3
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 6, 6
                dc.b 11, 2
                dc.b 11, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 14, 2
                dc.b 12, 4
                dc.b 14, 6
                dc.b 16, 4
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 6, 0
                dc.b 6, 5
                dc.b 9, 8
                dc.b 17, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 1
                dc.b 0, 9
                dc.b 6, 9
                dc.b 6, 6
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 13, 6
                dc.b 11, 8
                dc.b 13, 10
                dc.b 15, 8
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 6, 7
                dc.b 3, 10
                dc.b 6, 13
                dc.b 9, 10
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 4, 10
                dc.b 1, 13
                dc.b 4, 16
                dc.b 7, 13
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 9, 9
                dc.b 6, 12
                dc.b 9, 15
                dc.b 12, 12
                dc.b 0
                dc.b 0
                
                dc.b 3
                dc.b 0
                dc.b 17, 8
                dc.b 12, 13
                dc.b 17, 13
                dc.b 0, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 10, 13
                dc.b 7, 16
                dc.b 10, 19
                dc.b 13, 16
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 14, 13
                dc.b 11, 16
                dc.b 14, 19
                dc.b 17, 16
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 5, 16
                dc.b 1, 20
                dc.b 5, 24
                dc.b 9, 20
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 12, 17
                dc.b 8, 21
                dc.b 12, 25
                dc.b 16, 21
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 9, 20
                dc.b 6, 23
                dc.b 9, 26
                dc.b 12, 23
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 9, 2
                
