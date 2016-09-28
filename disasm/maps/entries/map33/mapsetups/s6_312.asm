
; SCRIPT SECTION maps\entries\map33\mapsetups\s6_312 :
; 

; =============== S U B R O U T I N E =======================================

ms_map33_flag312_InitFunction:
										
										rts

	; End of function ms_map33_flag312_InitFunction

cs_5AC58:           dc.w 4                  ; 0004 SET TEXT INDEX 70C : "You may go now.{N}I need to talk to fairy.{W1}"
										dc.w $70C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "You may go now.{N}I need to talk to fairy.{W1}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Yes, sir.{W1}"
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST C B
										dc.w $C
										dc.w $B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $47                ; 0047  11 B
										dc.w $11
										dc.w $B
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 11 B 3
										dc.b $80
										dc.b $11
										dc.b $B
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 3
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461B6
										dc.b $80
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 50
										dc.b $50
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Tum-de-dum-dum.  Oh...{N}Time to check the{N}collections.{W1}"
										dc.w $80
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 5
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 5
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 F 15 1
										dc.b 7
										dc.b $F
										dc.b $15
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 F 16 1
										dc.b 0
										dc.b $F
										dc.b $16
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F F 17 1
										dc.b $1F
										dc.b $F
										dc.b $17
										dc.b 1
										dc.w $47                ; 0047  F 14
										dc.w $F
										dc.w $14
										dc.w $32                ; 0032 SET CAMERA DEST 8 C
										dc.w 8
										dc.w $C
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Servant Goliath unlocks the{N}door.{W1}"
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 4
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 4
										dc.b 2
										dc.b 3
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 5
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 5
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 6
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 6
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Excuse me.{W1}"
										dc.w 7
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Yeow!{W1}"
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Y...yes?{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "We've come to see Mr. Creed.{W1}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "My master?{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Do you have an appointment?{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "A what?{W1}"
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "No, not yet, but...{W1}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "I'm sorry, but he's busy now.{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Please come back later.{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "We can't see Mr. Creed now.{W1}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "No kidding!{W2}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "{LEADER}, {NAME;7}, let's{N}force our way into the room!{W1}"
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "Oddler, you're getting bold.{W2}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "But, it is a good idea.{W1}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Hmmmph....{W1}"
										dc.w $80
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Let's go!{W1}"
										dc.w 7
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
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
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 7 0 0 5
										dc.b 7
										dc.b 0
										dc.b 0
										dc.b 5
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 0 5
										dc.b $1F
										dc.b 0
										dc.b 0
										dc.b 5
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 0 0 5
										dc.b 0
										dc.b 0
										dc.b 0
										dc.b 5
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 11 C 3
										dc.b $80
										dc.b $11
										dc.b $C
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 3
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45F0C
										dc.b 7
										dc.b 0
										dc.l eas_BumpUp         
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 45F0C
										dc.b $1F
										dc.b 0
										dc.l eas_BumpUp         
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45F0C
										dc.b 0
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "How did he do that?{W1}"
										dc.w 7
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "You impolite kids!{N}You can't go in!{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Mr. Creed is too busy!{N}Go away!{W1}"
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 46172
										dc.b 0
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 46172
										dc.b 7
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 46172
										dc.b $1F
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 1
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 1
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.b $80                ; WAIT 19
										dc.b $19
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "{LEADER}, on our left!{N}That door might lead to{N}Mr. Creed!{W2}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Let's ditch this guy and go{N}through that door.{W1}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "{LEADER}, let's do it!{N}I don't want to fail now!{W1}"
										dc.w $1F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "OK, OK.  We give up.{W2}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "We'll see Mr. Creed later.{N}Let's get out of here.{W1}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Yeah, maybe later.{W1}"
										dc.w $1F
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5AF36:           dc.w 4                  ; 0004 SET TEXT INDEX 72A : "No, don't go in there!{N}That door is...!{W1}"
										dc.w $72A
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 2
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "No, don't go in there!{N}That door is...!{W1}"
										dc.w $80
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
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
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 463AE
										dc.b 0
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 463AE
										dc.b 7
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 463AE
										dc.b $1F
										dc.b 0
										dc.l eas_463AE          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "What stupid kids!{W1}"
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 3
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "Whoever passes through this{N}magic door becomes small.{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "That is, anybody who's not{N}protected by Mr. Creed.{W1}"
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Goliath picks up{N}{LEADER}.{W1}"
										dc.w $FFFF
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Now, you're part of the{N}collection!{W1}"
										dc.w $80
										dc.w $47                ; 0047  C D
										dc.w $C
										dc.w $D
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 2
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 5
										dc.b 9
										dc.b $14
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 16000003
										dc.l $16000003
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5B016:           dc.w 4                  ; 0004 SET TEXT INDEX 730 : "Goliath...Goliath!{W1}"
										dc.w $730
										dc.w $46                ; 0046  C 2
										dc.w $C
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 3F 3F 3
										dc.b 0
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 3F 3F 3
										dc.b 7
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 3F 3F 3
										dc.b $1F
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "Goliath...Goliath!{W1}"
										dc.w $8081
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "Goliath!!!{W1}"
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "I'm here!  I'm coming!{W1}"
										dc.w $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 11 E 1
										dc.b $80
										dc.b $11
										dc.b $E
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST C 4
										dc.w $C
										dc.w 4
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 2
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $47                ; 0047  11 B
										dc.w $11
										dc.w $B
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 3
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Yes, Mr. Creed?{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "My collection is rather noisy{N}today.{W1}"
										dc.w $8081
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Oh, yes...ah...{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "What?{W1}"
										dc.w $8081
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "No, I...I added to your{N}collection today.{W1}"
										dc.w $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "You did what?!{W1}"
										dc.w $8081
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "I'm sorry!{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "I tried to stop them, but they{N}jumped through the magic door.{W1}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8081 : "You didn't lock the door, did{N}you?{W2}"
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "I told you to always lock{N}that door!{W1}"
										dc.w $8081
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "Anyway, I want to see them.{W1}"
										dc.w $8081
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Right away, sir!{W1}"
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
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 5
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "What?{W1}"
										dc.w $8081
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Ah...{W1}"
										dc.w $FFFF
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "I heard something.{W1}"
										dc.w $8081
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 1
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Are you Mr. Creed?{W1}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8081 : "Oh, someone from my{N}collection is talking!{W2}"
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "You must be one of the people{N}Goliath was talking about.{W1}"
										dc.w $8081
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "We came to see you.{W2}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Please return us to our{N}original size.{W1}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8081 : "You came to see me?{W2}"
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "Hmmm...why?{W1}"
										dc.w $8081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Make us bigger.  My neck{N}hurts from looking up at you!{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "Oh, sorry. {W1}"
										dc.w $8081
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "Abra kadabra!  1-2-3!{W1}"
										dc.w $8081
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 10 9 3
										dc.b 0
										dc.b $10
										dc.b 9
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 46310
										dc.b 0
										dc.b 0
										dc.l eas_46310          
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 F 9 3
										dc.b 7
										dc.b $F
										dc.b 9
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 46310
										dc.b 7
										dc.b 0
										dc.l eas_46310          
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 11 9 3
										dc.b $1F
										dc.b $11
										dc.b 9
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 46310
										dc.b $1F
										dc.b 0
										dc.l eas_46310          
										dc.b $80                ; WAIT 3C
										dc.b $3C
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
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Wow, we're back to normal!{N}I can't believe we were so{N}small!{W1}"
										dc.w 7
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "Now, why did you want to see{N}me?{W1}"
										dc.w $8081
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Oh, yes!{N}We want to know about Zeon!{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "Zeon?{W1}"
										dc.w $82
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 10 0 3
										dc.b $82
										dc.b $10
										dc.b 0
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 3 7
										dc.b $82
										dc.b $FF
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "You said Zeon?{W1}"
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "The King of the Devils who is{N}sealed in Arc Valley?{W1}"
										dc.w $8081
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 3 1
										dc.b $82
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "Did something happen to{N}Zeon?  Has he revived?{W1}"
										dc.w $82
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER} nods.{W1}"
										dc.w $FFFF
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 461B6
										dc.b $82
										dc.b 0
										dc.l eas_461B6          
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "No way!  You're kidding!{N}I can't believe it!{W1}"
										dc.w $82
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "Noisy fairy!{N}Be quiet!{W1}"
										dc.w $8081
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 82 0 0 1
										dc.b $82
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 1
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "Is what you say true?{W1}"
										dc.w $8081
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER} nods again.{W1}"
										dc.w $FFFF
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "So, Zeon will appear again....{N}He will destroy everything.{W1}"
										dc.w $8081
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 4
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 4
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Sir, the new additions to{N}your collection are missing!{W1}"
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "I know.{W1}"
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "How...?{W1}"
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "It doesn't matter how!{N}Now, go away!{W1}"
										dc.w $81
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4
										dc.w 4
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 1
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46102
										dc.b $82
										dc.b $FF
										dc.l eas_Init2          
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 1
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "Wow!  I can't believe this{N}is happening!{W1}"
										dc.w $82
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "You know, Grans Island is{N}covered by a dark cloud.{W2}"
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "At the same time, North{N}Parmecia has had no rain.{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "South Parmecia is OK, but....{W1}"
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 82 : "That's because of Volcanon.{W2}"
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "I fear for Mitula....{W1}"
										dc.w $82
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "Volcanon and Mitula are{N}invulnerable to everything, {N}except Zeon!{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Indeed...Zeon is extremely{N}powerful!{W1}"
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 1
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Zeon?  Oh, gosh!{W1}"
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Goliath!  What are you still{N}doing here?!{W1}"
										dc.w $81
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4
										dc.w 4
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8081 : "I have no time to scold you{N}now!{W2}"
										dc.w $8081
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8081 : "The Evil Spirit may know{N}something.{W1}"
										dc.w $8081
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 3
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 4
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 81
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46102
										dc.b $82
										dc.b $FF
										dc.l eas_Init2          
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 2 1
										dc.b $82
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "You guys, follow him.{N}Follow him!{W1}"
										dc.w $82
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 1
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 4
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5B466:           dc.w 4                  ; 0004 SET TEXT INDEX 78C : "Oddler?{W1}"
										dc.w $78C
										dc.w $32                ; 0032 SET CAMERA DEST C F
										dc.w $C
										dc.w $F
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1F
										dc.w $1F
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Oddler?{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "I understand you.{W1}"
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 11 F 3
										dc.b $81
										dc.b $11
										dc.b $F
										dc.b 3
										dc.w $32                ; 0032 SET CAMERA DEST C 7
										dc.w $C
										dc.w 7
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 460CE
										dc.b $82
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 F 17 1
										dc.b 0
										dc.b $F
										dc.b $17
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 F 16 1
										dc.b 7
										dc.b $F
										dc.b $16
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 10 16 1
										dc.b $1F
										dc.b $10
										dc.b $16
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 10 17 1
										dc.b $82
										dc.b $10
										dc.b $17
										dc.b 1
										dc.w $2E                ; 002E HIDE ENTITY E
										dc.w $E
										dc.w $2E                ; 002E HIDE ENTITY 10
										dc.w $10
										dc.w $2E                ; 002E HIDE ENTITY 11
										dc.w $11
										dc.w $2E                ; 002E HIDE ENTITY F
										dc.w $F
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 2
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 2
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST A 12
										dc.w $A
										dc.w $12
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Understand what?{W1}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "Oddler will remain here.{W2}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 1
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Won't you, Oddler?{W1}"
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Oddler, is this true?{W1}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F : "I don't know why, but I{N}would like to stay.{W2}"
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "No, I must stay here....{N}I must stay here....{W1}"
										dc.w $801F
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 1
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "He's weak.{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "He had better stay.{N}Say farewell.{W1}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 1
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 1
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F : "It was great travelling with{N}you {LEADER}.{W2}"
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "Thank you.  Please be{N}careful.{W1}"
										dc.w $801F
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 46
										dc.b $46
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 3
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 1
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "{LEADER}, you'll learn{N}the reason why he has to stay{N}here soon enough.{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Don't think about it now.{N}Go to the north.{W1}"
										dc.w $81
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 82 7 2
										dc.w $82
										dc.w 7
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
