
; SCRIPT SECTION battles\entries\battle01\abcs :
; Cutscene after battle 1
abcs_battle01:      dc.w 4                  ; 0004 SET TEXT INDEX 901
										dc.w $901
										dc.w $55                ; 0055 RESET FORCE BATTLE STATS
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 39 2 0
										dc.w $39
										dc.w 2
										dc.w 0
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 497F6
										dc.l word_497F6
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1 8 7 1
										dc.b 1
										dc.b 8
										dc.b 7
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 2 8 8 1
										dc.b 2
										dc.b 8
										dc.b 8
										dc.b 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
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
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 3C
										dc.w $80
										dc.w $3C
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 7 A 3
										dc.b $80
										dc.b 7
										dc.b $A
										dc.b 3
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 72
										dc.w $80
										dc.w $72
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1 3
										dc.b 1
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w $32                ; 0032 SET CAMERA DEST 2 3
										dc.w 2
										dc.w 3
										dc.b $80                ; WAIT 46
										dc.b $46
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 3C
										dc.w $80
										dc.w $3C
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 7 10 3
										dc.b $80
										dc.b 7
										dc.b $10
										dc.b 3
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 72
										dc.w $80
										dc.w $72
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $32                ; 0032 SET CAMERA DEST 2 A
										dc.w 2
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 4
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2E                ; 002E HIDE ENTITY 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 2 2
										dc.w 2
										dc.w 2
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 6
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 81
										dc.w $81
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_497F6:         dc.w 8
										dc.w 6
										dc.w 1
										dc.b 7
										dc.b 4
										dc.b 3
										dc.b $72
										dc.l eas_Init           
										dc.b 7
										dc.b 6
										dc.b 0
										dc.b $D1
										dc.l eas_Init           
										dc.w $FFFF
