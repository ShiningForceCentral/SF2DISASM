
; ASM FILE data\battles\global\losablebattles-standard.asm :

; Battles that are completed even in case of defeat.
table_LosableBattles:
                
                ; battle index, map index to warp to (or -1 to stay on current map)
                dc.b BATTLE_AMBUSHED_BY_GALAM_SOLDIERS, MAP_GALAM_INTERIORS ; battle 4, map 17
                
                tableEnd.b
