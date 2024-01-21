
; ASM FILE data\stats\items\losablebattles-standard.asm :

; Battles that are completed even in case of defeat.  Use 'MAP_NONE' if no wakeup scene after battle loss.
table_LosableBattles:
                
                dc.b BATTLE_AMBUSHED_BY_GALAM_SOLDIERS, MAP_GALAM_CASTLE_INNER      ; battle 4
                
                tableEnd.b
