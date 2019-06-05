
; ASM FILE data\stats\allies\classes\criticalhitsettings.asm :
; 0xACCA..0xACEA : Critical hit settings
CriticalHitSettings:
                ; a : Chance to perform critical hit = 1/a
                ; b : Additional damage = damage/2^b
                    
                dc.b 32, 1              ; 1/32, 150% damage
                dc.b 32, 2              ; 1/32, 125% damage
                dc.b 16, 1              ; 1/16, 150% damage
                dc.b 16, 2              ; 1/16, 125% damage
                dc.b 8, 1               ; 1/8, 150% damage
                dc.b 8, 2               ; 1/8, 125% damage
                dc.b 4, 1               ; 1/4, 150% damage
                dc.b 4, 2               ; 1/4, 125% damage
                dc.b 0, 0               ; No critical hits
                dc.b 4, 0               ; Poison attack
                dc.b 4, 0               ; Sleep attack
                dc.b 4, 0               ; Stun attack
                dc.b 4, 0               ; Muddle attack
                dc.b 4, 0               ; Slow attack
                dc.b 4, 0               ; Magic drain attack
                dc.b 4, 0               ; Silence attack
