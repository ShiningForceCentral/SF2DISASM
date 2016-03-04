
; SCRIPT SECTION battles\entries\battle18\bbcs :
; Cutscene before battle 18
bbcs_18:            dc.w 4                  ; 0004 SET TEXT INDEX 9D8
										dc.w $9D8
										dc.w $37                ; 0037 LOAD MAP AND FADE IN C 7 16
										dc.w $C
										dc.w 7
										dc.w $16
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4B2DA
										dc.l word_4B2DA
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 460CE
										dc.b $B
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 21 1
										dc.b 7
										dc.b $D
										dc.b $21
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F C 21 1
										dc.b $1F
										dc.b $C
										dc.b $21
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B B 21 1
										dc.b $B
										dc.b $B
										dc.b $21
										dc.b 1
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_SHRINE
										dc.w $23
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 40
										dc.w $40
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 6
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 6
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY B 0 1 6
										dc.b $B
										dc.b 0
										dc.b 1
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 6
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 6
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT B 0 461E4
										dc.b $B
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $2D                ; 002D MOVE ENTITY B FF 1 1
										dc.b $B
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 7 16
										dc.w 7
										dc.w $16
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING B 0
										dc.b $B
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING B 1
										dc.b $B
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4B2DA:         dc.w $C
										dc.w $20
										dc.w 1
										dc.b $C
										dc.b 8
										dc.b 3
										dc.b $FF
										dc.l eas_Init           
										dc.b $C
										dc.b 5
										dc.b 3
										dc.b $3E
										dc.l eas_Init           
										dc.w $FFFF
