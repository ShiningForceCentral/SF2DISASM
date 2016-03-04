
; SCRIPT SECTION battles\entries\battle28\bbcs :
; Cutscene before battle 28
bbcs_28:            dc.w 4                  ; 0004 SET TEXT INDEX A65
										dc.w $A65
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 2F 0 4
										dc.w $2F
										dc.w 0
										dc.w 4
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4C03C
										dc.l word_4C03C
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 0 9 0
										dc.b 7
										dc.b 0
										dc.b 9
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 0 7 0
										dc.b $1F
										dc.b 0
										dc.b 7
										dc.b 0
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_3
										dc.w $21
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $2D                ; 002D MOVE ENTITY 0 0 0 3
										dc.b 0
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 0 3
										dc.b $1F
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 0 3
										dc.b 7
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 3
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 2
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $32                ; 0032 SET CAMERA DEST 7 B
										dc.w 7
										dc.w $B
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 82
										dc.w $82
										dc.w 5                  ; 0005 PLAY SOUND SFX_MONSTER_SCREAM
										dc.w $5E
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 83
										dc.w $83
										dc.w 5                  ; 0005 PLAY SOUND SFX_MONSTER_SCREAM
										dc.w $5E
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $32                ; 0032 SET CAMERA DEST 0 6
										dc.w 0
										dc.w 6
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 45E44
										dc.b $1F
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461E4
										dc.b 7
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 64
										dc.b $64
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 3 2
										dc.b $1F
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $1C                ; 001C STOP ENTITY ANIM 0
										dc.w 0
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_HIT_2
										dc.w $54
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $2
										dc.w 2
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 0
										dc.w 0
										dc.w $32                ; 0032 SET CAMERA DEST 7 15
										dc.w 7
										dc.w $15
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $32                ; 0032 SET CAMERA DEST 0 6
										dc.w 0
										dc.w 6
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 0
										dc.w 0
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4C03C:         dc.w 1
										dc.w 8
										dc.w 0
										dc.b 0
										dc.b 9
										dc.b 0
										dc.b 7
										dc.l eas_Init           
										dc.b 0
										dc.b 8
										dc.b 0
										dc.b $3E
										dc.l eas_Init           
										dc.b $C
										dc.b $18
										dc.b 1
										dc.b $B0
										dc.l eas_Init           
										dc.b $D
										dc.b $D
										dc.b 2
										dc.b $54
										dc.l eas_Init           
										dc.b $C
										dc.b $11
										dc.b 1
										dc.b $54
										dc.l eas_Init           
										dc.b $B
										dc.b $16
										dc.b 3
										dc.b $54
										dc.l eas_Init           
										dc.b $B
										dc.b $19
										dc.b 0
										dc.b $54
										dc.l eas_Init           
										dc.w $FFFF
