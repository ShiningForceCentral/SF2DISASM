
; SCRIPT SECTION scripting\mapscripts\ms_caravanin :
; Mapscript for getting into Caravan ?
byte_45284:         dc.b 0                  ; mapscript
										dc.b $15
										dc.b $1E
										dc.b $FF
										dc.l eas_452A4          
										dc.b   0
										dc.b $15
										dc.b   0
										dc.b $FF
										dc.l eas_452B2          
										dc.b 0
										dc.b $19
										dc.b $1E
										dc.b $40 
										dc.b $40 
										dc.b   3
										dc.b   0
										dc.b $15
										dc.b   0
										dc.b $FF
										dc.l eas_45308          
										dc.b $FF
										dc.b $FF
eas_452A4:          dc.w $E                 ; 000E  $0 $0 $1
										dc.w 0
										dc.w 0
										dc.w 1
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_452AE:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FF4E
										dc.w eas_Idle+$10000-word_452AE
eas_452B2:          dc.w $E                 ; 000E  $1 $0 $0
										dc.w 1
										dc.w 0
										dc.w 0
eas_452BA:          dc.w 0                  ; 0000 WAIT value $6
										dc.w 6
										dc.w $1F                ; 001F SET 1D BIT 3 $FFFF
										dc.w $FFFF
										dc.w $23                ; 0023 SEND SOUND COMMAND $59
										dc.w $59
										dc.w $B                 ; 000B SET SPRITE SIZE $16
										dc.w $16
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $14
										dc.w $14
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $12
										dc.w $12
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $10
										dc.w $10
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $E
										dc.w $E
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $C
										dc.w $C
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w $D                 ; 000D CLONE POSITION FROM ENTITY $1
										dc.w 1
word_45304:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FEF8
										dc.w eas_Idle+$10000-word_45304
eas_45308:          dc.w $17                ; 0017 SET ENTITY SPRITE $3E
										dc.w $3E
										dc.w $1F                ; 001F SET 1D BIT 3 $0
										dc.w 0
										dc.w $A                 ; 000A UPDATE SPRITE
word_45312:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FEEA
										dc.w eas_Idle+$10000-word_45312
word_45316:         dc.w $E                 ; 000E  $0 $0 $0
										dc.w 0
										dc.w 0
										dc.w 0
word_4531E:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FF9C
										dc.w eas_452BA+$10000-word_4531E
