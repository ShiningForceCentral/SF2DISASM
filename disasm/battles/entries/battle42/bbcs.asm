
; SCRIPT SECTION battles\entries\battle42\bbcs :
; Cutscene before battle 42
bbcs_42:            dc.w 4                  ; 0004 SET TEXT INDEX C10
										dc.w $C10
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 3B 8 1D
										dc.w $3B
										dc.w 8
										dc.w $1D
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4EEDC
										dc.l word_4EEDC
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 C 24 1
										dc.b 7
										dc.b $C
										dc.b $24
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F E 24 1
										dc.b $1F
										dc.b $E
										dc.b $24
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C D 24 1
										dc.b $1C
										dc.b $D
										dc.b $24
										dc.b 1
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4EDE8
										dc.w $4C
										dc.l word_4EDE8         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4EDE8:         dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_WITCH
										dc.w $A
										dc.w $4A                ; 004A FADE IN FROM BLACK HALF
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 2
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 45E44
										dc.b $1F
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 45E44
										dc.b $1C
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 3
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 2
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 2
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 0 0 2 1
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 1
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 1
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w $32                ; 0032 SET CAMERA DEST 8 D
										dc.w 8
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4EEDC:         dc.w $D
										dc.w $23
										dc.w 1
										dc.b $C
										dc.b $24
										dc.b 1
										dc.b 7
										dc.l eas_Init           
										dc.b $D
										dc.b $24
										dc.b 1
										dc.b $1C
										dc.l eas_Init           
										dc.b $D
										dc.b $12
										dc.b 3
										dc.b $A4
										dc.l eas_Init           
										dc.b $D
										dc.b $F
										dc.b 3
										dc.b $CC
										dc.l eas_Init           
										dc.w $FFFF
