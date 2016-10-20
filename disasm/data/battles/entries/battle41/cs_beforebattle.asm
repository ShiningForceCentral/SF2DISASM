
; ASM FILE data\battles\entries\battle41\cs_beforebattle.asm :
; 0x4ED0E..0x4ED8E : Cutscene before battle 41
bbcs_41:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR C0B : "Who are you?!{N}Oh, are you from Granseal?{W1}"
		dc.w $C0B
		dc.w $37                
						; 0037 LOAD MAP AND FADE IN 38 C 15
		dc.w $38
		dc.w $C
		dc.w $15
		dc.w $42                
						; 0042 RELATED TO LOADING MAP ENTITIES 4ED76
		dc.l word_4ED76
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 460CE
		dc.b 0
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 7 10 18 0
		dc.b 7
		dc.b $10
		dc.b $18
		dc.b 0
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1F F 18 0
		dc.b $1F
		dc.b $F
		dc.b $18
		dc.b 0
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1C E 18 0
		dc.b $1C
		dc.b $E
		dc.b $18
		dc.b 0
		dc.w $D                 
						; 000D JUMP IF CLEAR FLAG 4C 4ED48 : Zynk is a follower
		dc.w $4C
		dc.l word_4ED48         
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1A D 18 0
		dc.b $1A
		dc.b $D
		dc.b $18
		dc.b 0
word_4ED48:
		dc.w 5                  
						; 0005 PLAY SOUND MUSIC_BATTLE_THEME_3
		dc.w $21
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Who are you?!{N}Oh, are you from Granseal?{W1}"
		dc.w $80
		dc.w $23                
						; 0023 SET ENTITY FACING 0 1
		dc.b 0
		dc.b 1
		dc.w $32                
						; 0032 SET CAMERA DEST C 4
		dc.w $C
		dc.w 4
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "But, Odd Eye went to...{W2}"
		dc.w $80
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 3 2
		dc.b $80
		dc.b $FF
		dc.b 3
		dc.b 2
		dc.w $8080
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 80 : "Impossible!{N}He was defeated?{W2}"
		dc.w $80
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 80 : "Inconceivable!  But...{N}OK, I'll stop you here.{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "You shall die now!{W1}"
		dc.w $80
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
word_4ED76:
		dc.w $11
		dc.w $18
		dc.w 0
		dc.b $10
		dc.b $18
		dc.b 0
		dc.b 7
		dc.l eas_Init           
		dc.b $10
		dc.b 6
		dc.b 3
		dc.b $63
		dc.l eas_Init           
		dc.w $FFFF
