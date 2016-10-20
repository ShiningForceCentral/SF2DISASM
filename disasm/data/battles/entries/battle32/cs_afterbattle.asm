
; ASM FILE data\battles\entries\battle32\cs_afterbattle.asm :
; 0x4CDB4..0x4CF0C : Cutscene after battle 32
abcs_battle32:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR B25 : "I can't believe it!{N}You might have been killed{N}by the devils.{W1}"
		dc.w $B25
		dc.w $37                
						; 0037 LOAD MAP AND FADE IN 4A 5 14
		dc.w $4A
		dc.w 5
		dc.w $14
		dc.w $42                
						; 0042 RELATED TO LOADING MAP ENTITIES 4CEEC
		dc.l word_4CEEC
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
						; 0019 SET ENTITY POS AND FACING 7 B 19 1
		dc.b 7
		dc.b $B
		dc.b $19
		dc.b 1
		dc.w $15                
						; 0015 SET ACTSCRIPT 1F FF 460CE
		dc.b $1F
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1F 9 19 1
		dc.b $1F
		dc.b 9
		dc.b $19
		dc.b 1
		dc.w $15                
						; 0015 SET ACTSCRIPT 16 FF 460CE
		dc.b $16
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 16 B 1A 1
		dc.b $16
		dc.b $B
		dc.b $1A
		dc.b 1
		dc.w $15                
						; 0015 SET ACTSCRIPT 1E FF 460CE
		dc.b $1E
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1E A 1A 1
		dc.b $1E
		dc.b $A
		dc.b $1A
		dc.b 1
		dc.w $15                
						; 0015 SET ACTSCRIPT 17 FF 460CE
		dc.b $17
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 17 A 16 3
		dc.b $17
		dc.b $A
		dc.b $16
		dc.b 3
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 1 1
		dc.b 7
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "I can't believe it!{N}You might have been killed{N}by the devils.{W1}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "Indeed!  Why did you{N}change your mind?{W1}"
		dc.w $1F
		dc.w $2D                
						; 002D MOVE ENTITY 17 FF 3 1
		dc.b $17
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C017 : "I'm {NAME;23}, from Galam.{N}I was waiting for the chance{N}to escape from them.{W2}"
		dc.w $C017
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C017 : "I can't stand their wicked{N}ways!{W1}"
		dc.w $C017
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 1 1
		dc.b 7
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 7 2
		dc.b 7
		dc.b 2
		dc.w $23                
						; 0023 SET ENTITY FACING 17 0
		dc.b $17
		dc.b 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "You have the same opinion{N}of them as we do.{W1}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C017 : "Please let me join you!{N}I could be a great help to{N}you.{W2}"
		dc.w $C017
		dc.w $23                
						; 0023 SET ENTITY FACING 17 3
		dc.b $17
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C017 : "You need a professional{N}soldier like me.{W1}"
		dc.w $C017
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "Oh, we welcome you.{W1}"
		dc.w $1F
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 FF 46172
		dc.b 7
		dc.b $FF
		dc.l eas_46172          
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 0 1
		dc.b 7
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "But, he was on the other{N}side just an minute ago.{W1}"
		dc.w 7
		dc.w $2D                
						; 002D MOVE ENTITY 1F FF 1 1
		dc.b $1F
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 1F 0
		dc.b $1F
		dc.b 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "I don't care, {NAME;7}.{N}He has seen the error of his{N}ways.{W1}"
		dc.w $1F
		dc.w $23                
						; 0023 SET ENTITY FACING 1F 3
		dc.b $1F
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "{LEADER}, don't you want{N}{NAME;23} to join our{N}force?{W1}"
		dc.w $1F
		dc.w $26                
						; 0026 MAKE ENTITY NOD 0
		dc.w 0
		dc.w 8                  
						; 0008 JOIN FORCE 17
		dc.w $17
		dc.w $54                
						; 0054  17 0
		dc.w $17
		dc.w 0
		dc.w $2D                
						; 002D MOVE ENTITY 17 FF 3 1
		dc.b $17
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C017 : "Oh, thank you!{W2}"
		dc.w $C017
		dc.w $15                
						; 0015 SET ACTSCRIPT 17 FF 45E44
		dc.b $17
		dc.b $FF
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 17 FF 45E44
		dc.b $17
		dc.b $FF
		dc.l eas_Jump           
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C017 : "I'll try to do my best!{W1}"
		dc.w $C017
		dc.w $A                 
						; 000A EXECUTE SUBROUTINE 4CEE4
		dc.l sub_4CEE4
		dc.w $2C                
						; 002C FOLLOW ENTITY 1E 0 2
		dc.w $1E
		dc.w 0
		dc.w 2
		dc.w $2C                
						; 002C FOLLOW ENTITY 7 1E 1
		dc.w 7
		dc.w $1E
		dc.w 1
		dc.w $2C                
						; 002C FOLLOW ENTITY 1F 1E 3
		dc.w $1F
		dc.w $1E
		dc.w 3
		dc.w $2C                
						; 002C FOLLOW ENTITY 16 1E 2
		dc.w $16
		dc.w $1E
		dc.w 2
		dc.w $2C                
						; 002C FOLLOW ENTITY 17 16 2
		dc.w $17
		dc.w $16
		dc.w 2
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_4CEE4:
		
		moveq   #$17,d0
		jmp     j_LeaveBattleParty

	; End of function sub_4CEE4

word_4CEEC:
		dc.w $A
		dc.w $19
		dc.w 1
		dc.b $B
		dc.b $19
		dc.b 1
		dc.b 7
		dc.l eas_Init           
		dc.b $B
		dc.b $1A
		dc.b 1
		dc.b $16
		dc.l eas_Init           
		dc.b $A
		dc.b $16
		dc.b 3
		dc.b $17
		dc.l eas_Init           
		dc.w $FFFF
