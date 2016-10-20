
; ASM FILE data\battles\entries\battle26\cs_beforebattle.asm :
; 0x4B958..0x4BCAA : Cutscene before battle 26
bbcs_26:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR A24 : "Answer me!{N}Where are you going?{W1}"
		dc.w $A24
		dc.w $37                
						; 0037 LOAD MAP AND FADE IN 48 2 14
		dc.w $48
		dc.w 2
		dc.w $14
		dc.w $42                
						; 0042 RELATED TO LOADING MAP ENTITIES 4BC5A
		dc.l word_4BC5A
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
						; 0019 SET ENTITY POS AND FACING 7 6 1A 0
		dc.b 7
		dc.b 6
		dc.b $1A
		dc.b 0
		dc.w $15                
						; 0015 SET ACTSCRIPT 1F FF 460CE
		dc.b $1F
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1F 6 18 0
		dc.b $1F
		dc.b 6
		dc.b $18
		dc.b 0
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1E 6 19 0
		dc.b $1E
		dc.b 6
		dc.b $19
		dc.b 0
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.w $45                
						; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
		dc.w $30
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Answer me!{N}Where are you going?{W1}"
		dc.w $80
		dc.w $32                
						; 0032 SET CAMERA DEST D 9
		dc.w $D
		dc.w 9
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C013 : "Ah...I...{W1}"
		dc.w $C013
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "You were going to South{N}Parmecia to get help, right?{W1}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C013 : "I...uh...{W1}"
		dc.w $C013
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 80 : "Paladins of Pacalon are{N}cowards!  {NAME;19}, don't{N}you have any pride?{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Wimp!{W1}"
		dc.w $80
		dc.w $2D                
						; 002D MOVE ENTITY 85 FF 1 2
		dc.b $85
		dc.b $FF
		dc.b 1
		dc.b 2
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 85 1
		dc.b $85
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C085 : "Shut up!  Mr. {NAME;19} is{N}the bravest soldier in the{N}world!{W1}"
		dc.w $C085
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C013 : "I can defend myself.{W1}"
		dc.w $C013
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Come on, you half-breed!{W1}"
		dc.w $80
		dc.w $23                
						; 0023 SET ENTITY FACING 80 1
		dc.b $80
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Are you afraid of me?{N}I'll turn my back to you.{N}Now, run away you cowards!{W1}"
		dc.w $80
		dc.w $15                
						; 0015 SET ACTSCRIPT 85 FF 45E44
		dc.b $85
		dc.b $FF
		dc.l eas_Jump           
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C085 : "You've gone too far!{W1}"
		dc.w $C085
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 85
		dc.b $85
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
						; 002D MOVE ENTITY 85 0 1 3
		dc.b $85
		dc.b 0
		dc.b 1
		dc.b 3
		dc.w $8080
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $22                
						; 0022 ANIMATE ENTITY FADE INOUT 80
		dc.w $80
		dc.w 6
		dc.w $16                
						; 0016 WAIT UNTIL IDLE ENTITY 85
		dc.w $85
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $15                
						; 0015 SET ACTSCRIPT 85 0 461B6
		dc.b $85
		dc.b 0
		dc.l eas_461B6          
		dc.b $80                
						; WAIT 78
		dc.b $78
		dc.w $23                
						; 0023 SET ENTITY FACING 83 2
		dc.b $83
		dc.b 2
		dc.w $23                
						; 0023 SET ENTITY FACING 85 3
		dc.b $85
		dc.b 3
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 83
		dc.b $83
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
		dc.w $2D                
						; 002D MOVE ENTITY 83 0 2 1
		dc.b $83
		dc.b 0
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.b $80                
						; WAIT 3
		dc.b 3
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 85
		dc.b $85
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
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 2
		dc.w 2
		dc.w $15                
						; 0015 SET ACTSCRIPT 85 FF 45E6C
		dc.b $85
		dc.b $FF
		dc.l eas_JumpLeft       
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 0
		dc.w 0
		dc.w $15                
						; 0015 SET ACTSCRIPT 85 FF 45E6C
		dc.b $85
		dc.b $FF
		dc.l eas_JumpLeft       
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C085 : "Aaaauuuuu!{W1}"
		dc.w $C085
		dc.w $15                
						; 0015 SET ACTSCRIPT 85 FF 46024
		dc.b $85
		dc.b $FF
		dc.l eas_Die            
		dc.w $32                
						; 0032 SET CAMERA DEST D D
		dc.w $D
		dc.w $D
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 80 12 13 1
		dc.b $80
		dc.b $12
		dc.b $13
		dc.b 1
		dc.w $22                
						; 0022 ANIMATE ENTITY FADE INOUT 80
		dc.w $80
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Pacalon soldiers have no{N}honor.  They attack while{N}my back is turned!{W1}"
		dc.w $80
		dc.w $15                
						; 0015 SET ACTSCRIPT 86 FF 45E44
		dc.b $86
		dc.b $FF
		dc.l eas_Jump           
		dc.w $23                
						; 0023 SET ENTITY FACING 13 3
		dc.b $13
		dc.b 3
		dc.w $23                
						; 0023 SET ENTITY FACING 86 3
		dc.b $86
		dc.b 3
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $2D                
						; 002D MOVE ENTITY 86 FF 2 1
		dc.b $86
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C086 : "What?!{W2}"
		dc.w $C086
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C086 : "If Mr. {NAME;19} was not{N}ill, you'd be history!{W1}"
		dc.w $C086
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 80 : "Oh, is {NAME;19} ill?{W1}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "In that case, you can try{N}and take me.{W1}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C086 : "I can no longer put up with{N}these insults!{W1}"
		dc.w $C086
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C013 : "No, no!{W1}"
		dc.w $C013
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 81 D 12 0
		dc.b $81
		dc.b $D
		dc.b $12
		dc.b 0
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
		dc.w $2D                
						; 002D MOVE ENTITY 86 0 3 2
		dc.b $86
		dc.b 0
		dc.b 3
		dc.b 2
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 81 0 0 4
		dc.b $81
		dc.b 0
		dc.b 0
		dc.b 4
		dc.w $8080
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 86
		dc.b $86
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
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 3
		dc.w 3
		dc.w $15                
						; 0015 SET ACTSCRIPT 86 FF 45E94
		dc.b $86
		dc.b $FF
		dc.l eas_JumpRight      
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 0
		dc.w 0
		dc.w $15                
						; 0015 SET ACTSCRIPT 86 FF 45E94
		dc.b $86
		dc.b $FF
		dc.l eas_JumpRight      
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C086 : "Grruuu....{W1}"
		dc.w $C086
		dc.w $15                
						; 0015 SET ACTSCRIPT 86 FF 46024
		dc.b $86
		dc.b $FF
		dc.l eas_Die            
		dc.w $23                
						; 0023 SET ENTITY FACING 81 3
		dc.b $81
		dc.b 3
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 1 2
		dc.b $80
		dc.b $FF
		dc.b 1
		dc.b 2
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "You look so sad,{N}{NAME;19}....{W1}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C013 : "You're not just a normal{N}devil soldier.{W1}"
		dc.w $C013
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 80 : "You're right, {NAME;19}.{N}I see why you're the leader{N}of the Pacalon Army.{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "I'm Geshp!  An adviser for{N}Zeon!{W1}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C013 : "How did you know my name?{W1}"
		dc.w $C013
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "I know everything.{W1}"
		dc.w $80
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C013 : "Now, tell me the reason why{N}"
		dc.w $C013
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C013 : "you're keeping me alive.{W1}"
		dc.w $C013
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Ha, ha!  You're smart!{W1}"
		dc.w $80
		dc.w $22                
						; 0022 ANIMATE ENTITY FADE INOUT 84
		dc.w $84
		dc.w 4
		dc.w $18                
						; 0018 FLASH ENTITY WHITE 80 1E
		dc.w $80
		dc.w $1E
		dc.w $32                
						; 0032 SET CAMERA DEST D B
		dc.w $D
		dc.w $B
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 84 12 C 3
		dc.b $84
		dc.b $12
		dc.b $C
		dc.b 3
		dc.w $22                
						; 0022 ANIMATE ENTITY FADE INOUT 84
		dc.w $84
		dc.w 5
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C013 : "What did you do?{W1}"
		dc.w $C013
		dc.w $2D                
						; 002D MOVE ENTITY 84 FF 3 1
		dc.b $84
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $22                
						; 0022 ANIMATE ENTITY FADE INOUT 84
		dc.w $84
		dc.w 4
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C013 : "I...can't...!{N}My body won't...{W1}"
		dc.w $C013
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 13
		dc.w $13
		dc.w $1C                
						; 001C STOP ENTITY ANIM 13
		dc.w $13
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 80 : "I came here to borrow your{N}body.{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Ha, ha!  Welcome our new{N}leader!{W1}"
		dc.w $80
		dc.w $1C                
						; 001C STOP ENTITY ANIM 13
		dc.w $13
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 13
		dc.b $13
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
						; 0000 DISPLAY SINGLE TEXTBOX C01F : "Stop!!!{W1}"
		dc.w $C01F
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
						; 0015 SET ACTSCRIPT 81 0 45E44
		dc.b $81
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 80 FF 45E44
		dc.b $80
		dc.b $FF
		dc.l eas_Jump           
		dc.w $32                
						; 0032 SET CAMERA DEST D F
		dc.w $D
		dc.w $F
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 3 3
		dc.b $80
		dc.b $FF
		dc.b 3
		dc.b 3
		dc.w $8080
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
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 2 1
		dc.b $80
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Who said that?{W1}"
		dc.w $80
		dc.w $32                
						; 0032 SET CAMERA DEST 2 14
		dc.w 2
		dc.w $14
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $32                
						; 0032 SET CAMERA DEST D F
		dc.w $D
		dc.w $F
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 80 : "A force from the south?{N}How?{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Where did you come from?{W1}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C01F : "We're from Granseal!{W1}"
		dc.w $C01F
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "But, that's on the other....{W1}"
		dc.w $80
		dc.w $15                
						; 0015 SET ACTSCRIPT 80 FF 46172
		dc.b $80
		dc.b $FF
		dc.l eas_46172          
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 80
		dc.b $80
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
						; 002D MOVE ENTITY 80 FF 0 2
		dc.b $80
		dc.b $FF
		dc.b 0
		dc.b 2
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "I'd better leave...{W2}"
		dc.w $80
		dc.w $23                
						; 0023 SET ENTITY FACING 80 1
		dc.b $80
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Devil soldiers!  Stop that{N}force from Granseal!{W1}"
		dc.w $80
		dc.w $23                
						; 0023 SET ENTITY FACING 80 3
		dc.b $80
		dc.b 3
		dc.w $15                
						; 0015 SET ACTSCRIPT 81 0 45E44
		dc.b $81
		dc.b 0
		dc.l eas_Jump           
		dc.w $22                
						; 0022 ANIMATE ENTITY FADE INOUT 80
		dc.w $80
		dc.w 6
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
word_4BC5A:
		dc.w 7
		dc.w $19
		dc.w 0
		dc.b 6
		dc.b $1A
		dc.b 0
		dc.b 7
		dc.l eas_Init           
		dc.b $12
		dc.b $E
		dc.b 1
		dc.b $13
		dc.l eas_Init           
		dc.b $12
		dc.b $B
		dc.b 3
		dc.b $9F
		dc.l eas_Init           
		dc.b $11
		dc.b $B
		dc.b 3
		dc.b $6D
		dc.l eas_Init           
		dc.b $13
		dc.b $B
		dc.b 3
		dc.b $91
		dc.l eas_Init           
		dc.b $14
		dc.b $A
		dc.b 3
		dc.b $53
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $6A
		dc.l eas_Init           
		dc.b $11
		dc.b $F
		dc.b 1
		dc.b $E9
		dc.l eas_Init           
		dc.b $13
		dc.b $F
		dc.b 1
		dc.b $E9
		dc.l eas_Init           
		dc.w $FFFF
