
; ASM FILE data\battles\spritesets\spriteset01.asm :
; 0x1B32E2..0x1B3376 : Battle Spritesets 01
BattleSpriteset01:
                ; # Allies
                dc.b 3
                ; # Enemies
                dc.b 6
                ; # AI Regions
                dc.b 3
                ; # AI Points
                dc.b 0
                
                ; Allies
                allyCombatant 0, 8, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 0, NONE, 0, 0, STARTING
                
                allyCombatant 1, 9, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 0, NONE, 0, 0, STARTING
                
                allyCombatant 2, 7, 18
                combatantAiAndItem HEALER1, NOTHING
                combatantBehavior NONE, 0, NONE, 0, 0, STARTING
                
                ; Enemies
                enemyCombatant GIZMO, 7, 3
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 96, STARTING
                
                enemyCombatant GIZMO, 9, 4
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 96, STARTING
                
                enemyCombatant GIZMO, 6, 4
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 2, NONE, 15, 96, STARTING
                
                enemyCombatant GIZMO, 8, 3
                combatantAiAndItem ATTACKER1, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 96, STARTING
                
                enemyCombatant GIZMO, 9, 5
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 1, NONE, 15, 112, STARTING
                
                enemyCombatant GIZMO, 6, 5
                combatantAiAndItem ATTACKER2, NOTHING
                combatantBehavior NONE, 0, NONE, 15, 112, STARTING
                
                ; AI Regions
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 19
                dc.b 15, 7
                dc.b 15, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 7
                dc.b 15, 19
                dc.b 15, 0
                dc.b 0
                dc.b 0
                
                dc.b 4
                dc.b 0
                dc.b 0, 0
                dc.b 0, 12
                dc.b 15, 12
                dc.b 15, 0
                dc.b 0
                
                dc.b 0
                
