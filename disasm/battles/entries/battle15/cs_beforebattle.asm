
; SCRIPT SECTION battles\entries\battle15\cs_beforebattle :
; Cutscene before battle 15
bbcs_15:            dc.w 4                  ; 0004 INIT TEXT CURSOR 9C7 : "This is the Ancient Hall{N}that leads to the Ancient{N}Tunnel...{W1}"
										dc.w $9C7
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 32 9 F
										dc.w $32
										dc.w 9
										dc.w $F
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4AE42
										dc.l word_4AE42
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E E 13 1
										dc.b $1E
										dc.b $E
										dc.b $13
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F F 14 1
										dc.b $1F
										dc.b $F
										dc.b $14
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 14 1
										dc.b 7
										dc.b $D
										dc.b $14
										dc.b 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E : "This is the Ancient Hall{N}that leads to the Ancient{N}Tunnel...{W1}"
										dc.w $1E
										dc.w $2D                ; 002D MOVE ENTITY 1E FF 1 1
										dc.b $1E
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST 9 4
										dc.w 9
										dc.w 4
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45E44
										dc.b $81
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45E44
										dc.b $82
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 45E44
										dc.b $83
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 45E44
										dc.b $84
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST 9 F
										dc.w 9
										dc.w $F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E : "There are more monsters here!{W2}"
										dc.w $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1E 3
										dc.b $1E
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E : "{LEADER}, take 'em out!{W1}"
										dc.w $1E
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4AE42:         dc.w $E
										dc.w $14
										dc.w 1
										dc.b $E
										dc.b 7
										dc.b 3
										dc.b $49
										dc.l eas_Init           
										dc.b $F
										dc.b 6
										dc.b 3
										dc.b $6B
										dc.l eas_Init           
										dc.b $D
										dc.b 6
										dc.b 3
										dc.b $85
										dc.l eas_Init           
										dc.b $10
										dc.b 7
										dc.b 3
										dc.b $8E
										dc.l eas_Init           
										dc.b $C
										dc.b 7
										dc.b 3
										dc.b $7C
										dc.l eas_Init           
										dc.w $FFFF
