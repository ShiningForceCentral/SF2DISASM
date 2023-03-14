
; ASM FILE data\battles\spritesets\spriteset36.asm :
; 0x1B5F14..0x1B60BE : Battle Spritesets 36
BattleSpriteset36:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 20
                ; # AI Regions
                dc.b 3
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 19, 5
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 19, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 20, 3
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 18, 3
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 20, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 17, 3
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 18, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 19, 3
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 16, 3
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 21, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 21, 5
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 17, 4
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant EXECUTIONER, 8, 27
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant PRISM_FLOWER, 11, 7
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant PRISM_FLOWER, 6, 11
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant PRISM_FLOWER, 12, 16
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant PRISM_FLOWER, 13, 17
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant PRISM_FLOWER, 14, 19
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant PRISM_FLOWER, 15, 20
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant PRISM_FLOWER, 18, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant PRISM_FLOWER, 7, 26
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant CHAOS_WIZARD, 7, 27
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant SHAMAN, 9, 28
                combatantAiAndItem HEALER5, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DRAGONEWT, 14, 10
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant GRIFFIN, 14, 12
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BOW_RIDER, 16, 12
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant PURPLE_WORM, 12, 15
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|15, 0, FOLLOW_ENEMY|15, 2, 0, STARTING
                
                enemyCombatant BOW_RIDER, 9, 14
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, FOLLOW_TARGET|0, 2, 0, STARTING
                
                enemyCombatant MIST_DEMON, 17, 20
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant BOW_RIDER, 18, 21
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior 144|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant BOW_RIDER, 6, 21
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant MIST_DEMON, 8, 22
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 31
                dc.b 27, 21
                dc.b 6, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 10
                dc.b 0, 31
                dc.b 27, 31
                dc.b 27, 10
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 22
                dc.b 0, 31
                dc.b 27, 31
                dc.b 27, 22
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 8, 27
                
