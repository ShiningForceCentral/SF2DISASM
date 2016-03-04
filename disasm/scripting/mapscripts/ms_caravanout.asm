
; SCRIPT SECTION scripting\mapscripts\ms_caravanout :
; Mapscript for getting out of Caravan ?
word_45348:         dc.w $15
										dc.w $1EFF
										dc.l eas_45360          
										dc.b   0
										dc.b $1A
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b   0
										dc.b $15
										dc.b   0
										dc.b $FF
										dc.l eas_4536C          
										dc.b $FF
										dc.b $FF
eas_45360:          dc.w $D                 ; 000D CLONE POSITION FROM ENTITY $0
										dc.w 0
word_45364:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FE98
										dc.w eas_Idle+$10000-word_45364
word_45368:         dc.w $D                 ; 000D CLONE POSITION FROM ENTITY $1
										dc.w 1
eas_4536C:          dc.w 9                  ; 0009  $0 $1
										dc.w 0
										dc.w 1
										dc.w $1F                ; 001F SET 1D BIT 3 $FFFF
										dc.w $FFFF
										dc.w $23                ; 0023 SEND SOUND COMMAND $59
										dc.w $59
										dc.w $B                 ; 000B SET SPRITE SIZE $C
										dc.w $C
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $E
										dc.w $E
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $10
										dc.w $10
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $12
										dc.w $12
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $14
										dc.w $14
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $16
										dc.w $16
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $1F                ; 001F SET 1D BIT 3 $0
										dc.w 0
										dc.w $B                 ; 000B SET SPRITE SIZE $10
										dc.w $10
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
word_453C2:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FE3A
										dc.w eas_Idle+$10000-word_453C2
