
; SCRIPT SECTION eas_main :
; Main entity actscripts
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$1 Y=Y+$0
										dc.w 1
										dc.w 0
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_44DEA:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $54
										dc.w eas_ControlledCharacter-word_44DEA
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$1 Y=Y+$FFFF
										dc.w 1
										dc.w $FFFF
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_44DF6:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $48
										dc.w eas_ControlledCharacter-word_44DF6
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$FFFF
										dc.w 0
										dc.w $FFFF
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_44E02:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $3C
										dc.w eas_ControlledCharacter-word_44E02
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFF Y=Y+$FFFF
										dc.w $FFFF
										dc.w $FFFF
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_44E0E:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $30
										dc.w eas_ControlledCharacter-word_44E0E
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFF Y=Y+$0
										dc.w $FFFF
										dc.w 0
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_44E1A:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $24
										dc.w eas_ControlledCharacter-word_44E1A
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFF Y=Y+$1
										dc.w $FFFF
										dc.w 1
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_44E26:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $18
										dc.w eas_ControlledCharacter-word_44E26
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$1
										dc.w 0
										dc.w 1
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_44E32:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $C
										dc.w eas_ControlledCharacter-word_44E32
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$1 Y=Y+$1
										dc.w 1
										dc.w 1
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
eas_ControlledCharacter:
										dc.w $18                ; 0018 SET 1C BIT 7 $FFFF
										dc.w $FFFF
										dc.w $19                ; 0019 SET 1C BIT 6 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $FFFF
										dc.w $FFFF
										dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $12                ; 0012  $FEFF
										dc.w $FEFF
										dc.w $13                ; 0013  $FEFF
										dc.w $FEFF
word_44E5A:         dc.w $40                ; 0040 
										dc.w 2                  ; 0002 BIG ONE RELATED TO CAMERA
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_44E60:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFFA
										dc.w word_44E5A+$10000-word_44E60
eas_Raft:           dc.w $18                ; 0018 SET 1C BIT 7 $FFFF
										dc.w $FFFF
										dc.w $19                ; 0019 SET 1C BIT 6 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $FFFF
										dc.w $FFFF
										dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $12                ; 0012  $FEFF
										dc.w $FEFF
										dc.w $13                ; 0013  $FEFF
										dc.w $FEFF
word_44E80:         dc.w $40                ; 0040 
										dc.w 7                  ; 0007 CONTROLLING RAFT
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_44E86:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFFA
										dc.w word_44E80+$10000-word_44E86
eas_Caravan:        dc.w $18                ; 0018 SET 1C BIT 7 $FFFF
										dc.w $FFFF
										dc.w $19                ; 0019 SET 1C BIT 6 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $FFFF
										dc.w $FFFF
										dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $12                ; 0012  $FEFF
										dc.w $FEFF
										dc.w $13                ; 0013  $FEFF
										dc.w $FEFF
word_44EA6:         dc.w $40                ; 0040 
										dc.w 8                  ; 0008 CONTROLLING CARAVAN 
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_44EAC:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFFA
										dc.w word_44EA6+$10000-word_44EAC
eas_UnitCursorSpeedx2:
										dc.w $18                ; 0018 SET 1C BIT 7 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $0
										dc.w 0
										dc.w $1A                ; 001A SET 1C BIT 5 $0
										dc.w 0
										dc.w $10                ; 0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $12                ; 0012  $FEFF
										dc.w $FEFF
										dc.w $13                ; 0013  $FEFF
										dc.w $FEFF
word_44ECC:         dc.w 2                  ; 0002 BIG ONE RELATED TO CAMERA
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_44ED0:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFFC
										dc.w word_44ECC+$10000-word_44ED0
eas_UnitCursor:     dc.w $18                ; 0018 SET 1C BIT 7 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $0
										dc.w 0
										dc.w $1A                ; 001A SET 1C BIT 5 $0
										dc.w 0
										dc.w $11                ; 0011  $101
										dc.w $101
										dc.w $12                ; 0012  $FEFF
										dc.w $FEFF
										dc.w $13                ; 0013  $FEFF
										dc.w $FEFF
word_44EEC:         dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
word_44EF2:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFFA
										dc.w word_44EEC+$10000-word_44EF2
eas_44EF6:          dc.w $18                ; 0018 SET 1C BIT 7 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $0
										dc.w 0
										dc.w $1A                ; 001A SET 1C BIT 5 $0
										dc.w 0
										dc.w $10                ; 0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $12                ; 0012  $FEFF
										dc.w $FEFF
										dc.w $13                ; 0013  $FEFF
										dc.w $FEFF
word_44F12:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFDA
										dc.w word_44EEC+$10000-word_44F12
eas_44F16:          dc.w $18                ; 0018 SET 1C BIT 7 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $0
										dc.w 0
										dc.w $10                ; 0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $11                ; 0011  $808
										dc.w $808
word_44F2A:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFC2
										dc.w word_44EEC+$10000-word_44F2A
eas_Follower1:      dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $12                ; 0012  $0
										dc.w 0
										dc.w $13                ; 0013  $0
										dc.w 0
										dc.w $18                ; 0018 SET 1C BIT 7 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $FFFF
										dc.w $FFFF
word_44F4A:         dc.w 3                  ; 0003  $0 $FFE8 $0
										dc.w 0
										dc.w $FFE8
										dc.w 0
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_44F54:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFF6
										dc.w word_44F4A+$10000-word_44F54
eas_Follower2:      dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $12                ; 0012  $0
										dc.w 0
										dc.w $13                ; 0013  $0
										dc.w 0
										dc.w $18                ; 0018 SET 1C BIT 7 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $FFFF
										dc.w $FFFF
word_44F74:         dc.w 3                  ; 0003  $1 $FFE8 $0
										dc.w 1
										dc.w $FFE8
										dc.w 0
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_44F7E:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFF6
										dc.w word_44F74+$10000-word_44F7E
eas_Follower3:      dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $12                ; 0012  $0
										dc.w 0
										dc.w $13                ; 0013  $0
										dc.w 0
										dc.w $18                ; 0018 SET 1C BIT 7 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $FFFF
										dc.w $FFFF
word_44F9E:         dc.w 3                  ; 0003  $2 $FFE8 $0
										dc.w 2
										dc.w $FFE8
										dc.w 0
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_44FA8:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFF6
										dc.w word_44F9E+$10000-word_44FA8
eas_OverworldFollower2:
										dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $12                ; 0012  $0
										dc.w 0
										dc.w $13                ; 0013  $0
										dc.w 0
										dc.w $18                ; 0018 SET 1C BIT 7 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $FFFF
										dc.w $FFFF
word_44FC8:         dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w 3                  ; 0003  $0 $FFE8 $FFE8
										dc.w 0
										dc.w $FFE8
										dc.w $FFE8
word_44FD4:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFF4
										dc.w word_44FC8+$10000-word_44FD4
eas_OverworldFollower3:
										dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $12                ; 0012  $0
										dc.w 0
										dc.w $13                ; 0013  $0
										dc.w 0
										dc.w $18                ; 0018 SET 1C BIT 7 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $FFFF
										dc.w $FFFF
word_44FF4:         dc.w 3                  ; 0003  $0 $FFE8 $18
										dc.w 0
										dc.w $FFE8
										dc.w $18
word_44FFC:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFF8
										dc.w word_44FF4+$10000-word_44FFC
eas_Follower4:      dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $12                ; 0012  $0
										dc.w 0
										dc.w $13                ; 0013  $0
										dc.w 0
										dc.w $18                ; 0018 SET 1C BIT 7 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $FFFF
										dc.w $FFFF
word_4501C:         dc.w 3                  ; 0003  $3 $FFE8 $0
										dc.w 3
										dc.w $FFE8
										dc.w 0
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_45026:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFF6
										dc.w word_4501C+$10000-word_45026
eas_OverworldFollower5:
										dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $12                ; 0012  $0
										dc.w 0
										dc.w $13                ; 0013  $0
										dc.w 0
										dc.w $18                ; 0018 SET 1C BIT 7 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $FFFF
										dc.w $FFFF
word_45046:         dc.w 3                  ; 0003  $4 $FFE8 $0
										dc.w 4
										dc.w $FFE8
										dc.w 0
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_45050:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFF6
										dc.w word_45046+$10000-word_45050
eas_Walking:        dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w $10                ; 0010 SET SPEED X=$0 Y=$0
										dc.b 0
										dc.b 0
										dc.w $11                ; 0011  $101
										dc.w $101
										dc.w $12                ; 0012  $FEFF
										dc.w $FEFF
										dc.w $13                ; 0013  $FEFF
										dc.w $FEFF
										dc.w $18                ; 0018 SET 1C BIT 7 $FFFF
										dc.w $FFFF
										dc.w $19                ; 0019 SET 1C BIT 6 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $FFFF
										dc.w $FFFF
word_45074:         dc.w 6                  ; 0006  $10 $10 $C
										dc.w $10
										dc.w $10
										dc.w $C
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w 0                  ; 0000 WAIT value $14
										dc.w $14
word_45082:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFF2
										dc.w word_45074+$10000-word_45082
word_45086:         dc.w $11                ; 0011  $102
										dc.w $102
										dc.w $10                ; 0010 SET SPEED X=$0 Y=$1A
										dc.b 0
										dc.b $1A
										dc.w $12                ; 0012  $FF00
										dc.w $FF00
										dc.w $13                ; 0013  $FFFF
										dc.w $FFFF
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFE Y=Y+$FFFE
										dc.w $FFFE
										dc.w $FFFE
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
eas_4509E:          dc.w $11                ; 0011  $201
										dc.w $201
										dc.w $10                ; 0010 SET SPEED X=$1A Y=$0
										dc.b $1A
										dc.b 0
										dc.w $12                ; 0012  $FFFF
										dc.w $FFFF
										dc.w $13                ; 0013  $FF00
										dc.w $FF00
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFE Y=Y+$2
										dc.w $FFFE
										dc.w 2
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w $11                ; 0011  $102
										dc.w $102
										dc.w $10                ; 0010 SET SPEED X=$0 Y=$1A
										dc.b 0
										dc.b $1A
										dc.w $12                ; 0012  $FF00
										dc.w $FF00
										dc.w $13                ; 0013  $FFFF
										dc.w $FFFF
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$2 Y=Y+$2
										dc.w 2
										dc.w 2
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w $11                ; 0011  $201
										dc.w $201
										dc.w $10                ; 0010 SET SPEED X=$1A Y=$0
										dc.b $1A
										dc.b 0
										dc.w $12                ; 0012  $FFFF
										dc.w $FFFF
										dc.w $13                ; 0013  $FF00
										dc.w $FF00
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$2 Y=Y+$FFFE
										dc.w 2
										dc.w $FFFE
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_450E6:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFA0
										dc.w word_45086+$10000-word_450E6
word_450EA:         dc.w $11                ; 0011  $102
										dc.w $102
										dc.w $10                ; 0010 SET SPEED X=$0 Y=$20
										dc.b 0
										dc.b $20
										dc.w $12                ; 0012  $FF00
										dc.w $FF00
										dc.w $13                ; 0013  $FFFF
										dc.w $FFFF
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFD Y=Y+$FFFD
										dc.w $FFFD
										dc.w $FFFD
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w $11                ; 0011  $201
										dc.w $201
										dc.w $10                ; 0010 SET SPEED X=$20 Y=$0
										dc.b $20
										dc.b 0
										dc.w $12                ; 0012  $FFFF
										dc.w $FFFF
										dc.w $13                ; 0013  $FF00
										dc.w $FF00
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFD Y=Y+$3
										dc.w $FFFD
										dc.w 3
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w $11                ; 0011  $102
										dc.w $102
										dc.w $10                ; 0010 SET SPEED X=$0 Y=$20
										dc.b 0
										dc.b $20
										dc.w $12                ; 0012  $FF00
										dc.w $FF00
										dc.w $13                ; 0013  $FFFF
										dc.w $FFFF
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$3 Y=Y+$3
										dc.w 3
										dc.w 3
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w $11                ; 0011  $201
										dc.w $201
										dc.w $10                ; 0010 SET SPEED X=$20 Y=$0
										dc.b $20
										dc.b 0
										dc.w $12                ; 0012  $FFFF
										dc.w $FFFF
										dc.w $13                ; 0013  $FF00
										dc.w $FF00
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$3 Y=Y+$FFFD
										dc.w 3
										dc.w $FFFD
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_4514A:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFA0
										dc.w word_450EA+$10000-word_4514A
										dc.w $14                ; 0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1E                ; 001E SET ANIM SPEED X2 $FFFF
										dc.w $FFFF
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w $1E                ; 001E SET ANIM SPEED X2 $0
										dc.w 0
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $A
										dc.w $A
										dc.w $14                ; 0014 SET ANIM COUNTER $FFFF
										dc.w $FFFF
word_4516A:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $92
										dc.w eas_Idle-word_4516A
										dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $0
										dc.w 0
										dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $12                ; 0012  $0
										dc.w 0
										dc.w $13                ; 0013  $0
										dc.w 0
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$FFFF
										dc.w 0
										dc.w $FFFF
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$1
										dc.w 0
										dc.w 1
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$0
										dc.w 0
										dc.w 0
										dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $FFFF
										dc.w $FFFF
word_451A0:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $5C
										dc.w eas_Idle-word_451A0
										dc.w $11                ; 0011  $101
										dc.w $101
										dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $12                ; 0012  $FEFF
										dc.w $FEFF
										dc.w $13                ; 0013  $0
										dc.w 0
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$FFFE
										dc.w 0
										dc.w $FFFE
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$2 Y=Y+$0
										dc.w 2
										dc.w 0
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w $1B                ; 001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $3C
										dc.w $3C
										dc.w $1B                ; 001B SET FLIPPING $0
										dc.w 0
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$2 Y=Y+$0
										dc.w 2
										dc.w 0
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_451DC:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $20
										dc.w eas_Idle-word_451DC
eas_Standing:       dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $12                ; 0012  $0
										dc.w 0
										dc.w $13                ; 0013  $0
										dc.w 0
										dc.w $18                ; 0018 SET 1C BIT 7 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $0
										dc.w 0
eas_Idle:           dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
word_45200:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFFC
