
; ASM FILE data\battles\global\randombattles.asm :
; 0x1B6DB0..0x1B6DDA : Random battles list, and data related to enemy upgrade functions
list_RandomBattles:
                
; List of battles prefixed with length.
;
; Syntax        battles [BATTLE_]enum,..[BATTLE_]enum
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                battles TO_HAWEL_HOUSE, &
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
table_MeleeTypeEnemyUpgradeDefinition:
                
; 3 bytes per entry, followed by a length prefixed list :
;       0:  base upgrade range (applied to a multiplier based on Bowie's effective level)
;       1:  first upgradable enemy
;       2:  last upgradable enemy
;       3+: list of excluded enemies
;               
; Syntax        upgradeRange    parameter, [ENEMY_]enum, [ENEMY_]enum
;               excludedEnemies [ENEMY_]enum,..[ENEMY_]enum
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                upgradeRange    5, OOZE, REAPER ; Regular, Centaur, Stealth, and Gunner movetypes
                excludedEnemies KRAKEN_LEG, PAWN, KNIGHT, RAT, BURST_ROCK, ZEON_GUARD
                
table_AirborneTypeEnemyUpgradeDefinition:
                upgradeRange    2, HUGE_BAT, DEMON ; Flying and Hovering movetypes
                excludedEnemies  ; blank entry causes enemy upgrade failure
                
table_RangedTypeEnemyUpgradeDefinition:
                upgradeRange    2, GALAM_ARCHER, DARK_GUNNER ; Archer, Centaur Archer, and Stealth Archer movetypes
                excludedEnemies KRAKEN_ARM, ROOK
                
table_MageTypeEnemyUpgradeDefinition:
                upgradeRange    1, GALAM_MAGE, CHAOS_WIZARD ; Mage movetype
                excludedEnemies QUEEN
                
table_HealerTypeEnemyUpgradeDefinition:
                upgradeRange    2, DARK_CLERIC, EVIL_BISHOP ; Healer movetype
                excludedEnemies BISHOP
                
