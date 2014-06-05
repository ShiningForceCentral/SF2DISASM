
; SCRIPT SECTION battlecutscenes\battle35\bbcs :
; Cutscene before battle 35
bbcs_35:            dc.w 4                  ; 0004 SET TEXT INDEX B76
										dc.w $B76
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 4C 25 5
										dc.w $4C
										dc.w $25
										dc.w 5
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4D832
										dc.l word_4D832
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 2C A 2
										dc.b 7
										dc.b $2C
										dc.b $A
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 2C 8 2
										dc.b $1F
										dc.b $2C
										dc.b 8
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E 2C 9 2
										dc.b $1E
										dc.b $2C
										dc.b 9
										dc.b 2
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4D728
										dc.w $4C
										dc.l word_4D728         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4D728:         dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w $32                ; 0032 SET CAMERA DEST 16 B
										dc.w $16
										dc.w $B
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C007
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C01F
										dc.w $C01F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $32                ; 0032 SET CAMERA DEST 16 14
										dc.w $16
										dc.w $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 1C 18 3
										dc.b $80
										dc.b $1C
										dc.b $18
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 83 2
										dc.b $83
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 85 0
										dc.b $85
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 86 0
										dc.b $86
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 87 0
										dc.b $87
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 88 0
										dc.b $88
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
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
										dc.w $15                ; 0015 SET ACTSCRIPT 86 0 45E44
										dc.b $86
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 87 0 45E44
										dc.b $87
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 88 0 45E44
										dc.b $88
										dc.b 0
										dc.l eas_Jump           
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $32                ; 0032 SET CAMERA DEST 25 5
										dc.w $25
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 1
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4D832:         dc.w $2B
										dc.w 9
										dc.w 2
										dc.b $2C
										dc.b $A
										dc.b 2
										dc.b 7
										dc.l eas_Init           
										dc.b $1B
										dc.b $10
										dc.b 1
										dc.b $9F
										dc.l eas_Init           
										dc.b $1A
										dc.b $15
										dc.b 1
										dc.b $59
										dc.l eas_Init           
										dc.b $1D
										dc.b $15
										dc.b 1
										dc.b $59
										dc.l eas_Init           
										dc.b $1F
										dc.b $18
										dc.b 1
										dc.b $59
										dc.l eas_Init           
										dc.b $1C
										dc.b $1C
										dc.b 1
										dc.b $59
										dc.l eas_Init           
										dc.b $18
										dc.b $18
										dc.b 1
										dc.b $5A
										dc.l eas_Init           
										dc.b $18
										dc.b $19
										dc.b 1
										dc.b $5B
										dc.l eas_Init           
										dc.b $18
										dc.b $1A
										dc.b 1
										dc.b $71
										dc.l eas_Init           
										dc.b $18
										dc.b $1B
										dc.b 1
										dc.b $72
										dc.l eas_Init           
										dc.w $FFFF
