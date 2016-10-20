
; ASM FILE data\maps\entries\map11\mapsetups\s6.asm :
; 0x57AA8..0x57CCC : 

; =============== S U B R O U T I N E =======================================

ms_map11_InitFunction:
		
		rts

	; End of function ms_map11_InitFunction

cs_57AAA:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR C4F : "God Volcanon!{N}I'm back!{W1}"
		dc.w $C4F
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 FF 460CE
		dc.b 7
		dc.b $FF
		dc.l eas_Init           
		dc.w $29                
						; 0029 SET ENTITY DEST 0 27 B
		dc.w 0
		dc.w $27
		dc.w $B
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 2 1
		dc.b 0
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 7
		dc.w 7
		dc.w $29                
						; 0029 SET ENTITY DEST 7 27 B
		dc.w 7
		dc.w $27
		dc.w $B
		dc.w $23                
						; 0023 SET ENTITY FACING 7 1
		dc.b 7
		dc.b 1
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 1 1
		dc.b 7
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 0 1
		dc.b 0
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 0 1
		dc.b 0
		dc.b 1
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 1 1
		dc.b 7
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "God Volcanon!{N}I'm back!{W1}"
		dc.w 7
		dc.w $32                
						; 0032 SET CAMERA DEST 22 3
		dc.w $22
		dc.w 3
		dc.b $80                
						; WAIT 78
		dc.b $78
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Welcome back, {NAME;7}.{N}You look well.{W1}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "Yes, I am!  This trip{N}was very interesting.{W1}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "That's good.{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "What made it interesting?{W1}"
		dc.w $80
		dc.w $26                
						; 0026 MAKE ENTITY NOD 7
		dc.w 7
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "I met a lot people that live{N}on the ground.{W2}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "They help each other.{N}I made some friends.{W1}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Wonderful.  It must've been{N}a good experience for you.{W1}"
		dc.w $80
		dc.w $26                
						; 0026 MAKE ENTITY NOD 7
		dc.w 7
		dc.w $32                
						; 0032 SET CAMERA DEST 22 5
		dc.w $22
		dc.w 5
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "I've brought a friend.{W1}"
		dc.w 7
		dc.w $23                
						; 0023 SET ENTITY FACING 7 3
		dc.b 7
		dc.b 3
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 0 1
		dc.b 0
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 0 1
		dc.b 0
		dc.b 1
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 3 2
		dc.b 7
		dc.b $FF
		dc.b 3
		dc.b 2
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 7 0
		dc.b 7
		dc.b 0
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 2 1
		dc.b 7
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 7 1
		dc.b 7
		dc.b 1
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 2 1
		dc.b 0
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 0 1
		dc.b 0
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "This is {LEADER}.{N}He's from Granseal.{W1}"
		dc.w 7
		dc.w $32                
						; 0032 SET CAMERA DEST 22 2
		dc.w $22
		dc.w 2
		dc.w 5                  
						; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		dc.w $5D
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 2
		dc.w 2
		dc.b $80                
						; WAIT 5A
		dc.b $5A
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 0
		dc.w 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Granseal!{W1}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "People of Grans Island{N}caused a serious, deadly{N}problem for the world!{W1}"
		dc.w $80
		dc.w 5                  
						; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		dc.w $5D
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 3
		dc.w 3
		dc.b $80                
						; WAIT 5A
		dc.b $5A
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 0
		dc.w 0
		dc.w $32                
						; 0032 SET CAMERA DEST 22 6
		dc.w $22
		dc.w 6
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 0 461B6
		dc.b 7
		dc.b 0
		dc.l eas_461B6          
		dc.b $80                
						; WAIT 78
		dc.b $78
		dc.w $23                
						; 0023 SET ENTITY FACING 7 1
		dc.b 7
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "Volcanon?{W1}"
		dc.w 7
		dc.w $32                
						; 0032 SET CAMERA DEST 22 2
		dc.w $22
		dc.w 2
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "They awakened Zeon, the{N}legendary devil!{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "I've been protecting all the{N}ground-dwelling people.{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "I can't forgive them for{N}this!{W1}"
		dc.w $80
		dc.w 5                  
						; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		dc.w $5D
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 4
		dc.w 4
		dc.b $80                
						; WAIT 5A
		dc.b $5A
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 0
		dc.w 0
		dc.w $32                
						; 0032 SET CAMERA DEST 22 5
		dc.w $22
		dc.w 5
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 0 1
		dc.b 0
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 0 1
		dc.b 7
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 0 1
		dc.b 0
		dc.b 1
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 1 3
		dc.b 7
		dc.b $FF
		dc.b 1
		dc.b 3
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "Volcanon, please calm down!{W2}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "{LEADER} is not the person{N}who did it!{W1}"
		dc.w 7
		dc.w $32                
						; 0032 SET CAMERA DEST 22 3
		dc.w $22
		dc.w 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Everybody who lives on the{N}ground is responsibile.{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "They have to solve this by{N}themselves.{W1}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "What should {LEADER} do?{W1}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "My protection ceases now!{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "He must face the devils on{N}his own.{W1}"
		dc.w $80
		dc.w 5                  
						; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		dc.w $5D
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 4
		dc.w 4
		dc.b $80                
						; WAIT 5A
		dc.b $5A
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 0
		dc.w 0
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 FF 46172
		dc.b 7
		dc.b $FF
		dc.l eas_46172          
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 3 1
		dc.b 7
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 FF 460CE
		dc.b 7
		dc.b $FF
		dc.l eas_Init           
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "But...{W2}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "Even the greater devils{N}are as strong as you!{W1}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "If all the humans are{N}annihilated, that's OK.{N}It's their destiny.{W2}"
		dc.w $80
		dc.w 5                  
						; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		dc.w $5D
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 4
		dc.w 4
		dc.b $80                
						; WAIT 5A
		dc.b $5A
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 0
		dc.w 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "I want them to show me{N}courage.{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "They must reseal the devil{N}again.{W1}"
		dc.w $80
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 1 1
		dc.b 7
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "Then, please give some{N}advice to {LEADER}.{W1}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "{LEADER}, believe in the{N}power of the jewel.{W2}"
		dc.w $80
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 2 1
		dc.b 0
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 1 2
		dc.b 0
		dc.b $FF
		dc.b 1
		dc.b 2
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "It belongs to both the{N}light and the darkness.{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "It shows its true power{N}when the light and the{N}darkness are as one.{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "You may go now.  I don't{N}want to see anybody until{N}Zeon is defeated.{W1}"
		dc.w $80
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 1 1
		dc.b 7
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "Volcanon!{W1}"
		dc.w 7
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 FF 45E44
		dc.b 7
		dc.b $FF
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 FF 45E44
		dc.b 7
		dc.b $FF
		dc.l eas_Jump           
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 3 1
		dc.b 7
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "{LEADER}, we'll defeat{N}that devil by ourselves!{W1}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "I didn't know he was such a{N}cold-hearted god.{W2}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "OK, I'll help you!  I'll{N}go with you to reseal the{N}devil!{W1}"
		dc.w 7
		dc.w 8                  
						; 0008 JOIN FORCE 7
		dc.w 7
		dc.w $54                
						; 0054  7 0
		dc.w 7
		dc.w 0
		dc.w $2C                
						; 002C FOLLOW ENTITY 7 0 2
		dc.w 7
		dc.w 0
		dc.w 2
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
