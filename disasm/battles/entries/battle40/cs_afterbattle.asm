
; SCRIPT SECTION battles\entries\battle40\cs_afterbattle :
; Cutscene after battle 40
abcs_battle40:      dc.w 4                  ; 0004 SET TEXT INDEX BF9
										dc.w $BF9
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 36 A 4
										dc.w $36
										dc.w $A
										dc.w 4
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4ECD6
										dc.l word_4ECD6
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 8 0
										dc.b 7
										dc.b $D
										dc.b 8
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F F 6 3
										dc.b $1F
										dc.b $F
										dc.b 6
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C 11 8 2
										dc.b $1C
										dc.b $11
										dc.b 8
										dc.b 2
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4EAEE
										dc.w $4C
										dc.l word_4EAEE         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4EAEE:         dc.w $34                ; 0034 SET BLOCKS B06 B1D 2C00
										dc.w $B06
										dc.w $B1D
										dc.w $2C00
										dc.w $34                ; 0034 SET BLOCKS 34 A07 D0A
										dc.w $34
										dc.w $A07
										dc.w $D0A
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $1C                ; 001C STOP ENTITY ANIM 83
										dc.w $83
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45FB2
										dc.b $80
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45FB2
										dc.b $81
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45FB2
										dc.b $82
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_SAD_THEME_1
										dc.w $10
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C000
										dc.w $C000
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C000
										dc.w $C000
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 1
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $18                ; 0018 FLASH ENTITY WHITE 83 1E
										dc.w $83
										dc.w $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 F 8 3
										dc.b $80
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 0 0 2
										dc.b $80
										dc.b 0
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 F 8 3
										dc.b $81
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 81 0 7 2
										dc.b $81
										dc.b 0
										dc.b 7
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 F 8 3
										dc.b $82
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 82 0 3 2
										dc.b $82
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 F 8 3
										dc.b $80
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 0 7 2
										dc.b $80
										dc.b 0
										dc.b 7
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 F 8 3
										dc.b $81
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 81 0 0 2
										dc.b $81
										dc.b 0
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 F 8 3
										dc.b $82
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 82 0 7 2
										dc.b $82
										dc.b 0
										dc.b 7
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 F 8 3
										dc.b $80
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 2
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 F 8 3
										dc.b $81
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 81 0 7 2
										dc.b $81
										dc.b 0
										dc.b 7
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 F 8 3
										dc.b $82
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 82 0 0 2
										dc.b $82
										dc.b 0
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $2E                ; 002E HIDE ENTITY 80
										dc.w $80
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $2E                ; 002E HIDE ENTITY 81
										dc.w $81
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w $18                ; 0018 FLASH ENTITY WHITE 83 78
										dc.w $83
										dc.w $78
										dc.w $2E                ; 002E HIDE ENTITY 83
										dc.w $83
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_SAD_THEME_3
										dc.w $F
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 2 1
										dc.b $1C
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1C 2
										dc.b $1C
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 2
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1C 1F 2
										dc.w $1C
										dc.w $1F
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4ECD6:         dc.w $F
										dc.w $A
										dc.w 1
										dc.b $D
										dc.b 8
										dc.b 0
										dc.b 7
										dc.l eas_Init           
										dc.b $11
										dc.b 8
										dc.b 2
										dc.b $1C
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $AD
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $AD
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $AD
										dc.l eas_Init           
										dc.b $F
										dc.b 8
										dc.b 3
										dc.b $A0
										dc.l eas_Init           
										dc.w $FFFF
