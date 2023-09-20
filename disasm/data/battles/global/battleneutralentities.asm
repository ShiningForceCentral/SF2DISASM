
; ASM FILE data\battles\global\battleneutralentities.asm :
; 0x448C4..0x4497A : Battle entities which are not force members or enemies
tbl_BattleNeutralEntities:
                battle.w INSIDE_ANCIENT_TOWER ; [Battle][X][Y][Facing][Sprite][ActScript]
                npcPosition 7,4
                npcFacing DOWN
                mapSprite MIST_DEMON
                dc.l eas_Standing
                npcPosition 7,6
                npcFacing UP
                mapSprite ASTRAL
                dc.l eas_Standing
                dc.w CODE_TERMINATOR_WORD              ; FFFF to say "end of definition for this battle"
				
                battle.w VERSUS_DARK_SMOKES ; Non-enemy entity definition for battle 7
                npcPosition 13,21
                npcFacing DOWN
                mapSprite ASTRAL
                dc.l eas_LyingLeft
                npcPosition 13,17
                npcFacing DOWN
                mapSprite GALAM_EVIL
                dc.l eas_LyingLeft
                npcPosition 12,15
                npcFacing DOWN
                mapSprite ELIS
                dc.l eas_Standing
                npcPosition 15,35
                npcFacing UP
                mapSprite MINISTER
                dc.l eas_Standing
                npcPosition 11,35
                npcFacing UP
                mapSprite GRANSEAL_KING
                dc.l eas_Standing
                dc.w CODE_TERMINATOR_WORD
				
                battle.w NORTH_CLIFF
                npcPosition 13,2
                npcFacing DOWN
                mapSprite WORKER
                dc.l eas_LyingLeft
                dc.w CODE_TERMINATOR_WORD
				
                battle.w POLCA_VILLAGE
                npcPosition 16,13
                npcFacing DOWN
                mapSprite LUKE_BASE
                dc.l eas_LyingLeft
                dc.w CODE_TERMINATOR_WORD
				
                battle.w VERSUS_TAROS
                npcPosition 12,5
                npcFacing LEFT
                mapSprite CARAVAN
                dc.l eas_Motionless
                dc.w CODE_TERMINATOR_WORD
				
                battle.w HARPIES_POND
                npcPosition 6,6
                npcFacing DOWN
                mapSprite ELRIC_BASE
                dc.l eas_WhirlsInWater
                dc.w CODE_TERMINATOR_WORD
				
                battle.w CHESSBOARD
                npcPosition 6,2
                npcFacing DOWN
                mapSprite DESKTOP_KING
                dc.l eas_Standing
                npcPosition 5,3
                npcFacing DOWN
                mapSprite MAID
                dc.l eas_Standing
                dc.w CODE_TERMINATOR_WORD
				
                battle.w OUTSIDE_KETTO
                npcPosition 18,14
                npcFacing DOWN
                mapSprite HIGINS_PROMO
                dc.l eas_LyingLeft
                dc.w CODE_TERMINATOR_WORD
				
                battle.w PANGOAT_VALLEY_BRIDGE
                npcPosition 12,24
                npcFacing UP
                mapSprite POSE3
                dc.l eas_Motionless
                dc.w CODE_TERMINATOR_WORD
				
                battle.w VERSUS_GALAM
                npcPosition 13,15
                npcFacing DOWN
                mapSprite ELIS
                dc.l eas_LyingLeft
                dc.w CODE_TERMINATOR_WORD
				
                battle.w VERSUS_ZEON
                npcPosition 11,15
                npcFacing DOWN
                mapSprite ELIS
                dc.l eas_LyingLeft
                dc.w CODE_TERMINATOR_WORD
				
                tableEnd
