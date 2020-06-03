
; ASM FILE data\battles\global\randombattles.asm :
; 0x1B6DB0..0x1B6DBC : Random battles table
RandomBattlesList:
                
; List of battle indexes prefixed with length
;
; Syntax        randomBattles battle_index1, battle_index2, ...
                
                randomBattles &
                    TO_HAWEL_HOUSE, &
                    NORTH_CLIFF, &
                    TO_RIBBLE, &
                    TO_THE_EAST, &
                    SOUTHEAST_DESERT, &
                    TO_TAROS_SHRINE, &
                    OUTSIDE_ELVEN_VILLAGE, &
                    DEVIL_TAIL, &
                    TO_NORTH_PARMECIA, &
                    OUTSIDE_KETTO, &
                    TO_ROFT
