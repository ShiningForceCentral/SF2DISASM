
; SCRIPT SECTION battles\entries\battle07\cs_beforebattle :
; Cutscene before battle 7
bbcs_07:            dc.w 4                  ; 0004 SET TEXT INDEX 935 : "Astral, you're so persistent!{W1}"
										dc.w $935
										dc.w $10                ; 0010 SET FLAG 53 0 : King + Minister are followers
										dc.w $53
										dc.w 0
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 3A 8 1D
										dc.w $3A
										dc.w 8
										dc.w $1D
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 49F36
										dc.l word_49F36
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 85
										dc.w $85
										dc.w 4
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 28
										dc.w $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Astral, you're so persistent!{W1}"
										dc.w $C080
										dc.w $32                ; 0032 SET CAMERA DEST 8 F
										dc.w 8
										dc.w $F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "King Galam, what do you{N}intend to do?{W1}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "You wouldn't understand.{W1}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83 : "Astral, save her!{W1}"
										dc.w $83
										dc.w $32                ; 0032 SET CAMERA DEST 8 D
										dc.w 8
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "Father!{W1}"
										dc.w $82
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 3 1
										dc.b $82
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 45E44
										dc.b $82
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 1
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "King Granseal and{N}{LEADER}!{W1}"
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "Blast!{W2}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Give up now, King Granseal!{N}Do you want her to die?!{W1}"
										dc.w $C080
										dc.w $32                ; 0032 SET CAMERA DEST 8 F
										dc.w 8
										dc.w $F
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "No!  You give up!{N}We've got reinforcements!{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Your great magic cannot{N}defeat all of our soldiers!{W1}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "I'll kill you before they{N}have a chance to attack!{W1}"
										dc.w $C080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Just try it!{W1}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45F34
										dc.b $80
										dc.b $FF
										dc.l eas_BumpDown       
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_LIGHTNING_1
										dc.w $51
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45F0C
										dc.b $81
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45F34
										dc.b $80
										dc.b 0
										dc.l eas_BumpDown       
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w 5                  ; 0005 PLAY SOUND SFX_LIGHTNING_2
										dc.w $52
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45F0C
										dc.b $81
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45E44
										dc.b $81
										dc.b 0
										dc.l eas_Jump           
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45F34
										dc.b $81
										dc.b $FF
										dc.l eas_BumpDown       
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN
										dc.w $5C
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45F0C
										dc.b $80
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45F34
										dc.b $80
										dc.b 0
										dc.l eas_BumpDown       
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w 5                  ; 0005 PLAY SOUND SFX_HIT_2
										dc.w $54
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45F0C
										dc.b $81
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 1
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Astral...{W1}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Gguuu....{W1}"
										dc.w $81
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
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
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "I've beaten you!{N}You've lost!{W1}"
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "But, so have you!{N}Or had you not noticed?{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "You cannot move.{N}Princess Elis, run away!{W1}"
										dc.w $81
										dc.w $32                ; 0032 SET CAMERA DEST 8 D
										dc.w 8
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "I'll try.{W1}"
										dc.w $82
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 82 0 3 3
										dc.b $82
										dc.b 0
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 C 12 1
										dc.b $85
										dc.b $C
										dc.b $12
										dc.b 1
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 85
										dc.w $85
										dc.w 5
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85 : "Stop, my dear!{W1}"
										dc.w $85
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 45E44
										dc.b $82
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "Oh!{W1}"
										dc.w $82
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 2
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST 8 F
										dc.w 8
										dc.w $F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Hee, hee, hee...{N}I won't lose her now.{W1}"
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "What should I do?{N}{LEADER}, can you hear{N}me?{W1}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Save her.{W1}"
										dc.w $81
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "I've no time to play with{N}these kids.{N}Devils!  I summon thee!{W1}"
										dc.w $C080
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 E 12 3
										dc.b $86
										dc.b $E
										dc.b $12
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 F 12 3
										dc.b $87
										dc.b $F
										dc.b $12
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 85 3
										dc.b $85
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86 : "Yeeeeee!{W1}"
										dc.w $86
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "Forget about Astral.{N}"
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "I'll kill him!{W2}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Eat them all up before{N}they reach her!{W1}"
										dc.w $C080
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E44
										dc.b $85
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 86 0 45E44
										dc.b $86
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 87 FF 45E44
										dc.b $87
										dc.b $FF
										dc.l eas_Jump           
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_49F36:         dc.w $D
										dc.w $23
										dc.w 1
										dc.b $D
										dc.b $11
										dc.b 3
										dc.b $A4
										dc.l eas_Init           
										dc.b $D
										dc.b $15
										dc.b 1
										dc.b $D1
										dc.l eas_Init           
										dc.b $C
										dc.b $E
										dc.b 3
										dc.b $CC
										dc.l eas_Init           
										dc.b $C
										dc.b $23
										dc.b 1
										dc.b $CB
										dc.l eas_Init           
										dc.b $E
										dc.b $23
										dc.b 1
										dc.b $CD
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $83
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $78
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $43
										dc.l eas_Init           
										dc.w $FFFF
