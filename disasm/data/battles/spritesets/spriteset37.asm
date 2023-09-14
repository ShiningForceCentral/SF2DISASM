
; ASM FILE data\battles\spritesets\spriteset37.asm :
; 0x1B60BE..0x1B6250 : Battle Spritesets 37
BattleSpriteset37:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 18
                ; # AI Regions
                dc.b 3
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 39, 6
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 40, 6
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 39, 5
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 40, 5
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 41, 6
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 39, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 41, 5
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 40, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 41, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 42, 6
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 42, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 42, 5
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant RED_BARON, 19, 28
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant EVIL_BISHOP, 17, 28
                combatantAiAndItem HEALER5, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant CHAOS_WIZARD, 18, 27
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant MINOTAUR, 20, 24
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BOW_RIDER, 20, 25
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|3, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HELL_HOUND, 23, 27
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant CHAOS_WIZARD, 24, 18
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 2, NONE, 15, 0, STARTING
                
                enemyCombatant EVIL_BISHOP, 25, 20
                combatantAiAndItem HEALER4, NOTHING
                combatantBehavior FOLLOW_ENEMY|6, 2, FOLLOW_ENEMY|0, 15, 0, STARTING
                
                enemyCombatant HELL_HOUND, 26, 20
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|6, 2, NONE, 15, 0, STARTING
                
                enemyCombatant MIST_DEMON, 36, 29
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant HELL_HOUND, 38, 23
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|11, 1, NONE, 15, 0, STARTING
                
                enemyCombatant MINOTAUR, 39, 22
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant MIST_DEMON, 23, 2
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant EXECUTIONER, 31, 9
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BOW_RIDER, 32, 10
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|13, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BOW_RIDER, 31, 13
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HELL_HOUND, 32, 15
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|15, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BOW_RIDER, 33, 15
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior 144|0, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 15
                dc.b 0, 31
                dc.b 30, 31
                dc.b 30, 15
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 12
                dc.b 0, 31
                dc.b 47, 31
                dc.b 47, 12
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 31
                dc.b 47, 31
                dc.b 18, 0
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 19, 28
                
