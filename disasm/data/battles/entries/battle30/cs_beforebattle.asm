
; ASM FILE data\battles\entries\battle30\cs_beforebattle.asm :
; 0x4C5E6..0x4C6A8 : Cutscene before battle 30
bbcs_30:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR AC8 : "What a pleasure!{N}Nice to meet you.{W1}"
		dc.w $AC8
		dc.w $37                
						; 0037 LOAD MAP AND FADE IN 1 7 15
		dc.w 1
		dc.w 7
		dc.w $15
		dc.w $42                
						; 0042 RELATED TO LOADING MAP ENTITIES 4C690
		dc.l word_4C690
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
						; 0019 SET ENTITY POS AND FACING 7 B 1C 1
		dc.b 7
		dc.b $B
		dc.b $1C
		dc.b 1
		dc.w $15                
						; 0015 SET ACTSCRIPT 1F FF 460CE
		dc.b $1F
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1F B 1B 1
		dc.b $1F
		dc.b $B
		dc.b $1B
		dc.b 1
		dc.w 5                  
						; 0005 PLAY SOUND MUSIC_BATTLE_THEME_1
		dc.w $22
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.w $2D                
						; 002D MOVE ENTITY 0 0 1 2
		dc.b 0
		dc.b 0
		dc.b 1
		dc.b 2
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 1F 0 1 2
		dc.b $1F
		dc.b 0
		dc.b 1
		dc.b 2
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 1 2
		dc.b 7
		dc.b $FF
		dc.b 1
		dc.b 2
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "What a pleasure!{N}Nice to meet you.{W1}"
		dc.w $80
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 FF 45E44
		dc.b 7
		dc.b $FF
		dc.l eas_Jump           
		dc.w $2D                
						; 002D MOVE ENTITY 1F FF 0 1
		dc.b $1F
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $26                
						; 0026 MAKE ENTITY NOD 1F
		dc.w $1F
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01F : "Ohhh....{N}He's ugly, isn't he?{W1}"
		dc.w $C01F
		dc.w $32                
						; 0032 SET CAMERA DEST 7 0
		dc.w 7
		dc.w 0
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 2 2
		dc.b $80
		dc.b $FF
		dc.b 2
		dc.b 2
		dc.w $8080
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 80
		dc.w $80
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 3 2
		dc.b $80
		dc.b $FF
		dc.b 3
		dc.b 2
		dc.w $8080
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 80 : "What?!{N}You dare insult me?!{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "I've never...{N}For that you will die!{W1}"
		dc.w $80
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 3 1
		dc.b $80
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Are you ready to die?{W1}"
		dc.w $80
		dc.w 5                  
						; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
		dc.w $76
		dc.w $41                
						; 0041 FLASH SCREEN WHITE 28
		dc.w $28
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
word_4C690:
		dc.w $B
		dc.w $1A
		dc.w 1
		dc.b $B
		dc.b $1C
		dc.b 1
		dc.b 7
		dc.l eas_Init           
		dc.b $D
		dc.b 4
		dc.b 3
		dc.b $9B
		dc.l eas_Init           
		dc.w $FFFF
