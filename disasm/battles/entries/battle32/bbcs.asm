
; SCRIPT SECTION battles\entries\battle32\bbcs :
; Cutscene before battle 32
bbcs_32:            dc.w 4                  ; 0004 SET TEXT INDEX B1D
										dc.w $B1D
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 4A A 26
										dc.w $4A
										dc.w $A
										dc.w $26
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4CCC0
										dc.l word_4CCC0
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 10 2D 1
										dc.b 7
										dc.b $10
										dc.b $2D
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F E 2D 1
										dc.b $1F
										dc.b $E
										dc.b $2D
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 16 FF 460CE
										dc.b $16
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 16 F 2E 1
										dc.b $16
										dc.b $F
										dc.b $2E
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E F 2D 1
										dc.b $1E
										dc.b $F
										dc.b $2D
										dc.b 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 3
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 3
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 1 3
										dc.b $1F
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1E 0 1 3
										dc.b $1E
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 16 FF 1 3
										dc.b $16
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST A 12
										dc.w $A
										dc.w $12
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
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
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45E44
										dc.b $84
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E44
										dc.b $85
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 45E44
										dc.b $86
										dc.b $FF
										dc.l eas_Jump           
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4CCC0:         dc.w $F
										dc.w $2C
										dc.w 1
										dc.b $10
										dc.b $2D
										dc.b 1
										dc.b 7
										dc.l eas_Init           
										dc.b $F
										dc.b $2E
										dc.b 1
										dc.b $16
										dc.l eas_Init           
										dc.b $E
										dc.b $15
										dc.b 3
										dc.b $7A
										dc.l eas_Init           
										dc.b $C
										dc.b $15
										dc.b 3
										dc.b $89
										dc.l eas_Init           
										dc.b $D
										dc.b $14
										dc.b 3
										dc.b $8D
										dc.l eas_Init           
										dc.b $10
										dc.b $16
										dc.b 3
										dc.b $70
										dc.l eas_Init           
										dc.b $E
										dc.b $18
										dc.b 3
										dc.b $57
										dc.l eas_Init           
										dc.b $10
										dc.b $18
										dc.b 3
										dc.b $58
										dc.l eas_Init           
										dc.b $12
										dc.b $17
										dc.b 3
										dc.b $89
										dc.l eas_Init           
										dc.w $FFFF
