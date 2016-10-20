
; ASM FILE data\battles\entries\battle07\cs_afterbattle.asm :
; 0x49F7E..0x4A952 : Cutscene after battle 7
abcs_battle07:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 951 : "King Galam!  You've lost{N}your followers!{W1}"
		dc.w $951
		dc.w $37                
						; 0037 LOAD MAP AND FADE IN 3A 8 10
		dc.w $3A
		dc.w 8
		dc.w $10
		dc.w $42                
						; 0042 RELATED TO LOADING MAP ENTITIES 4A912
		dc.l word_4A912
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 460CE
		dc.b 0
		dc.b $FF
		dc.l eas_Init           
		dc.w $34                
						; 0034 SET BLOCKS 717 102 D16
		dc.w $717
		dc.w $102
		dc.w $D16
		dc.w $34                
						; 0034 SET BLOCKS 717 102 D18
		dc.w $717
		dc.w $102
		dc.w $D18
		dc.w $34                
						; 0034 SET BLOCKS 717 102 D1D
		dc.w $717
		dc.w $102
		dc.w $D1D
		dc.w $1C                
						; 001C STOP ENTITY ANIM 82
		dc.w $82
		dc.w $1C                
						; 001C STOP ENTITY ANIM 83
		dc.w $83
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 82
		dc.b $82
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
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 83
		dc.b $83
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
		dc.w $15                
						; 0015 SET ACTSCRIPT 80 FF 46172
		dc.b $80
		dc.b $FF
		dc.l eas_46172          
		dc.w $15                
						; 0015 SET ACTSCRIPT 81 FF 46172
		dc.b $81
		dc.b $FF
		dc.l eas_46172          
		dc.w $15                
						; 0015 SET ACTSCRIPT 80 0 45FB2
		dc.b $80
		dc.b 0
		dc.l eas_AnimSpeedx2    
		dc.w $15                
						; 0015 SET ACTSCRIPT 81 0 45FB2
		dc.b $81
		dc.b 0
		dc.l eas_AnimSpeedx2    
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.w $45                
						; 0045 RELATED TO CAMERA ADJUST TO PLAYER 28
		dc.w $28
		dc.b $80                
						; WAIT 32
		dc.b $32
		dc.w $2D                
						; 002D MOVE ENTITY 85 0 1 6
		dc.b $85
		dc.b 0
		dc.b 1
		dc.b 6
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 86 FF 1 6
		dc.b $86
		dc.b $FF
		dc.b 1
		dc.b 6
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 86 : "King Galam!  You've lost{N}your followers!{W1}"
		dc.w $86
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 85 : "Princess Elis, come here.{N}Come here.{W1}"
		dc.w $85
		dc.w $32                
						; 0032 SET CAMERA DEST 8 D
		dc.w 8
		dc.w $D
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 84 : "Father...{W1}"
		dc.w $84
		dc.w $2D                
						; 002D MOVE ENTITY 84 FF 3 1
		dc.b $84
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 82
		dc.b $82
		dc.b $FF
		dc.w $14                
						;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                
						;   001B SET FLIPPING $0
		dc.w 0
		dc.w $A                 
						;   000A UPDATE SPRITE
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $1B                
						; 001B START ENTITY ANIM 82
		dc.w $82
		dc.w $2D                
						; 002D MOVE ENTITY 84 0 3 1
		dc.b $84
		dc.b 0
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 82
		dc.b $82
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $2D                
						; 002D MOVE ENTITY 82 FF 2 1
		dc.b $82
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 82 1
		dc.b $82
		dc.b 1
		dc.w $16                
						; 0016 WAIT UNTIL IDLE ENTITY 84
		dc.w $84
		dc.w $15                
						; 0015 SET ACTSCRIPT 84 FF 45E44
		dc.b $84
		dc.b $FF
		dc.l eas_Jump           
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 84 : "(Shriek!){W1}"
		dc.w $84
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "No, Princess.{W1}"
		dc.w $C082
		dc.w $15                
						; 0015 SET ACTSCRIPT 84 FF 46172
		dc.b $84
		dc.b $FF
		dc.l eas_46172          
		dc.w $2D                
						; 002D MOVE ENTITY 84 FF 1 1
		dc.b $84
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 85 : "Elis!{W1}"
		dc.w $85
		dc.w $32                
						; 0032 SET CAMERA DEST 8 F
		dc.w 8
		dc.w $F
		dc.w $2D                
						; 002D MOVE ENTITY 85 0 1 1
		dc.b $85
		dc.b 0
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 86 FF 1 1
		dc.b $86
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "Freeze!  Ha, ha!{W1}"
		dc.w $C082
		dc.w $15                
						; 0015 SET ACTSCRIPT 85 0 45E44
		dc.b $85
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 86 FF 45E44
		dc.b $86
		dc.b $FF
		dc.l eas_Jump           
		dc.w $32                
						; 0032 SET CAMERA DEST 8 E
		dc.w 8
		dc.w $E
		dc.w $2D                
						; 002D MOVE ENTITY 82 FF 0 1
		dc.b $82
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.b 1
		dc.b 2
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 82 3
		dc.b $82
		dc.b 3
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C082 : "What a good hostage she is!{W2}"
		dc.w $C082
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "Stay there!  Or she'll die!{W1}"
		dc.w $C082
		dc.w $2D                
						; 002D MOVE ENTITY 85 FF 1 1
		dc.b $85
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 85 : "Stop this, King Galam!{N}Leave her alone!  Please!{W1}"
		dc.w $85
		dc.w $2D                
						; 002D MOVE ENTITY 86 FF 1 1
		dc.b $86
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 86 : "Princess Elis...I'll save{N}you!{W1}"
		dc.w $86
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "King Galam murmurs a{N}magic spell.{W1}"
		dc.w $FFFF
		dc.w $23                
						; 0023 SET ENTITY FACING 84 0
		dc.b $84
		dc.b 0
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w $15                
						; 0015 SET ACTSCRIPT 84 FF 45E44
		dc.b $84
		dc.b $FF
		dc.l eas_Jump           
		dc.w $23                
						; 0023 SET ENTITY FACING 84 3
		dc.b $84
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 84 : "Watch out!{W1}"
		dc.w $84
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 85 : "What?!{W1}"
		dc.w $85
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 80
		dc.b $80
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$50 Y=$50
		dc.b $50
		dc.b $50
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 81
		dc.b $81
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$50 Y=$50
		dc.b $50
		dc.b $50
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 80 D 10 0
		dc.b $80
		dc.b $D
		dc.b $10
		dc.b 0
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 81 D 10 0
		dc.b $81
		dc.b $D
		dc.b $10
		dc.b 0
		dc.w 5                  
						; 0005 PLAY SOUND SFX_DEMON_BREATH
		dc.w $75
		dc.w $2D                
						; 002D MOVE ENTITY 80 0 6 1
		dc.b $80
		dc.b 0
		dc.b 6
		dc.b 1
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 81 FF 7 1
		dc.b $81
		dc.b $FF
		dc.b 7
		dc.b 1
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 80 0 3 8
		dc.b $80
		dc.b 0
		dc.b 3
		dc.b 8
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 81 0 3 8
		dc.b $81
		dc.b 0
		dc.b 3
		dc.b 8
		dc.w $8080
		dc.b $80                
						; WAIT A
		dc.b $A
		dc.w $15                
						; 0015 SET ACTSCRIPT 85 FF 46172
		dc.b $85
		dc.b $FF
		dc.l eas_46172          
		dc.w $15                
						; 0015 SET ACTSCRIPT 86 FF 46172
		dc.b $86
		dc.b $FF
		dc.l eas_46172          
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 85
		dc.b $85
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 86
		dc.b $86
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $2D                
						; 002D MOVE ENTITY 85 0 3 3
		dc.b $85
		dc.b 0
		dc.b 3
		dc.b 3
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 86 FF 3 3
		dc.b $86
		dc.b $FF
		dc.b 3
		dc.b 3
		dc.w $8080
		dc.w $1C                
						; 001C STOP ENTITY ANIM 85
		dc.w $85
		dc.w $1C                
						; 001C STOP ENTITY ANIM 86
		dc.w $86
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 85
		dc.b $85
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
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 86
		dc.b $86
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
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 84 : "Father!{W1}"
		dc.w $84
		dc.w $15                
						; 0015 SET ACTSCRIPT 85 FF 460CE
		dc.b $85
		dc.b $FF
		dc.l eas_Init           
		dc.w $15                
						; 0015 SET ACTSCRIPT 86 FF 460CE
		dc.b $86
		dc.b $FF
		dc.l eas_Init           
		dc.w $1B                
						; 001B START ENTITY ANIM 85
		dc.w $85
		dc.w $1B                
						; 001B START ENTITY ANIM 86
		dc.w $86
		dc.w $27                
						; 0027 MAKE ENTITY SHAKE HEAD 85
		dc.w $85
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 85 : "Don't worry...I'm fine.{W1}"
		dc.w $85
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "That was just a warning!{N}Do you want me to attack{N}again?{W1}"
		dc.w $C082
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 80 3F 3F 3
		dc.b $80
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 81 3F 3F 3
		dc.b $81
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.w $32                
						; 0032 SET CAMERA DEST 8 11
		dc.w 8
		dc.w $11
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 83
		dc.b $83
		dc.b $FF
		dc.w $14                
						;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                
						;   001B SET FLIPPING $0
		dc.w 0
		dc.w $A                 
						;   000A UPDATE SPRITE
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $1B                
						; 001B START ENTITY ANIM 83
		dc.w $83
		dc.w $27                
						; 0027 MAKE ENTITY SHAKE HEAD 83
		dc.w $83
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 83 : "King Granseal...{W2}"
		dc.w $83
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "Galam, please tell me...{N}What's in this tower?{N}In Ground Seal?{W1}"
		dc.w $83
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "You really want to know?{N}Ha, ha!  OK, I'll tell you.{W1}"
		dc.w $C082
		dc.w $32                
						; 0032 SET CAMERA DEST 8 D
		dc.w 8
		dc.w $D
		dc.w $23                
						; 0023 SET ENTITY FACING 82 1
		dc.b $82
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "King Galam displays the{N}Jewel of Evil.{W1}"
		dc.w $FFFF
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "I'll open the door to the{N}Evil World!{N}Observe!{W1}"
		dc.w $C082
		dc.w $18                
						; 0018 FLASH ENTITY WHITE 82 32
		dc.w $82
		dc.w $32
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $3F                
						; 003F FADE MAP OUT TO WHITE
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $40                
						; 0040 FADE MAP IN FROM WHITE
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w $3F                
						; 003F FADE MAP OUT TO WHITE
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $40                
						; 0040 FADE MAP IN FROM WHITE
		dc.w 5                  
						; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		dc.w $5D
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 2
		dc.w 2
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 0
		dc.w 0
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 3
		dc.w 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 85 : "An earthquake!{W1}"
		dc.w $85
		dc.w $32                
						; 0032 SET CAMERA DEST 8 3
		dc.w 8
		dc.w 3
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $34                
						; 0034 SET BLOCKS 27 303 C04
		dc.w $27
		dc.w $303
		dc.w $C04
		dc.b $80                
						; WAIT 32
		dc.b $32
		dc.w $34                
						; 0034 SET BLOCKS 2B 303 C04
		dc.w $2B
		dc.w $303
		dc.w $C04
		dc.b $80                
						; WAIT 32
		dc.b $32
		dc.w $34                
						; 0034 SET BLOCKS 2F 303 C04
		dc.w $2F
		dc.w $303
		dc.w $C04
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 0
		dc.w 0
		dc.w $32                
						; 0032 SET CAMERA DEST 8 D
		dc.w 8
		dc.w $D
		dc.w $23                
						; 0023 SET ENTITY FACING 82 3
		dc.b $82
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "Now do you understand?  I{N}plan on opening the sealed{N}door!{W1}"
		dc.w $C082
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "Why?  What's inside?{W1}"
		dc.w $83
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "You'll find out soon enough.{W1}"
		dc.w $C082
		dc.w $23                
						; 0023 SET ENTITY FACING 82 1
		dc.b $82
		dc.b 1
		dc.w $18                
						; 0018 FLASH ENTITY WHITE 82 28
		dc.w $82
		dc.w $28
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 85 : "What's he doing now??{W1}"
		dc.w $85
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "Here they come!{N}Ha, ha, ha!{W1}"
		dc.w $C082
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "What?{W1}"
		dc.w $83
		dc.w $32                
						; 0032 SET CAMERA DEST 8 3
		dc.w 8
		dc.w 3
		dc.w $1A                
						; 001A SET ENTITY SPRITE 80 B4
		dc.w $80
		dc.w $B4
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 80 C 5 1
		dc.b $80
		dc.b $C
		dc.b 5
		dc.b 1
		dc.w $22                
						; 0022 ANIMATE ENTITY FADE INOUT 80
		dc.w $80
		dc.w 7
		dc.w $1A                
						; 001A SET ENTITY SPRITE 81 B4
		dc.w $81
		dc.w $B4
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 81 D 5 1
		dc.b $81
		dc.b $D
		dc.b 5
		dc.b 1
		dc.w $22                
						; 0022 ANIMATE ENTITY FADE INOUT 81
		dc.w $81
		dc.w 7
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 80
		dc.b $80
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
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 0 : "I have a bad feeling about{N}this!{W1}"
		dc.w 0
		dc.w $2D                
						; 002D MOVE ENTITY 80 0 3 5
		dc.b $80
		dc.b 0
		dc.b 3
		dc.b 5
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 81 FF 3 5
		dc.b $81
		dc.b $FF
		dc.b 3
		dc.b 5
		dc.w $8080
		dc.w $32                
						; 0032 SET CAMERA DEST 8 8
		dc.w 8
		dc.w 8
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 86 : "Princess Elis is swallowed{N}by a light tube.{W1}"
		dc.w $86
		dc.w $2D                
						; 002D MOVE ENTITY 80 0 3 5
		dc.b $80
		dc.b 0
		dc.b 3
		dc.b 5
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 84 1
		dc.b $84
		dc.b 1
		dc.w $15                
						; 0015 SET ACTSCRIPT 84 0 45E44
		dc.b $84
		dc.b 0
		dc.l eas_Jump           
		dc.w $2D                
						; 002D MOVE ENTITY 81 FF 3 5
		dc.b $81
		dc.b $FF
		dc.b 3
		dc.b 5
		dc.w $8080
		dc.w $32                
						; 0032 SET CAMERA DEST 8 D
		dc.w 8
		dc.w $D
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "Farewell for now!{N}Going up!{W1}"
		dc.w $C082
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 82
		dc.b $82
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$2 Y=$2
		dc.b 2
		dc.b 2
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 84
		dc.b $84
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$2 Y=$2
		dc.b 2
		dc.b 2
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 80
		dc.b $80
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$2 Y=$2
		dc.b 2
		dc.b 2
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 81
		dc.b $81
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$2 Y=$2
		dc.b 2
		dc.b 2
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $2D                
						; 002D MOVE ENTITY 80 0 1 2
		dc.b $80
		dc.b 0
		dc.b 1
		dc.b 2
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 81 0 1 2
		dc.b $81
		dc.b 0
		dc.b 1
		dc.b 2
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 82 0 1 2
		dc.b $82
		dc.b 0
		dc.b 1
		dc.b 2
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 84 0 1 2
		dc.b $84
		dc.b 0
		dc.b 1
		dc.b 2
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "He's using the light tube{N}to go through the doorway!{W1}"
		dc.w $83
		dc.w $32                
						; 0032 SET CAMERA DEST 8 11
		dc.w 8
		dc.w $11
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "Save her.  Save her now!{W1}"
		dc.w $83
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $15                
						; 0015 SET ACTSCRIPT 83 0 461B6
		dc.b $83
		dc.b 0
		dc.l eas_461B6          
		dc.b $80                
						; WAIT 78
		dc.b $78
		dc.w $23                
						; 0023 SET ENTITY FACING 83 3
		dc.b $83
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "{LEADER}, you're good{N}at performing acrobatics!{W1}"
		dc.w $83
		dc.w $2D                
						; 002D MOVE ENTITY 83 FF 3 1
		dc.b $83
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 83 0
		dc.b $83
		dc.b 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "Minister, help me!{W1}"
		dc.w $83
		dc.w $23                
						; 0023 SET ENTITY FACING 86 2
		dc.b $86
		dc.b 2
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 86 : "Y...yes...but how?{W1}"
		dc.w $86
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "Throw {LEADER} towards{N}the light tubes!{W1}"
		dc.w $83
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 45E44
		dc.b 0
		dc.b $FF
		dc.l eas_Jump           
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		dc.w 0
		dc.w $2D                
						; 002D MOVE ENTITY 85 FF 2 1
		dc.b $85
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 83 FF 2 1
		dc.b $83
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 86 FF 3 1
		dc.b $86
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $16                
						; 0016 WAIT UNTIL IDLE ENTITY 83
		dc.w $83
		dc.w $23                
						; 0023 SET ENTITY FACING 85 0
		dc.b $85
		dc.b 0
		dc.w $23                
						; 0023 SET ENTITY FACING 83 0
		dc.b $83
		dc.b 0
		dc.w $23                
						; 0023 SET ENTITY FACING 86 2
		dc.b $86
		dc.b 2
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $1C                
						; 001C STOP ENTITY ANIM 0
		dc.w 0
		dc.w $23                
						; 0023 SET ENTITY FACING 0 3
		dc.b 0
		dc.b 3
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.b 0
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
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "{LEADER}, save her!{W1}"
		dc.w $83
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.b 0
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 83
		dc.b $83
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 86
		dc.b $86
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 46172
		dc.b 0
		dc.b $FF
		dc.l eas_46172          
		dc.w $15                
						; 0015 SET ACTSCRIPT 83 FF 46172
		dc.b $83
		dc.b $FF
		dc.l eas_46172          
		dc.w $15                
						; 0015 SET ACTSCRIPT 86 FF 46172
		dc.b $86
		dc.b $FF
		dc.l eas_46172          
		dc.w $2D                
						; 002D MOVE ENTITY 83 0 3 3
		dc.b $83
		dc.b 0
		dc.b 3
		dc.b 3
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 86 0 3 3
		dc.b $86
		dc.b 0
		dc.b 3
		dc.b 3
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 3 3
		dc.b 0
		dc.b $FF
		dc.b 3
		dc.b 3
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "Too late.  You're too late.{W1}"
		dc.w $C082
		dc.w $45                
						; 0045 RELATED TO CAMERA ADJUST TO PLAYER 38
		dc.w $38
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.b 0
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 83
		dc.b $83
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 86
		dc.b $86
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $2D                
						; 002D MOVE ENTITY 83 0 1 5
		dc.b $83
		dc.b 0
		dc.b 1
		dc.b 5
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 86 0 1 5
		dc.b $86
		dc.b 0
		dc.b 1
		dc.b 5
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 1 5
		dc.b 0
		dc.b $FF
		dc.b 1
		dc.b 5
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 85 1
		dc.b $85
		dc.b 1
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 1 3
		dc.b 0
		dc.b $FF
		dc.b 1
		dc.b 3
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "Oops, we lost our grip!{N}But...{W1}"
		dc.w $83
		dc.w $2D                
						; 002D MOVE ENTITY 80 0 1 8
		dc.b $80
		dc.b 0
		dc.b 1
		dc.b 8
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 81 0 1 8
		dc.b $81
		dc.b 0
		dc.b 1
		dc.b 8
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 82 0 1 8
		dc.b $82
		dc.b 0
		dc.b 1
		dc.b 8
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 84 0 1 8
		dc.b $84
		dc.b 0
		dc.b 1
		dc.b 8
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 1 5
		dc.b 0
		dc.b $FF
		dc.b 1
		dc.b 5
		dc.w $8080
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.b 0
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$2 Y=$2
		dc.b 2
		dc.b 2
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 4
		dc.w 4
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.b 0
		dc.b $FF
		dc.w $14                
						;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                
						;   001B SET FLIPPING $0
		dc.w 0
		dc.w $A                 
						;   000A UPDATE SPRITE
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $23                
						; 0023 SET ENTITY FACING 0 1
		dc.b 0
		dc.b 1
		dc.w $1A                
						; 001A SET ENTITY SPRITE 0 B1
		dc.w 0
		dc.w $B1
		dc.w $2D                
						; 002D MOVE ENTITY 0 0 1 8
		dc.b 0
		dc.b 0
		dc.b 1
		dc.b 8
		dc.w $8080
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 0
		dc.w 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER} grasped the{N}Jewel of Evil.{W1}"
		dc.w $FFFF
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		dc.w $FFFF
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C082 : "What are you doing?{W2}"
		dc.w $C082
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		dc.w 0
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		dc.w $FFFF
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "Don't touch my jewel!{N}Don't touch it!{W1}"
		dc.w $C082
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		dc.w 0
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 0
		dc.w 0
		dc.w $1C                
						; 001C STOP ENTITY ANIM 0
		dc.w 0
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		dc.w $FFFF
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C082 : "I said, don't touch it!{W2}"
		dc.w $C082
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		dc.w 0
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		dc.w $FFFF
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "I'll shake you off!{W1}"
		dc.w $C082
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		dc.w 0
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 0
		dc.w 0
		dc.w $1C                
						; 001C STOP ENTITY ANIM 0
		dc.w 0
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		dc.w $FFFF
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "You're still there?{W1}"
		dc.w $C082
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		dc.w 0
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		dc.w $FFFF
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 0 : "Wow!  He's so brave.  Hmmm....{W1}"
		dc.w 0
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		dc.w 0
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		dc.w $FFFF
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "I've almost got you now!{W1}"
		dc.w $C082
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		dc.w 0
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 0
		dc.w 0
		dc.w $1C                
						; 001C STOP ENTITY ANIM 0
		dc.w 0
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		dc.w $FFFF
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 84 : "No, you'll fall if you{N}open your hands now!{W1}"
		dc.w $84
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		dc.w 0
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		dc.w $FFFF
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER}'s jewel suddenly{N}flared!{W1}"
		dc.w $FFFF
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		dc.w 0
		dc.w $18                
						; 0018 FLASH ENTITY WHITE 0 14
		dc.w 0
		dc.w $14
		dc.w 5                  
						; 0005 PLAY SOUND SFX_VALIDATION
		dc.w $43
		dc.w $3F                
						; 003F FADE MAP OUT TO WHITE
		dc.b $80                
						; WAIT A
		dc.b $A
		dc.w $40                
						; 0040 FADE MAP IN FROM WHITE
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		dc.w $FFFF
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "Whoa!  The light...the{N}light!{W1}"
		dc.w $C082
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		dc.w 0
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		dc.w $FFFF
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "The Jewel of Evil fused{N}to {LEADER}'s neck.{W1}"
		dc.w $FFFF
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		dc.w 0
		dc.w $45                
						; 0045 RELATED TO CAMERA ADJUST TO PLAYER 38
		dc.w $38
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.b 0
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 46172
		dc.b 0
		dc.b $FF
		dc.l eas_46172          
		dc.w $1A                
						; 001A SET ENTITY SPRITE 0 0
		dc.w 0
		dc.w 0
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.b 0
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
		dc.w $29                
						; 0029 SET ENTITY DEST 0 D A
		dc.w 0
		dc.w $D
		dc.w $A
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "He stole my jewel!{W1}"
		dc.w $C082
		dc.w $23                
						; 0023 SET ENTITY FACING 83 1
		dc.b $83
		dc.b 1
		dc.w $23                
						; 0023 SET ENTITY FACING 86 1
		dc.b $86
		dc.b 1
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 3 5
		dc.b 0
		dc.b $FF
		dc.b 3
		dc.b 5
		dc.w $8080
		dc.w $45                
						; 0045 RELATED TO CAMERA ADJUST TO PLAYER 40
		dc.w $40
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.b 0
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w 5                  
						; 0005 PLAY SOUND SFX_DOOR_OPEN
		dc.w $5C
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 3
		dc.w 3
		dc.w $23                
						; 0023 SET ENTITY FACING 0 3
		dc.b 0
		dc.b 3
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 3 1
		dc.b 0
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 0 2
		dc.b 0
		dc.b 2
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 3 1
		dc.b 0
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 0 1
		dc.b 0
		dc.b 1
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 3 1
		dc.b 0
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 0 0
		dc.b 0
		dc.b 0
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 3 1
		dc.b 0
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 0 3
		dc.b 0
		dc.b 3
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 3 1
		dc.b 0
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $1A                
						; 001A SET ENTITY SPRITE 0 B1
		dc.w 0
		dc.w $B1
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.b 0
		dc.b $FF
		dc.w $14                
						;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                
						;   001B SET FLIPPING $0
		dc.w 0
		dc.w $A                 
						;   000A UPDATE SPRITE
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 0
		dc.w 0
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 0
		dc.w 0
		dc.w $1C                
						; 001C STOP ENTITY ANIM 0
		dc.w 0
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		dc.w $FFFF
		dc.w $45                
						; 0045 RELATED TO CAMERA ADJUST TO PLAYER 28
		dc.w $28
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "The two jewels merge{N}together.{W1}"
		dc.w $FFFF
		dc.w $10                
						; 0010 SET FLAG 181 FFFF : set after Bowie obtains King Galam's jewel
		dc.w $181
		dc.w $FFFF
		dc.w $32                
						; 0032 SET CAMERA DEST 8 3
		dc.w 8
		dc.w 3
		dc.w $16                
						; 0016 WAIT UNTIL IDLE ENTITY 82
		dc.w $82
		dc.w $23                
						; 0023 SET ENTITY FACING 82 3
		dc.b $82
		dc.b 3
		dc.w $23                
						; 0023 SET ENTITY FACING 84 3
		dc.b $84
		dc.b 3
		dc.w $22                
						; 0022 ANIMATE ENTITY FADE INOUT 81
		dc.w $81
		dc.w 6
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "I have to go back and get{N}my jewel....{N}Noooooooo!{W1}"
		dc.w $C082
		dc.w $15                
						; 0015 SET ACTSCRIPT 82 0 463AE
		dc.b $82
		dc.b 0
		dc.l eas_463AE          
		dc.w $22                
						; 0022 ANIMATE ENTITY FADE INOUT 80
		dc.w $80
		dc.w 6
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 84 : "Father...{N}{LEADER}...help meeeeee!{W1}"
		dc.w $84
		dc.w $15                
						; 0015 SET ACTSCRIPT 84 FF 463AE
		dc.b $84
		dc.b $FF
		dc.l eas_463AE          
		dc.w $15                
						; 0015 SET ACTSCRIPT 83 FF 460CE
		dc.b $83
		dc.b $FF
		dc.l eas_Init           
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 83
		dc.b $83
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
						; 0015 SET ACTSCRIPT 86 FF 460CE
		dc.b $86
		dc.b $FF
		dc.l eas_Init           
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 86
		dc.b $86
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
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 85
		dc.b $85
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
		dc.w 5                  
						; 0005 PLAY SOUND 
		dc.w $FD
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $32                
						; 0032 SET CAMERA DEST 8 11
		dc.w 8
		dc.w $11
		dc.w 5                  
						; 0005 PLAY SOUND MUSIC_SAD_THEME_1
		dc.w $10
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 85 : "She's gone....{N}Elis!{W1}"
		dc.w $85
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "We couldn't help the{N}Princess.{W1}"
		dc.w $83
		dc.w $1A                
						; 001A SET ENTITY SPRITE 0 0
		dc.w 0
		dc.w 0
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 460CE
		dc.b 0
		dc.b $FF
		dc.l eas_Init           
		dc.w $1B                
						; 001B START ENTITY ANIM 0
		dc.w 0
		dc.w $27                
						; 0027 MAKE ENTITY SHAKE HEAD 0
		dc.w 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C000 : "(Sigh)....{W1}"
		dc.w $C000
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "{LEADER}, why do you{N}have two jewels?{W1}"
		dc.w $83
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER} explains{N}what happened.{W1}"
		dc.w $FFFF
		dc.w $26                
						; 0026 MAKE ENTITY NOD 83
		dc.w $83
		dc.w $26                
						; 0026 MAKE ENTITY NOD 0
		dc.w 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "Indeed, perhaps...these{N}jewels are the key to{N}solving this....{W1}"
		dc.w $83
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 2
		dc.w 2
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $15                
						; 0015 SET ACTSCRIPT 86 0 461B6
		dc.b $86
		dc.b 0
		dc.l eas_461B6          
		dc.w 5                  
						; 0005 PLAY SOUND 
		dc.w $FD
		dc.b $80                
						; WAIT 78
		dc.b $78
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 0
		dc.w 0
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 1
		dc.w 1
		dc.w 5                  
						; 0005 PLAY SOUND MUSIC_BOSS_ATTACK
		dc.w 6
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "What?! Another earthquake?{W1}"
		dc.w $83
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 86 : "Wow!  It's getting worse!{W1}"
		dc.w $86
		dc.w $2D                
						; 002D MOVE ENTITY 86 FF 3 1
		dc.b $86
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 86 2
		dc.b $86
		dc.b 2
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C085 : "Whoa!{W1}"
		dc.w $C085
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 86 : "Sssiirrr Astral!{N}What should we do?!{W1}"
		dc.w $86
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "I'm not sure.{W1}"
		dc.w $83
		dc.w $2D                
						; 002D MOVE ENTITY 86 FF 2 2
		dc.b $86
		dc.b $FF
		dc.b 2
		dc.b 2
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 86 1
		dc.b $86
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 86 : "Sir Astral!{W1}"
		dc.w $86
		dc.w $23                
						; 0023 SET ENTITY FACING 83 3
		dc.b $83
		dc.b 3
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 83 : "Let's get out of here!{W2}"
		dc.w $83
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "We'll come back later with{N}soldiers to rescue her.{W1}"
		dc.w $83
		dc.w $23                
						; 0023 SET ENTITY FACING 83 2
		dc.b $83
		dc.b 2
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C085 : "But, Sir Astral...{W1}"
		dc.w $C085
		dc.w $23                
						; 0023 SET ENTITY FACING 83 3
		dc.b $83
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "He won't budge.{N}We'll have to carry him.{W1}"
		dc.w $83
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "The Minister nods.{W1}"
		dc.w $FFFF
		dc.w $26                
						; 0026 MAKE ENTITY NOD 83
		dc.w $83
		dc.w $2D                
						; 002D MOVE ENTITY 83 0 2 1
		dc.b $83
		dc.b 0
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 86 FF 3 1
		dc.b $86
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w $15                
						; 0015 SET ACTSCRIPT 85 FF 46172
		dc.b $85
		dc.b $FF
		dc.l eas_46172          
		dc.w $23                
						; 0023 SET ENTITY FACING 83 3
		dc.b $83
		dc.b 3
		dc.w $1C                
						; 001C STOP ENTITY ANIM 85
		dc.w $85
		dc.b $80                
						; WAIT 32
		dc.b $32
		dc.w $2D                
						; 002D MOVE ENTITY 83 0 0 2
		dc.b $83
		dc.b 0
		dc.b 0
		dc.b 2
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 86 0 0 2
		dc.b $86
		dc.b 0
		dc.b 0
		dc.b 2
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 85 FF 0 2
		dc.b $85
		dc.b $FF
		dc.b 0
		dc.b 2
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 83 0 0 1
		dc.b $83
		dc.b 0
		dc.b 0
		dc.b 1
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 86 FF 2 1
		dc.b $86
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 86 3
		dc.b $86
		dc.b 3
		dc.b $80                
						; WAIT 32
		dc.b $32
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 85
		dc.w $85
		dc.w $45                
						; 0045 RELATED TO CAMERA ADJUST TO PLAYER 20
		dc.w $20
		dc.w $2D                
						; 002D MOVE ENTITY 83 0 3 D
		dc.b $83
		dc.b 0
		dc.b 3
		dc.b $D
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 86 0 3 D
		dc.b $86
		dc.b 0
		dc.b 3
		dc.b $D
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 85 FF 3 D
		dc.b $85
		dc.b $FF
		dc.b 3
		dc.b $D
		dc.w $8080
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w $15                
						; 0015 SET ACTSCRIPT 83 FF 45E44
		dc.b $83
		dc.b $FF
		dc.l eas_Jump           
		dc.w $23                
						; 0023 SET ENTITY FACING 83 1
		dc.b $83
		dc.b 1
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 83 : "{LEADER}, you'll be{N}buried in the tower!{W2}"
		dc.w $83
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "Come on!{W1}"
		dc.w $83
		dc.b $80                
						; WAIT 32
		dc.b $32
		dc.w 7                  
						; 0007 EXECUTE MAP SYSTEM EVENT 3A0D2303
		dc.l $3A0D2303
		dc.w $2C                
						; 002C FOLLOW ENTITY 83 0 2
		dc.w $83
		dc.w 0
		dc.w 2
		dc.w $2C                
						; 002C FOLLOW ENTITY 85 83 2
		dc.w $85
		dc.w $83
		dc.w 2
		dc.w $2C                
						; 002C FOLLOW ENTITY 86 85 2
		dc.w $86
		dc.w $85
		dc.w 2
		dc.w $10                
						; 0010 SET FLAG 4A FFFF : Astral + King are followers
		dc.w $4A
		dc.w $FFFF
		dc.w $10                
						; 0010 SET FLAG 280 FFFF : set after the end of battle 7's long sequence, cleared at docks?
		dc.w $280
		dc.w $FFFF
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
word_4A912:
		dc.w $D
		dc.w $17
		dc.w 1
		dc.b $3F
		dc.b $3F
		dc.b 0
		dc.b $B2
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 0
		dc.b $B2
		dc.l eas_Init           
		dc.b $D
		dc.b $11
		dc.b 1
		dc.b $A4
		dc.l eas_Init           
		dc.b $D
		dc.b $15
		dc.b 1
		dc.b $D1
		dc.l eas_Init           
		dc.b $C
		dc.b $E
		dc.b 3
		dc.b $CC
		dc.l eas_Init           
		dc.b $C
		dc.b $1B
		dc.b 1
		dc.b $CB
		dc.l eas_Init           
		dc.b $E
		dc.b $1B
		dc.b 1
		dc.b $CD
		dc.l eas_Init           
		dc.w $FFFF
