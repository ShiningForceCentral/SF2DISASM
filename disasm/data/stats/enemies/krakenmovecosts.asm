
; ASM FILE data\stats\enemies\krakenmovecosts.asm :
; 0xF9B4..0xF9C4 : Kraken move costs table
table_KrakenMoveCosts:
                dc.b 15                 ; special move cost list for Kraken Arm, Kraken Leg, Kraken Head
                dc.b 2
                dc.b 2
                dc.b 3
                dc.b 4
                dc.b 3
                dc.b 3
                dc.b -1
                dc.b 2
                dc.b -1
                dc.b -1
                dc.b -1
                dc.b -1
                dc.b -1
                dc.b -1
                dc.b -1


table_KrakenMoveCostEnemies:
            if (STANDARD_BUILD=1)
                dc.b ENEMY_KRAKEN_LEG
                dc.b ENEMY_KRAKEN_ARM
                dc.b ENEMY_KRAKEN_HEAD

                tableEnd.b
            endif
