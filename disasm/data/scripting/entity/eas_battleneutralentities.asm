
; ASM FILE data\scripting\entity\eas_battleneutralentities.asm :
; 0x4497A..0x449C6 : Entity actscripts for battle entities which are not force members or enemies
eas_LyingLeft:   ac_setFlip $1
                 ac_updateSprite
eas_Motionless:  ac_setAnimCounter $0
word_44984:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $878
                dc.w eas_Idle-word_44984
eas_LyingRight:  ac_setFlip $3
                 ac_updateSprite
word_4498E:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFF2
                dc.w (eas_Motionless-word_4498E) & $FFFF
eas_WhirlsInWater:
                 ac_inWater $FFFF
                 ac_setAnimSpeedX2 $FFFF
byte_4499A:      ac_setFacing RIGHT
                 ac_updateSprite
                 ac_wait 10
                 ac_setFacing UP
                 ac_updateSprite
                 ac_wait 10
                 ac_setFacing LEFT
                 ac_updateSprite
                 ac_wait 10
                 ac_setFacing DOWN
                 ac_updateSprite
                 ac_wait 10
word_449C2:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFD8
                dc.w (byte_4499A-word_449C2) & $FFFF
