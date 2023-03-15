
; ASM FILE data\battles\spritesets\spriteset21.asm :
; 0x1B4950..0x1B4AA4 : Battle Spritesets 21
BattleSpriteset21:
                ; # Allies
                dc.b 12
                ; # Enemies
                dc.b 12
                ; # AI Regions
                dc.b 4
                ; # AI Points
                dc.b 0
                
                ; Allies
                allyCombatant 0, 27, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 1, 27, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 2, 27, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 3, 28, 26
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 4, 28, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 5, 28, 22
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 6, 28, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 7, 28, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 8, 29, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 9, 29, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 10, 30, 23
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                allyCombatant 11, 30, 24
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; Enemies
                enemyCombatant SKELETON, 7, 23
                combatantAiAndItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI
                combatantBehavior NONE, 1, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_MADAM, 8, 22
                combatantAiAndItem ATTACKER3, PROTECT_RING|EQUIPPED|UNUSED_ITEM_DROP
                combatantBehavior FOLLOW_ENEMY|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant HIGH_PRIEST, 9, 24
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|0, 1, NONE, 15, 0, STARTING
                
                enemyCombatant DARK_MADAM, 13, 18
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 0, STARTING
                
                enemyCombatant HIGH_PRIEST, 15, 19
                combatantAiAndItem HEALER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|3, 0, NONE, 15, 0, STARTING
                
                enemyCombatant ORC, 23, 14
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ORC, 19, 16
                combatantAiAndItem ATTACKER3, NOTHING
                combatantBehavior FOLLOW_ENEMY|7, 15, NONE, 15, 0, STARTING
                
                enemyCombatant SKELETON, 21, 17
                combatantAiAndItem ATTACKER1, MEDICAL_HERB|USABLE_BY_AI
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant HARPY, 15, 25
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 0, STARTING
                
                enemyCombatant HARPY, 13, 31
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 3, NONE, 15, 0, STARTING
                
                enemyCombatant ORC, 20, 29
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                enemyCombatant ARROW_LAUNCHER, 26, 33
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 15, NONE, 15, 0, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 40
                dc.b 31, 15
                dc.b 31, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 21
                dc.b 9, 32
                dc.b 20, 23
                dc.b 11, 13
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 15
                dc.b 0, 41
                dc.b 23, 41
                dc.b 23, 15
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 1
                dc.b 0, 41
                dc.b 31, 41
                dc.b 31, 37
                dc.b 0
                
                dc.b 0
                
