
; ASM FILE data\battles\entries\battle39\cs_beforebattle.asm :
; 0x4E3D2..0x4E4DC : Cutscene before battle 39
bbcs_39:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR BD5 : "I just heard that Geshp{N}lost.{W2}"
		dc.w $BD5
		dc.w $37                
						; 0037 LOAD MAP AND FADE IN 42 3 5
		dc.w $42
		dc.w 3
		dc.w 5
		dc.w $42                
						; 0042 RELATED TO LOADING MAP ENTITIES 4E4AC
		dc.l word_4E4AC
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 460CE
		dc.b 0
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 7 9 8 3
		dc.b 7
		dc.b 9
		dc.b 8
		dc.b 3
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1F 7 8 3
		dc.b $1F
		dc.b 7
		dc.b 8
		dc.b 3
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1E 8 8 3
		dc.b $1E
		dc.b 8
		dc.b 8
		dc.b 3
		dc.w $D                 
						; 000D JUMP IF CLEAR FLAG 4C 4E40C : Zynk is a follower
		dc.w $4C
		dc.l word_4E40C         
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1A 8 7 3
		dc.b $1A
		dc.b 8
		dc.b 7
		dc.b 3
word_4E40C:
		dc.w $D                 
						; 000D JUMP IF CLEAR FLAG 47 4E41A : Lemon is a follower
		dc.w $47
		dc.l word_4E41A         
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1C 3F 3E 3
		dc.b $1C
		dc.b $3F
		dc.b $3E
		dc.b 3
word_4E41A:
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.w $45                
						; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
		dc.w $30
		dc.w $32                
						; 0032 SET CAMERA DEST 3 12
		dc.w 3
		dc.w $12
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 80 : "I just heard that Geshp{N}lost.{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "All greater devils have been{N}defeated except for Odd Eye.{W1}"
		dc.w $80
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 3 1
		dc.b $80
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 80 : "This is a good chance for us{N}to become greater devils!{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "I'm sure Zeon will promote{N}us if we can get the jewel.{W1}"
		dc.w $80
		dc.w $15                
						; 0015 SET ACTSCRIPT 81 0 45E44
		dc.b $81
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 82 0 45E44
		dc.b $82
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 83 0 45E44
		dc.b $83
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 84 FF 45E44
		dc.b $84
		dc.b $FF
		dc.l eas_Jump           
		dc.b $80                
						; WAIT 32
		dc.b $32
		dc.w $2D                
						; 002D MOVE ENTITY 83 FF 1 1
		dc.b $83
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "Look over there!{W1}"
		dc.w $83
		dc.w $2D                
						; 002D MOVE ENTITY 84 FF 1 1
		dc.b $84
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 80 1
		dc.b $80
		dc.b 1
		dc.w $32                
						; 0032 SET CAMERA DEST 3 5
		dc.w 3
		dc.w 5
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $32                
						; 0032 SET CAMERA DEST 3 12
		dc.w 3
		dc.w $12
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "They're coming!{W1}"
		dc.w $83
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 80
		dc.b $80
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$18 Y=$18
		dc.b $18
		dc.b $18
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 3 3
		dc.b $80
		dc.b $FF
		dc.b 3
		dc.b 3
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 80 1
		dc.b $80
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Excellent!{N}Welcome to your graveyard!{W1}"
		dc.w $80
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
word_4E4AC:
		dc.w 8
		dc.w 9
		dc.w 3
		dc.b 8
		dc.b $14
		dc.b 3
		dc.b $61
		dc.l eas_Init           
		dc.b 7
		dc.b $17
		dc.b 1
		dc.b $8A
		dc.l eas_Init           
		dc.b 9
		dc.b $17
		dc.b 1
		dc.b $94
		dc.l eas_Init           
		dc.b 6
		dc.b $17
		dc.b 1
		dc.b $81
		dc.l eas_Init           
		dc.b $A
		dc.b $17
		dc.b 1
		dc.b $5F
		dc.l eas_Init           
		dc.w $FFFF
