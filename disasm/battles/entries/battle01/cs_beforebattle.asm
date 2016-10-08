
; SCRIPT SECTION battles\entries\battle01\cs_beforebattle :
; Cutscene before battle 1
bbcs_01:            dc.w 4                  ; 0004 INIT TEXT CURSOR 8F4 : "There you are, {LEADER}.{N}Stay here.{W2}"
										dc.w $8F4
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 39 2 A
										dc.w $39
										dc.w 2
										dc.w $A
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 49694
										dc.l word_49694
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1 8 11 1
										dc.b 1
										dc.b 8
										dc.b $11
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 2 7 11 1
										dc.b 2
										dc.b 7
										dc.b $11
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1 FF 460CE
										dc.b 1
										dc.b $FF
										dc.l eas_Init           
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $32                ; 0032 SET CAMERA DEST 2 8
										dc.w 2
										dc.w 8
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 87 3
										dc.b $87
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 87 : "There you are, {LEADER}.{N}Stay here.{W2}"
										dc.w $87
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "I'll take a look inside the{N}tower.{W1}"
										dc.w $87
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 87
										dc.w $87
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 1 1
										dc.b $87
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 87 0 461B6
										dc.b $87
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "Hmm, what a mysterious{N}tower.  I wonder who built{N}it?{W1}"
										dc.w $87
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 1 1
										dc.b $87
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $C
										dc.b $3C
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "I have a strange feeling{N}about this place.{W1}"
										dc.w $87
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 1 3
										dc.b $87
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "Oh, what's this?{N}I think I have seen this{N}symbol before....{W1}"
										dc.w $87
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 87 0 461B6
										dc.b $87
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST 2 A
										dc.w 2
										dc.w $A
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 2 0 461B6
										dc.b 2
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2 : "What's happening?{W1}"
										dc.w 2
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 1 1
										dc.b 1
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1 : "Look!  Something is{N}appearing.  What's that?{W1}"
										dc.w 1
										dc.w $23                ; 0023 SET ENTITY FACING 87 1
										dc.b $87
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 2 1
										dc.w 2
										dc.w 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 7 4 3
										dc.b $80
										dc.b 7
										dc.b 4
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 87 FF 46172
										dc.b $87
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 3 1
										dc.b $87
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 87 : "An evil Gizmo!  A devil{N}that possesses people!{W2}"
										dc.w $87
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "Why are you here?{W1}"
										dc.w $87
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 1
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 0 1
										dc.b $87
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "Where are you going?{N}What...wait!  You're here to{N}possess the King, aren't you?{W1}"
										dc.w $87
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 2 1
										dc.b $87
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "I won't let you pass.{N}You shall not harm the King!{W1}"
										dc.w $87
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 7 4 3
										dc.b $81
										dc.b 7
										dc.b 4
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 7 4 3
										dc.b $82
										dc.b 7
										dc.b 4
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 7 4 3
										dc.b $83
										dc.b 7
										dc.b 4
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 7 4 3
										dc.b $84
										dc.b 7
										dc.b 4
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 7 4 3
										dc.b $85
										dc.b 7
										dc.b 4
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 7 4 3
										dc.b $86
										dc.b 7
										dc.b 4
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 46172
										dc.b $83
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 46172
										dc.b $84
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 46172
										dc.b $85
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 46172
										dc.b $86
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 81 0 1 1
										dc.b $81
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 82 0 2 1
										dc.b $82
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 83 0 3 1
										dc.b $83
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 84 0 0 2
										dc.b $84
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 0 0 3
										dc.b $85
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 0 0 3
										dc.b $86
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 87 : "This doesn't look good.{W2}"
										dc.w $87
										dc.w $23                ; 0023 SET ENTITY FACING 87 3
										dc.b $87
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "We'll stop the evil Gizmo{N}here.  {LEADER}, defeat{N}these fiends!{W1}"
										dc.w $87
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_49694:         dc.w 7
										dc.w $10
										dc.w 1
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $72
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $67
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $67
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $67
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $67
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $67
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $67
										dc.l eas_Init           
										dc.b 7
										dc.b $B
										dc.b 1
										dc.b $D1
										dc.l eas_Init           
										dc.w $FFFF
