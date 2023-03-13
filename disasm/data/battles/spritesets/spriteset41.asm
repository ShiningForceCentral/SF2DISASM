
; ASM FILE data\battles\spritesets\spriteset41.asm :
; 0x1B66EE..0x1B68B0 : Battle Spritesets 41
BattleSpriteset41:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 20
                ; # AI Regions
                dc.b 5
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 16, 26
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 17, 26
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 15, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 16, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 17, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 17, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 15, 26
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 15, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 14, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 14, 26
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 16, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 14, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant REAPER, 16, 8
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BLUE_SHAMAN, 15, 5
                combatantAiAndItem HEALER5, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DEMON_MASTER, 17, 6
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HYDRA, 23, 6
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|4, 15, NONE, 15, 0, STARTING
                
                enemyCombatant CHAOS_WARRIOR, 24, 5
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DEMON, 18, 12
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant CHAOS_WARRIOR, 18, 13
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DEMON_MASTER, 20, 13
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|5, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HYDRA, 13, 12
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant CHAOS_WARRIOR, 13, 13
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DEMON_MASTER, 9, 12
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|11, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DEMON, 7, 11
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant CHAOS_WARRIOR, 15, 19
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|13, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HYDRA, 18, 18
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HYDRA, 18, 19
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HYDRA, 22, 18
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior 144|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DEMON, 23, 17
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DEMON, 3, 18
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 4, 0, STARTING
                
                enemyCombatant CHAOS_DRAGON, 28, 9
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 3, 0, STARTING
                
                enemyCombatant CHAOS_DRAGON, 5, 3
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 22
                dc.b 19, 22
                dc.b 19, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 17
                dc.b 18, 17
                dc.b 18, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 12, 0
                dc.b 12, 11
                dc.b 31, 11
                dc.b 31, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 26, 12
                dc.b 26, 19
                dc.b 31, 19
                dc.b 31, 12
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 24
                dc.b 0, 28
                dc.b 5, 28
                dc.b 5, 24
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 17, 7
                
