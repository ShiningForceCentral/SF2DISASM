
; ASM FILE data\battles\spritesets\spriteset30.asm :
; 0x1B55FC..0x1B5782 : Battle Spritesets 30
BattleSpriteset30:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 16
                ; # AI Regions
                dc.b 4
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 11, 28
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 11, 29
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 10, 29
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 12, 29
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 11, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 10, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 12, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 11, 31
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 9, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 13, 30
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 12, 31
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 10, 31
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant ZALBARD, 11, 7
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 3, NONE, 15, 0, STARTING
                
                enemyCombatant MASTER_MONK, 12, 6
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 3, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_KNIGHT, 12, 8
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 3, NONE, 3, 0, STARTING
                
                enemyCombatant GARGOYLE, 8, 7
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|4, 3, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_KNIGHT, 9, 10
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|5, 3, NONE, 15, 0, STARTING
                
                enemyCombatant ORC_LORD, 7, 12
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HARPY_QUEEN, 11, 11
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior MOVE_TO|0, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WIZARD, 17, 10
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|8, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_KNIGHT, 16, 12
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HARPY_QUEEN, 2, 14
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant WYVERN, 18, 16
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_KNIGHT, 7, 18
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_KNIGHT, 17, 21
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ORC_LORD, 5, 22
                combatantAiAndItem SENTRY, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant WIZARD, 16, 21
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|12, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HARPY_QUEEN, 19, 15
                combatantAiAndItem ATTACKER1, MITHRIL|UNUSED_ITEM_DROP
                combatantBehavior NONE, 15, NONE, 15, 0, HIDDEN
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 21
                dc.b 23, 30
                dc.b 23, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 29
                dc.b 23, 20
                dc.b 23, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 18
                dc.b 23, 18
                dc.b 23, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 16
                dc.b 23, 16
                dc.b 23, 0
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 11, 13
                
