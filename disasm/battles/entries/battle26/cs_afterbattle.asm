
; SCRIPT SECTION battles\entries\battle26\cs_afterbattle :
; Cutscene after battle 26
abcs_battle26:      dc.w 4                  ; 0004 SET TEXT INDEX A4D : "Is he alright?{W1}"
										dc.w $A4D
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 48 D B
										dc.w $48
										dc.w $D
										dc.w $B
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4BE4A
										dc.l word_4BE4A
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 13
										dc.b $13
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 11 E 0
										dc.b 7
										dc.b $11
										dc.b $E
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 12 10 1
										dc.b $1F
										dc.b $12
										dc.b $10
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E 13 11 1
										dc.b $1E
										dc.b $13
										dc.b $11
										dc.b 1
										dc.w $53                ; 0053  13 0
										dc.w $13
										dc.w 0
										dc.w $53                ; 0053  80 FFFF
										dc.w $80
										dc.w $FFFF
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 2
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Is he alright?{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "We have to save him before{N}he is possessed by an evil...{W1}"
										dc.w $1F
										dc.w $18                ; 0018 FLASH ENTITY WHITE 1F 3C
										dc.w $1F
										dc.w $3C
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w $32                ; 0032 SET CAMERA DEST D 9
										dc.w $D
										dc.w 9
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 4
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 12 D 3
										dc.b $80
										dc.b $12
										dc.b $D
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 5
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 3
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 4509E
										dc.b $80
										dc.b 0
										dc.l eas_4509E          
										dc.b $80                ; WAIT C8
										dc.b $C8
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46024
										dc.b $80
										dc.b $FF
										dc.l eas_Die            
										dc.w $32                ; 0032 SET CAMERA DEST D B
										dc.w $D
										dc.w $B
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 13
										dc.b $13
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $0
										dc.w 0
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $23                ; 0023 SET ENTITY FACING 13 3
										dc.b $13
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 13
										dc.w $13
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013 : "What happened?{W2}"
										dc.w $C013
										dc.w $2D                ; 002D MOVE ENTITY 13 FF 1 1
										dc.b $13
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 13 FF 45E44
										dc.b $13
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013 : "Ah...I was almost possessed{N}by that devil.{W1}"
										dc.w $C013
										dc.w $2D                ; 002D MOVE ENTITY 13 FF 3 2
										dc.b $13
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013 : "Thank you.{N}How can I repay you for{N}your kindness?{W1}"
										dc.w $C013
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "Are you OK now?  Good.{W2}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "May I ask you, where were{N}you going in such a wounded{N}state?{W1}"
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C013 : "Pacalon, my country.  We{N}are fighting against the{N}devils.{W2}"
										dc.w $C013
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C013 : "But, no country in North{N}Parmecia has enough power{N}to resist them.{W2}"
										dc.w $C013
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013 : "So, I was heading south to{N}find some allies.{W1}"
										dc.w $C013
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "You don't have to go any{N}further.{W1}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 13 2
										dc.b $13
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013 : "Then, you're from South{N}Parmecia?{W1}"
										dc.w $C013
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Yes, Granseal.{W1}"
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 13 3
										dc.b $13
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013 : "Oh, how lucky!  Please{N}come with me to Pacalon!{W1}"
										dc.w $C013
										dc.w $26                ; 0026 MAKE ENTITY NOD 13
										dc.w $13
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "But, we have to go to{N}Tristan.{W1}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 13 2
										dc.b $13
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C013 : "Oh, please...I can't return{N}to Pacalon without allies.{W2}"
										dc.w $C013
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C013 : "Maybe, when you're done...{W2}"
										dc.w $C013
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013 : "OK, I'll go with you.{W1}"
										dc.w $C013
										dc.w 8                  ; 0008 JOIN FORCE 13
										dc.w $13
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "But, you're injured{N}Mr. {NAME;19}.{W1}"
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 13 3
										dc.b $13
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013 : "No problem.  I don't know{N}why, but I'm much better.{W1}"
										dc.w $C013
										dc.w $15                ; 0015 SET ACTSCRIPT 13 0 45FBC
										dc.b $13
										dc.b 0
										dc.l eas_RotateRight    
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 13 FF 45E44
										dc.b $13
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 13 3
										dc.b $13
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 13 FF 45E44
										dc.b $13
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 13 FF 460CE
										dc.b $13
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 13
										dc.w $13
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013 : "Let's go to Pacalon.{W1}"
										dc.w $C013
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 13
										dc.w $13
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4BE4A:         dc.w $13
										dc.w $10
										dc.w 1
										dc.b $11
										dc.b $E
										dc.b 3
										dc.b 7
										dc.l eas_Init           
										dc.b $12
										dc.b $E
										dc.b 3
										dc.b $13
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $6A
										dc.l eas_Init           
										dc.w $FFFF
