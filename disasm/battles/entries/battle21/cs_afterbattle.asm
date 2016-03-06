
; SCRIPT SECTION battles\entries\battle21\cs_afterbattle :
; Cutscene after battle 21
abcs_battle21:      dc.w 4                  ; 0004 SET TEXT INDEX A17
										dc.w $A17
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 43 4 12
										dc.w $43
										dc.w 4
										dc.w $12
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4B948
										dc.l word_4B948
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 B 17 2
										dc.b 7
										dc.b $B
										dc.b $17
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F B 15 2
										dc.b $1F
										dc.b $B
										dc.b $15
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E B 16 2
										dc.b $1E
										dc.b $B
										dc.b $16
										dc.b 2
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$1C Y=$1C
										dc.b $1C
										dc.b $1C
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 3
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2C                ; 002C FOLLOW ENTITY 1E 0 2
										dc.w $1E
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 7 1E 1
										dc.w 7
										dc.w $1E
										dc.w 1
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 1E 3
										dc.w $1F
										dc.w $1E
										dc.w 3
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 431A1703
										dc.l $431A1703
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4B948:         dc.w $A
										dc.w $16
										dc.w 2
										dc.b $B
										dc.b $17
										dc.b 2
										dc.b 7
										dc.l eas_Init           
										dc.w $FFFF
