
; ASM FILE data\stats\items\afterturnrecovery-standard.asm :

; Item index, recovery amount

table_AfterTurnHpRecoveryForWeapons:
                
                dc.b ITEM_HOLY_STAFF, 2
                
                tableEnd.b


table_AfterTurnHpRecoveryForRings:
                
                dc.b ITEM_LIFE_RING, 5
                
                tableEnd.b


table_AfterTurnMpRecoveryForWeapons:
                
                dc.b ITEM_MYSTERY_STAFF, 2
                
                tableEnd.b


table_AfterTurnMpRecoveryForRings:
                
                tableEnd.b
