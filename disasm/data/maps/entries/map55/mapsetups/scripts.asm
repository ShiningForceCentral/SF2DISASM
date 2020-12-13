
; ASM FILE data\maps\entries\map55\mapsetups\scripts.asm :
; 0x5E27C..0x5E37C : 
cs_5E27C:       setActscriptWait ALLY_BOWIE,eas_5E2C4
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait ALLY_PETER,eas_5E2C4
                setActscriptWait FOLLOWER_B,eas_Init
                setActscriptWait FOLLOWER_B,eas_5E2C4
                jumpIfFlagClear 76,cs_5E2BC ; Zynk is a follower
                setActscriptWait ALLY_ZYNK,eas_Init
                setActscriptWait ALLY_ZYNK,eas_5E2C4
cs_5E2BC:       warp MAP_NAZCA_SHIP_INTERIOR,29,8,LEFT
                csc_end
eas_5E2C4:       ac_entityUncollidable OFF
                 ac_moveAbs 7,7
                 ac_wait 6
                 ac_resizable ON
                 ac_setSize 22
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 20
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 18
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 16
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 14
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 12
                 ac_updateSprite
                 ac_waitDest
                 ac_setSprite MAPSPRITE_BLANK
                 ac_updateSprite
                 ac_wait 1
                 ac_jump eas_Idle
cs_5E320:       mapLoad MAP_OVERWORLD_GRANS_NORTH_SHORE,8,14
                loadMapEntities ce_5E33E
                setActscriptWait ALLY_BOWIE,eas_Init
                playSound MUSIC_MAIN_THEME
                fadeInB
                csc_end
ce_5E33E:       mainEntity 12,19,DOWN
                dc.w $FFFF
cs_5E346:       textCursor 3371
                setActscriptWait ALLY_BOWIE,eas_Init
                entityActionsWait ALLY_BOWIE
                 moveLeft 1
                 moveLeft 1
                endActions
                csWait 30
                setFacing ALLY_PETER,RIGHT
                setFacing ALLY_ZYNK,RIGHT
                setFacing FOLLOWER_B,RIGHT
                setFacing ALLY_BOWIE,RIGHT
                nextText $0,FOLLOWER_B  ; "What a terrible waste.{N}We've lost an ancient{N}treasure.{W2}"
                setFacing FOLLOWER_B,LEFT
                nextSingleText $0,FOLLOWER_B ; "Anyway, we have to go to{N}Arc Valley.{N}{LEADER}, let's go.{W1}"
                csc_end
