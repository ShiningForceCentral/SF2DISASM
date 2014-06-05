
; SCRIPT SECTION battlecutscenes\battle20\abcs :
; Cutscene after battle 20
abcs_battle20:      dc.w 4                  ; 0004 SET TEXT INDEX A06
										dc.w $A06
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 33 2 6
										dc.w $33
										dc.w 2
										dc.w 6
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4B780
										dc.l word_4B780
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
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 5 A 1
										dc.b 7
										dc.b 5
										dc.b $A
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 7 A 1
										dc.b $1F
										dc.b 7
										dc.b $A
										dc.b 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 2                  ; 0002 DISPLAY TEXT BOX D
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX D
										dc.w $D
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C007
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX D
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX D
										dc.w $D
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $2D                ; 002D MOVE ENTITY D FF 3 1
										dc.b $D
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX D
										dc.w $D
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 8                  ; 0008 JOIN FORCE D
										dc.w $D
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY D 1F 2
										dc.w $D
										dc.w $1F
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4B780:         dc.w 6
										dc.w $A
										dc.w 1
										dc.b 6
										dc.b 8
										dc.b 3
										dc.b $D
										dc.l eas_Init           
										dc.w $FFFF
