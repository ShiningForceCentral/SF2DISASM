
; ASM FILE data\scripting\entity\eas_main.asm :
; 0x44DE2..0x45204 : Main entity actscripts
                 ac_moveRel 1,0
                 ac_waitDest
word_44DEA:      ac_branch
                dc.w eas_ControlledCharacter-word_44DEA
                 ac_moveRel 1,65535
                 ac_waitDest
word_44DF6:      ac_branch
                dc.w eas_ControlledCharacter-word_44DF6
                 ac_moveRel 0,65535
                 ac_waitDest
word_44E02:      ac_branch
                dc.w eas_ControlledCharacter-word_44E02
                 ac_moveRel 65535,65535
                 ac_waitDest
word_44E0E:      ac_branch
                dc.w eas_ControlledCharacter-word_44E0E
                 ac_moveRel 65535,0
                 ac_waitDest
word_44E1A:      ac_branch
                dc.w eas_ControlledCharacter-word_44E1A
                 ac_moveRel 65535,1
                 ac_waitDest
word_44E26:      ac_branch
                dc.w eas_ControlledCharacter-word_44E26
                 ac_moveRel 0,1
                 ac_waitDest
word_44E32:      ac_branch
                dc.w eas_ControlledCharacter-word_44E32
                 ac_moveRel 1,1
                 ac_waitDest
eas_ControlledCharacter:
                 ac_set1Cb7 $FFFF
                 ac_set1Cb6 $FFFF
                 ac_set1Cb5 $FFFF
                 ac_setSpeed 32,32
                 ac_11 $0
                 ac_12 $FEFF
                 ac_13 $FEFF
byte_44E5A:      ac_40
                 ac_02
                 ac_waitDest
word_44E60:      ac_branch
                dc.w (byte_44E5A-word_44E60) & $FFFF
eas_Raft:        ac_set1Cb7 $FFFF
                 ac_set1Cb6 $FFFF
                 ac_set1Cb5 $FFFF
                 ac_setSpeed 32,32
                 ac_11 $0
                 ac_12 $FEFF
                 ac_13 $FEFF
byte_44E80:      ac_40
                 ac_controlRaft
                 ac_waitDest
word_44E86:      ac_branch
                dc.w (byte_44E80-word_44E86) & $FFFF
eas_Caravan:     ac_set1Cb7 $FFFF
                 ac_set1Cb6 $FFFF
                 ac_set1Cb5 $FFFF
                 ac_setSpeed 32,32
                 ac_11 $0
                 ac_12 $FEFF
                 ac_13 $FEFF
byte_44EA6:      ac_40
                 ac_controlCaravan
                 ac_waitDest
word_44EAC:      ac_branch
                dc.w (byte_44EA6-word_44EAC) & $FFFF
eas_UnitCursorSpeedx2:
                 ac_set1Cb7 $0
                 ac_set1Cb6 $0
                 ac_set1Cb5 $0
                 ac_setSpeed 64,64
                 ac_11 $0
                 ac_12 $FEFF
                 ac_13 $FEFF
byte_44ECC:      ac_02
                 ac_waitDest
word_44ED0:      ac_branch
                dc.w (byte_44ECC-word_44ED0) & $FFFF
eas_UnitCursor:  ac_set1Cb7 $0
                 ac_set1Cb6 $0
                 ac_set1Cb5 $0
                 ac_11 $101
                 ac_12 $FEFF
                 ac_13 $FEFF
byte_44EEC:      ac_waitDest
                 ac_wait 1
word_44EF2:      ac_branch
                dc.w (byte_44EEC-word_44EF2) & $FFFF
eas_44EF6:       ac_set1Cb7 $0
                 ac_set1Cb6 $0
                 ac_set1Cb5 $0
                 ac_setSpeed 64,64
                 ac_11 $0
                 ac_12 $FEFF
                 ac_13 $FEFF
word_44F12:      ac_branch
                dc.w (byte_44EEC-word_44F12) & $FFFF
eas_44F16:       ac_set1Cb7 $0
                 ac_set1Cb6 $FFFF
                 ac_set1Cb5 $0
                 ac_setSpeed 8,8
                 ac_11 $808
word_44F2A:      ac_branch
                dc.w (byte_44EEC-word_44F2A) & $FFFF
eas_Follower1:   ac_setSpeed 32,32
                 ac_11 $0
                 ac_12 $0
                 ac_13 $0
                 ac_set1Cb7 $0
                 ac_set1Cb6 $FFFF
                 ac_set1Cb5 $FFFF
byte_44F4A:      ac_03 $0,$FFE8,$0
                 ac_waitDest
word_44F54:      ac_branch
                dc.w (byte_44F4A-word_44F54) & $FFFF
eas_Follower2:   ac_setSpeed 32,32
                 ac_11 $0
                 ac_12 $0
                 ac_13 $0
                 ac_set1Cb7 $0
                 ac_set1Cb6 $FFFF
                 ac_set1Cb5 $FFFF
byte_44F74:      ac_03 $1,$FFE8,$0
                 ac_waitDest
word_44F7E:      ac_branch
                dc.w (byte_44F74-word_44F7E) & $FFFF
eas_Follower3:   ac_setSpeed 32,32
                 ac_11 $0
                 ac_12 $0
                 ac_13 $0
                 ac_set1Cb7 $0
                 ac_set1Cb6 $FFFF
                 ac_set1Cb5 $FFFF
byte_44F9E:      ac_03 $2,$FFE8,$0
                 ac_waitDest
word_44FA8:      ac_branch
                dc.w (byte_44F9E-word_44FA8) & $FFFF
eas_OverworldFollower2:
                 ac_setSpeed 32,32
                 ac_11 $0
                 ac_12 $0
                 ac_13 $0
                 ac_set1Cb7 $0
                 ac_set1Cb6 $FFFF
                 ac_set1Cb5 $FFFF
byte_44FC8:      ac_setSpeed 32,32
                 ac_03 $0,$FFE8,$FFE8
word_44FD4:      ac_branch
                dc.w (byte_44FC8-word_44FD4) & $FFFF
eas_OverworldFollower3:
                 ac_setSpeed 32,32
                 ac_11 $0
                 ac_12 $0
                 ac_13 $0
                 ac_set1Cb7 $0
                 ac_set1Cb6 $FFFF
                 ac_set1Cb5 $FFFF
byte_44FF4:      ac_03 $0,$FFE8,$18
word_44FFC:      ac_branch
                dc.w (byte_44FF4-word_44FFC) & $FFFF
eas_Follower4:   ac_setSpeed 32,32
                 ac_11 $0
                 ac_12 $0
                 ac_13 $0
                 ac_set1Cb7 $0
                 ac_set1Cb6 $FFFF
                 ac_set1Cb5 $FFFF
byte_4501C:      ac_03 $3,$FFE8,$0
                 ac_waitDest
word_45026:      ac_branch
                dc.w (byte_4501C-word_45026) & $FFFF
eas_OverworldFollower5:
                 ac_setSpeed 32,32
                 ac_11 $0
                 ac_12 $0
                 ac_13 $0
                 ac_set1Cb7 $0
                 ac_set1Cb6 $FFFF
                 ac_set1Cb5 $FFFF
byte_45046:      ac_03 $4,$FFE8,$0
                 ac_waitDest
word_45050:      ac_branch
                dc.w (byte_45046-word_45050) & $FFFF
eas_Walking:     ac_wait 30
                 ac_setSpeed 0,0
                 ac_11 $101
                 ac_12 $FEFF
                 ac_13 $FEFF
                 ac_set1Cb7 $FFFF
                 ac_set1Cb6 $FFFF
                 ac_set1Cb5 $FFFF
byte_45074:      ac_06 $10,$10,$C
                 ac_waitDest
                 ac_wait 20
word_45082:      ac_branch
                dc.w (byte_45074-word_45082) & $FFFF
byte_45086:      ac_11 $102
                 ac_setSpeed 0,26
                 ac_12 $FF00
                 ac_13 $FFFF
                 ac_moveRel 65534,65534
                 ac_waitDest
eas_4509E:       ac_11 $201
                 ac_setSpeed 26,0
                 ac_12 $FFFF
                 ac_13 $FF00
                 ac_moveRel 65534,2
                 ac_waitDest
                 ac_11 $102
                 ac_setSpeed 0,26
                 ac_12 $FF00
                 ac_13 $FFFF
                 ac_moveRel 2,2
                 ac_waitDest
                 ac_11 $201
                 ac_setSpeed 26,0
                 ac_12 $FFFF
                 ac_13 $FF00
                 ac_moveRel 2,65534
                 ac_waitDest
word_450E6:      ac_branch
                dc.w (byte_45086-word_450E6) & $FFFF
byte_450EA:      ac_11 $102
                 ac_setSpeed 0,32
                 ac_12 $FF00
                 ac_13 $FFFF
                 ac_moveRel 65533,65533
                 ac_waitDest
                 ac_11 $201
                 ac_setSpeed 32,0
                 ac_12 $FFFF
                 ac_13 $FF00
                 ac_moveRel 65533,3
                 ac_waitDest
                 ac_11 $102
                 ac_setSpeed 0,32
                 ac_12 $FF00
                 ac_13 $FFFF
                 ac_moveRel 3,3
                 ac_waitDest
                 ac_11 $201
                 ac_setSpeed 32,0
                 ac_12 $FFFF
                 ac_13 $FF00
                 ac_moveRel 3,65533
                 ac_waitDest
word_4514A:      ac_branch
                dc.w (byte_450EA-word_4514A) & $FFFF
                 ac_setAnimCounter $0
                 ac_setAnimSpeedX2 $FFFF
                 ac_updateSprite
                 ac_wait 30
                 ac_setAnimSpeedX2 $0
                 ac_updateSprite
                 ac_wait 10
                 ac_setAnimCounter $FFFF
word_4516A:      ac_branch
                dc.w eas_Idle-word_4516A
                 ac_autoFacing $0
                 ac_11 $0
                 ac_setSpeed 32,32
                 ac_12 $0
                 ac_13 $0
                 ac_moveRel 0,65535
                 ac_wait 5
                 ac_moveRel 0,1
                 ac_wait 5
                 ac_moveRel 0,0
                 ac_autoFacing $FFFF
word_451A0:      ac_branch
                dc.w eas_Idle-word_451A0
                 ac_11 $101
                 ac_setSpeed 32,32
                 ac_12 $FEFF
                 ac_13 $0
                 ac_moveRel 0,65534
                 ac_waitDest
                 ac_moveRel 2,0
                 ac_waitDest
                 ac_setFlip $1
                 ac_updateSprite
                 ac_wait 60
                 ac_setFlip $0
                 ac_updateSprite
                 ac_moveRel 2,0
                 ac_waitDest
word_451DC:      ac_branch
                dc.w eas_Idle-word_451DC
eas_Standing:    ac_setSpeed 32,32
                 ac_11 $0
                 ac_12 $0
                 ac_13 $0
                 ac_set1Cb7 $0
                 ac_set1Cb6 $FFFF
                 ac_set1Cb5 $0
eas_Idle:        ac_wait 1
word_45200:      ac_branch
                dc.w (eas_Idle-word_45200) & $FFFF
