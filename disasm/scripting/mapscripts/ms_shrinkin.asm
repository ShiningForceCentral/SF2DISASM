
; SCRIPT SECTION scripting\mapscripts\ms_shrinkin :
; Mapscript for shrinking in ?
byte_45546:         dc.b 0
										dc.b $15                ; mapscript
										dc.b   0
										dc.b $FF
										dc.l eas_ShrinkIn       
										dc.b   0
										dc.b $19
										dc.b 0
										dc.b $40 
										dc.b $40 
										dc.b   3
										dc.b $FF
										dc.b $FF
eas_ShrinkIn:       dc.w $E                 ; 000E  $1 $0 $0
										dc.w 1
										dc.w 0
										dc.w 0
										dc.w 0                  ; 0000 WAIT value $6
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
										dc.w $D                 ; 000D CLONE POSITION FROM ENTITY $0
										dc.w 0
word_455A8:         dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FC54
										dc.w eas_Idle+$10000-word_455A8
