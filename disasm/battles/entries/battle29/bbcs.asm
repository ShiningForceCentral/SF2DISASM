
; SCRIPT SECTION battles\entries\battle29\bbcs :
; Cutscene before battle 29
bbcs_29:            dc.w 4                  ; 0004 SET TEXT INDEX A9E
										dc.w $A9E
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 0 A 1C
										dc.w 0
										dc.w $A
										dc.w $1C
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4C5AE
										dc.l word_4C5AE
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 10 22 1
										dc.b 7
										dc.b $10
										dc.b $22
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F E 22 1
										dc.b $1F
										dc.b $E
										dc.b $22
										dc.b 1
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_MITULA_SHRINE
										dc.w $28
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 1
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 1
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $32                ; 0032 SET CAMERA DEST A 1A
										dc.w $A
										dc.w $1A
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 1 3
										dc.b $1F
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 0 2 1
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 2 2
										dc.b 7
										dc.b 0
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 2
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $32                ; 0032 SET CAMERA DEST C 13
										dc.w $C
										dc.w $13
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 10 17 3
										dc.b $80
										dc.b $10
										dc.b $17
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $32                ; 0032 SET CAMERA DEST 8 F
										dc.w 8
										dc.w $F
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 C 12 3
										dc.b $80
										dc.b $C
										dc.b $12
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $32                ; 0032 SET CAMERA DEST 9 9
										dc.w 9
										dc.w 9
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 E D 3
										dc.b $80
										dc.b $E
										dc.b $D
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $18                ; 0018 FLASH ENTITY WHITE 80 1E
										dc.w $80
										dc.w $1E
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_1
										dc.w $22
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 AF
										dc.w $80
										dc.w $AF
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 55
										dc.w $80
										dc.w $55
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 E C 3
										dc.b $81
										dc.b $E
										dc.b $C
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 F D 3
										dc.b $82
										dc.b $F
										dc.b $D
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 F E 3
										dc.b $83
										dc.b $F
										dc.b $E
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 B E 3
										dc.b $84
										dc.b $B
										dc.b $E
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4C5AE:         dc.w $F
										dc.w $21
										dc.w 1
										dc.b $10
										dc.b $22
										dc.b 1
										dc.b 7
										dc.l eas_Init           
										dc.b $F
										dc.b $1E
										dc.b 3
										dc.b $C0
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $8D
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $56
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $88
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $54
										dc.l eas_Init           
										dc.w $FFFF
