
; ASM FILE data\battles\spritesets\spriteset40.asm :
; 0x1B6538..0x1B66EE : Battle Spritesets 40
BattleSpriteset40:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 20
                ; # AI Regions
                dc.b 4
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 15, 35
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 16, 35
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 15, 36
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 16, 36
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 15, 37
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 16, 37
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 15, 38
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 16, 38
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 14, 36
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 17, 36
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 14, 37
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 17, 37
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant ODD_EYE, 16, 5
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 2, NONE, 15, 0, STARTING
                
                enemyCombatant DEMON_MASTER, 15, 5
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 2, NONE, 15, 0, STARTING
                
                enemyCombatant EVIL_BISHOP, 16, 3
                combatantAiAndItem HEALER5, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 2, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_GUNNER, 15, 8
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|5, 1, NONE, 1, 0, STARTING
                
                enemyCombatant HYDRA, 13, 9
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|5, 1, NONE, 1, 0, STARTING
                
                enemyCombatant CHAOS_WARRIOR, 16, 9
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                enemyCombatant DEMON, 18, 3
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant WHITE_DRAGON, 12, 4
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant DEMON, 5, 27
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_GUNNER, 8, 14
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|10, 3, NONE, 3, 0, STARTING
                
                enemyCombatant CHAOS_WIZARD, 10, 12
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|11, 3, NONE, 3, 0, STARTING
                
                enemyCombatant CHAOS_WARRIOR, 12, 13
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 3, NONE, 15, 0, STARTING
                
                enemyCombatant CYCLOPS, 12, 22
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant CHAOS_WIZARD, 9, 22
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|15, 0, NONE, 0, 0, STARTING
                
                enemyCombatant EVIL_BISHOP, 5, 23
                combatantAiAndItem HEALER3, FAIRY_TEAR|USABLE_BY_AI|UNUSED_ITEM_DROP
                combatantBehavior FOLLOW_ENEMY|15, 0, NONE, 0, 0, STARTING
                
                enemyCombatant CYCLOPS, 24, 17
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant CHAOS_WARRIOR, 18, 21
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant CYCLOPS, 22, 22
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant HYDRA, 15, 17
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WHITE_DRAGON, 21, 28
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 24
                dc.b 0, 32
                dc.b 31, 32
                dc.b 31, 24
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 23
                dc.b 31, 23
                dc.b 31, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 16
                dc.b 31, 16
                dc.b 31, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 22
                dc.b 17, 22
                dc.b 27, 0
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 16, 5
                
