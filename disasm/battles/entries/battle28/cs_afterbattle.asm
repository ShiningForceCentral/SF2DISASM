
; SCRIPT SECTION battles\entries\battle28\cs_afterbattle :
; Cutscene after battle 28
abcs_battle28:      dc.w 4                  ; 0004 SET TEXT INDEX A6E : "Phew!  That was close!{W1}"
										dc.w $A6E
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 2F 7 19
										dc.w $2F
										dc.w 7
										dc.w $19
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4C3B4
										dc.l word_4C3B4
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 1C 3
										dc.b 7
										dc.b $D
										dc.b $1C
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F B 1C 3
										dc.b $1F
										dc.b $B
										dc.b $1C
										dc.b 3
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 82
										dc.w $82
										dc.w $53                ; 0053  1F 0
										dc.w $1F
										dc.w 0
										dc.w $53                ; 0053  7 0
										dc.w 7
										dc.w 0
										dc.w $53                ; 0053  80 FFFF
										dc.w $80
										dc.w $FFFF
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 39
										dc.b $39
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Phew!  That was close!{W1}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "Thank you very much.{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Excuse me, will you help{N}me up?{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 3 1
										dc.b $1F
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT F
										dc.b $F
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45E94
										dc.b 0
										dc.b $FF
										dc.l eas_JumpRight      
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "NO!  I'll do it!{W1}"
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "We'll take you with us.{W2}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Tristan is the nearest town.{N}I think you had better rest{N}there.{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Thank you, sir.{W1}"
										dc.w $80
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 C5
										dc.w $80
										dc.w $C5
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 2
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT E
										dc.b $E
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 461AA
										dc.b $80
										dc.b $FF
										dc.l eas_461AA          
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "You sure are being nice.{N}Hmmm....{W2}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Anyway, Tristan is just over{N}there.  Let's go.{W1}"
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 0 0 0 1
										dc.b 0
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 1
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST A 19
										dc.w $A
										dc.w $19
										dc.w $2D                ; 002D MOVE ENTITY 0 0 0 2
										dc.b 0
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 0 3
										dc.b $81
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 4
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 4
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "{LEADER}...{NAME;7}...{W1}"
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "What?  Don't you want to{N}go to Tristan?{W1}"
										dc.w 7
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Oh, I do, but...{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "We shouldn't go to Tristan{N}right now.{W1}"
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Why not?{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Because of me!{W1}"
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 8 19
										dc.w 8
										dc.w $19
										dc.w $18                ; 0018 FLASH ENTITY WHITE 80 28
										dc.w $80
										dc.w $28
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 B 1E 0
										dc.b $80
										dc.b $B
										dc.b $1E
										dc.b 0
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
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 9C
										dc.w $80
										dc.w $9C
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 7 0 2 1
										dc.b 7
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "Wh...who are you?!{W2}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Are you a devil?{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "I'm one of the leaders of{N}the Devil Army.{N}My name is Cameela!{W1}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "What do you want?{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "{LEADER}, I came here{N}to get your Jewel of Evil!{W1}"
										dc.w $C080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "Zeon told US to bring it to{N}the Ancient Tower.{N}He didn't mention you.{W2}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "And since we've never heard{N}of you, you're not getting{N}the jewel!{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "No!  His orders were...{W1}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "If Zeon finds out, you will{N}be...{W1}"
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "He'll forgive me when I{N}bring him the jewel.{W2}"
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "Enough talking!  Hand over{N}that jewel.  In return, I'll{N}spare Sir Astral!{W2}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Do you want me to kill this{N}old man?{W1}"
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "The jewel can't be removed{N}from {LEADER}'s neck.{W2}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Do you really think that you{N}can kill me?{W1}"
										dc.w $1F
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Of course.{W1}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "HA!{W1}"
										dc.w $1F
										dc.w $18                ; 0018 FLASH ENTITY WHITE 1F 28
										dc.w $1F
										dc.w $28
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Ooops!{W1}"
										dc.w $C080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 C 1E 2
										dc.b $82
										dc.b $C
										dc.b $1E
										dc.b 2
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
										dc.b $38
										dc.b $38
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 82 0 2 8
										dc.b $82
										dc.b 0
										dc.b 2
										dc.b 8
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_JUMP
										dc.w $57
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Well done.  You dodged my{N}fireball.{W1}"
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "What a surprising old wizard!{W2}"
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "I didn't think I could obtain{N}the jewel that easily.{N}Ha, ha!{W2}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "This is gonna be fun!{N}{LEADER}!{N}Keep it for a while.{W1}"
										dc.w $C080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 A
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b $A
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $32                ; 0032 SET CAMERA DEST 8 1A
										dc.w 8
										dc.w $1A
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 2
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Wait!{W1}"
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w $32                ; 0032 SET CAMERA DEST 7 10
										dc.w 7
										dc.w $10
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Be careful of Geshp and{N}Zalbard!{W1}"
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E6C
										dc.b $80
										dc.b $FF
										dc.l eas_JumpLeft       
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 463AE
										dc.b $80
										dc.b $FF
										dc.l eas_463AE          
										dc.w $32                ; 0032 SET CAMERA DEST 8 1A
										dc.w 8
										dc.w $1A
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Ah, she's gone....{N}OK, {LEADER}.{N}Let's go to Tristan.{W1}"
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Would you please explain{N}what just happened?{W1}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "You don't know?{W2}"
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "Everything here was set up{N}by Cameela.{W2}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "It was a trap to get the{N}Jewel of Evil.{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Your fireball...as if you{N}knew what she was from the{N}beginning.{W1}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "Yes, I did.{W2}"
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "Her evil aura was apparent.{N}By the way, did you hear{N}what she said?{W2}"
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "They're all acting on their{N}own, ignoring Zeon's orders.{W2}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "It will be dangerous.{N}We must be careful.{W1}"
										dc.w $1F
										dc.w $2C                ; 002C FOLLOW ENTITY 81 0 2
										dc.w $81
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 81 1
										dc.w $1F
										dc.w $81
										dc.w 1
										dc.w $2C                ; 002C FOLLOW ENTITY 7 81 3
										dc.w 7
										dc.w $81
										dc.w 3
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT FF101E00
										dc.l $FF101E00
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4C3B4:         dc.w $C
										dc.w $1C
										dc.w 3
										dc.b $C
										dc.b $1F
										dc.b 1
										dc.b $B0
										dc.l eas_Init           
										dc.b $D
										dc.b $1C
										dc.b 3
										dc.b 7
										dc.l eas_Init           
										dc.b $C
										dc.b $1B
										dc.b 3
										dc.b $3E
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $B2
										dc.l eas_Init           
										dc.w $FFFF
