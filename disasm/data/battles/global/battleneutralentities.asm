
; ASM FILE data\battles\global\battleneutralentities.asm :
; 0x448C4..0x4497A : Battle entities which are not force members or enemies
table_NeutralBattleEntities:
                
; Syntax        battle.w  [BATTLE_]enum
;               position  X,Y
;               facing    RIGHT, UP, LEFT, or DOWN
;               mapsprite [MAPSPRITE_]enum
;               dc.l pointer to entity actscript (see table below)
;               ...
;               dc.w TERMINATOR_WORD
                
                battle.w INSIDE_ANCIENT_TOWER
                
                position 7,4
                facing DOWN
                mapsprite MIST_DEMON
                dc.l eas_Standing
                position 7,6
                facing UP
                mapsprite ASTRAL
                dc.l eas_Standing
                dc.w TERMINATOR_WORD
                
                battle.w VERSUS_DARK_SMOKES
                position 13,21
                facing DOWN
                mapsprite ASTRAL
                dc.l eas_LyingLeft
                position 13,17
                facing DOWN
                mapsprite GALAM_EVIL
                dc.l eas_LyingLeft
                position 12,15
                facing DOWN
                mapsprite ELIS
                dc.l eas_Standing
                position 15,35
                facing UP
                mapsprite MINISTER
                dc.l eas_Standing
                position 11,35
                facing UP
                mapsprite GRANSEAL_KING
                dc.l eas_Standing
                dc.w TERMINATOR_WORD
                
                battle.w NORTH_CLIFF
                position 13,2
                facing DOWN
                mapsprite WORKER
                dc.l eas_LyingLeft
                dc.w TERMINATOR_WORD
                
                battle.w POLCA_VILLAGE
                position 16,13
                facing DOWN
                mapsprite LUKE_BASE
                dc.l eas_LyingLeft
                dc.w TERMINATOR_WORD
                
                battle.w VERSUS_TAROS
                position 12,5
                facing LEFT
                mapsprite CARAVAN
                dc.l eas_Motionless
                dc.w TERMINATOR_WORD
                
                battle.w HARPIES_POND
                position 6,6
                facing DOWN
                mapsprite ELRIC_BASE
                dc.l eas_WhirlsInWater
                dc.w TERMINATOR_WORD
                
                battle.w CHESSBOARD
                position 6,2
                facing DOWN
                mapsprite DESKTOP_KING
                dc.l eas_Standing
                position 5,3
                facing DOWN
                mapsprite MAID
                dc.l eas_Standing
                dc.w TERMINATOR_WORD
                
                battle.w OUTSIDE_KETTO
                position 18,14
                facing DOWN
                mapsprite HIGINS_PROMO
                dc.l eas_LyingLeft
                dc.w TERMINATOR_WORD
                
                battle.w PANGOAT_VALLEY_BRIDGE
                position 12,24
                facing UP
                mapsprite POSE3
                dc.l eas_Motionless
                dc.w TERMINATOR_WORD
                
                battle.w VERSUS_GALAM
                position 13,15
                facing DOWN
                mapsprite ELIS
                dc.l eas_LyingLeft
                dc.w TERMINATOR_WORD
                
                battle.w VERSUS_ZEON
                position 11,15
                facing DOWN
                mapsprite ELIS
                dc.l eas_LyingLeft
                dc.w TERMINATOR_WORD
                
                tableEnd.w
