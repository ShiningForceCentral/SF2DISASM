
; ASM FILE data\stats\allies\classes\criticalhitsettings.asm :
; 0xACCA..0xACEA : Critical hit settings
tbl_CriticalHitSettings:
                
; Syntax        dc.b chance, modifier
;               
; Notes: Chance to inflict critical hit = 1/chance
;        Additional damage = damage/2^modifier
                
                dc.b 32, 1              ; 1/32 chance to inflict +50% damage
                dc.b 32, 2              ; 1/32 chance to inflict +25% damage
                dc.b 16, 1              ; 1/16 chance to inflict +50% damage
                dc.b 16, 2              ; 1/16 chance to inflict +25% damage
                dc.b 8, 1               ; 1/8 chance to inflict +50% damage
                dc.b 8, 2               ; 1/8 chance to inflict +25% damage
                dc.b 4, 1               ; 1/4 chance to inflict +50% damage
                dc.b 4, 2               ; 1/4 chance to inflict +25% damage
                dc.b 0, 0               ; No chance to inflict critical hits
                dc.b 4, 0               ; 1/4 chance to inflict poison, no additional damage
                dc.b 4, 0               ; 1/4 chance to inflict sleep, no additional damage
                dc.b 4, 0               ; 1/4 chance to inflict stun, no additional damage
                dc.b 4, 0               ; 1/4 chance to inflict muddle, no additional damage
                dc.b 4, 0               ; 1/4 chance to inflict slow, no additional damage
                dc.b 4, 0               ; 1/4 chance to drain MP, no additional damage
                dc.b 4, 0               ; 1/4 chance to inflict silence, no additional damage
