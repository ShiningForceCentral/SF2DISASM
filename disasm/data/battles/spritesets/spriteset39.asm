
; ASM FILE data\battles\spritesets\spriteset39.asm :
; 0x1B63FA..0x1B6538 : Battle Spritesets 39
BattleSpriteset39:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 14
                ; # AI Regions
                dc.b 0
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 8, 9
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 7, 9
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 6, 9
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 5, 8
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 6, 8
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 7, 8
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 5, 7
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 6, 7
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 7, 7
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 8, 7
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 8, 8
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 5, 9
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant HYDRA, 8, 24
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant CHAOS_WIZARD, 7, 23
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant EVIL_BISHOP, 9, 23
                combatantAiAndItem HEALER5, EVIL_RING|EQUIPPED|USABLE_BY_AI|UNUSED_ITEM_DROP
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_GUNNER, 6, 22
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant CYCLOPS, 10, 22
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WHITE_DRAGON, 2, 29
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WHITE_DRAGON, 9, 28
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HELL_HOUND, 7, 19
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|8, 15, NONE, 15, 0, STARTING
                
                enemyCombatant MINOTAUR, 8, 19
                combatantAiAndItem SENTRY, HOLY_THUNDER|USABLE_BY_AI|UNUSED_ITEM_DROP
                combatantBehavior FOLLOW_TARGET|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_GUNNER, 11, 18
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_GUNNER, 11, 15
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant MINOTAUR, 11, 2
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|12, 15, NONE, 15, 0, STARTING
                
                enemyCombatant CYCLOPS, 12, 2
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WHITE_DRAGON, 17, 9
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Points
                dc.b 8, 24
                
