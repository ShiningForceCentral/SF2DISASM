
; ASM FILE data\scripting\entity\eas_actions.asm :
; 0x45E44..0x46506 : Entity scripts for cutscene actions
eas_Jump:        ac_autoFacing OFF
                 ac_moveRel 0,-1
                 ac_wait 5
                 ac_moveRel 0,1
                 ac_wait 5
                 ac_moveRel 0,0
                 ac_autoFacing ON
                 ac_jump eas_Idle
eas_JumpLeft:    ac_autoFacing OFF
                 ac_moveRel -1,-1
                 ac_wait 6
                 ac_moveRel -1,1
                 ac_wait 6
                 ac_moveRel 0,0
                 ac_autoFacing ON
                 ac_jump eas_Idle
eas_JumpRight:   ac_autoFacing OFF
                 ac_moveRel 1,-1
                 ac_wait 6
                 ac_moveRel 1,1
                 ac_wait 6
                 ac_moveRel 0,0
                 ac_autoFacing ON
                 ac_jump eas_Idle
eas_BumpRight:   ac_autoFacing OFF
                 ac_moveRel 1,0
                 ac_wait 5
                 ac_moveRel -1,0
                 ac_wait 5
                 ac_moveRel 0,0
                 ac_autoFacing ON
                 ac_jump eas_Idle
eas_BumpLeft:    ac_autoFacing OFF
                 ac_moveRel -1,0
                 ac_wait 5
                 ac_moveRel 1,0
                 ac_wait 5
                 ac_moveRel 0,0
                 ac_autoFacing ON
                 ac_jump eas_Idle
eas_BumpUp:      ac_autoFacing OFF
                 ac_moveRel 0,-1
                 ac_wait 5
                 ac_moveRel 0,1
                 ac_wait 5
                 ac_moveRel 0,0
                 ac_autoFacing ON
                 ac_jump eas_Idle
eas_BumpDown:    ac_autoFacing OFF
                 ac_moveRel 0,1
                 ac_wait 5
                 ac_moveRel 0,-1
                 ac_wait 5
                 ac_moveRel 0,0
                 ac_autoFacing ON
                 ac_jump eas_Idle
                 ac_motion OFF
                 ac_orientUp
                 ac_updateSprite
                 ac_jump eas_Idle
eas_LyingLeftBis:
                 ac_motion OFF
                 ac_orientLeft
                 ac_updateSprite
                 ac_jump eas_Idle
eas_LyingDownBis:
                 ac_motion OFF
                 ac_orientDown
                 ac_updateSprite
                 ac_jump eas_Idle
eas_LyingRightBis:
                 ac_motion OFF
                 ac_orientRight
                 ac_updateSprite
                 ac_jump eas_Idle
eas_Immersed:    ac_immersed ON
                 ac_updateSprite
                 ac_jump eas_Idle
eas_Transparent: ac_transparency ON
                 ac_jump eas_Idle
eas_AnimSpeedx2: ac_animSpeedX2 ON
                 ac_jump eas_Idle
eas_RotateRight: ac_motion OFF
                 ac_autoFacing OFF
                 ac_setFacing LEFT
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing UP
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing RIGHT
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing DOWN
                 ac_updateSprite
                 ac_wait 5
word_45FEC:      ac_branch
                dc.w (eas_RotateRight-word_45FEC) & $FFFF
eas_RotateRightHighSpeed:
                 ac_motion OFF
                 ac_autoFacing OFF
                 ac_setFacing LEFT
                 ac_updateSprite
                 ac_wait 1
                 ac_setFacing UP
                 ac_updateSprite
                 ac_wait 1
                 ac_setFacing RIGHT
                 ac_updateSprite
                 ac_wait 1
                 ac_setFacing DOWN
                 ac_updateSprite
                 ac_wait 1
word_46020:      ac_branch
                dc.w (eas_RotateRightHighSpeed-word_46020) & $FFFF
eas_Die:         ac_motion OFF
                 ac_setFacing LEFT
                 ac_updateSprite
                 ac_wait 3
                 ac_setFacing UP
                 ac_updateSprite
                 ac_wait 3
                 ac_setFacing RIGHT
                 ac_updateSprite
                 ac_wait 3
                 ac_setFacing DOWN
                 ac_updateSprite
                 ac_setFacing LEFT
                 ac_updateSprite
                 ac_wait 3
                 ac_setFacing UP
                 ac_updateSprite
                 ac_wait 3
                 ac_setFacing RIGHT
                 ac_updateSprite
                 ac_wait 3
                 ac_setFacing DOWN
                 ac_updateSprite
                 ac_wait 3
                 ac_setFacing LEFT
                 ac_updateSprite
                 ac_wait 3
                 ac_setFacing UP
                 ac_updateSprite
                 ac_wait 3
                 ac_setFacing RIGHT
                 ac_updateSprite
                 ac_wait 3
                 ac_setFacing DOWN
                 ac_updateSprite
                 ac_wait 3
                 ac_soundCommand SFX_BATTLEFIELD_DEATH
                 ac_setSprite MAPSPRITE_EFFECT1
                 ac_setFacing UP
                 ac_updateSprite
                 ac_wait 8
                 ac_setFacing LEFT
                 ac_updateSprite
                 ac_wait 8
                 ac_setFacing DOWN
                 ac_updateSprite
                 ac_wait 8
                 ac_setPos 63,63
                 ac_jump eas_Idle
eas_Init:        ac_accelFactors 0,0
                 ac_setSpeed 32,32
                 ac_acceleration OFF,OFF
                 ac_deceleration OFF,OFF
                 ac_entityObstructable ON
                 ac_entityUncollidable OFF
                 ac_mapUncollidable OFF
                 ac_autoFacing ON
                 ac_orientUp
                 ac_immersed OFF
                 ac_setSize 24
                 ac_updateSprite
                 ac_jump eas_Idle
eas_InitSlow:    ac_setSpeed 16,16
                 ac_accelFactors 1,1
                 ac_acceleration -2,ON
                 ac_deceleration -2,ON
                 ac_entityObstructable ON
                 ac_entityUncollidable OFF
                 ac_mapUncollidable OFF
                 ac_autoFacing ON
                 ac_orientUp
                 ac_immersed OFF
                 ac_setSize 24
                 ac_updateSprite
                 ac_jump eas_Idle
eas_InitFixedSprite:
                 ac_accelFactors 0,0
                 ac_setSpeed 32,32
                 ac_acceleration OFF,OFF
                 ac_deceleration OFF,OFF
                 ac_entityObstructable ON
                 ac_entityUncollidable OFF
                 ac_mapUncollidable OFF
                 ac_autoFacing ON
                 ac_orientUp
                 ac_immersed OFF
                 ac_autoFacing OFF
                 ac_motion OFF
                 ac_setSize 24
                 ac_updateSprite
                 ac_jump eas_Idle
eas_DeactivateAutoFacing:
                 ac_autoFacing OFF
                 ac_jump eas_Idle
                 ac_accelFactors 1,1
                 ac_acceleration -2,ON
                 ac_jump eas_Idle
eas_4618A:       ac_accelFactors 1,1
                 ac_deceleration -2,ON
                 ac_jump eas_Idle
eas_46198:       ac_accelFactors 1,1
                 ac_acceleration -2,ON
                 ac_deceleration -2,ON
                 ac_jump eas_Idle
eas_StopMoving:  ac_moveRel 0,0
                 ac_jump eas_Idle
eas_2xRightLeft: ac_setFacing RIGHT
                 ac_updateSprite
                 ac_wait 30
                 ac_setFacing LEFT
                 ac_updateSprite
                 ac_wait 30
                 ac_setFacing RIGHT
                 ac_updateSprite
                 ac_wait 30
                 ac_setFacing LEFT
                 ac_updateSprite
                 ac_wait 30
                 ac_jump eas_Idle
eas_2xUpDown:    ac_setFacing UP
                 ac_updateSprite
                 ac_wait 30
                 ac_setFacing DOWN
                 ac_updateSprite
                 ac_wait 30
                 ac_setFacing UP
                 ac_updateSprite
                 ac_wait 30
                 ac_setFacing DOWN
                 ac_updateSprite
                 ac_wait 30
                 ac_jump eas_Idle
eas_RightLeftLoop:
                 ac_setSpeed 0,0
                 ac_accelFactors 1,1
                 ac_acceleration -2,ON
                 ac_deceleration -2,ON
                 ac_entityObstructable ON
                 ac_entityUncollidable OFF
                 ac_mapUncollidable OFF
byte_4622E:      ac_setFacing RIGHT
                 ac_updateSprite
                 ac_wait 60
                 ac_setFacing LEFT
                 ac_updateSprite
                 ac_wait 60
word_46242:      ac_branch
                dc.w (byte_4622E-word_46242) & $FFFF
eas_LeftRightMoveLoop:
                 ac_setSpeed 0,0
                 ac_accelFactors 1,1
                 ac_acceleration -2,ON
                 ac_deceleration -2,ON
                 ac_entityObstructable ON
                 ac_entityUncollidable ON
                 ac_mapUncollidable OFF
word_46262:      ac_branch
                dc.w byte_462AE-word_46262
eas_RightLeftMoveLoop:
                 ac_setSpeed 0,0
                 ac_accelFactors 1,1
                 ac_acceleration -2,ON
                 ac_deceleration -2,ON
                 ac_entityObstructable ON
                 ac_entityUncollidable ON
                 ac_mapUncollidable OFF
byte_46282:      ac_moveRel 1,0
                 ac_waitDest
                 ac_wait 30
                 ac_setFacing DOWN
                 ac_updateSprite
                 ac_wait 30
                 ac_setFacing LEFT
                 ac_updateSprite
                 ac_wait 30
                 ac_moveRel -1,0
                 ac_waitDest
                 ac_wait 60
byte_462AE:      ac_moveRel -1,0
                 ac_waitDest
                 ac_wait 30
                 ac_setFacing DOWN
                 ac_updateSprite
                 ac_wait 30
                 ac_setFacing RIGHT
                 ac_updateSprite
                 ac_wait 30
                 ac_moveRel 1,0
                 ac_waitDest
                 ac_wait 60
word_462DA:      ac_branch
                dc.w (byte_46282-word_462DA) & $FFFF
                 ac_soundCommand SFX_JUMP
                 ac_setSprite MAPSPRITE_EFFECT1
                 ac_setFacing UP
                 ac_updateSprite
                 ac_wait 8
                 ac_setFacing LEFT
                 ac_updateSprite
                 ac_wait 8
                 ac_setFacing DOWN
                 ac_updateSprite
                 ac_wait 8
                 ac_setSprite MAPSPRITE_BLANK
                 ac_updateSprite
                 ac_jump eas_Idle
eas_TwirlGrow:   ac_resizable ON
                 ac_setFacing LEFT
                 ac_setSize 6
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing DOWN
                 ac_setSize 8
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing RIGHT
                 ac_setSize 10
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing UP
                 ac_setSize 12
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing LEFT
                 ac_setSize 14
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing DOWN
                 ac_setSize 16
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing RIGHT
                 ac_setSize 18
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing UP
                 ac_setSize 20
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing LEFT
                 ac_setSize 22
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing DOWN
                 ac_setSize 24
                 ac_updateSprite
                 ac_wait 5
                 ac_resizable OFF
                 ac_setSize 18
                 ac_jump eas_Init
eas_TwirlShrinkDisappear:
                 ac_wait 5
                 ac_resizable ON
                 ac_setFacing DOWN
                 ac_setSize 22
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing RIGHT
                 ac_setSize 20
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing UP
                 ac_setSize 18
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing LEFT
                 ac_setSize 16
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing DOWN
                 ac_setSize 14
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing RIGHT
                 ac_setSize 12
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing UP
                 ac_setSize 10
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing LEFT
                 ac_setSize 8
                 ac_updateSprite
                 ac_wait 5
                 ac_setFacing DOWN
                 ac_setSize 6
                 ac_updateSprite
                 ac_wait 5
                 ac_setPos 63,63
                 ac_resizable OFF
                 ac_setSize 18
                 ac_jump eas_Idle
eas_ShrinkDisappear:
                 ac_wait 5
                 ac_resizable ON
                 ac_setSize 22
                 ac_updateSprite
                 ac_wait 5
                 ac_setSize 20
                 ac_updateSprite
                 ac_wait 5
                 ac_setSize 18
                 ac_updateSprite
                 ac_wait 5
                 ac_setSize 16
                 ac_updateSprite
                 ac_wait 5
                 ac_setSize 14
                 ac_updateSprite
                 ac_wait 5
                 ac_setSize 12
                 ac_updateSprite
                 ac_wait 5
                 ac_setSize 10
                 ac_updateSprite
                 ac_wait 5
                 ac_setSize 8
                 ac_updateSprite
                 ac_wait 5
                 ac_setSize 6
                 ac_updateSprite
                 ac_wait 5
                 ac_setPos 63,63
                 ac_resizable OFF
                 ac_setSize 18
                 ac_jump eas_Idle
eas_ClockwiseMoveUpLeft:
                 ac_moveRel -1,-1
                 ac_waitDest
eas_ClockwiseMoveUpRight:
                 ac_moveRel -1,1
                 ac_waitDest
eas_ClockwiseMoveDownRight:
                 ac_moveRel 1,1
                 ac_waitDest
eas_ClockwiseMoveDownLeft:
                 ac_moveRel 1,-1
                 ac_waitDest
word_464DE:      ac_branch
                dc.w (eas_ClockwiseMoveUpLeft-word_464DE) & $FFFF
eas_CounterClockwiseMoveUpRight:
                 ac_moveRel -1,1
                 ac_waitDest
eas_CounterClockwiseMoveUpLeft:
                 ac_moveRel -1,-1
                 ac_waitDest
eas_CounterClockwiseMoveDownLeft:
                 ac_moveRel 1,-1
                 ac_waitDest
eas_CounterClockwiseMoveDownRight:
                 ac_moveRel 1,1
                 ac_waitDest
word_46502:      ac_branch
                dc.w (eas_CounterClockwiseMoveUpRight-word_46502) & $FFFF
