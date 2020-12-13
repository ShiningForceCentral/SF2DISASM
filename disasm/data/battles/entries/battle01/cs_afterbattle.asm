
; ASM FILE data\battles\entries\battle01\cs_afterbattle.asm :
; 0x496DC..0x4980E : Cutscene after battle 1
abcs_battle01:  textCursor 2305
                resetForceBattleStats
                loadMapFadeIn MAP_ANCIENT_TOWER_FIRST_ROOM,2,0
                loadMapEntities ce_497F6
                setActscriptWait ALLY_BOWIE,eas_Init
                setPos ALLY_SARAH,8,7,UP
                setPos ALLY_CHESTER,8,8,UP
                fadeInB
                csWait 40
                nextSingleText $0,129   ; "Well done, {LEADER}!{N}What should I do with this{N}devil?{W1}"
                setFacing 129,UP
                csWait 40
                shiver 128
                csWait 30
                shiver 128
                csWait 30
                mapFadeOutToWhite
                csWait 30
                mapFadeInFromWhite
                csWait 5
                setActscript 129,eas_2xRightLeft
                csWait 5
                setActscript ALLY_BOWIE,eas_2xRightLeft
                csWait 30
                mapFadeOutToWhite
                csWait 30
                mapFadeInFromWhite
                csWait 30
                mapFadeOutToWhite
                animEntityFX 128,6
                setSprite 128,MAPSPRITE_BLANK
                setPos 128,7,10,DOWN
                setSprite 128,MAPSPRITE_MIST_DEMON
                mapFadeInFromWhite
                csWait 30
                entityActionsWait 129
                 moveUp 1
                endActions
                nextSingleText $0,129   ; "Oh, it disappeared?!{W1}"
                csWait 5
                setActscript 129,eas_2xRightLeft
                csWait 120
                entityActionsWait 129
                 moveDown 1
                endActions
                nextSingleText $0,129   ; "Oh, there it is!{W1}"
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_SARAH,DOWN
                setFacing ALLY_CHESTER,DOWN
                setCamDest 2,3
                csWait 70
                mapFadeOutToWhite
                animEntityFX 128,6
                setSprite 128,MAPSPRITE_BLANK
                setPos 128,7,16,DOWN
                setSprite 128,MAPSPRITE_MIST_DEMON
                mapFadeInFromWhite
                csWait 30
                nextSingleText $0,129   ; "It disappeared again.{W1}"
                setCamDest 2,10
                nextSingleText $0,129   ; "There it is!{W1}"
                entityActions 128
                 moveDown 4
                endActions
                animEntityFX 128,6
                csWait 20
                hide 128
                setCamDest 2,2
                setFacing 129,RIGHT
                nextSingleText $0,129   ; "We must hurry to the King!{W1}"
                entityActionsWait 129
                 moveDown 6
                endActions
                hide 129
                csWait 40
                csc_end
ce_497F6:       mainEntity 8,6,UP
                entity 7,4,DOWN,MAPSPRITE_MIST_DEMON,eas_Init
                entity 7,6,RIGHT,MAPSPRITE_ASTRAL,eas_Init
                dc.w $FFFF
