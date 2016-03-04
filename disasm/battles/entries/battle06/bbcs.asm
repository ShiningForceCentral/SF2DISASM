
; SCRIPT SECTION battles\entries\battle06\bbcs :
; Cutscene before battle 6
bbcs_06:            dc.w 4                  ; 0004 SET TEXT INDEX 926
										dc.w $926
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 42 19 5
										dc.w $42
										dc.w $19
										dc.w 5
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 49CBA
										dc.l word_49CBA
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 460CE
										dc.b 5
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 460CE
										dc.b $82
										dc.b $FF
										dc.l eas_Init           
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_MAIN_THEME
										dc.w 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 5 0 45E44
										dc.b 5
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45E44
										dc.b 0
										dc.b $FF
										dc.l eas_Jump           
										dc.w $32                ; 0032 SET CAMERA DEST 1F 9
										dc.w $1F
										dc.w 9
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C005
										dc.w $C005
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 82
										dc.w $82
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 5
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C005
										dc.w $C005
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 2
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C005
										dc.w $C005
										dc.w $13                ; 0013 SET STORY FLAG 7
										dc.w 7
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_49CBA:         dc.w $1E
										dc.w 9
										dc.w 3
										dc.b $1D
										dc.b 8
										dc.b 3
										dc.b 5
										dc.l eas_Init           
										dc.b $20
										dc.b $14
										dc.b 1
										dc.b $42
										dc.l eas_Init           
										dc.b $24
										dc.b $D
										dc.b 2
										dc.b $42
										dc.l eas_Init           
										dc.b $25
										dc.b $E
										dc.b 1
										dc.b $78
										dc.l eas_Init           
										dc.w $FFFF
