
; ASM FILE data\battles\entries\battle08\cs_afterbattle.asm :
; 0x4AA74..0x4ABFE : Cutscene after battle 8
abcs_battle08:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 9A4 : "Oh, my...hey!{N}Are you OK?!{W1}"
		dc.w $9A4
		dc.w $37                
						; 0037 LOAD MAP AND FADE IN 48 8 20
		dc.w $48
		dc.w 8
		dc.w $20
		dc.w $42                
						; 0042 RELATED TO LOADING MAP ENTITIES 4ABBE
		dc.l word_4ABBE
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 460CE
		dc.b 0
		dc.b $FF
		dc.l eas_Init           
		dc.w $1C                
						; 001C STOP ENTITY ANIM 81
		dc.w $81
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 81
		dc.b $81
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
		dc.w $C                 
						; 000C JUMP IF SET FLAG 6 4AAB6 : Kiwi joined
		dc.w 6
		dc.l word_4AAB6         
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 6 3F 3F 3
		dc.b 6
		dc.b $3F
		dc.b $3F
		dc.b 3
word_4AAB6:
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "The game will be suspended.{N}OK?"
		dc.w $80
		dc.w $23                
						; 0023 SET ENTITY FACING 80 2
		dc.b $80
		dc.b 2
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 2 1
		dc.b $80
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 80 1
		dc.b $80
		dc.b 1
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 1 1
		dc.b $80
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 80 0
		dc.b $80
		dc.b 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "....{W1}"
		dc.w $80
		dc.w $15                
						; 0015 SET ACTSCRIPT 81 FF 460CE
		dc.b $81
		dc.b $FF
		dc.l eas_Init           
		dc.w $1A                
						; 001A SET ENTITY SPRITE 81 3B
		dc.w $81
		dc.w $3B
		dc.w $23                
						; 0023 SET ENTITY FACING 81 2
		dc.b $81
		dc.b 2
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C081 : "{LEADER}, are you ready{N}for battle?{D3}"
		dc.w $C081
		dc.w $1A                
						; 001A SET ENTITY SPRITE 81 CA
		dc.w $81
		dc.w $CA
		dc.w $23                
						; 0023 SET ENTITY FACING 81 3
		dc.b $81
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C081 : "Do you need more preparations?"
		dc.w $C081
		dc.w $15                
						; 0015 SET ACTSCRIPT 81 FF 460CE
		dc.b $81
		dc.b $FF
		dc.l eas_Init           
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $15                
						; 0015 SET ACTSCRIPT 81 0 461B6
		dc.b $81
		dc.b 0
		dc.l eas_461B6          
		dc.b $80                
						; WAIT 78
		dc.b $78
		dc.w $23                
						; 0023 SET ENTITY FACING 81 2
		dc.b $81
		dc.b 2
		dc.w $1B                
						; 001B START ENTITY ANIM 81
		dc.w $81
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C081 : "Did you change your mind?{W2}"
		dc.w $C081
		dc.w $23                
						; 0023 SET ENTITY FACING 81 3
		dc.b $81
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C081 : "Be careful.{D1}{N}Haste makes waste.{D1}"
		dc.w $C081
		dc.w $15                
						; 0015 SET ACTSCRIPT 80 0 45EBC
		dc.b $80
		dc.b 0
		dc.l eas_BumpRight      
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 81
		dc.b $81
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $15                
						; 0015 SET ACTSCRIPT 81 FF 4618A
		dc.b $81
		dc.b $FF
		dc.l eas_4618A          
		dc.b $80                
						; WAIT 8
		dc.b 8
		dc.w $2D                
						; 002D MOVE ENTITY 81 FF 0 1
		dc.b $81
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 81 3
		dc.b $81
		dc.b 3
		dc.w $27                
						; 0027 MAKE ENTITY SHAKE HEAD 81
		dc.w $81
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 80 : "{LEADER}, you had better{N}take a rest now.{D3}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "{LEADER}, to retreat is{N}sometimes a good strategy.{D3}"
		dc.w $80
		dc.w $23                
						; 0023 SET ENTITY FACING 81 2
		dc.b $81
		dc.b 2
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C081 : "{LEADER}, are you ready?{D3}"
		dc.w $C081
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C081 : "{LEADER}, you are going to{N}battle again."
		dc.w $C081
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C081 : "{LEADER}, take it easy!{W1}"
		dc.w $C081
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C081 : "{LEADER}, take it easy!{W1}"
		dc.w $C081
		dc.w $23                
						; 0023 SET ENTITY FACING 81 0
		dc.b $81
		dc.b 0
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $23                
						; 0023 SET ENTITY FACING 6 0
		dc.b 6
		dc.b 0
		dc.w $32                
						; 0032 SET CAMERA DEST 16 20
		dc.w $16
		dc.w $20
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $32                
						; 0032 SET CAMERA DEST 8 20
		dc.w 8
		dc.w $20
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 0 1
		dc.b $80
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $15                
						; 0015 SET ACTSCRIPT 80 FF 45E44
		dc.b $80
		dc.b $FF
		dc.l eas_Jump           
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 80 : "{LEADER}, are you ready?{D3}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Do you need more preparations?"
		dc.w $80
		dc.w $23                
						; 0023 SET ENTITY FACING 80 3
		dc.b $80
		dc.b 3
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 3 1
		dc.b $80
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "You changed your mind?{W2}"
		dc.w $80
		dc.w 7                  
						; 0007 EXECUTE MAP SYSTEM EVENT 493E3102
		dc.l $493E3102
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
word_4ABBE:
		dc.w $E
		dc.w $25
		dc.w 1
		dc.b $E
		dc.b $23
		dc.b 1
		dc.b $CA
		dc.l eas_Init           
		dc.b $D
		dc.b $24
		dc.b 1
		dc.b 1
		dc.l eas_Init           
		dc.b $C
		dc.b $23
		dc.b 1
		dc.b 3
		dc.l eas_Init           
		dc.b $F
		dc.b $24
		dc.b 1
		dc.b 4
		dc.l eas_Init           
		dc.b $10
		dc.b $23
		dc.b 1
		dc.b 2
		dc.l eas_Init           
		dc.b $10
		dc.b $22
		dc.b 2
		dc.b 6
		dc.l eas_Init           
		dc.b $E
		dc.b $22
		dc.b 3
		dc.b $CA
		dc.l eas_Init           
		dc.w $FFFF
