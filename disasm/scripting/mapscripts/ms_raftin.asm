
; SCRIPT SECTION scripting\mapscripts\ms_raftin :
; Mapscript for getting into Raft ?
byte_453F2:         dc.b 0
										dc.b $15                ; mapscript
										dc.b   0
										dc.b $FF
										dc.l eas_4540C          
										dc.b   0
										dc.b $19
										dc.b $9F 
										dc.b $40 
										dc.b $40 
										dc.b   3
										dc.b   0
										dc.b $15
										dc.b   0
										dc.b $FF
										dc.l eas_45426          
										dc.b $FF
										dc.b $FF
										dc.b $4E 
										dc.b $75 
eas_4540C:          dc.w $E                 ; 000E  $1F $0 $0
										dc.w $1F
										dc.w 0
										dc.w 0
word_45414:         dc.w 0                  ; 0000 WAIT value $6
										dc.w 6
										dc.w $23                ; 0023 SEND SOUND COMMAND $59
										dc.w $59
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w $D                 ; 000D CLONE POSITION FROM ENTITY $1F
										dc.w $1F
word_45422:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FDDA
										dc.w eas_Idle+$10000-word_45422
eas_45426:          dc.w $17                ; 0017 SET ENTITY SPRITE $3D
										dc.w $3D
										dc.w $1F                ; 001F SET 1D BIT 3 $0
										dc.w 0
										dc.w $A                 ; 000A UPDATE SPRITE
word_45430:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FDCC
										dc.w eas_Idle+$10000-word_45430
word_45434:         dc.w $E                 ; 000E  $0 $0 $0
										dc.w 0
										dc.w 0
										dc.w 0
word_4543C:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFD8
										dc.w word_45414+$10000-word_4543C
