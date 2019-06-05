
; ASM FILE data\scripting\entity\eas_actions.asm :
; 0x45E44..0x46506 : Entity scripts for cutscene actions
eas_Jump:        ac_autoFacing $0
                 ac_moveRel 0,65535
                 ac_wait 5
                 ac_moveRel 0,1
                 ac_wait 5
                 ac_moveRel 0,0
                 ac_autoFacing $FFFF
                 ac_jump eas_Idle
eas_JumpLeft:    ac_autoFacing $0
                 ac_moveRel 65535,65535
                 ac_wait 6
                 ac_moveRel 65535,1
                 ac_wait 6
                 ac_moveRel 0,0
                 ac_autoFacing $FFFF
                 ac_jump eas_Idle
eas_JumpRight:   ac_autoFacing $0
                 ac_moveRel 1,65535
                 ac_wait 6
                 ac_moveRel 1,1
                 ac_wait 6
                 ac_moveRel 0,0
                 ac_autoFacing $FFFF
                 ac_jump eas_Idle
eas_BumpRight:   ac_autoFacing $0
                 ac_moveRel 1,0
                 ac_wait 5
                 ac_moveRel 65535,0
                 ac_wait 5
                 ac_moveRel 0,0
                 ac_autoFacing $FFFF
                 ac_jump eas_Idle
eas_BumpLeft:    ac_autoFacing $0
                 ac_moveRel 65535,0
                 ac_wait 5
                 ac_moveRel 1,0
                 ac_wait 5
                 ac_moveRel 0,0
                 ac_autoFacing $FFFF
                 ac_jump eas_Idle
eas_BumpUp:      ac_autoFacing $0
                 ac_moveRel 0,65535
                 ac_wait 5
                 ac_moveRel 0,1
                 ac_wait 5
                 ac_moveRel 0,0
                 ac_autoFacing $FFFF
                 ac_jump eas_Idle
eas_BumpDown:    ac_autoFacing $0
                 ac_moveRel 0,1
                 ac_wait 5
                 ac_moveRel 0,65535
                 ac_wait 5
                 ac_moveRel 0,0
                 ac_autoFacing $FFFF
                 ac_jump eas_Idle
                 ac_setAnimCounter $0
                 ac_setFlip $0
                 ac_updateSprite
                 ac_jump eas_Idle
eas_LyingLeftBis:
                 ac_setAnimCounter $0
                 ac_setFlip $1
                 ac_updateSprite
                 ac_jump eas_Idle
eas_45F7C:       ac_setAnimCounter $0
                 ac_setFlip $2
                 ac_updateSprite
                 ac_jump eas_Idle
eas_LyingRightBis:
                 ac_setAnimCounter $0
                 ac_setFlip $3
                 ac_updateSprite
                 ac_jump eas_Idle
eas_45F9C:       ac_inWater $FFFF
                 ac_updateSprite
                 ac_jump eas_Idle
eas_Transparent: ac_setTransparency $FFFF
                 ac_jump eas_Idle
eas_AnimSpeedx2: ac_setAnimSpeedX2 $FFFF
                 ac_jump eas_Idle
eas_RotateRight: ac_setAnimCounter $0
                 ac_autoFacing $0
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
                 ac_setAnimCounter $0
                 ac_autoFacing $0
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
eas_Die:         ac_setAnimCounter $0
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
eas_Init:        ac_11 $0
                 ac_setSpeed 32,32
                 ac_12 $0
                 ac_13 $0
                 ac_set1Cb7 $FFFF
                 ac_set1Cb5 $0
                 ac_set1Cb6 $0
                 ac_autoFacing $FFFF
                 ac_setFlip $0
                 ac_inWater $0
                 ac_setSize 24
                 ac_updateSprite
                 ac_jump eas_Idle
eas_Init2:       ac_setSpeed 16,16
                 ac_11 $101
                 ac_12 $FEFF
                 ac_13 $FEFF
                 ac_set1Cb7 $FFFF
                 ac_set1Cb5 $0
                 ac_set1Cb6 $0
                 ac_autoFacing $FFFF
                 ac_setFlip $0
                 ac_inWater $0
                 ac_setSize 24
                 ac_updateSprite
                 ac_jump eas_Idle
eas_Init3:       ac_11 $0
                 ac_setSpeed 32,32
                 ac_12 $0
                 ac_13 $0
                 ac_set1Cb7 $FFFF
                 ac_set1Cb5 $0
                 ac_set1Cb6 $0
                 ac_autoFacing $FFFF
                 ac_setFlip $0
                 ac_inWater $0
                 ac_autoFacing $0
                 ac_setAnimCounter $0
                 ac_setSize 24
                 ac_updateSprite
                 ac_jump eas_Idle
eas_46172:       ac_autoFacing $0
                 ac_jump eas_Idle
                 ac_11 $101
                 ac_12 $FEFF
                 ac_jump eas_Idle
eas_4618A:       ac_11 $101
                 ac_13 $FEFF
                 ac_jump eas_Idle
eas_46198:       ac_11 $101
                 ac_12 $FEFF
                 ac_13 $FEFF
                 ac_jump eas_Idle
eas_461AA:       ac_moveRel 0,0
                 ac_jump eas_Idle
eas_461B6:       ac_setFacing RIGHT
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
eas_461E4:       ac_setFacing UP
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
eas_46212:       ac_setSpeed 0,0
                 ac_11 $101
                 ac_12 $FEFF
                 ac_13 $FEFF
                 ac_set1Cb7 $FFFF
                 ac_set1Cb5 $0
                 ac_set1Cb6 $0
byte_4622E:      ac_setFacing RIGHT
                 ac_updateSprite
                 ac_wait 60
                 ac_setFacing LEFT
                 ac_updateSprite
                 ac_wait 60
word_46242:      ac_branch
                dc.w (byte_4622E-word_46242) & $FFFF
eas_46246:       ac_setSpeed 0,0
                 ac_11 $101
                 ac_12 $FEFF
                 ac_13 $FEFF
                 ac_set1Cb7 $FFFF
                 ac_set1Cb5 $FFFF
                 ac_set1Cb6 $0
word_46262:      ac_branch
                dc.w byte_462AE-word_46262
eas_46266:       ac_setSpeed 0,0
                 ac_11 $101
                 ac_12 $FEFF
                 ac_13 $FEFF
                 ac_set1Cb7 $FFFF
                 ac_set1Cb5 $FFFF
                 ac_set1Cb6 $0
byte_46282:      ac_moveRel 1,0
                 ac_waitDest
                 ac_wait 30
                 ac_setFacing DOWN
                 ac_updateSprite
                 ac_wait 30
                 ac_setFacing LEFT
                 ac_updateSprite
                 ac_wait 30
                 ac_moveRel 65535,0
                 ac_waitDest
                 ac_wait 60
byte_462AE:      ac_moveRel 65535,0
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
eas_46310:       ac_set1Db3 $FFFF
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
                 ac_set1Db3 $0
                 ac_setSize 18
                 ac_jump eas_Init
eas_463AE:       ac_wait 5
                 ac_set1Db3 $FFFF
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
                 ac_set1Db3 $0
                 ac_setSize 18
                 ac_jump eas_Idle
                 ac_wait 5
                 ac_set1Db3 $FFFF
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
                 ac_set1Db3 $0
                 ac_setSize 18
                 ac_jump eas_Idle
eas_464BE:       ac_moveRel 65535,65535
                 ac_waitDest
eas_464C6:       ac_moveRel 65535,1
                 ac_waitDest
eas_464CE:       ac_moveRel 1,1
                 ac_waitDest
eas_464D6:       ac_moveRel 1,65535
                 ac_waitDest
word_464DE:      ac_branch
                dc.w (eas_464BE-word_464DE) & $FFFF
eas_464E2:       ac_moveRel 65535,1
                 ac_waitDest
eas_464EA:       ac_moveRel 65535,65535
                 ac_waitDest
eas_464F2:       ac_moveRel 1,65535
                 ac_waitDest
eas_464FA:       ac_moveRel 1,1
                 ac_waitDest
word_46502:      ac_branch
                dc.w (eas_464E2-word_46502) & $FFFF
