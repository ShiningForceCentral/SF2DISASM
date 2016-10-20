
; ASM FILE data\battles\entries\battle08\cs_beforebattle.asm :
; 0x4A952..0x4AA74 : Cutscene before battle 8
bbcs_08:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 99D : "It's over there!{N}There he is!{W1}"
		dc.w $99D
		dc.w $37                
						; 0037 LOAD MAP AND FADE IN 48 1 2E
		dc.w $48
		dc.w 1
		dc.w $2E
		dc.w $42                
						; 0042 RELATED TO LOADING MAP ENTITIES 4AA14
		dc.l word_4AA14
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
						; 000C JUMP IF SET FLAG 6 4A994 : Kiwi joined
		dc.w 6
		dc.l word_4A994         
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 6 3F 3F 3
		dc.b 6
		dc.b $3F
		dc.b $3F
		dc.b 3
word_4A994:
		dc.w 5                  
						; 0005 PLAY SOUND MUSIC_MAIN_THEME
		dc.w 1
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "The game will be suspended.{N}OK?"
		dc.w $80
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 0 2
		dc.b $80
		dc.b $FF
		dc.b 0
		dc.b 2
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
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 81
		dc.w $81
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "....{W1}"
		dc.w $80
		dc.w 5                  
						; 0005 PLAY SOUND MUSIC_ENEMY_ATTACK
		dc.w 5
		dc.w $32                
						; 0032 SET CAMERA DEST 7 20
		dc.w 7
		dc.w $20
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 83 C 23 3
		dc.b $83
		dc.b $C
		dc.b $23
		dc.b 3
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 84 B 23 3
		dc.b $84
		dc.b $B
		dc.b $23
		dc.b 3
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 85 D 23 3
		dc.b $85
		dc.b $D
		dc.b $23
		dc.b 3
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 82 C 25 3
		dc.b $82
		dc.b $C
		dc.b $25
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "{LEADER}, are you ready{N}for battle?{D3}"
		dc.w $C082
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "Do you need more preparations?"
		dc.w $C082
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C082 : "Did you change your mind?{W2}"
		dc.w $C082
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "Be careful.{D1}{N}Haste makes waste.{D1}"
		dc.w $C082
		dc.w $23                
						; 0023 SET ENTITY FACING 82 1
		dc.b $82
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "{LEADER}, you had better{N}take a rest now.{D3}"
		dc.w $C082
		dc.w $15                
						; 0015 SET ACTSCRIPT 83 0 45E44
		dc.b $83
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 84 0 45E44
		dc.b $84
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 85 FF 45E44
		dc.b $85
		dc.b $FF
		dc.l eas_Jump           
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
word_4AA14:
		dc.w 4
		dc.w $32
		dc.w 0
		dc.b 5
		dc.b $32
		dc.b 0
		dc.b $CA
		dc.l eas_Init           
		dc.b 4
		dc.b $31
		dc.b 0
		dc.b 1
		dc.l eas_Init           
		dc.b 4
		dc.b $33
		dc.b 0
		dc.b 3
		dc.l eas_Init           
		dc.b 3
		dc.b $32
		dc.b 0
		dc.b 4
		dc.l eas_Init           
		dc.b 2
		dc.b $32
		dc.b 0
		dc.b 2
		dc.l eas_Init           
		dc.b 1
		dc.b $32
		dc.b 0
		dc.b 6
		dc.l eas_Init           
		dc.b $E
		dc.b $22
		dc.b 3
		dc.b $CA
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $84
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $44
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $45
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $79
		dc.l eas_Init           
		dc.w $FFFF
