
; ASM FILE data\battles\spritesets\spriteset24.asm :
; 0x1B4D2C..0x1B4EA6 : Battle Spritesets 24
BattleSpriteset24:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 16
                ; # AI Regions
                dc.b 3
                ; # AI Points
                dc.b 1
                
                ; Allies
                allyCombatant 0, 4, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 3, 17
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 3, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 2, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 3, 19
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 2, 17
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 2, 19
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 2, 16
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 3, 16
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 1, 16
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 1, 17
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 1, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant DARK_BISHOP, 25, 7
                combatantAiAndItem LEADER, NOTHING
                combatantBehavior MOVE_TO|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SNIPER, 25, 5
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant SKELETON, 24, 8
                combatantAiAndItem ATTACKER3, MEDICAL_HERB|USABLE_BY_AI
                combatantBehavior FOLLOW_ENEMY|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant LESSER_DEMON, 28, 10
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SNIPER, 18, 13
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 0, 0, STARTING
                
                enemyCombatant SKELETON, 21, 14
                combatantAiAndItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI|UNUSED_ITEM_DROP
                combatantBehavior NONE, 1, NONE, 0, 0, STARTING
                
                enemyCombatant SKELETON, 17, 18
                combatantAiAndItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_BISHOP, 18, 19
                combatantAiAndItem HEALER3, BLIZZARD|USABLE_BY_AI|UNUSED_ITEM_DROP
                combatantBehavior FOLLOW_ENEMY|6, 15, NONE, 15, 0, STARTING
                
                enemyCombatant SKELETON, 18, 20
                combatantAiAndItem HEALER3, MEDICAL_HERB|USABLE_BY_AI
                combatantBehavior FOLLOW_ENEMY|6, 15, NONE, 15, 0, STARTING
                
                enemyCombatant LESSER_DEMON, 22, 25
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 1, 0, STARTING
                
                enemyCombatant LESSER_DEMON, 21, 26
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 1, 0, STARTING
                
                enemyCombatant SKELETON, 11, 21
                combatantAiAndItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant SKELETON, 9, 25
                combatantAiAndItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI|UNUSED_ITEM_DROP
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SNIPER, 8, 24
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|12, 15, NONE, 15, 0, STARTING
                
                enemyCombatant LESSER_DEMON, 14, 3
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 2, 0, STARTING
                
                enemyCombatant LESSER_DEMON, 8, 8
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior FOLLOW_TARGET|0, 1, NONE, 2, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 9, 18
                dc.b 13, 29
                dc.b 31, 29
                dc.b 31, 18
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 19, 0
                dc.b 10, 18
                dc.b 31, 18
                dc.b 31, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 10
                dc.b 10, 17
                dc.b 19, 0
                dc.b 0
                dc.b 0
                
                ; AI Points
                dc.b 25, 7
                
