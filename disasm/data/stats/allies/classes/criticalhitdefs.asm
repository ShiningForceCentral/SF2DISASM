
; ASM FILE data\stats\allies\classes\criticalhitdefs.asm :
; 0xACCA..0xACEA : Critical hit settings definitions
table_CriticalHitDefinitions:
                
; Syntax        dc.b chance (1/n), damageFactor (additionalDamage = damage/2^n)
                
                dc.b 32, CRITICAL_HIT_DAMAGE_FACTOR_1 ; 1/32 chance to inflict +50% damage
                dc.b 32, CRITICAL_HIT_DAMAGE_FACTOR_2 ; 1/32 chance to inflict +25% damage
                dc.b 16, CRITICAL_HIT_DAMAGE_FACTOR_1 ; 1/16 chance to inflict +50% damage
                dc.b 16, CRITICAL_HIT_DAMAGE_FACTOR_2 ; 1/16 chance to inflict +25% damage
                dc.b 8, CRITICAL_HIT_DAMAGE_FACTOR_1 ; 1/8 chance to inflict +50% damage
                dc.b 8, CRITICAL_HIT_DAMAGE_FACTOR_2 ; 1/8 chance to inflict +25% damage
                dc.b 4, CRITICAL_HIT_DAMAGE_FACTOR_1 ; 1/4 chance to inflict +50% damage
                dc.b 4, CRITICAL_HIT_DAMAGE_FACTOR_2 ; 1/4 chance to inflict +25% damage
                dc.b 0, 0               ; No chance to inflict critical hits
                dc.b 4, 0               ; 1/4 chance to inflict poison, no additional damage
                dc.b 4, 0               ; 1/4 chance to inflict sleep, no additional damage
                dc.b 4, 0               ; 1/4 chance to inflict stun, no additional damage
                dc.b 4, 0               ; 1/4 chance to inflict muddle, no additional damage
                dc.b 4, 0               ; 1/4 chance to inflict slow, no additional damage
                dc.b 4, 0               ; 1/4 chance to drain MP, no additional damage
                dc.b 4, 0               ; 1/4 chance to inflict silence, no additional damage
