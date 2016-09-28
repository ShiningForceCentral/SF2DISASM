
; SCRIPT SECTION battles\entries\battle30\cs_afterbattle :
; Cutscene after battle 30
abcs_battle30:      dc.w 4                  ; 0004 SET TEXT INDEX ACD : "Grrr...impossible!{N}Why...do I have to die?{W1}"
										dc.w $ACD
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 1 5 8
										dc.w 1
										dc.w 5
										dc.w 8
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4C96C
										dc.l word_4C96C
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 C D 1
										dc.b 7
										dc.b $C
										dc.b $D
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F B D 1
										dc.b $1F
										dc.b $B
										dc.b $D
										dc.b 1
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $1C                ; 001C STOP ENTITY ANIM 82
										dc.w $82
										dc.w $53                ; 0053  7 0
										dc.w 7
										dc.w 0
										dc.w $53                ; 0053  1F FFFF
										dc.w $1F
										dc.w $FFFF
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Grrr...impossible!{N}Why...do I have to die?{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Where is Mitula?{W1}"
										dc.w $1F
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "I don't know...haven't{N}seen her.{W1}"
										dc.w $80
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
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
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 B A 1
										dc.b $82
										dc.b $B
										dc.b $A
										dc.b 1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $29                ; 0029 SET ENTITY DEST 82 9 B
										dc.w $82
										dc.w 9
										dc.w $B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Oops!  The Ground Orb....{W1}"
										dc.w $80
										dc.w $18                ; 0018 FLASH ENTITY WHITE 82 3C
										dc.w $82
										dc.w $3C
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "I can't endure the light....{N}Ohhh....{W1}"
										dc.w $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $0
										dc.w 0
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46024
										dc.b $80
										dc.b $FF
										dc.l eas_Die            
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "Thanks to the Ground Orb, we{N}finally defeated Zalbard.{W2}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "The orb released holy power{N}in it's light.{W1}"
										dc.w $1F
										dc.w $18                ; 0018 FLASH ENTITY WHITE 82 3C
										dc.w $82
										dc.w $3C
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 2
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Hey, look over there!{W1}"
										dc.w 7
										dc.w $32                ; 0032 SET CAMERA DEST 5 0
										dc.w 5
										dc.w 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 B 3 3
										dc.b $81
										dc.b $B
										dc.b 3
										dc.b 3
										dc.w $18                ; 0018 FLASH ENTITY WHITE 81 3C
										dc.w $81
										dc.w $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Welcome!{W1}"
										dc.w $81
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 4
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 4
										dc.b 2
										dc.b 2
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $18                ; 0018 FLASH ENTITY WHITE 81 3C
										dc.w $81
										dc.w $3C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
										dc.b $38
										dc.b $38
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 38
										dc.w $38
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 82
										dc.w $82
										dc.w $29                ; 0029 SET ENTITY DEST 82 B 2
										dc.w $82
										dc.w $B
										dc.w 2
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 82
										dc.w $82
										dc.w 4
										dc.w $32                ; 0032 SET CAMERA DEST 5 8
										dc.w 5
										dc.w 8
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081 : "Thank you.{W2}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "I've finally returned to this{N}world.{W1}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Goddess Mitula?{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "Oh, nice to meet you,{N}Sir Astral.{W1}"
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "Oh, you know my name?{N}Gee....{W2}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Please tell us, what should{N}we do now?{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "I don't know.{W1}"
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "What?!{W2}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "But, why?  You're a goddess.{N}You know our future, right?{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "I'm not Volcanon.  I never{N}tell people the future, even{N}if it could prevent death.{W1}"
										dc.w $C081
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Death?!  Not ours I hope.{W1}"
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081 : "Zeon is an unimaginably{N}strong devil.{W2}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "If he attains full power,{N}I, even Volcanon, would not{N}be able to stop him.{W1}"
										dc.w $C081
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "So, we have to defeat him{N}before he revives completely.{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "His power is sealed in the{N}Jewel of Evil.{W1}"
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "So, that's why he wants the{N}jewel!{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Then, why don't we keep the{N}jewel forever.{W1}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081 : "Arc Valley is the place where{N}evil power gathers.{W2}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "He will recover his power{N}if he stays there long enough.{W1}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Did you say, Arc Valley?{W1}"
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081 : "You call it Ancient Tower{N}or Granseal.{W2}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "Granseal is named for the{N}symbol in the tower.{N}It seals the ground.{W1}"
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "I see.{W1}"
										dc.w $1F
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $18                ; 0018 FLASH ENTITY WHITE 81 32
										dc.w $81
										dc.w $32
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Goddess Mitula, where are{N}you going?{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "Down to the surface.{N}To save the people.{W1}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Are you going to abandon us,{N}as Volcanon did?{W1}"
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081 : "Well...no.{N}I'll give you a hint.{W2}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "Listen to the legends from{N}the storytellers before you{N}go to Grans Island.{W1}"
										dc.w $C081
										dc.w $18                ; 0018 FLASH ENTITY WHITE 81 1E
										dc.w $81
										dc.w $1E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081 : "You can't kill Zeon, but{N}Volcanon and I will help you{N}if you weaken him.{W2}"
										dc.w $C081
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081 : "{LEADER}!{N}You are the chosen one.{N}You have the holy jewel.{W2}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "We need your help to reseal{N}Zeon.{N}Find the holy sword.{W1}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Where is it?{N}How can we find it?{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "It's on Grans.{N}Your jewel will lead you to...{W1}"
										dc.w $C081
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 6
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 2
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461E4
										dc.b $1F
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Mitula, Mitula!!{W1}"
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "{LEADER}, Mitula{N}has vanished!{N}What should we do now?{W1}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "We have to go to Arc Valley{N}on Grans Island.{W2}"
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "{LEADER}, find the{N}storytellers first.{W1}"
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 0 2
										dc.w $1F
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 7 1F 2
										dc.w 7
										dc.w $1F
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4C96C:         dc.w $A
										dc.w $D
										dc.w 1
										dc.b $C
										dc.b $D
										dc.b 1
										dc.b 7
										dc.l eas_Init           
										dc.b $B
										dc.b $A
										dc.b 3
										dc.b $9B
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $D7
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $AC
										dc.l eas_Init           
										dc.w $FFFF
