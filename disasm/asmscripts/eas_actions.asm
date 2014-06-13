
; SCRIPT SECTION eas_actions :
; Entity scripts for cutscene actions
eas_Jump:           dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $0
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
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_JumpLeft:       dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $0
										dc.w 0
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFF Y=Y+$FFFF
										dc.w $FFFF
										dc.w $FFFF
										dc.w 0                  ; 0000 WAIT value $6
										dc.w 6
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFF Y=Y+$1
										dc.w $FFFF
										dc.w 1
										dc.w 0                  ; 0000 WAIT value $6
										dc.w 6
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$0
										dc.w 0
										dc.w 0
										dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $FFFF
										dc.w $FFFF
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_JumpRight:      dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $0
										dc.w 0
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$1 Y=Y+$FFFF
										dc.w 1
										dc.w $FFFF
										dc.w 0                  ; 0000 WAIT value $6
										dc.w 6
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$1 Y=Y+$1
										dc.w 1
										dc.w 1
										dc.w 0                  ; 0000 WAIT value $6
										dc.w 6
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$0
										dc.w 0
										dc.w 0
										dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $FFFF
										dc.w $FFFF
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_BumpRight:      dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $0
										dc.w 0
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$1 Y=Y+$0
										dc.w 1
										dc.w 0
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFF Y=Y+$0
										dc.w $FFFF
										dc.w 0
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$0
										dc.w 0
										dc.w 0
										dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $FFFF
										dc.w $FFFF
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_BumpLeft:       dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $0
										dc.w 0
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFF Y=Y+$0
										dc.w $FFFF
										dc.w 0
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$1 Y=Y+$0
										dc.w 1
										dc.w 0
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$0
										dc.w 0
										dc.w 0
										dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $FFFF
										dc.w $FFFF
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_BumpUp:         dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $0
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
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_BumpDown:       dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $0
										dc.w 0
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$1
										dc.w 0
										dc.w 1
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$FFFF
										dc.w 0
										dc.w $FFFF
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$0
										dc.w 0
										dc.w 0
										dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $FFFF
										dc.w $FFFF
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $14                ; 0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ; 001B SET FLIPPING $0
										dc.w 0
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_LyingLeftBis:   dc.w $14                ; 0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ; 001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_45F7C:          dc.w $14                ; 0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ; 001B SET FLIPPING $2
										dc.w 2
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_LyingRightBis:  dc.w $14                ; 0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ; 001B SET FLIPPING $3
										dc.w 3
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_45F9C:          dc.w $20                ; 0020 SET ENTITY IN WATER $FFFF
										dc.w $FFFF
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_Transparent:    dc.w $1C                ; 001C SET TRANSPARENCY $FFFF
										dc.w $FFFF
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_AnimSpeedx2:    dc.w $1E                ; 001E SET ANIM SPEED X2 $FFFF
										dc.w $FFFF
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_RotateRight:    dc.w $14                ; 0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $0
										dc.w 0
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $1
										dc.w 1
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $0
										dc.w 0
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
word_45FEC:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFD0
										dc.w eas_RotateRight+$10000-word_45FEC
eas_RotateRightHighSpeed:
										dc.w $14                ; 0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $0
										dc.w 0
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $22                ; 0022 SET FACING $1
										dc.w 1
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $22                ; 0022 SET FACING $0
										dc.w 0
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
word_46020:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFD0
										dc.w eas_RotateRightHighSpeed+$10000-word_46020
eas_Die:            dc.w $14                ; 0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $3
										dc.w 3
										dc.w $22                ; 0022 SET FACING $1
										dc.w 1
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $3
										dc.w 3
										dc.w $22                ; 0022 SET FACING $0
										dc.w 0
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $3
										dc.w 3
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $3
										dc.w 3
										dc.w $22                ; 0022 SET FACING $1
										dc.w 1
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $3
										dc.w 3
										dc.w $22                ; 0022 SET FACING $0
										dc.w 0
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $3
										dc.w 3
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $3
										dc.w 3
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $3
										dc.w 3
										dc.w $22                ; 0022 SET FACING $1
										dc.w 1
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $3
										dc.w 3
										dc.w $22                ; 0022 SET FACING $0
										dc.w 0
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $3
										dc.w 3
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $3
										dc.w 3
										dc.w $23                ; 0023 SEND SOUND COMMAND $74
										dc.w $74
										dc.w $17                ; 0017 SET ENTITY SPRITE $3F
										dc.w $3F
										dc.w $22                ; 0022 SET FACING $1
										dc.w 1
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $8
										dc.w 8
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $8
										dc.w 8
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $8
										dc.w 8
										dc.w $C                 ; 000C SET POSITION X=$3F Y=$3F
										dc.w $3F
										dc.w $3F
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_Init:           dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $12                ; 0012  $0
										dc.w 0
										dc.w $13                ; 0013  $0
										dc.w 0
										dc.w $18                ; 0018 SET 1C BIT 7 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $0
										dc.w 0
										dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $FFFF
										dc.w $FFFF
										dc.w $1B                ; 001B SET FLIPPING $0
										dc.w 0
										dc.w $20                ; 0020 SET ENTITY IN WATER $0
										dc.w 0
										dc.w $B                 ; 000B SET SPRITE SIZE $18
										dc.w $18
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_Init2:          dc.w $10                ; 0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $11                ; 0011  $101
										dc.w $101
										dc.w $12                ; 0012  $FEFF
										dc.w $FEFF
										dc.w $13                ; 0013  $FEFF
										dc.w $FEFF
										dc.w $18                ; 0018 SET 1C BIT 7 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $0
										dc.w 0
										dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $FFFF
										dc.w $FFFF
										dc.w $1B                ; 001B SET FLIPPING $0
										dc.w 0
										dc.w $20                ; 0020 SET ENTITY IN WATER $0
										dc.w 0
										dc.w $B                 ; 000B SET SPRITE SIZE $18
										dc.w $18
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_Init3:          dc.w $11                ; 0011  $0
										dc.w 0
										dc.w $10                ; 0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $12                ; 0012  $0
										dc.w 0
										dc.w $13                ; 0013  $0
										dc.w 0
										dc.w $18                ; 0018 SET 1C BIT 7 $FFFF
										dc.w $FFFF
										dc.w $1A                ; 001A SET 1C BIT 5 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $0
										dc.w 0
										dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $FFFF
										dc.w $FFFF
										dc.w $1B                ; 001B SET FLIPPING $0
										dc.w 0
										dc.w $20                ; 0020 SET ENTITY IN WATER $0
										dc.w 0
										dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $0
										dc.w 0
										dc.w $14                ; 0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $B                 ; 000B SET SPRITE SIZE $18
										dc.w $18
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_46172:          dc.w $15                ; 0015 SET ABILITY TO CHANGE FACING $0
										dc.w 0
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $11                ; 0011  $101
										dc.w $101
										dc.w $12                ; 0012  $FEFF
										dc.w $FEFF
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_4618A:          dc.w $11                ; 0011  $101
										dc.w $101
										dc.w $13                ; 0013  $FEFF
										dc.w $FEFF
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_46198:          dc.w $11                ; 0011  $101
										dc.w $101
										dc.w $12                ; 0012  $FEFF
										dc.w $FEFF
										dc.w $13                ; 0013  $FEFF
										dc.w $FEFF
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_461AA:          dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$0
										dc.w 0
										dc.w 0
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_461B6:          dc.w $22                ; 0022 SET FACING $0
										dc.w 0
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w $22                ; 0022 SET FACING $0
										dc.w 0
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_461E4:          dc.w $22                ; 0022 SET FACING $1
										dc.w 1
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w $22                ; 0022 SET FACING $1
										dc.w 1
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_46212:          dc.w $10                ; 0010 SET SPEED X=$0 Y=$0
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
										dc.w $1A                ; 001A SET 1C BIT 5 $0
										dc.w 0
										dc.w $19                ; 0019 SET 1C BIT 6 $0
										dc.w 0
word_4622E:         dc.w $22                ; 0022 SET FACING $0
										dc.w 0
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $3C
										dc.w $3C
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $3C
										dc.w $3C
word_46242:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFEC
										dc.w word_4622E+$10000-word_46242
eas_46246:          dc.w $10                ; 0010 SET SPEED X=$0 Y=$0
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
										dc.w $1A                ; 001A SET 1C BIT 5 $FFFF
										dc.w $FFFF
										dc.w $19                ; 0019 SET 1C BIT 6 $0
										dc.w 0
word_46262:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $4C
										dc.w word_462AE-word_46262
eas_46266:          dc.w $10                ; 0010 SET SPEED X=$0 Y=$0
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
										dc.w $1A                ; 001A SET 1C BIT 5 $FFFF
										dc.w $FFFF
										dc.w $19                ; 0019 SET 1C BIT 6 $0
										dc.w 0
word_46282:         dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$1 Y=Y+$0
										dc.w 1
										dc.w 0
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFF Y=Y+$0
										dc.w $FFFF
										dc.w 0
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w 0                  ; 0000 WAIT value $3C
										dc.w $3C
word_462AE:         dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFF Y=Y+$0
										dc.w $FFFF
										dc.w 0
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w $22                ; 0022 SET FACING $0
										dc.w 0
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1E
										dc.w $1E
										dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$1 Y=Y+$0
										dc.w 1
										dc.w 0
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w 0                  ; 0000 WAIT value $3C
										dc.w $3C
word_462DA:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFA8
										dc.w word_46282+$10000-word_462DA
										dc.w $23                ; 0023 SEND SOUND COMMAND $57
										dc.w $57
										dc.w $17                ; 0017 SET ENTITY SPRITE $3F
										dc.w $3F
										dc.w $22                ; 0022 SET FACING $1
										dc.w 1
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $8
										dc.w 8
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $8
										dc.w 8
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $8
										dc.w 8
										dc.w $17                ; 0017 SET ENTITY SPRITE $3C
										dc.w $3C
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_46310:          dc.w $1F                ; 001F SET 1D BIT 3 $FFFF
										dc.w $FFFF
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $B                 ; 000B SET SPRITE SIZE $6
										dc.w 6
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $B                 ; 000B SET SPRITE SIZE $8
										dc.w 8
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $0
										dc.w 0
										dc.w $B                 ; 000B SET SPRITE SIZE $A
										dc.w $A
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $C
										dc.w $C
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $B                 ; 000B SET SPRITE SIZE $E
										dc.w $E
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $B                 ; 000B SET SPRITE SIZE $10
										dc.w $10
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $0
										dc.w 0
										dc.w $B                 ; 000B SET SPRITE SIZE $12
										dc.w $12
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $14
										dc.w $14
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $B                 ; 000B SET SPRITE SIZE $16
										dc.w $16
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $B                 ; 000B SET SPRITE SIZE $18
										dc.w $18
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $1F                ; 001F SET 1D BIT 3 $0
										dc.w 0
										dc.w $B                 ; 000B SET SPRITE SIZE $12
										dc.w $12
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x460CE
										dc.l eas_Init           
eas_463AE:          dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $1F                ; 001F SET 1D BIT 3 $FFFF
										dc.w $FFFF
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $B                 ; 000B SET SPRITE SIZE $16
										dc.w $16
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $0
										dc.w 0
										dc.w $B                 ; 000B SET SPRITE SIZE $14
										dc.w $14
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $12
										dc.w $12
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $B                 ; 000B SET SPRITE SIZE $10
										dc.w $10
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $B                 ; 000B SET SPRITE SIZE $E
										dc.w $E
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $0
										dc.w 0
										dc.w $B                 ; 000B SET SPRITE SIZE $C
										dc.w $C
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $A
										dc.w $A
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $2
										dc.w 2
										dc.w $B                 ; 000B SET SPRITE SIZE $8
										dc.w 8
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $22                ; 0022 SET FACING $3
										dc.w 3
										dc.w $B                 ; 000B SET SPRITE SIZE $6
										dc.w 6
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $C                 ; 000C SET POSITION X=$3F Y=$3F
										dc.w $3F
										dc.w $3F
										dc.w $1F                ; 001F SET 1D BIT 3 $0
										dc.w 0
										dc.w $B                 ; 000B SET SPRITE SIZE $12
										dc.w $12
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $1F                ; 001F SET 1D BIT 3 $FFFF
										dc.w $FFFF
										dc.w $B                 ; 000B SET SPRITE SIZE $16
										dc.w $16
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $B                 ; 000B SET SPRITE SIZE $14
										dc.w $14
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $B                 ; 000B SET SPRITE SIZE $12
										dc.w $12
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $B                 ; 000B SET SPRITE SIZE $10
										dc.w $10
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $B                 ; 000B SET SPRITE SIZE $E
										dc.w $E
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $B                 ; 000B SET SPRITE SIZE $C
										dc.w $C
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $B                 ; 000B SET SPRITE SIZE $A
										dc.w $A
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $B                 ; 000B SET SPRITE SIZE $8
										dc.w 8
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $B                 ; 000B SET SPRITE SIZE $6
										dc.w 6
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $5
										dc.w 5
										dc.w $C                 ; 000C SET POSITION X=$3F Y=$3F
										dc.w $3F
										dc.w $3F
										dc.w $1F                ; 001F SET 1D BIT 3 $0
										dc.w 0
										dc.w $B                 ; 000B SET SPRITE SIZE $12
										dc.w $12
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
eas_464BE:          dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFF Y=Y+$FFFF
										dc.w $FFFF
										dc.w $FFFF
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
eas_464C6:          dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFF Y=Y+$1
										dc.w $FFFF
										dc.w 1
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
eas_464CE:          dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$1 Y=Y+$1
										dc.w 1
										dc.w 1
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
eas_464D6:          dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$1 Y=Y+$FFFF
										dc.w 1
										dc.w $FFFF
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_464DE:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFE0
										dc.w eas_464BE+$10000-word_464DE
eas_464E2:          dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFF Y=Y+$1
										dc.w $FFFF
										dc.w 1
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
eas_464EA:          dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$FFFF Y=Y+$FFFF
										dc.w $FFFF
										dc.w $FFFF
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
eas_464F2:          dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$1 Y=Y+$FFFF
										dc.w 1
										dc.w $FFFF
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
eas_464FA:          dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$1 Y=Y+$1
										dc.w 1
										dc.w 1
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_46502:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFE0
										dc.w eas_464E2+$10000-word_46502
