
; ASM FILE data\scripting\entity\eas_battleneutralentities.asm :
; 0x4497A..0x449C6 : Entity actscripts for battle entities which are not force members or enemies
eas_LyingLeft:   ac_orientLeft
                 ac_updateSprite
eas_Motionless:  ac_motion OFF
word_44984:      ac_branch
                dc.w eas_Idle-word_44984
eas_LyingRight:  ac_orientRight
                 ac_updateSprite
word_4498E:      ac_branch
                dc.w (eas_Motionless-word_4498E) & $FFFF
eas_WhirlsInWater:
                 ac_immersed ON
                 ac_animSpeedX2 ON
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
word_449C2:      ac_branch
                dc.w (byte_4499A-word_449C2) & $FFFF
