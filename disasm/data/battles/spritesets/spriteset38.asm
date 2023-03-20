
; ASM FILE data\battles\spritesets\spriteset38.asm :
; 0x1B6250..0x1B63FA : Battle Spritesets 38
BattleSpriteset38:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 20
                ; # AI Regions
                dc.b 3
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 13, 11
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 14, 11
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 14, 10
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 13, 10
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 14, 9
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 13, 9
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 12, 9
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 11, 9
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 12, 11
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 11, 10
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 12, 10
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 11, 11
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant GESHP, 7, 27
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_GUNNER, 7, 26
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WHITE_DRAGON, 8, 26
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant CYCLOPS, 8, 27
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant MIST_DEMON, 12, 19
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|5, 15, NONE, 15, 0, STARTING
                
                enemyCombatant CHAOS_WIZARD, 13, 20
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant EVIL_BISHOP, 15, 20
                combatantAiAndItem HEALER4, FAIRY_TEAR|USABLE_BY_AI
                combatantBehavior FOLLOW_ENEMY|5, 15, FOLLOW_ENEMY|0, 15, 0, STARTING
                
                enemyCombatant HELL_HOUND, 19, 14
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant MINOTAUR, 19, 15
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_GUNNER, 20, 15
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WHITE_DRAGON, 6, 17
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant BURST_ROCK, 14, 15
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, HIDDEN
                
                enemyCombatant BURST_ROCK, 10, 12
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, HIDDEN
                
                enemyCombatant BURST_ROCK, 11, 14
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, HIDDEN
                
                enemyCombatant BURST_ROCK, 12, 16
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 1, NONE, 15, 0, HIDDEN
                
                enemyCombatant BURST_ROCK, 15, 18
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 1, NONE, 15, 0, HIDDEN
                
                enemyCombatant BURST_ROCK, 12, 20
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 1, NONE, 15, 0, HIDDEN
                
                enemyCombatant BURST_ROCK, 12, 22
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 2, NONE, 15, 0, HIDDEN
                
                enemyCombatant BURST_ROCK, 9, 24
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 2, NONE, 15, 0, HIDDEN
                
                enemyCombatant BURST_ROCK, 10, 26
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 2, NONE, 15, 0, HIDDEN
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 13
                dc.b 0, 31
                dc.b 31, 31
                dc.b 31, 13
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 19
                dc.b 0, 31
                dc.b 31, 31
                dc.b 31, 19
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 24
                dc.b 0, 31
                dc.b 31, 31
                dc.b 31, 24
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 7, 27
                
