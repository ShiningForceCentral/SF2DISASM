
; ASM FILE data\stats\items\egresspositionsforbattles-standard.asm :

; Battles for which a specific Egress map is forced.
table_EgressPositionsForBattles:
                
                ; Battle index, map index (or 255 to clear the battle unlocked flag)
                dc.b BATTLE_VERSUS_GESHP, 255
                dc.b BATTLE_TO_ANCIENT_SHRINE, 255
                dc.b BATTLE_VERSUS_KRAKEN, MAP_POLCA
                dc.b BATTLE_TO_TAROS_SHRINE, MAP_HASSAN
                dc.b BATTLE_POLCA_VILLAGE, MAP_MOUNT_VOLCANON
                dc.b BATTLE_PACALON, MAP_PACALON_CASTLE
                dc.b BATTLE_TO_MOUN, MAP_PACALON
                
                tableEnd.b
