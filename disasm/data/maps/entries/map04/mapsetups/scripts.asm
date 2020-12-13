
; ASM FILE data\maps\entries\map04\mapsetups\scripts.asm :
; 0x51840..0x51912 : 
eas_FallInEarthquakeCrack:
                 ac_setSpeed 0,0
                 ac_accelFactors 1,1
                 ac_acceleration -2,ON
                 ac_deceleration -2,ON
                 ac_entityObstructable ON
                 ac_mapUncollidable OFF
                 ac_entityUncollidable OFF
                 ac_autoFacing OFF
                 ac_moveRel 0,2
                 ac_resizable ON
                 ac_soundCommand SFX_FALLING
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
