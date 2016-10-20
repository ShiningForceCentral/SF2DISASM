
; ASM FILE data\battles\entries\battle37\cs_afterbattle.asm :
; 0x4DB94..0x4DDA4 : Cutscene after battle 37
abcs_battle37:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR B9C : "Sir Astral, he's...crying!{W1}"
		dc.w $B9C
		dc.w $37                
						; 0037 LOAD MAP AND FADE IN 4D 1F 36
		dc.w $4D
		dc.w $1F
		dc.w $36
		dc.w $42                
						; 0042 RELATED TO LOADING MAP ENTITIES 4DD8C
		dc.l word_4DD8C
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 460CE
		dc.b 0
		dc.b $FF
		dc.l eas_Init           
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 FF 460CE
		dc.b 7
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 7 21 3B 0
		dc.b 7
		dc.b $21
		dc.b $3B
		dc.b 0
		dc.w $15                
						; 0015 SET ACTSCRIPT 1F FF 460CE
		dc.b $1F
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1F 22 39 3
		dc.b $1F
		dc.b $22
		dc.b $39
		dc.b 3
		dc.w $15                
						; 0015 SET ACTSCRIPT 1E FF 460CE
		dc.b $1E
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1E 25 3B 2
		dc.b $1E
		dc.b $25
		dc.b $3B
		dc.b 2
		dc.w $D                 
						; 000D JUMP IF CLEAR FLAG 4C 4DBEE : Zynk is a follower
		dc.w $4C
		dc.l word_4DBEE         
		dc.w $15                
						; 0015 SET ACTSCRIPT 1A FF 460CE
		dc.b $1A
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
		dc.b $1A
		dc.b $3F
		dc.b $3E
		dc.b 3
word_4DBEE:
		dc.w $1C                
						; 001C STOP ENTITY ANIM 1C
		dc.w $1C
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 1C
		dc.b $1C
		dc.b $FF
		dc.w $14                
						;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                
						;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 
						;   000A UPDATE SPRITE
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $53                
						; 0053  1F 0
		dc.w $1F
		dc.w 0
		dc.w $53                
						; 0053  1C FFFF
		dc.w $1C
		dc.w $FFFF
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 0 1
		dc.b 7
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.b $80                
						; WAIT 32
		dc.b $32
		dc.w $23                
						; 0023 SET ENTITY FACING 7 1
		dc.b 7
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "Sir Astral, he's...crying!{W1}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "Why would he be crying?{W1}"
		dc.w $1F
		dc.w $2D                
						; 002D MOVE ENTITY 1F FF 0 1
		dc.b $1F
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $23                
						; 0023 SET ENTITY FACING 7 0
		dc.b 7
		dc.b 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "I think I've seen his style{N}of fighting before.{N}Let's see his face.{W1}"
		dc.w $1F
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Astral removes the mask.{W1}"
		dc.w $FFFF
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01C : "Huh?{W1}"
		dc.w $C01C
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 0 45E44
		dc.b 7
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 1F FF 45E44
		dc.b $1F
		dc.b $FF
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 0 45E44
		dc.b 7
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 1F FF 45E44
		dc.b $1F
		dc.b $FF
		dc.l eas_Jump           
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "It's {NAME;28}!{W1}"
		dc.w $1F
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 3 2
		dc.b 0
		dc.b $FF
		dc.b 3
		dc.b 2
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 0 2
		dc.b 0
		dc.b 2
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 7
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "Let me see him.{W1}"
		dc.w 7
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 1C
		dc.w $1C
		dc.w $1C                
						; 001C STOP ENTITY ANIM 1C
		dc.w $1C
		dc.w $18                
						; 0018 FLASH ENTITY WHITE 1C 39
		dc.w $1C
		dc.w $39
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 0 45E44
		dc.b 7
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 0 45E44
		dc.b 0
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 1F FF 45E44
		dc.b $1F
		dc.b $FF
		dc.l eas_Jump           
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "Wow, he's alive!{W1}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "{NAME;28}!  {NAME;28}!{W1}"
		dc.w $1F
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01C : "Where?!{W1}"
		dc.w $C01C
		dc.w $15                
						; 0015 SET ACTSCRIPT 1C FF 460CE
		dc.b $1C
		dc.b $FF
		dc.l eas_Init           
		dc.w $1B                
						; 001B START ENTITY ANIM 1C
		dc.w $1C
		dc.w $23                
						; 0023 SET ENTITY FACING 1C 3
		dc.b $1C
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01C : "What?!{W1}"
		dc.w $C01C
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $15                
						; 0015 SET ACTSCRIPT 1C 0 461B6
		dc.b $1C
		dc.b 0
		dc.l eas_461B6          
		dc.b $80                
						; WAIT 78
		dc.b $78
		dc.w $23                
						; 0023 SET ENTITY FACING 1C 1
		dc.b $1C
		dc.b 1
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C01C : "Oh, Sir Astral!  I had an{N}awful nightmare.{W2}"
		dc.w $C01C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01C : "I was controlled by someone{N}and I killed a lot of...{W1}"
		dc.w $C01C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "It wasn't a dream.{W1}"
		dc.w $1F
		dc.w $15                
						; 0015 SET ACTSCRIPT 1C FF 45E44
		dc.b $1C
		dc.b $FF
		dc.l eas_Jump           
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01C : "What?!{W1}"
		dc.w $C01C
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 1F : "You were being controlled{N}by a devil.{W2}"
		dc.w $1F
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 1F : "And he made you kill every{N}person you saw.{W2}"
		dc.w $1F
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "You recovered your senses{N}when we defeated the devils.{W1}"
		dc.w $1F
		dc.w $23                
						; 0023 SET ENTITY FACING 1C 3
		dc.b $1C
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01C : "I can't believe it!{N}I'm {NAME;28}, I'm...{W1}"
		dc.w $C01C
		dc.w $2D                
						; 002D MOVE ENTITY 1C FF 3 2
		dc.b $1C
		dc.b $FF
		dc.b 3
		dc.b 2
		dc.w $8080
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 1C
		dc.w $1C
		dc.w $23                
						; 0023 SET ENTITY FACING 7 3
		dc.b 7
		dc.b 3
		dc.w $23                
						; 0023 SET ENTITY FACING 0 3
		dc.b 0
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01C : "What can I do?{N}How can I atone for my sins?{W1}"
		dc.w $C01C
		dc.w $23                
						; 0023 SET ENTITY FACING 1C 3
		dc.b $1C
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01C : "Sir Astral, tell me.{W1}"
		dc.w $C01C
		dc.w $2D                
						; 002D MOVE ENTITY 1F FF 3 1
		dc.b $1F
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 1F : "You're not at fault.{W1}"
		dc.w $1F
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "It's not your fault.{N}The devils are to blame.{W1}"
		dc.w $1F
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01C : "But...{W1}"
		dc.w $C01C
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 1C
		dc.w $1C
		dc.b $80                
						; WAIT 32
		dc.b $32
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 1C
		dc.w $1C
		dc.w $23                
						; 0023 SET ENTITY FACING 1C 1
		dc.b $1C
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01C : "I have to die for my sins.{N}It will be my atonement.{W2}"
		dc.w $C01C
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 0 45E44
		dc.b 7
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 45E44
		dc.b 0
		dc.b $FF
		dc.l eas_Jump           
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01C : "I have to die!{W1}"
		dc.w $C01C
		dc.w $23                
						; 0023 SET ENTITY FACING 1C 3
		dc.b $1C
		dc.b 3
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $2D                
						; 002D MOVE ENTITY 1C FF 3 3
		dc.b $1C
		dc.b $FF
		dc.b 3
		dc.b 3
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "Oh, poor {NAME;28}.{W1}"
		dc.w $1F
		dc.w $23                
						; 0023 SET ENTITY FACING 7 0
		dc.b 7
		dc.b 0
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 7 : "Sir Astral, {NAME;28} has{N}fled. {W2}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "Will you let him die?{W1}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "{NAME;28} is an immortal{N}vampire now.  He can't die{N}very easily.{W1}"
		dc.w $1F
		dc.w $23                
						; 0023 SET ENTITY FACING 1F 0
		dc.b $1F
		dc.b 0
		dc.w $23                
						; 0023 SET ENTITY FACING 0 2
		dc.b 0
		dc.b 2
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "I think we'll meet him again.{N}{LEADER}, let's go.{W1}"
		dc.w $1F
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
word_4DD8C:
		dc.w $24
		dc.w $39
		dc.w 3
		dc.b $21
		dc.b $3B
		dc.b 0
		dc.b 7
		dc.l eas_Init           
		dc.b $23
		dc.b $3B
		dc.b 3
		dc.b $1C
		dc.l eas_Init           
		dc.w $FFFF
