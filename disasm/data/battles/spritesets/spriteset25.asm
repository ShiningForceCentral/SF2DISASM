
; ASM FILE data\battles\spritesets\spriteset25.asm :
; 0x1B4EA6..0x1B5012 : Battle Spritesets 25
BattleSpriteset25:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 15
                ; # AI Regions
                dc.b 3
                ; # AI Points
                dc.b 0
                
                ; Allies
                allyCombatant 0, 25, 26
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 26, 26
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 27, 26
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 26, 27
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 27, 27
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 28, 27
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 27, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 26, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 28, 26
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 28, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 27, 28
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 28, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant DARK_SOLDIER, 24, 7
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_BISHOP, 21, 10
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant LESSER_DEMON, 19, 9
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 0, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_BISHOP, 6, 6
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|4, 1, NONE, 1, 0, STARTING
                
                enemyCombatant DARK_SNIPER, 7, 9
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|5, 1, NONE, 1, 0, STARTING
                
                enemyCombatant SKELETON, 5, 10
                combatantAiAndItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI|UNUSED_ITEM_DROP
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                enemyCombatant LESSER_DEMON, 14, 12
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                enemyCombatant SKELETON, 10, 16
                combatantAiAndItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SNIPER, 8, 17
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant LESSER_DEMON, 6, 28
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SNIPER, 13, 28
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|11, 15, NONE, 15, 0, STARTING
                
                enemyCombatant SKELETON, 14, 27
                combatantAiAndItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant SKELETON, 15, 19
                combatantAiAndItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_SNIPER, 18, 21
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|14, 15, NONE, 15, 0, STARTING
                
                enemyCombatant SKELETON, 20, 22
                combatantAiAndItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI|UNUSED_ITEM_DROP
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 14
                dc.b 31, 14
                dc.b 31, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 31
                dc.b 7, 31
                dc.b 31, 7
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 31
                dc.b 18, 31
                dc.b 18, 0
                dc.b 0
                
                dc.b 0
                
