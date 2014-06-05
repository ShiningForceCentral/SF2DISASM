
; SCRIPT SECTION battlecutscenes\battle21\bbcs :
; Cutscene before battle 21
bbcs_21:            dc.w 4                  ; 0004 SET TEXT INDEX A10
										dc.w $A10
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 43 5 12
										dc.w $43
										dc.w 5
										dc.w $12
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4B84C
										dc.l word_4B84C
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 1C 18 2
										dc.b 7
										dc.b $1C
										dc.b $18
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 1C 16 2
										dc.b $1F
										dc.b $1C
										dc.b $16
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E 1C 17 2
										dc.b $1E
										dc.b $1C
										dc.b $17
										dc.b 2
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 82 0
										dc.b $82
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST 17 12
										dc.w $17
										dc.w $12
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 2
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $32                ; 0032 SET CAMERA DEST 5 12
										dc.w 5
										dc.w $12
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 1
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 A 18 0
										dc.b $83
										dc.b $A
										dc.b $18
										dc.b 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 A 14 0
										dc.b $84
										dc.b $A
										dc.b $14
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 A 16 0
										dc.b $85
										dc.b $A
										dc.b $16
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 45E44
										dc.b $83
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45E44
										dc.b $84
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 45E44
										dc.b $85
										dc.b $FF
										dc.l eas_Jump           
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4B84C:         dc.w $1B
										dc.w $17
										dc.w 2
										dc.b $1C
										dc.b $18
										dc.b 2
										dc.b 7
										dc.l eas_Init           
										dc.b 8
										dc.b $16
										dc.b 2
										dc.b $51
										dc.l eas_Init           
										dc.b 9
										dc.b $15
										dc.b 2
										dc.b $8C
										dc.l eas_Init           
										dc.b 9
										dc.b $17
										dc.b 2
										dc.b $86
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $7C
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $6C
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $4C
										dc.l eas_Init           
										dc.w $FFFF
