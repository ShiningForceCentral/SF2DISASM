
; ASM FILE data\maps\entries\map19\mapsetups\s6_1FB.asm :
; 0x53168..0x53634 : 

; =============== S U B R O U T I N E =======================================

ms_map19_flag1FB_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $1FB               
						; Battle 7 completed
		beq.s   return_53174
		lea     cs_53FD8(pc), a0
		trap    #6
return_53174:
		
		rts

	; End of function ms_map19_flag1FB_InitFunction

cs_53176:
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		dc.w $FFFF
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 2D1 : "That's all the info I can{N}give you about the mission.{W1}"
		dc.w $2D1
		dc.w $2B                
						; 002B  90 1D 9 1 CF
		dc.w $90
		dc.b $1D
		dc.b 9
		dc.b 1
		dc.b $CF
		dc.w $2B                
						; 002B  91 1C 9 1 CE
		dc.w $91
		dc.b $1C
		dc.b 9
		dc.b 1
		dc.b $CE
		dc.w $2B                
						; 002B  92 1C A 1 CA
		dc.w $92
		dc.b $1C
		dc.b $A
		dc.b 1
		dc.b $CA
		dc.w $2B                
						; 002B  93 1C B 1 CA
		dc.w $93
		dc.b $1C
		dc.b $B
		dc.b 1
		dc.b $CA
		dc.b $80                
						; WAIT 1
		dc.b 1
		dc.w $2B                
						; 002B  94 1E 9 1 CE
		dc.w $94
		dc.b $1E
		dc.b 9
		dc.b 1
		dc.b $CE
		dc.w $2B                
						; 002B  95 1E A 1 CA
		dc.w $95
		dc.b $1E
		dc.b $A
		dc.b 1
		dc.b $CA
		dc.w $2B                
						; 002B  96 1E B 1 CA
		dc.w $96
		dc.b $1E
		dc.b $B
		dc.b 1
		dc.b $CA
		dc.b $80                
						; WAIT 1
		dc.b 1
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 0 1A 9 0
		dc.b 0
		dc.b $1A
		dc.b 9
		dc.b 0
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1 1A A 0
		dc.b 1
		dc.b $1A
		dc.b $A
		dc.b 0
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 2 1A B 0
		dc.b 2
		dc.b $1A
		dc.b $B
		dc.b 0
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 8C 3F 3F 3
		dc.b $8C
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 460CE
		dc.b 0
		dc.b $FF
		dc.l eas_Init           
		dc.w $15                
						; 0015 SET ACTSCRIPT 1 FF 460CE
		dc.b 1
		dc.b $FF
		dc.l eas_Init           
		dc.w $15                
						; 0015 SET ACTSCRIPT 2 FF 460CE
		dc.b 2
		dc.b $FF
		dc.l eas_Init           
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.w $32                
						; 0032 SET CAMERA DEST 18 5
		dc.w $18
		dc.w 5
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 808A : "That's all the info I can{N}give you about the mission.{W1}"
		dc.w $808A
		dc.w $2D                
						; 002D MOVE ENTITY 90 FF 1 1
		dc.b $90
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 808A : "So, all we have to do is{N}find the evil Gizmo and{N}kill him.{W1}"
		dc.w $808A
		dc.w $26                
						; 0026 MAKE ENTITY NOD 8A
		dc.w $8A
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 808A : "That's right.  Kill him{N}before he possesses{N}somebody else.{W2}"
		dc.w $808A
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 808A : "You may go.{W1}"
		dc.w $808A
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 90 : "Yes, sir.{W1}"
		dc.w $90
		dc.w $23                
						; 0023 SET ENTITY FACING 90 3
		dc.b $90
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 90 : "Let's go and defeat the{N}evil Gizmo.{W1}"
		dc.w $90
		dc.w $15                
						; 0015 SET ACTSCRIPT 91 0 45E44
		dc.b $91
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 92 0 45E44
		dc.b $92
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 93 0 45E44
		dc.b $93
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 94 0 45E44
		dc.b $94
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 95 0 45E44
		dc.b $95
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 96 FF 45E44
		dc.b $96
		dc.b $FF
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 91 0 45E44
		dc.b $91
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 92 0 45E44
		dc.b $92
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 93 0 45E44
		dc.b $93
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 94 0 45E44
		dc.b $94
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 95 0 45E44
		dc.b $95
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 96 FF 45E44
		dc.b $96
		dc.b $FF
		dc.l eas_Jump           
		dc.b $80                
						; WAIT 19
		dc.b $19
		dc.w $2D                
						; 002D MOVE ENTITY 90 FF 3 4
		dc.b $90
		dc.b $FF
		dc.b 3
		dc.b 4
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 91 3
		dc.b $91
		dc.b 3
		dc.w $23                
						; 0023 SET ENTITY FACING 92 3
		dc.b $92
		dc.b 3
		dc.w $23                
						; 0023 SET ENTITY FACING 93 3
		dc.b $93
		dc.b 3
		dc.w $23                
						; 0023 SET ENTITY FACING 94 3
		dc.b $94
		dc.b 3
		dc.w $23                
						; 0023 SET ENTITY FACING 95 3
		dc.b $95
		dc.b 3
		dc.w $23                
						; 0023 SET ENTITY FACING 96 3
		dc.b $96
		dc.b 3
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $23                
						; 0023 SET ENTITY FACING 90 1
		dc.b $90
		dc.b 1
		dc.w $32                
						; 0032 SET CAMERA DEST 17 6
		dc.w $17
		dc.w 6
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 90 : "Forward men!{W1}"
		dc.w $90
		dc.w $2D                
						; 002D MOVE ENTITY 90 0 3 6
		dc.b $90
		dc.b 0
		dc.b 3
		dc.b 6
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 91 0 3 6
		dc.b $91
		dc.b 0
		dc.b 3
		dc.b 6
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 92 0 3 6
		dc.b $92
		dc.b 0
		dc.b 3
		dc.b 6
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 93 0 3 6
		dc.b $93
		dc.b 0
		dc.b 3
		dc.b 6
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 94 0 3 6
		dc.b $94
		dc.b 0
		dc.b 3
		dc.b 6
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 95 0 3 6
		dc.b $95
		dc.b 0
		dc.b 3
		dc.b 6
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 96 FF 3 6
		dc.b $96
		dc.b $FF
		dc.b 3
		dc.b 6
		dc.w $8080
		dc.w $2E                
						; 002E HIDE ENTITY 90
		dc.w $90
		dc.w $2E                
						; 002E HIDE ENTITY 91
		dc.w $91
		dc.w $2E                
						; 002E HIDE ENTITY 92
		dc.w $92
		dc.w $2E                
						; 002E HIDE ENTITY 93
		dc.w $93
		dc.w $2E                
						; 002E HIDE ENTITY 94
		dc.w $94
		dc.w $2E                
						; 002E HIDE ENTITY 95
		dc.w $95
		dc.w $2E                
						; 002E HIDE ENTITY 96
		dc.w $96
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w $32                
						; 0032 SET CAMERA DEST 18 6
		dc.w $18
		dc.w 6
		dc.w $2D                
						; 002D MOVE ENTITY 8A FF 3 3
		dc.b $8A
		dc.b $FF
		dc.b 3
		dc.b 3
		dc.w $8080
		dc.b $80                
						; WAIT 46
		dc.b $46
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 808A : "Sir Astral is still{N}sleeping...{N}Is he alright?{W2}"
		dc.w $808A
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 808A : "The King is upstairs looking{N}in on Sir Astral.{N}I'm worried.{W1}"
		dc.w $808A
		dc.w $23                
						; 0023 SET ENTITY FACING 8A 2
		dc.b $8A
		dc.b 2
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $2D                
						; 002D MOVE ENTITY 1 FF 0 1
		dc.b 1
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1 : "Is he going to be OK?{W1}"
		dc.w 1
		dc.w $2D                
						; 002D MOVE ENTITY 2 FF 0 1
		dc.b 2
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 2 : "We...we are...{W1}"
		dc.w 2
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 8A
		dc.b $8A
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $2D                
						; 002D MOVE ENTITY 8A FF 2 1
		dc.b $8A
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 808A : "He just fainted because{N}he was exhausted by the{N}two battles.{W2}"
		dc.w $808A
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 808A : "Don't worry about him.{N}If he dies, it doesn't matter.{N}He's old anyway.{W1}"
		dc.w $808A
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8C : "Minister!{N}Is the Minister there?{W1}"
		dc.w $8C
		dc.w $23                
						; 0023 SET ENTITY FACING 8A 3
		dc.b $8A
		dc.b 3
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 8C 17 D 1
		dc.b $8C
		dc.b $17
		dc.b $D
		dc.b 1
		dc.w $2D                
						; 002D MOVE ENTITY 8C FF 0 3
		dc.b $8C
		dc.b $FF
		dc.b 0
		dc.b 3
		dc.b 1
		dc.b 1
		dc.b 0
		dc.b 3
		dc.b 1
		dc.b 2
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 8A 0
		dc.b $8A
		dc.b 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 808A : "Here I am.{W1}"
		dc.w $808A
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $15                
						; 0015 SET ACTSCRIPT 8C 0 461E4
		dc.b $8C
		dc.b 0
		dc.l eas_461E4          
		dc.b $80                
						; WAIT 78
		dc.b $78
		dc.w $23                
						; 0023 SET ENTITY FACING 8C 2
		dc.b $8C
		dc.b 2
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8C : "Did our soldiers leave{N}for the subjugation?{W1}"
		dc.w $8C
		dc.w $26                
						; 0026 MAKE ENTITY NOD 8A
		dc.w $8A
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 808A : "Yes, just a few minutes{N}ago.{W1}"
		dc.w $808A
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $32                
						; 0032 SET CAMERA DEST 17 5
		dc.w $17
		dc.w 5
		dc.w $2D                
						; 002D MOVE ENTITY 8C FF 1 1
		dc.b $8C
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.b $C
		dc.b $28
		dc.b 1
		dc.b 1
		dc.b $C
		dc.b $28
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 8C FF C 28
		dc.b $8C
		dc.b $FF
		dc.b $C
		dc.b $28
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 8C 3
		dc.b $8C
		dc.b 3
		dc.w $2D                
						; 002D MOVE ENTITY 8A FF 0 1
		dc.b $8A
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 8A 1
		dc.b $8A
		dc.b 1
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 8C : "Oh, I'm too late.{W2}"
		dc.w $8C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8C : "Astral came back to his{N}senses just now.{W1}"
		dc.w $8C
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 8A
		dc.b $8A
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $2D                
						; 002D MOVE ENTITY 8A FF 1 1
		dc.b $8A
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 808A : "That's great!{N}Did you talk to him?{W1}"
		dc.w $808A
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 8C : "Astral said, he feels an ill{N}omen behind the opening of{N}the tower and Gizmo appearing.{W2}"
		dc.w $8C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8C : "We must study the ancient{N}history of Grans Island.{W1}"
		dc.w $8C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 808A : "How?{W1}"
		dc.w $808A
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 8C : "A historian named Hawel{N}lives northwest of Yeel.{W2}"
		dc.w $8C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8C : "Astral asked me to send{N}soldiers for him, but....{W1}"
		dc.w $8C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 808A : "Ah, I understand.{W1}"
		dc.w $808A
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8C : "What should we do now?{W1}"
		dc.w $8C
		dc.w $23                
						; 0023 SET ENTITY FACING 8A 3
		dc.b $8A
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 808A : "What should we do?{W1}"
		dc.w $808A
		dc.w $1C                
						; 001C STOP ENTITY ANIM 8C
		dc.w $8C
		dc.w $1C                
						; 001C STOP ENTITY ANIM 8A
		dc.w $8A
		dc.b $80                
						; WAIT 50
		dc.b $50
		dc.w $15                
						; 0015 SET ACTSCRIPT 8C FF 45E44
		dc.b $8C
		dc.b $FF
		dc.l eas_Jump           
		dc.w $1B                
						; 001B START ENTITY ANIM 8C
		dc.w $8C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8C : "Oh, yes!{W1}"
		dc.w $8C
		dc.w $15                
						; 0015 SET ACTSCRIPT 8A FF 45E44
		dc.b $8A
		dc.b $FF
		dc.l eas_Jump           
		dc.w $1B                
						; 001B START ENTITY ANIM 8A
		dc.w $8A
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 808A : "Ah, yes!{W1}"
		dc.w $808A
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8C : "Minister, I have a good{N}idea.{W1}"
		dc.w $8C
		dc.w $23                
						; 0023 SET ENTITY FACING 8A 1
		dc.b $8A
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 808A : "As do I.{W1}"
		dc.w $808A
		dc.w $2D                
						; 002D MOVE ENTITY 8A FF 3 1
		dc.b $8A
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 8A 2
		dc.b $8A
		dc.b 2
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 808A : "You're the pupils of Astral.{N}I know of you, {LEADER}.{W2}"
		dc.w $808A
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 0 1
		dc.b 0
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 808A : "I heard that you did a very{N}good job in the Ancient{N}Tower.{W1}"
		dc.w $808A
		dc.w $2D                
						; 002D MOVE ENTITY 8C FF 3 1
		dc.b $8C
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 8C : "Why don't you go to Yeel{N}and bring Hawel back here?{W2}"
		dc.w $8C
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 8C : "I don't think this is a{N}difficult job.{N}Will you go?{W1}"
		dc.w $8C
word_53482:
		dc.w $11                
						; 0011 STORY YESNO PROMPT
		dc.w $C                 
						; 000C JUMP IF SET FLAG 59 534AC : YES/NO prompt answer
		dc.w $59
		dc.l word_534AC         
		dc.w 9                  
						; 0009 HIDE TEXTBOX AND PORTRAIT
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 2F5 : "You refuse the King's{N}wish?!{N}Answer again!{W1}"
		dc.w $2F5
		dc.w $15                
						; 0015 SET ACTSCRIPT 8A FF 45E44
		dc.b $8A
		dc.b $FF
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 8A FF 45E44
		dc.b $8A
		dc.b $FF
		dc.l eas_Jump           
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 808A : "You refuse the King's{N}wish?!{N}Answer again!{W1}"
		dc.w $808A
		dc.w $B                 
						; 000B JUMP 53482
		dc.l word_53482         
word_534AC:
		dc.w $2D                
						; 002D MOVE ENTITY 8C FF 3 1
		dc.b $8C
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 8C 2
		dc.b $8C
		dc.b 2
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 2F6 : "Thank you.{N}Depart to fetch Hawel{N}immediately.{W1}"
		dc.w $2F6
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8C : "Thank you.{N}Depart to fetch Hawel{N}immediately.{W1}"
		dc.w $8C
		dc.w $2C                
						; 002C FOLLOW ENTITY 1 0 2
		dc.w 1
		dc.w 0
		dc.w 2
		dc.w $2C                
						; 002C FOLLOW ENTITY 2 1 2
		dc.w 2
		dc.w 1
		dc.w 2
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
cs_534D2:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 2B6 : "Stop, please stop!{N}Don't make me use my{N}sword any more!{W1}"
		dc.w $2B6
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1C : "Stop, please stop!{N}Don't make me use my{N}sword any more!{W1}"
		dc.w $1C
		dc.w $32                
						; 0032 SET CAMERA DEST 11 6
		dc.w $11
		dc.w 6
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 8080 : "Where is King Galam?{N}He went into the tower,{N}Ground Seal, right?{W2}"
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Then, I must go there!{W1}"
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 2 1
		dc.b $80
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w $29                
						; 0029 SET ENTITY DEST 80 17 C
		dc.w $80
		dc.w $17
		dc.w $C
		dc.w $29                
						; 0029 SET ENTITY DEST 1C 14 A
		dc.w $1C
		dc.w $14
		dc.w $A
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1C : "Please don't move, or I'll{N}have to kill you!  Please!{W1}"
		dc.w $1C
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 5 1
		dc.b $80
		dc.b $FF
		dc.b 5
		dc.b 1
		dc.w $8080
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 8080 : "{NAME;28}, calm down!{N}You already figured it out,{N}didn't you?{W2}"
		dc.w $8080
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 8080 : "We didn't attack Galam.{N}Your King lied!{N}We are allies.{W2}"
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Do you believe me?{N}We would never....{W1}"
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 1C 0
		dc.b $1C
		dc.b 0
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $23                
						; 0023 SET ENTITY FACING 1C 1
		dc.b $1C
		dc.b 1
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $27                
						; 0027 MAKE ENTITY SHAKE HEAD 1C
		dc.w $1C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1C : "Stop!  NO!{N}King Galam is my...{W1}"
		dc.w $1C
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 8080 : "You have to believe me.{W2}"
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Your King is possessed{N}by a devil.{N}He is not King Galam!{W1}"
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 1C 0
		dc.b $1C
		dc.b 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1C : "No!....{W1}"
		dc.w $1C
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Princess Elis screams{N}for help.{W1}"
		dc.w $FFFF
		dc.w $23                
						; 0023 SET ENTITY FACING 1C 1
		dc.b $1C
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 98 : "No, no!{N}Father!  Astral!{N}Somebody please...!{W1}"
		dc.w $98
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8082 : "Elis!{W1}"
		dc.w $8082
		dc.w $23                
						; 0023 SET ENTITY FACING 1C 0
		dc.b $1C
		dc.b 0
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $23                
						; 0023 SET ENTITY FACING 80 0
		dc.b $80
		dc.b 0
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 8080 : "He is taking her away!{W2}"
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8080 : "We have no time.{W1}"
		dc.w $8080
		dc.w $29                
						; 0029 SET ENTITY DEST 80 15 A
		dc.w $80
		dc.w $15
		dc.w $A
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1C : "Stop, sir!{N}I can't let you pass!{W1}"
		dc.w $1C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8080 : "Then you come with me!{N}Yes, a good idea.{W1}"
		dc.w $8080
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $23                
						; 0023 SET ENTITY FACING 1C 3
		dc.b $1C
		dc.b 3
		dc.b $80                
						; WAIT 32
		dc.b $32
		dc.w $23                
						; 0023 SET ENTITY FACING 1C 0
		dc.b $1C
		dc.b 0
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $26                
						; 0026 MAKE ENTITY NOD 1C
		dc.w $1C
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $2D                
						; 002D MOVE ENTITY 1C FF 2 1
		dc.b $1C
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 2 1
		dc.b $80
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 1C FF 1 3
		dc.b $1C
		dc.b $FF
		dc.b 1
		dc.b 3
		dc.b 2
		dc.b 3
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 2 1
		dc.b $80
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w $15                
						; 0015 SET ACTSCRIPT 80 FF 45E44
		dc.b $80
		dc.b $FF
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 80 FF 45E44
		dc.b $80
		dc.b $FF
		dc.l eas_Jump           
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 8080 : "You kids, follow me!{W1}"
		dc.w $8080
		dc.w $26                
						; 0026 MAKE ENTITY NOD 84
		dc.w $84
		dc.w $26                
						; 0026 MAKE ENTITY NOD 85
		dc.w $85
		dc.w $2D                
						; 002D MOVE ENTITY 80 0 1 3
		dc.b $80
		dc.b 0
		dc.b 1
		dc.b 3
		dc.b 2
		dc.b 3
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 85 0 0 1
		dc.b $85
		dc.b 0
		dc.b 0
		dc.b 1
		dc.b 1
		dc.b 3
		dc.b 2
		dc.b 3
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 84 FF 1 1
		dc.b $84
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.b 0
		dc.b 1
		dc.b 1
		dc.b 3
		dc.b 2
		dc.b 3
		dc.w $8080
		dc.w $2E                
						; 002E HIDE ENTITY 80
		dc.w $80
		dc.w $2E                
						; 002E HIDE ENTITY 1C
		dc.w $1C
		dc.w $2E                
						; 002E HIDE ENTITY 84
		dc.w $84
		dc.w $2E                
						; 002E HIDE ENTITY 85
		dc.w $85
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
cs_535FA:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 2B2 : "Oh, it's you, {LEADER}!{W2}"
		dc.w $2B2
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 81 : "Oh, it's you, {LEADER}!{W2}"
		dc.w $81
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 81 : "King Galam took{N}Princess Elis to the{N}Ancient Tower!{W1}"
		dc.w $81
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 82 : "Elis is in the tower.{N}I shall go with you and{N}save my daughter.{W1}"
		dc.w $82
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "King Granseal and the{N}Minister go with {LEADER}.{W1}"
		dc.w $FFFF
		dc.w $2C                
						; 002C FOLLOW ENTITY 82 0 2
		dc.w $82
		dc.w 0
		dc.w 2
		dc.w $2C                
						; 002C FOLLOW ENTITY 81 82 2
		dc.w $81
		dc.w $82
		dc.w 2
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
cs_53620:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 2C9 : "Strange earthquake....{N}{LEADER}, you must{N}escape!{W1}"
		dc.w $2C9
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Strange earthquake....{N}{LEADER}, you must{N}escape!{W1}"
		dc.w $80
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
cs_5362A:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 2CA : "OK, everybody is safe.{W1}"
		dc.w $2CA
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "OK, everybody is safe.{W1}"
		dc.w $80
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
