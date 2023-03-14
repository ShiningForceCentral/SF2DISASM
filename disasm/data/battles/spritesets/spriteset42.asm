
; ASM FILE data\battles\spritesets\spriteset42.asm :
; 0x1B68B0..0x1B6A5A : Battle Spritesets 42
BattleSpriteset42:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 19
                ; # AI Regions
                dc.b 4
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 13, 32
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 14, 33
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 13, 33
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 12, 33
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 11, 33
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 14, 32
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 12, 32
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 11, 32
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 14, 34
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 13, 34
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 12, 34
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 11, 34
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant GALAM, 13, 18
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 0, NONE, 1, 0, STARTING
                
                enemyCombatant BLUE_SHAMAN, 12, 17
                combatantAiAndItem HEALER5, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 0, NONE, 1, 0, STARTING
                
                enemyCombatant DEMON_MASTER, 14, 17
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 0, NONE, 1, 0, STARTING
                
                enemyCombatant DEVIL_GRIFFIN, 9, 13
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DEVIL_GRIFFIN, 17, 17
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 3, NONE, 15, 0, HIDDEN
                
                enemyCombatant REAPER, 16, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 3, NONE, 15, 0, HIDDEN
                
                enemyCombatant EVIL_BEAST, 9, 17
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, HIDDEN
                
                enemyCombatant HORSEMAN, 8, 18
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, HIDDEN
                
                enemyCombatant REAPER, 10, 20
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant EVIL_BEAST, 12, 21
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DEMON_MASTER, 3, 19
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|12, 0, NONE, 15, 0, STARTING
                
                enemyCombatant EVIL_BEAST, 6, 20
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|12, 0, NONE, 15, 0, STARTING
                
                enemyCombatant CHAOS_WARRIOR, 4, 21
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant HORSEMAN, 19, 19
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|15, 1, NONE, 15, 0, STARTING
                
                enemyCombatant REAPER, 18, 20
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|15, 1, NONE, 15, 0, STARTING
                
                enemyCombatant CHAOS_DRAGON, 21, 21
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                enemyCombatant REAPER, 11, 26
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant CHAOS_WARRIOR, 13, 26
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HORSEMAN, 12, 27
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 31
                dc.b 25, 22
                dc.b 25, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 21
                dc.b 25, 32
                dc.b 25, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 7, 15
                dc.b 7, 18
                dc.b 11, 20
                dc.b 18, 15
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 11, 15
                dc.b 11, 20
                dc.b 18, 18
                dc.b 18, 15
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 13, 18
                
