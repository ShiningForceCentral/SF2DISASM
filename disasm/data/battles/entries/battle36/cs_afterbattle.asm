
; ASM FILE data\battles\entries\battle36\cs_afterbattle.asm :
; 0x4D9A4..0x4DA66 : Cutscene after battle 36
abcs_battle36:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR B89 : "Prism Flowers?{W2}"
		dc.w $B89
		dc.w $37                
						; 0037 LOAD MAP AND FADE IN 35 6 11
		dc.w $35
		dc.w 6
		dc.w $11
		dc.w $42                
						; 0042 RELATED TO LOADING MAP ENTITIES 4DA46
		dc.l word_4DA46
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
						; 0019 SET ENTITY POS AND FACING 7 A 13 3
		dc.b 7
		dc.b $A
		dc.b $13
		dc.b 3
		dc.w $15                
						; 0015 SET ACTSCRIPT 1F FF 460CE
		dc.b $1F
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1F C 13 3
		dc.b $1F
		dc.b $C
		dc.b $13
		dc.b 3
		dc.w $D                 
						; 000D JUMP IF CLEAR FLAG 4C 4D9F0 : Zynk is a follower
		dc.w $4C
		dc.l word_4D9F0         
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
word_4D9F0:
		dc.w $22                
						; 0022 ANIMATE ENTITY FADE INOUT 80
		dc.w $80
		dc.w 6
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.w $22                
						; 0022 ANIMATE ENTITY FADE INOUT 80
		dc.w $80
		dc.w 7
		dc.w $15                
						; 0015 SET ACTSCRIPT 80 FF 45E44
		dc.b $80
		dc.b $FF
		dc.l eas_Jump           
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $15                
						; 0015 SET ACTSCRIPT 80 0 461B6
		dc.b $80
		dc.b 0
		dc.l eas_461B6          
		dc.b $80                
						; WAIT 78
		dc.b $78
		dc.w $23                
						; 0023 SET ENTITY FACING 80 3
		dc.b $80
		dc.b 3
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 80 : "Prism Flowers?{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "My Prism Flowers!{W1}"
		dc.w $80
		dc.w $23                
						; 0023 SET ENTITY FACING 80 1
		dc.b $80
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "{LEADER}, I shall return{N}with Red Baron!{N}You'll pay for this!{W1}"
		dc.w $80
		dc.w $22                
						; 0022 ANIMATE ENTITY FADE INOUT 80
		dc.w $80
		dc.w 6
		dc.w $2C                
						; 002C FOLLOW ENTITY 81 0 2
		dc.w $81
		dc.w 0
		dc.w 2
		dc.w $2C                
						; 002C FOLLOW ENTITY 7 81 1
		dc.w 7
		dc.w $81
		dc.w 1
		dc.w $2C                
						; 002C FOLLOW ENTITY 1F 81 3
		dc.w $1F
		dc.w $81
		dc.w 3
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
word_4DA46:
		dc.w $B
		dc.w $14
		dc.w 3
		dc.b $A
		dc.b $13
		dc.b 3
		dc.b 7
		dc.l eas_Init           
		dc.b $B
		dc.b $17
		dc.b 3
		dc.b $9F
		dc.l eas_Init           
		dc.b $B
		dc.b $13
		dc.b 3
		dc.b $3E
		dc.l eas_Init           
		dc.w $FFFF
