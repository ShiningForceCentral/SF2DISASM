
; SCRIPT SECTION battles\entries\battle42\abcs :
; Cutscene after battle 42
abcs_battle42:      dc.w 4                  ; 0004 SET TEXT INDEX C22
										dc.w $C22
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 3B 8 D
										dc.w $3B
										dc.w 8
										dc.w $D
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4F328
										dc.l word_4F328
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 F F 2
										dc.b 7
										dc.b $F
										dc.b $F
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F B F 0
										dc.b $1F
										dc.b $B
										dc.b $F
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C C 13 0
										dc.b $1C
										dc.b $C
										dc.b $13
										dc.b 0
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4EF5E
										dc.w $4C
										dc.l word_4EF5E         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4EF5E:         dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
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
										dc.w $53                ; 0053  1F 0
										dc.w $1F
										dc.w 0
										dc.w $53                ; 0053  1C 0
										dc.w $1C
										dc.w 0
										dc.w $53                ; 0053  80 FFFF
										dc.w $80
										dc.w $FFFF
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1C 1
										dc.b $1C
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 0 1
										dc.b $1F
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 1
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $1A                ; 001A SET ENTITY SPRITE 81 D8
										dc.w $81
										dc.w $D8
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 2
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $1A                ; 001A SET ENTITY SPRITE 81 CC
										dc.w $81
										dc.w $CC
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $1B                ; 001B START ENTITY ANIM 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$18 Y=$18
										dc.b $18
										dc.b $18
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0
										dc.w 0
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 12 1
										dc.b 7
										dc.b $D
										dc.b $12
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 E 10 2
										dc.b 7
										dc.b $E
										dc.b $10
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D F 3
										dc.b 7
										dc.b $D
										dc.b $F
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 E 11 2
										dc.b 7
										dc.b $E
										dc.b $11
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1C 0 461B6
										dc.b $1C
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w $2D                ; 002D MOVE ENTITY 0 0 2 2
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461E4
										dc.b 0
										dc.b 0
										dc.l eas_461E4          
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 2
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 2
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C 0 1 1
										dc.b $1C
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 2
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 1 1
										dc.b $81
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0
										dc.w 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1C 1
										dc.b $1C
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 8 3
										dc.w 8
										dc.w 3
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $34                ; 0034 SET BLOCKS C27 704 A03
										dc.w $C27
										dc.w $704
										dc.w $A03
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $34                ; 0034 SET BLOCKS C2C 704 A03
										dc.w $C2C
										dc.w $704
										dc.w $A03
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $34                ; 0034 SET BLOCKS C31 704 A03
										dc.w $C31
										dc.w $704
										dc.w $A03
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0
										dc.w 0
										dc.w 5                  ; 0005 PLAY SOUND SFX_DEMON_BREATH
										dc.w $75
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4
										dc.w 4
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $34                ; 0034 SET BLOCKS C36 704 A03
										dc.w $C36
										dc.w $704
										dc.w $A03
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 D 6 3
										dc.b $82
										dc.b $D
										dc.b 6
										dc.b 3
										dc.w $3D                ; 003D TINT MAP
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.b $80                ; WAIT 5A
										dc.b $5A
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 6E
										dc.b $6E
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_ZEON_ATTACK
										dc.w 7
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 B2
										dc.w $80
										dc.w $B2
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 D
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b $D
										dc.w $8080
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C082
										dc.w $C082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
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
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w $3D                ; 003D TINT MAP
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $32                ; 0032 SET CAMERA DEST 8 C
										dc.w 8
										dc.w $C
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1C 2
										dc.b $1C
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45E44
										dc.b 0
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 3 1
										dc.b $1C
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1C 0
										dc.b $1C
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1C 2
										dc.b $1C
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $13                ; 0013 SET STORY FLAG 2B
										dc.w $2B
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4F328:         dc.w $D
										dc.w $11
										dc.w 1
										dc.b $F
										dc.b $F
										dc.b 2
										dc.b 7
										dc.l eas_Init           
										dc.b $C
										dc.b $13
										dc.b 0
										dc.b $1C
										dc.l eas_Init           
										dc.b $D
										dc.b $13
										dc.b 3
										dc.b $A4
										dc.l eas_Init           
										dc.b $D
										dc.b $F
										dc.b 3
										dc.b $CC
										dc.l eas_Init           
										dc.b $3E
										dc.b $3E
										dc.b 3
										dc.b $FB
										dc.l eas_Init           
										dc.w $FFFF
