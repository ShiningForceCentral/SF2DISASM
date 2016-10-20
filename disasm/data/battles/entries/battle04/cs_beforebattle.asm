
; ASM FILE data\battles\entries\battle04\cs_beforebattle.asm :
; 0x4981E..0x498EE : Cutscene before battle 4
bbcs_04:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 907 : "Who are they?{W1}"
		dc.w $907
		dc.w $37                
						; 0037 LOAD MAP AND FADE IN 42 1 5
		dc.w $42
		dc.w 1
		dc.w 5
		dc.w $42                
						; 0042 RELATED TO LOADING MAP ENTITIES 4989E
		dc.l word_4989E
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 460CE
		dc.b 0
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 4 6 9 3
		dc.b 4
		dc.b 6
		dc.b 9
		dc.b 3
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.w $15                
						; 0015 SET ACTSCRIPT 4 FF 45E44
		dc.b 4
		dc.b $FF
		dc.l eas_Jump           
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 4 : "Who are they?{W1}"
		dc.w 4
		dc.w $32                
						; 0032 SET CAMERA DEST 7 D
		dc.w 7
		dc.w $D
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 4 : "Galam soldiers!{W1}"
		dc.w 4
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01C : "Greetings, Granseal scum!{W1}"
		dc.w $C01C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 4 : "Why did you kill Sir{N}Hawel?  How could you be{N}so mean?{W1}"
		dc.w 4
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01C : "Ummm....{W1}"
		dc.w $C01C
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 4 : "Answer me!{W1}"
		dc.w 4
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 4 : "{LEADER}, we must{N}defeat them so we can learn{N}the truth!{W1}"
		dc.w 4
		dc.w $23                
						; 0023 SET ENTITY FACING 1C 3
		dc.b $1C
		dc.b 3
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $23                
						; 0023 SET ENTITY FACING 1C 0
		dc.b $1C
		dc.b 0
		dc.w $23                
						; 0023 SET ENTITY FACING 80 2
		dc.b $80
		dc.b 2
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01C : "Capture them alive!{W1}"
		dc.w $C01C
		dc.w $26                
						; 0026 MAKE ENTITY NOD 80
		dc.w $80
		dc.w $2D                
						; 002D MOVE ENTITY 1C FF 3 1
		dc.b $1C
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.b 0
		dc.b 2
		dc.b 3
		dc.b 2
		dc.b 0
		dc.b 1
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 1C FF 0 2
		dc.b $1C
		dc.b $FF
		dc.b 0
		dc.b 2
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
word_4989E:
		dc.w 5
		dc.w 9
		dc.w 3
		dc.b 6
		dc.b 9
		dc.b 3
		dc.b 4
		dc.l eas_Init           
		dc.b 5
		dc.b 8
		dc.b 3
		dc.b 1
		dc.l eas_Init           
		dc.b 5
		dc.b 7
		dc.b 3
		dc.b 2
		dc.l eas_Init           
		dc.b 6
		dc.b 8
		dc.b 3
		dc.b 3
		dc.l eas_Init           
		dc.b $D
		dc.b $11
		dc.b 1
		dc.b $1C
		dc.l eas_Init           
		dc.b $E
		dc.b $11
		dc.b 1
		dc.b $78
		dc.l eas_Init           
		dc.b $B
		dc.b $12
		dc.b 1
		dc.b $42
		dc.l eas_Init           
		dc.b $C
		dc.b $12
		dc.b 1
		dc.b $42
		dc.l eas_Init           
		dc.b $E
		dc.b $10
		dc.b 1
		dc.b $42
		dc.l eas_Init           
		dc.w $FFFF
