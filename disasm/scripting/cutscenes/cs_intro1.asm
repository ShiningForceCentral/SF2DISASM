
; SCRIPT SECTION scripting\cutscenes\cs_intro1 :
; Intro cutscene 1
IntroCutscene1:     dc.w 4                  ; 0004 INIT TEXT CURSOR 105A : "Stay here, OK?{D2}"
										dc.w $105A
										dc.w $48                ; 0048 LOAD MAP 2A 2 5
										dc.w $2A
										dc.w 2
										dc.w 5
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 48340
										dc.l word_48340
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 46136
										dc.b $83
										dc.b $FF
										dc.l eas_Init3          
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 46136
										dc.b $84
										dc.b $FF
										dc.l eas_Init3          
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 46136
										dc.b $85
										dc.b $FF
										dc.l eas_Init3          
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45FA8
										dc.b $82
										dc.b 0
										dc.l eas_Transparent    
										dc.w $4A                ; 004A FADE IN FROM BLACK HALF
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 5 7 F 1
										dc.b 5
										dc.b 7
										dc.b $F
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 7 10 1
										dc.b $80
										dc.b 7
										dc.b $10
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 7 11 1
										dc.b $81
										dc.b 7
										dc.b $11
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 5 0 1 6
										dc.b 5
										dc.b 0
										dc.b 1
										dc.b 6
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 6
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 6
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 6
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 6
										dc.b $80
										dc.b $80
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 7 C 2
										dc.b $83
										dc.b 7
										dc.b $C
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 7 D 1
										dc.b $84
										dc.b 7
										dc.b $D
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 7 E 1
										dc.b $85
										dc.b 7
										dc.b $E
										dc.b 1
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 3F 3F 2
										dc.b $83
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 3F 3F 1
										dc.b $84
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 3F 3F 1
										dc.b $85
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 7 C 2
										dc.b $83
										dc.b 7
										dc.b $C
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 7 D 1
										dc.b $84
										dc.b 7
										dc.b $D
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 7 E 1
										dc.b $85
										dc.b 7
										dc.b $E
										dc.b 1
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 3F 3F 2
										dc.b $83
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 3F 3F 1
										dc.b $84
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 3F 3F 1
										dc.b $85
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 7 C 2
										dc.b $83
										dc.b 7
										dc.b $C
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 7 D 1
										dc.b $84
										dc.b 7
										dc.b $D
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 7 E 1
										dc.b $85
										dc.b 7
										dc.b $E
										dc.b 1
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 3F 3F 2
										dc.b $83
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 3F 3F 1
										dc.b $84
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 3F 3F 1
										dc.b $85
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $15                ; 0015 SET ACTSCRIPT 5 0 45E44
										dc.b 5
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 5 0 45E44
										dc.b 5
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 5
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 5 0 1 4
										dc.b 5
										dc.b 0
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 4
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 4
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45F0C
										dc.b $80
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45F0C
										dc.b $81
										dc.b $FF
										dc.l eas_BumpUp         
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005 : "Stay here, OK?{D2}"
										dc.w $8005
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 0 5
										dc.b 5
										dc.b $FF
										dc.b 0
										dc.b 5
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 3 3
										dc.b 5
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 5
										dc.w 5
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005 : "Oops, a dead end!{D2}"
										dc.w $8005
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 1 3
										dc.b 5
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.b 2
										dc.b 5
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 5
										dc.w 5
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 2 5
										dc.b 5
										dc.b $FF
										dc.b 2
										dc.b 5
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 3 3
										dc.b 5
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 5
										dc.w 5
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005 : "Hey!  I found some hidden{N}stairs!{D2}"
										dc.w $8005
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 1 2
										dc.b 5
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b 8
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005 : "Hey, guys!{N}Follow me!{D2}"
										dc.w $8005
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Alright!{D2}"
										dc.w $80
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
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 1
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 5
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 2
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 4
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 5 1
										dc.b 5
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 5 0 3 3
										dc.b 5
										dc.b 0
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 3
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 1
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_WARP
										dc.w $59
										dc.w $4B                ; 004B FADE OUT TO BLACK HALF
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 5 13 3 3
										dc.b 5
										dc.b $13
										dc.b 3
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 13 3 3
										dc.b $80
										dc.b $13
										dc.b 3
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 13 3 3
										dc.b $81
										dc.b $13
										dc.b 3
										dc.b 3
										dc.w $46                ; 0046  F 0
										dc.w $F
										dc.w 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $4A                ; 004A FADE IN FROM BLACK HALF
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 5
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 3 1
										dc.b 5
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005 : "Finally, I found the hidden{N}room of the Ancient Shrine!{D2}"
										dc.w $8005
										dc.w $2D                ; 002D MOVE ENTITY 5 0 3 1
										dc.b 5
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 5 0 3 2
										dc.b 5
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 2
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 2
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005 : "A treasure chest!{D2}"
										dc.w $8005
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
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 5 0 3 2
										dc.b 5
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 2
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 2
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST F 5
										dc.w $F
										dc.w 5
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005 : "I wonder if they're here?{D2}"
										dc.w $8005
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{NAME;5} the thief opened{N}the chest.{D2}"
										dc.w $FFFF
										dc.w $34                ; 0034 SET BLOCKS 703 101 130A
										dc.w $703
										dc.w $101
										dc.w $130A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "He found Power Water.{D2}"
										dc.w $FFFF
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005 : "No, I don't want this!{D2}"
										dc.w $8005
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{NAME;5} discarded the{N}Power Water.{D2}"
										dc.w $FFFF
										dc.w $34                ; 0034 SET BLOCKS 403 101 130A
										dc.w $403
										dc.w $101
										dc.w $130A
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 460CE
										dc.b 5
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 1
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 2
										dc.b 8
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Where on Earth are those{N}jewels?{D2}"
										dc.w $81
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 5 2
										dc.b 5
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005 : "I'm not sure.{D2}"
										dc.w $8005
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 5
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 5 0 0 5
										dc.b 5
										dc.b 0
										dc.b 0
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 1
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF C 14
										dc.b $81
										dc.b $FF
										dc.b $C
										dc.b $14
										dc.b 0
										dc.b 4
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 5 0 461E4
										dc.b 5
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461B6
										dc.b $80
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 0 2
										dc.b 5
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005 : "Something is shining over{N}there...!{D2}"
										dc.w $8005
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 15 1
										dc.w $15
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8005 : "Oh, they must be the jewels{N}of light and evil!{D2}"
										dc.w $8005
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $4B                ; 004B FADE OUT TO BLACK HALF
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
word_48340:         dc.w $3F
										dc.w $3F
										dc.w 1
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b 5
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $CA
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $CA
										dc.l eas_Init           
										dc.b $1A
										dc.b 4
										dc.b 3
										dc.b $AD
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $B7
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $B7
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $B7
										dc.l eas_Init           
										dc.b $FF
										dc.b $FF
