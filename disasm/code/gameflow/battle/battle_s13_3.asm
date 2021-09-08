
; ASM FILE code\gameflow\battle\battle_s13_3.asm :
; 0x1B6DBC..0x1B6DDA : Data related to UpgradeUnitIdx function
byte_1B6DBC:    dc.b 5                  ; related to enemy selection in random battles, and tied to move type
                                        ; - regular
                                        ; - centaur
                                        ; - stealth
                                        ; - brass gunner
                                        ; 
                                        ; 0:   base chance to upgrade (?)
                                        ; 1-2: first and last upgradable enemies
                                        ; 3+:  list of excluded enemies
                dc.b ENEMY_OOZE
                dc.b ENEMY_REAPER
                dc.b 6
                dc.b ENEMY_KRAKEN_LEG
                dc.b ENEMY_PAWN
                dc.b ENEMY_KNIGHT
                dc.b ENEMY_RAT
                dc.b ENEMY_BURST_ROCK
                dc.b ENEMY_ZEON_GUARD
byte_1B6DC6:    dc.b 2                  ; - flying
                                        ; - hovering
                dc.b ENEMY_HUGE_BAT
                dc.b ENEMY_DEMON
                dc.b 0
byte_1B6DCA:    dc.b 2                  ; - archer
                                        ; - centaur archer
                                        ; - stealth archer
                dc.b ENEMY_GALAM_ARCHER
                dc.b ENEMY_DARK_GUNNER
                dc.b 2
                dc.b ENEMY_KRAKEN_ARM
                dc.b ENEMY_ROOK
byte_1B6DD0:    dc.b 1                  ; - mage
                dc.b ENEMY_GALAM_MAGE
                dc.b ENEMY_CHAOS_WIZARD
                dc.b 1
                dc.b ENEMY_QUEEN
byte_1B6DD5:    dc.b 2                  ; - healer
                dc.b ENEMY_DARK_CLERIC
                dc.b ENEMY_EVIL_BISHOP
                dc.b 1
                dc.b ENEMY_BISHOP
