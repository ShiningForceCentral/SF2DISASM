
; SCRIPT SECTION battles\entries\battle31\cs_beforebattle :
; Cutscene before battle 31
bbcs_31:            dc.w 4                  ; 0004 INIT TEXT CURSOR AFB : "Finally, you've left the{N}castle, Vicar {NAME;22}.{W1}"
										dc.w $AFB
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 2 10 2
										dc.w 2
										dc.w $10
										dc.w 2
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4CB92
										dc.l word_4CB92
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 14 3 3
										dc.b 7
										dc.b $14
										dc.b 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 16 3 3
										dc.b $1F
										dc.b $16
										dc.b 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 16 FF 460CE
										dc.b $16
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 16 15 3 3
										dc.b $16
										dc.b $15
										dc.b 3
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 6
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45FB2
										dc.b $82
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_1
										dc.w $22
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Finally, you've left the{N}castle, Vicar {NAME;22}.{W1}"
										dc.w $C080
										dc.w $32                ; 0032 SET CAMERA DEST 10 5
										dc.w $10
										dc.w 5
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Geshp!{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "So, you remember me. {W1}"
										dc.w $C080
										dc.w $32                ; 0032 SET CAMERA DEST 10 2
										dc.w $10
										dc.w 2
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "What do you want?{W1}"
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "I have plans for you.{W2}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "I'm very happy that you came{N}out of the castle.{W1}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Why?{W1}"
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "I have been waiting for{N}{NAME;22}.{W2}"
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "Vicar {NAME;22}, you locked{N}the gate of Moun, remember?{W2}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "My faithful soldiers can't{N}enter Parmecia.{N}Now, you will open it!{W1}"
										dc.w $C080
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "It's a trap!{W2}"
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST 10 0
										dc.w $10
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "{NAME;22}, run!{W1}"
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 16 FF 1 1
										dc.b $16
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $41                ; 0041 FLASH SCREEN WHITE 2
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 15 1 2
										dc.b $82
										dc.b $15
										dc.b 1
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 16 FF 45E44
										dc.b $16
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 16 FF 46172
										dc.b $16
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 16 FF 3 1
										dc.b $16
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Ha, ha.  He can't.{W1}"
										dc.w $C080
										dc.w $32                ; 0032 SET CAMERA DEST 10 6
										dc.w $10
										dc.w 6
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Cameela!  Cameeeeeela!{W1}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Cameela?!  We met her in{N}Pangoat Valley.{W1}"
										dc.w 7
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "What?{W1}"
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "Ah, Cameela.  You're here.{W2}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Get the key for me!{W1}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Geshp, you're as devious as{N}usual.{W1}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "That I am.  Now, get the key!{W1}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Me?!  Why?{W1}"
										dc.w $81
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Cameela!{W1}"
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "I hate you!{N}I won't help you.{W2}"
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "You want the key?{N}You get it!{N}You can use my army.{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "See you later.{W1}"
										dc.w $81
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 6
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "That witch!{W2}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Cameela!  Cameela!!{W1}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "They're divided....{W1}"
										dc.w 7
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "I don't need your help,{N}Cameela!{W2}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Come on, devils!{N}Kill {LEADER} now!{W1}"
										dc.w $C080
										dc.w $32                ; 0032 SET CAMERA DEST 10 D
										dc.w $10
										dc.w $D
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 13 12 1
										dc.b $83
										dc.b $13
										dc.b $12
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 15 13 1
										dc.b $84
										dc.b $15
										dc.b $13
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 16 12 1
										dc.b $85
										dc.b $16
										dc.b $12
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 17 F 1
										dc.b $86
										dc.b $17
										dc.b $F
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 45E44
										dc.b $83
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45E44
										dc.b $84
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E44
										dc.b $85
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 45E44
										dc.b $86
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST 10 6
										dc.w $10
										dc.w 6
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Bye, {LEADER}.{W1}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "You're not staying?{W1}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "I'm good at using my brains,{N}not my strength.{W2}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "I'll return by the time{N}you're defeated.{W1}"
										dc.w $C080
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4CB92:         dc.w $15
										dc.w 4
										dc.w 3
										dc.b $14
										dc.b 3
										dc.b 3
										dc.b 7
										dc.l eas_Init           
										dc.b $15
										dc.b 3
										dc.b 3
										dc.b $16
										dc.l eas_Init           
										dc.b $15
										dc.b 8
										dc.b 1
										dc.b $9F
										dc.l eas_Init           
										dc.b $15
										dc.b $B
										dc.b 1
										dc.b $9C
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $AB
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $8D
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $91
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $56
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $6F
										dc.l eas_Init           
										dc.w $FFFF
