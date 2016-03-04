
; SCRIPT SECTION scripting\cutscenes\cs_intro3 :
; Intro cutscene 3
IntroCutscene3:     dc.w 4                  ; 0004 SET TEXT INDEX 1077
										dc.w $1077
										dc.w $48                ; 0048 LOAD MAP 2A 15 1
										dc.w $2A
										dc.w $15
										dc.w 1
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 48A50
										dc.l word_48A50
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $36                ; 0036 RELATED TO LOADING A MAP
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $46                ; 0046  15 1
										dc.w $15
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005
										dc.w $8005
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 2A 15 1
										dc.w $2A
										dc.w $15
										dc.w 1
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45FA8
										dc.b $82
										dc.b 0
										dc.l eas_Transparent    
										dc.w $4A                ; 004A FADE IN FROM BLACK HALF
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 5
										dc.w 5
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $A
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 81 0 2 1
										dc.b $81
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 1 1
										dc.b 5
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005
										dc.w $8005
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 1
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 5
										dc.b 5
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 1 1
										dc.b 5
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $26                ; 0026 MAKE ENTITY NOD 5
										dc.w 5
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $2D                ; 002D MOVE ENTITY 5 0 1 1
										dc.b 5
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 6
										dc.b 6
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 461AA
										dc.b 5
										dc.b $FF
										dc.l eas_461AA          
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w $1A                ; 001A SET ENTITY SPRITE 5 BB
										dc.w 5
										dc.w $BB
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 5
										dc.w 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 5
										dc.w 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 5
										dc.w 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 5
										dc.w 5
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 5 0 3 1
										dc.b 5
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 6
										dc.b 6
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 461AA
										dc.b 5
										dc.b $FF
										dc.l eas_461AA          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 5
										dc.b 5
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 46172
										dc.b 5
										dc.b $FF
										dc.l eas_46172          
										dc.w $1A                ; 001A SET ENTITY SPRITE 5 5
										dc.w 5
										dc.w 5
										dc.w $23                ; 0023 SET ENTITY FACING 5 1
										dc.b 5
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 3 1
										dc.b 5
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005
										dc.w $8005
										dc.w $23                ; 0023 SET ENTITY FACING 5 2
										dc.b 5
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 5 0
										dc.b 5
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 5 1
										dc.b 5
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $26                ; 0026 MAKE ENTITY NOD 5
										dc.w 5
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005
										dc.w $8005
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 460CE
										dc.b 5
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 1 1
										dc.b 5
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 5 0 1 1
										dc.b 5
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 6
										dc.b 6
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 461AA
										dc.b 5
										dc.b $FF
										dc.l eas_461AA          
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w $1A                ; 001A SET ENTITY SPRITE 5 BB
										dc.w 5
										dc.w $BB
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005
										dc.w $8005
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005
										dc.w $8005
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 5
										dc.w 5
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 5
										dc.b 5
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 46172
										dc.b 5
										dc.b $FF
										dc.l eas_46172          
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w $34                ; 0034 SET BLOCKS 1A12 101 1A04
										dc.w $1A12
										dc.w $101
										dc.w $1A04
										dc.w $1A                ; 001A SET ENTITY SPRITE 5 5
										dc.w 5
										dc.w 5
										dc.w $23                ; 0023 SET ENTITY FACING 5 1
										dc.b 5
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 5 0 3 1
										dc.b 5
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 461AA
										dc.b 5
										dc.b $FF
										dc.l eas_461AA          
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 3 5
										dc.b 5
										dc.b $FF
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 460CE
										dc.b 5
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 1 2
										dc.b 5
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 5 2
										dc.b 5
										dc.b 2
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 5
										dc.b 5
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $3
										dc.w 3
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 2
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 2
										dc.b 8
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 2
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b $A
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005
										dc.w $8005
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 9
										dc.b $28
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 5 1
										dc.b 5
										dc.b 1
										dc.w $1A                ; 001A SET ENTITY SPRITE 5 3B
										dc.w 5
										dc.w $3B
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 460CE
										dc.b 5
										dc.b $FF
										dc.l eas_Init           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005
										dc.w $8005
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $1A                ; 001A SET ENTITY SPRITE 5 5
										dc.w 5
										dc.w 5
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005
										dc.w $8005
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 5 0 45E44
										dc.b 5
										dc.b 0
										dc.l eas_Jump           
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 5 0 461B6
										dc.b 5
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461E4
										dc.b $80
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461E4
										dc.b $81
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 5 1
										dc.b 5
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 80
										dc.w $80
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 81
										dc.w $81
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4
										dc.w 4
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005
										dc.w $8005
										dc.w $33                ; 0033 SET QUAKE AMOUNT 5
										dc.w 5
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 5
										dc.b 5
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 5 0 3 1
										dc.b 5
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 7
										dc.b 1
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 2
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 7
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF B A
										dc.b $81
										dc.b $FF
										dc.b $B
										dc.b $A
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 8
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_WARP
										dc.w $59
										dc.w $4B                ; 004B FADE OUT TO BLACK HALF
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 5 2 8 3
										dc.b 5
										dc.b 2
										dc.b 8
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 2 8 3
										dc.b $80
										dc.b 2
										dc.b 8
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 2 8 3
										dc.b $81
										dc.b 2
										dc.b 8
										dc.b 3
										dc.w $46                ; 0046  0 3
										dc.w 0
										dc.w 3
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $4A                ; 004A FADE IN FROM BLACK HALF
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 5
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 1 1
										dc.b 5
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 5 0 1 1
										dc.b 5
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 5 0 1 1
										dc.b 5
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 2
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 2
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 3
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 1
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
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
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 5 0 0 2
										dc.b 5
										dc.b 0
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 2
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 5 2
										dc.b 5
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 5 0 2 2
										dc.b 5
										dc.b 0
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 2
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 81
										dc.w $81
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 5 0 0 2
										dc.b 5
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b $A
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 80 0 0 3
										dc.b $80
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 3
										dc.b 9
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 4
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 4
										dc.b 3
										dc.b 8
										dc.b $80
										dc.b $80
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $4B                ; 004B FADE OUT TO BLACK HALF
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
word_48A50:         dc.w $3F
										dc.w $3F
										dc.w 1
										dc.b $1A
										dc.b 7
										dc.b 1
										dc.b 5
										dc.l eas_Init           
										dc.b $1A
										dc.b 5
										dc.b 1
										dc.b $CA
										dc.l eas_Init           
										dc.b $1B
										dc.b 6
										dc.b 1
										dc.b $CA
										dc.l eas_Init           
										dc.b $1A
										dc.b 4
										dc.b 3
										dc.b $AD
										dc.l eas_Init           
										dc.b $FF
										dc.b $FF
