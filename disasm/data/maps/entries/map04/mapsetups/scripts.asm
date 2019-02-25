
; ASM FILE data\maps\entries\map04\mapsetups\scripts.asm :
; 0x51840..0x51912 : 
eas_51840:       ac_setSpeed 0,0
                 ac_11 $101
                 ac_12 $FEFF
                 ac_13 $FEFF
                 ac_set1Cb7 $FFFF
                 ac_set1Cb6 $0
                 ac_set1Cb5 $0
                 ac_autoFacing $0
                 ac_moveRel 0,2
                 ac_set1Db3 $FFFF
                 ac_soundCommand $58
                 ac_setFacing RIGHT
                 ac_setSize 22
                 ac_updateSprite
                 ac_wait 4
                 ac_setFacing UP
                 ac_setSize 20
                 ac_updateSprite
                 ac_wait 4
                 ac_setFacing LEFT
                 ac_setSize 18
                 ac_updateSprite
                 ac_wait 4
                 ac_setFacing DOWN
                 ac_setSize 16
                 ac_updateSprite
                 ac_wait 4
                 ac_setFacing RIGHT
                 ac_setSize 14
                 ac_updateSprite
                 ac_wait 4
                 ac_setFacing UP
                 ac_setSize 12
                 ac_updateSprite
                 ac_wait 4
                 ac_setFacing LEFT
                 ac_setSize 10
                 ac_updateSprite
                 ac_wait 4
                 ac_setFacing DOWN
                 ac_setSize 8
                 ac_updateSprite
                 ac_wait 4
                 ac_setFacing RIGHT
                 ac_setSize 6
                 ac_updateSprite
                 ac_wait 4
                 ac_setFacing UP
                 ac_setSize 4
                 ac_updateSprite
                 ac_wait 4
                 ac_setFacing LEFT
                 ac_setSize 2
                 ac_updateSprite
                 ac_waitDest
                 ac_setPos 0,0
                 ac_jump eas_Idle
