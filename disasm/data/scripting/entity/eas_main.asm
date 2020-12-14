
; ASM FILE data\scripting\entity\eas_main.asm :
; 0x44DE2..0x45204 : Main entity actscripts
                 ac_moveRel 1,0
                 ac_waitDest
word_44DEA:      ac_branch
                dc.w eas_ControlledCharacter-word_44DEA
                 ac_moveRel 1,-1
                 ac_waitDest
word_44DF6:      ac_branch
                dc.w eas_ControlledCharacter-word_44DF6
                 ac_moveRel 0,-1
                 ac_waitDest
word_44E02:      ac_branch
                dc.w eas_ControlledCharacter-word_44E02
                 ac_moveRel -1,-1
                 ac_waitDest
word_44E0E:      ac_branch
                dc.w eas_ControlledCharacter-word_44E0E
                 ac_moveRel -1,0
                 ac_waitDest
word_44E1A:      ac_branch
                dc.w eas_ControlledCharacter-word_44E1A
                 ac_moveRel -1,1
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
                 ac_entityObstructable ON
                 ac_mapUncollidable ON
                 ac_entityUncollidable ON
                 ac_setSpeed 32,32
                 ac_accelFactors 0,0
                 ac_acceleration -2,ON
                 ac_deceleration -2,ON
                if (BUGFIX_MOVEMENT_GLITCH=1)
byte_44E5A:      ac_waitDest
                 ac_checkMapBlockCopy
                 ac_controlCharacter
                else
byte_44E5A:      ac_checkMapBlockCopy
                 ac_controlCharacter
                 ac_waitDest
                endif
word_44E60:      ac_branch
                dc.w (byte_44E5A-word_44E60) & $FFFF
eas_Raft:        ac_entityObstructable ON
                 ac_mapUncollidable ON
                 ac_entityUncollidable ON
                 ac_setSpeed 32,32
                 ac_accelFactors 0,0
                 ac_acceleration -2,ON
                 ac_deceleration -2,ON
byte_44E80:      ac_checkMapBlockCopy
                 ac_controlRaft
                 ac_waitDest
word_44E86:      ac_branch
                dc.w (byte_44E80-word_44E86) & $FFFF
eas_Caravan:     ac_entityObstructable ON
                 ac_mapUncollidable ON
                 ac_entityUncollidable ON
                 ac_setSpeed 32,32
                 ac_accelFactors 0,0
                 ac_acceleration -2,ON
                 ac_deceleration -2,ON
byte_44EA6:      ac_checkMapBlockCopy
                 ac_controlCaravan
                 ac_waitDest
word_44EAC:      ac_branch
                dc.w (byte_44EA6-word_44EAC) & $FFFF
eas_UnitCursorSpeedx2:
                 ac_entityObstructable OFF
                 ac_mapUncollidable OFF
                 ac_entityUncollidable OFF
                 ac_setSpeed 64,64
                 ac_accelFactors 0,0
                 ac_acceleration -2,ON
                 ac_deceleration -2,ON
byte_44ECC:      ac_controlCharacter
                 ac_waitDest
word_44ED0:      ac_branch
                dc.w (byte_44ECC-word_44ED0) & $FFFF
eas_UnitCursor:  ac_entityObstructable OFF
                 ac_mapUncollidable OFF
                 ac_entityUncollidable OFF
                 ac_accelFactors 1,1
                 ac_acceleration -2,ON
                 ac_deceleration -2,ON
byte_44EEC:      ac_waitDest
                 ac_wait 1
word_44EF2:      ac_branch
                dc.w (byte_44EEC-word_44EF2) & $FFFF
eas_44EF6:       ac_entityObstructable OFF
                 ac_mapUncollidable OFF
                 ac_entityUncollidable OFF
                 ac_setSpeed 64,64
                 ac_accelFactors 0,0
                 ac_acceleration -2,ON
                 ac_deceleration -2,ON
word_44F12:      ac_branch
                dc.w (byte_44EEC-word_44F12) & $FFFF
eas_44F16:       ac_entityObstructable OFF
                 ac_mapUncollidable ON
                 ac_entityUncollidable OFF
                 ac_setSpeed 8,8
                 ac_accelFactors 8,8
word_44F2A:      ac_branch
                dc.w (byte_44EEC-word_44F2A) & $FFFF
eas_Follower1:   ac_setSpeed 32,32
                 ac_accelFactors 0,0
                 ac_acceleration OFF,OFF
                 ac_deceleration OFF,OFF
                 ac_entityObstructable OFF
                 ac_mapUncollidable ON
                 ac_entityUncollidable ON
byte_44F4A:      ac_follow 0,-24,0
                 ac_waitDest
word_44F54:      ac_branch
                dc.w (byte_44F4A-word_44F54) & $FFFF
eas_Follower2:   ac_setSpeed 32,32
                 ac_accelFactors 0,0
                 ac_acceleration OFF,OFF
                 ac_deceleration OFF,OFF
                 ac_entityObstructable OFF
                 ac_mapUncollidable ON
                 ac_entityUncollidable ON
byte_44F74:      ac_follow 1,-24,0
                 ac_waitDest
word_44F7E:      ac_branch
                dc.w (byte_44F74-word_44F7E) & $FFFF
eas_Follower3:   ac_setSpeed 32,32
                 ac_accelFactors 0,0
                 ac_acceleration OFF,OFF
                 ac_deceleration OFF,OFF
                 ac_entityObstructable OFF
                 ac_mapUncollidable ON
                 ac_entityUncollidable ON
byte_44F9E:      ac_follow 2,-24,0
                 ac_waitDest
word_44FA8:      ac_branch
                dc.w (byte_44F9E-word_44FA8) & $FFFF
eas_OverworldFollower2:
                 ac_setSpeed 32,32
                 ac_accelFactors 0,0
                 ac_acceleration OFF,OFF
                 ac_deceleration OFF,OFF
                 ac_entityObstructable OFF
                 ac_mapUncollidable ON
                 ac_entityUncollidable ON
byte_44FC8:      ac_setSpeed 32,32
                 ac_follow 0,-24,-24
word_44FD4:      ac_branch
                dc.w (byte_44FC8-word_44FD4) & $FFFF
eas_OverworldFollower3:
                 ac_setSpeed 32,32
                 ac_accelFactors 0,0
                 ac_acceleration OFF,OFF
                 ac_deceleration OFF,OFF
                 ac_entityObstructable OFF
                 ac_mapUncollidable ON
                 ac_entityUncollidable ON
byte_44FF4:      ac_follow 0,-24,24
word_44FFC:      ac_branch
                dc.w (byte_44FF4-word_44FFC) & $FFFF
eas_Follower4:   ac_setSpeed 32,32
                 ac_accelFactors 0,0
                 ac_acceleration OFF,OFF
                 ac_deceleration OFF,OFF
                 ac_entityObstructable OFF
                 ac_mapUncollidable ON
                 ac_entityUncollidable ON
byte_4501C:      ac_follow 3,-24,0
                 ac_waitDest
word_45026:      ac_branch
                dc.w (byte_4501C-word_45026) & $FFFF
eas_OverworldFollower5:
                 ac_setSpeed 32,32
                 ac_accelFactors 0,0
                 ac_acceleration OFF,OFF
                 ac_deceleration OFF,OFF
                 ac_entityObstructable OFF
                 ac_mapUncollidable ON
                 ac_entityUncollidable ON
byte_45046:      ac_follow 4,-24,0
                 ac_waitDest
word_45050:      ac_branch
                dc.w (byte_45046-word_45050) & $FFFF
eas_Walking:     ac_wait 30
                 ac_setSpeed 0,0
                 ac_accelFactors 1,1
                 ac_acceleration -2,ON
                 ac_deceleration -2,ON
                 ac_entityObstructable ON
                 ac_mapUncollidable ON
                 ac_entityUncollidable ON
byte_45074:      ac_randomWalk 16,16,12
                 ac_waitDest
                 ac_wait 20
word_45082:      ac_branch
                dc.w (byte_45074-word_45082) & $FFFF
byte_45086:      ac_accelFactors 1,2
                 ac_setSpeed 0,26
                 ac_acceleration ON,OFF
                 ac_deceleration ON,ON
                 ac_moveRel -2,-2
                 ac_waitDest
eas_EvilGizmoCircle:
                 ac_accelFactors 2,1
                 ac_setSpeed 26,0
                 ac_acceleration ON,ON
                 ac_deceleration ON,OFF
                 ac_moveRel -2,2
                 ac_waitDest
                 ac_accelFactors 1,2
                 ac_setSpeed 0,26
                 ac_acceleration ON,OFF
                 ac_deceleration ON,ON
                 ac_moveRel 2,2
                 ac_waitDest
                 ac_accelFactors 2,1
                 ac_setSpeed 26,0
                 ac_acceleration ON,ON
                 ac_deceleration ON,OFF
                 ac_moveRel 2,-2
                 ac_waitDest
word_450E6:      ac_branch
                dc.w (byte_45086-word_450E6) & $FFFF
byte_450EA:      ac_accelFactors 1,2
                 ac_setSpeed 0,32
                 ac_acceleration ON,OFF
                 ac_deceleration ON,ON
                 ac_moveRel -3,-3
                 ac_waitDest
                 ac_accelFactors 2,1
                 ac_setSpeed 32,0
                 ac_acceleration ON,ON
                 ac_deceleration ON,OFF
                 ac_moveRel -3,3
                 ac_waitDest
                 ac_accelFactors 1,2
                 ac_setSpeed 0,32
                 ac_acceleration ON,OFF
                 ac_deceleration ON,ON
                 ac_moveRel 3,3
                 ac_waitDest
                 ac_accelFactors 2,1
                 ac_setSpeed 32,0
                 ac_acceleration ON,ON
                 ac_deceleration ON,OFF
                 ac_moveRel 3,-3
                 ac_waitDest
word_4514A:      ac_branch
                dc.w (byte_450EA-word_4514A) & $FFFF
                 ac_motion OFF
                 ac_animSpeedX2 ON
                 ac_updateSprite
                 ac_wait 30
                 ac_animSpeedX2 OFF
                 ac_updateSprite
                 ac_wait 10
                 ac_motion ON
word_4516A:      ac_branch
                dc.w eas_Idle-word_4516A
                 ac_autoFacing OFF
                 ac_accelFactors 0,0
                 ac_setSpeed 32,32
                 ac_acceleration OFF,OFF
                 ac_deceleration OFF,OFF
                 ac_moveRel 0,-1
                 ac_wait 5
                 ac_moveRel 0,1
                 ac_wait 5
                 ac_moveRel 0,0
                 ac_autoFacing ON
word_451A0:      ac_branch
                dc.w eas_Idle-word_451A0
                 ac_accelFactors 1,1
                 ac_setSpeed 32,32
                 ac_acceleration -2,ON
                 ac_deceleration OFF,OFF
                 ac_moveRel 0,-2
                 ac_waitDest
                 ac_moveRel 2,0
                 ac_waitDest
                 ac_orientLeft
                 ac_updateSprite
                 ac_wait 60
                 ac_orientUp
                 ac_updateSprite
                 ac_moveRel 2,0
                 ac_waitDest
word_451DC:      ac_branch
                dc.w eas_Idle-word_451DC
eas_Standing:    ac_setSpeed 32,32
                 ac_accelFactors 0,0
                 ac_acceleration OFF,OFF
                 ac_deceleration OFF,OFF
                 ac_entityObstructable OFF
                 ac_mapUncollidable ON
                 ac_entityUncollidable OFF
eas_Idle:        ac_wait 1
word_45200:      ac_branch
                dc.w (eas_Idle-word_45200) & $FFFF
