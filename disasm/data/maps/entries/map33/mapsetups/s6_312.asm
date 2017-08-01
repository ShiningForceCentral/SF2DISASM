
; ASM FILE data\maps\entries\map33\mapsetups\s6_312.asm :
; 0x5AC56..0x5B5B6 : 

; =============== S U B R O U T I N E =======================================

ms_map33_flag312_InitFunction:
		
		rts

	; End of function ms_map33_flag312_InitFunction

cs_5AC58:
		textCursor $70C         
						; Initial text line $70C : "You may go now.{N}I need to talk to fairy.{W1}"
		nextSingleText $0,$81   
						; "You may go now.{N}I need to talk to fairy.{W1}"
		nextSingleText $0,$80   
						; "Yes, sir.{W1}"
		setCamDest $C,$B        
						; 0032 SET CAMERA DEST C B
		csWait $1E              
						; WAIT 1E
		csc47 $11,$B            
						; 0047 UNKNOWN
		entityPosDir $80,$11,$B,$3
						; 0019 SET ENTITY POS AND FACING 80 11 B 3
		moveEntity $80,$FF,$3,$3
						; 002D MOVE ENTITY 80 FF 3 3
		endMove $8080
		csWait $5               
						; WAIT 5
		setActscript $80,$0,eas_461B6
						; 0015 SET ACTSCRIPT 80 0 461B6
		csWait $50              
						; WAIT 50
		nextSingleText $0,$80   
						; "Tum-de-dum-dum.  Oh...{N}Time to check the{N}collections.{W1}"
		setCameraEntity $80     
						; 0024 SET ENTITY FOLLOWED BY CAMERA 80
		moveEntity $80,$FF,$2,$5
						; 002D MOVE ENTITY 80 FF 2 5
		endMove $8080
		setEntityDir $80,$1     
						; 0023 SET ENTITY FACING 80 1
		setActscript $7,$FF,eas_Init
						; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init
						; 0015 SET ACTSCRIPT 1F FF 460CE
		entityPosDir $7,$F,$15,$1
						; 0019 SET ENTITY POS AND FACING 7 F 15 1
		entityPosDir $0,$F,$16,$1
						; 0019 SET ENTITY POS AND FACING 0 F 16 1
		entityPosDir $1F,$F,$17,$1
						; 0019 SET ENTITY POS AND FACING 1F F 17 1
		csc47 $F,$14            
						; 0047 UNKNOWN
		setCamDest $8,$C        
						; 0032 SET CAMERA DEST 8 C
		csWait $1E              
						; WAIT 1E
		nextSingleText $FF,$FF  
						; "Servant Goliath unlocks the{N}door.{W1}"
		moveEntity $7,$0,$1,$4  
						; 002D MOVE ENTITY 7 0 1 4
		moreMove $2,$3
		moreMove $1,$1
		endMove $8080
		moveEntity $0,$0,$1,$5  
						; 002D MOVE ENTITY 0 0 1 5
		moreMove $2,$3
		endMove $8080
		moveEntity $1F,$FF,$1,$6
						; 002D MOVE ENTITY 1F FF 1 6
		moreMove $2,$2
		endMove $8080
		setEntityDir $0,$1      
						; 0023 SET ENTITY FACING 0 1
		setEntityDir $1F,$1     
						; 0023 SET ENTITY FACING 1F 1
		nextSingleText $0,$7    
						; "Excuse me.{W1}"
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		nextSingleText $0,$80   
						; "Yeow!{W1}"
		stopEntity $80          
						; 001C STOP ENTITY ANIM 80
		csWait $1E              
						; WAIT 1E
		setEntityDir $80,$0     
						; 0023 SET ENTITY FACING 80 0
		csWait $3C              
						; WAIT 3C
		setEntityDir $80,$3     
						; 0023 SET ENTITY FACING 80 3
		csWait $1E              
						; WAIT 1E
		startEntity $80         
						; 001B START ENTITY ANIM 80
		nextSingleText $0,$80   
						; "Y...yes?{W1}"
		moveEntity $7,$FF,$1,$1 
						; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		nextSingleText $0,$7    
						; "We've come to see Mr. Creed.{W1}"
		nextText $0,$80         
						; "My master?{W2}"
		nextSingleText $0,$80   
						; "Do you have an appointment?{W1}"
		nextSingleText $0,$7    
						; "A what?{W1}"
		moveEntity $7,$FF,$3,$1 
						; 002D MOVE ENTITY 7 FF 3 1
		endMove $8080
		entityShakeHead $0      
						; 0027 MAKE ENTITY SHAKE HEAD 0
		moveEntity $7,$FF,$1,$1 
						; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		nextSingleText $0,$7    
						; "No, not yet, but...{W1}"
		nextText $0,$80         
						; "I'm sorry, but he's busy now.{W2}"
		nextSingleText $0,$80   
						; "Please come back later.{W1}"
		moveEntity $7,$FF,$3,$1 
						; 002D MOVE ENTITY 7 FF 3 1
		endMove $8080
		nextSingleText $0,$7    
						; "We can't see Mr. Creed now.{W1}"
		setEntityDir $0,$0      
						; 0023 SET ENTITY FACING 0 0
		setEntityDir $1F,$2     
						; 0023 SET ENTITY FACING 1F 2
		nextText $0,$1F         
						; "No kidding!{W2}"
		nextSingleText $0,$1F   
						; "{LEADER}, {NAME;7}, let's{N}force our way into the room!{W1}"
		moveEntity $7,$FF,$0,$1 
						; 002D MOVE ENTITY 7 FF 0 1
		endMove $8080
		setEntityDir $7,$3      
						; 0023 SET ENTITY FACING 7 3
		setEntityDir $0,$1      
						; 0023 SET ENTITY FACING 0 1
		setEntityDir $1F,$1     
						; 0023 SET ENTITY FACING 1F 1
		nextText $0,$7          
						; "Oddler, you're getting bold.{W2}"
		nextSingleText $0,$7    
						; "But, it is a good idea.{W1}"
		setEntityDir $80,$1     
						; 0023 SET ENTITY FACING 80 1
		csWait $A               
						; WAIT A
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		moveEntity $7,$FF,$2,$1 
						; 002D MOVE ENTITY 7 FF 2 1
		endMove $8080
		setEntityDir $0,$1      
						; 0023 SET ENTITY FACING 0 1
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		setEntityDir $1F,$1     
						; 0023 SET ENTITY FACING 1F 1
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		csWait $A               
						; WAIT A
		nextSingleText $0,$80   
						; "Hmmmph....{W1}"
		csWait $14              
						; WAIT 14
		nextSingleText $0,$7    
						; "Let's go!{W1}"
		setCameraEntity $0      
						; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		setActscript $0,$0,eas_Jump
						; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $7,$0,eas_Jump
						; 0015 SET ACTSCRIPT 7 0 45E44
		setActscript $1F,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 1F FF 45E44
		customActscript $0,$FF  
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $10                
						;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $7,$FF  
						; 0014 SET MANUAL ACTSCRIPT 7
		dc.w $10                
						;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $1F,$FF 
						; 0014 SET MANUAL ACTSCRIPT 1F
		dc.w $10                
						;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $7,$0,$0,$5  
						; 002D MOVE ENTITY 7 0 0 5
		moreMove $1,$3
		endMove $8080
		moveEntity $1F,$0,$0,$5 
						; 002D MOVE ENTITY 1F 0 0 5
		moreMove $1,$3
		endMove $8080
		moveEntity $0,$0,$0,$5  
						; 002D MOVE ENTITY 0 0 0 5
		moreMove $1,$3
		endMove $8080
		csWait $A               
						; WAIT A
		animEntityFadeInOut $80,$2
						; 0022 ANIMATE ENTITY FADE INOUT 80
		entityPosDir $80,$11,$C,$3
						; 0019 SET ENTITY POS AND FACING 80 11 C 3
		animEntityFadeInOut $80,$3
						; 0022 ANIMATE ENTITY FADE INOUT 80
		waitIdle $0             
						; 0016 WAIT UNTIL IDLE ENTITY 0
		setActscript $7,$0,eas_BumpUp
						; 0015 SET ACTSCRIPT 7 0 45F0C
		setActscript $1F,$0,eas_BumpUp
						; 0015 SET ACTSCRIPT 1F 0 45F0C
		setActscript $0,$FF,eas_BumpUp
						; 0015 SET ACTSCRIPT 0 FF 45F0C
		nextSingleText $0,$7    
						; "How did he do that?{W1}"
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		nextText $0,$80         
						; "You impolite kids!{N}You can't go in!{W2}"
		nextSingleText $0,$80   
						; "Mr. Creed is too busy!{N}Go away!{W1}"
		setActscript $0,$FF,eas_46172
						; 0015 SET ACTSCRIPT 0 FF 46172
		setActscript $7,$FF,eas_46172
						; 0015 SET ACTSCRIPT 7 FF 46172
		setActscript $1F,$FF,eas_46172
						; 0015 SET ACTSCRIPT 1F FF 46172
		customActscript $0,$FF  
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $10                
						;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $7,$FF  
						; 0014 SET MANUAL ACTSCRIPT 7
		dc.w $10                
						;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $1F,$FF 
						; 0014 SET MANUAL ACTSCRIPT 1F
		dc.w $10                
						;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $0,$0,$3,$1  
						; 002D MOVE ENTITY 0 0 3 1
		endMove $8080
		moveEntity $7,$0,$3,$1  
						; 002D MOVE ENTITY 7 0 3 1
		endMove $8080
		moveEntity $1F,$FF,$3,$1
						; 002D MOVE ENTITY 1F FF 3 1
		endMove $8080
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $7,$FF,eas_Init
						; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init
						; 0015 SET ACTSCRIPT 1F FF 460CE
		csWait $19              
						; WAIT 19
		csWait $5               
						; WAIT 5
		setActscript $7,$0,eas_461B6
						; 0015 SET ACTSCRIPT 7 0 461B6
		csWait $78              
						; WAIT 78
		nextText $0,$7          
						; "{LEADER}, on our left!{N}That door might lead to{N}Mr. Creed!{W2}"
		setEntityDir $7,$3      
						; 0023 SET ENTITY FACING 7 3
		nextSingleText $0,$7    
						; "Let's ditch this guy and go{N}through that door.{W1}"
		setEntityDir $0,$0      
						; 0023 SET ENTITY FACING 0 0
		setEntityDir $1F,$2     
						; 0023 SET ENTITY FACING 1F 2
		nextSingleText $0,$1F   
						; "{LEADER}, let's do it!{N}I don't want to fail now!{W1}"
		entityNod $0            
						; 0026 MAKE ENTITY NOD 0
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		nextText $0,$7          
						; "OK, OK.  We give up.{W2}"
		nextSingleText $0,$7    
						; "We'll see Mr. Creed later.{N}Let's get out of here.{W1}"
		setEntityDir $1F,$1     
						; 0023 SET ENTITY FACING 1F 1
		setEntityDir $0,$1      
						; 0023 SET ENTITY FACING 0 1
		nextSingleText $0,$1F   
						; "Yeah, maybe later.{W1}"
		followEntity $7,$0,$2   
						; 002C FOLLOW ENTITY 7 0 2
		followEntity $1F,$7,$2  
						; 002C FOLLOW ENTITY 1F 7 2
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5AF36:
		textCursor $72A         
						; Initial text line $72A : "No, don't go in there!{N}That door is...!{W1}"
		setActscript $80,$FF,eas_Init
						; 0015 SET ACTSCRIPT 80 FF 460CE
		setActscript $80,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 80 FF 45E44
		customActscript $80,$FF 
						; 0014 SET MANUAL ACTSCRIPT 80
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$FF,$3,$2
						; 002D MOVE ENTITY 80 FF 3 2
		moreMove $2,$2
		endMove $8080
		setCameraEntity $80     
						; 0024 SET ENTITY FOLLOWED BY CAMERA 80
		nextSingleText $0,$80   
						; "No, don't go in there!{N}That door is...!{W1}"
		flashScreenWhite $4     
						; 0041 FLASH SCREEN WHITE 4
		csWait $28              
						; WAIT 28
		flashScreenWhite $4     
						; 0041 FLASH SCREEN WHITE 4
		csWait $1E              
						; WAIT 1E
		flashScreenWhite $4     
						; 0041 FLASH SCREEN WHITE 4
		csWait $5               
						; WAIT 5
		setActscript $0,$0,eas_461B6
						; 0015 SET ACTSCRIPT 0 0 461B6
		csWait $5               
						; WAIT 5
		setActscript $7,$0,eas_461E4
						; 0015 SET ACTSCRIPT 7 0 461E4
		csWait $5               
						; WAIT 5
		setActscript $1F,$0,eas_461B6
						; 0015 SET ACTSCRIPT 1F 0 461B6
		csWait $14              
						; WAIT 14
		flashScreenWhite $4     
						; 0041 FLASH SCREEN WHITE 4
		csWait $A               
						; WAIT A
		flashScreenWhite $1E    
						; 0041 FLASH SCREEN WHITE 1E
		setActscript $0,$0,eas_463AE
						; 0015 SET ACTSCRIPT 0 0 463AE
		setActscript $7,$0,eas_463AE
						; 0015 SET ACTSCRIPT 7 0 463AE
		setActscript $1F,$0,eas_463AE
						; 0015 SET ACTSCRIPT 1F 0 463AE
		csWait $3C              
						; WAIT 3C
		nextSingleText $0,$80   
						; "What stupid kids!{W1}"
		setActscript $80,$FF,eas_Init
						; 0015 SET ACTSCRIPT 80 FF 460CE
		moveEntity $80,$FF,$2,$3
						; 002D MOVE ENTITY 80 FF 2 3
		endMove $8080
		setEntityDir $80,$1     
						; 0023 SET ENTITY FACING 80 1
		nextText $0,$80         
						; "Whoever passes through this{N}magic door becomes small.{W2}"
		nextSingleText $0,$80   
						; "That is, anybody who's not{N}protected by Mr. Creed.{W1}"
		stopEntity $80          
						; 001C STOP ENTITY ANIM 80
		csWait $14              
						; WAIT 14
		nextSingleText $FF,$FF  
						; "Goliath picks up{N}{LEADER}.{W1}"
		startEntity $80         
						; 001B START ENTITY ANIM 80
		nextSingleText $0,$80   
						; "Now, you're part of the{N}collection!{W1}"
		csc47 $C,$D             
						; 0047 UNKNOWN
		moveEntity $80,$FF,$1,$2
						; 002D MOVE ENTITY 80 FF 1 2
		moreMove $2,$5
		moreMove $9,$14
		endMove $8080
		setActscript $80,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 80 FF 45E44
		csWait $14              
						; WAIT 14
		mapSysEvent $16000003   
						; 0007 EXECUTE MAP SYSTEM EVENT 16000003
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5B016:
		textCursor $730         
						; Initial text line $730 : "Goliath...Goliath!{W1}"
		csc46 $C,$2             
						; 0046 UNKNOWN
		entityPosDir $0,$3F,$3F,$3
						; 0019 SET ENTITY POS AND FACING 0 3F 3F 3
		entityPosDir $7,$3F,$3F,$3
						; 0019 SET ENTITY POS AND FACING 7 3F 3F 3
		entityPosDir $1F,$3F,$3F,$3
						; 0019 SET ENTITY POS AND FACING 1F 3F 3F 3
		fadeInB                 
						; 0039 FADE IN FROM BLACK
		csWait $28              
						; WAIT 28
		nextSingleText $80,$81  
						; "Goliath...Goliath!{W1}"
		moveEntity $81,$FF,$3,$1
						; 002D MOVE ENTITY 81 FF 3 1
		moreMove $2,$2
		endMove $8080
		setEntityDir $81,$3     
						; 0023 SET ENTITY FACING 81 3
		nextSingleText $80,$81  
						; "Goliath!!!{W1}"
		nextSingleText $0,$80   
						; "I'm here!  I'm coming!{W1}"
		entityPosDir $80,$11,$E,$1
						; 0019 SET ENTITY POS AND FACING 80 11 E 1
		setCamDest $C,$4        
						; 0032 SET CAMERA DEST C 4
		moveEntity $80,$FF,$1,$2
						; 002D MOVE ENTITY 80 FF 1 2
		endMove $8080
		csc47 $11,$B            
						; 0047 UNKNOWN
		moveEntity $80,$FF,$1,$3
						; 002D MOVE ENTITY 80 FF 1 3
		endMove $8080
		nextSingleText $0,$80   
						; "Yes, Mr. Creed?{W1}"
		nextSingleText $80,$81  
						; "My collection is rather noisy{N}today.{W1}"
		csWait $A               
						; WAIT A
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		nextSingleText $0,$80   
						; "Oh, yes...ah...{W1}"
		nextSingleText $80,$81  
						; "What?{W1}"
		entityShakeHead $80     
						; 0027 MAKE ENTITY SHAKE HEAD 80
		nextSingleText $0,$80   
						; "No, I...I added to your{N}collection today.{W1}"
		customActscript $81,$FF 
						; 0014 SET MANUAL ACTSCRIPT 81
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $81,$FF,$3,$1
						; 002D MOVE ENTITY 81 FF 3 1
		endMove $8080
		nextSingleText $80,$81  
						; "You did what?!{W1}"
		setQuakeAmount $3       
						; 0033 SET QUAKE AMOUNT 3
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		setQuakeAmount $0       
						; 0033 SET QUAKE AMOUNT 0
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		nextText $0,$80         
						; "I'm sorry!{W2}"
		nextSingleText $0,$80   
						; "I tried to stop them, but they{N}jumped through the magic door.{W1}"
		nextText $80,$81        
						; "You didn't lock the door, did{N}you?{W2}"
		nextSingleText $80,$81  
						; "I told you to always lock{N}that door!{W1}"
		setQuakeAmount $3       
						; 0033 SET QUAKE AMOUNT 3
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		setQuakeAmount $0       
						; 0033 SET QUAKE AMOUNT 0
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		csWait $14              
						; WAIT 14
		setEntityDir $81,$1     
						; 0023 SET ENTITY FACING 81 1
		csWait $1E              
						; WAIT 1E
		customActscript $81,$FF 
						; 0014 SET MANUAL ACTSCRIPT 81
		dc.w $10                
						;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $81,$FF,$1,$1
						; 002D MOVE ENTITY 81 FF 1 1
		endMove $8080
		csWait $14              
						; WAIT 14
		setEntityDir $81,$3     
						; 0023 SET ENTITY FACING 81 3
		nextSingleText $80,$81  
						; "Anyway, I want to see them.{W1}"
		entityNod $80           
						; 0026 MAKE ENTITY NOD 80
		nextSingleText $0,$80   
						; "Right away, sir!{W1}"
		customActscript $80,$FF 
						; 0014 SET MANUAL ACTSCRIPT 80
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$FF,$3,$5
						; 002D MOVE ENTITY 80 FF 3 5
		endMove $8080
		setEntityDir $81,$1     
						; 0023 SET ENTITY FACING 81 1
		csWait $78              
						; WAIT 78
		setEntityDir $81,$3     
						; 0023 SET ENTITY FACING 81 3
		nextSingleText $80,$81  
						; "What?{W1}"
		csWait $5               
						; WAIT 5
		setActscript $81,$0,eas_461B6
						; 0015 SET ACTSCRIPT 81 0 461B6
		csWait $78              
						; WAIT 78
		moveEntity $81,$FF,$3,$1
						; 002D MOVE ENTITY 81 FF 3 1
		moreMove $2,$1
		endMove $8080
		csWait $14              
						; WAIT 14
		nextSingleText $FF,$FF  
						; "Ah...{W1}"
		csWait $5               
						; WAIT 5
		setActscript $81,$0,eas_461B6
						; 0015 SET ACTSCRIPT 81 0 461B6
		nextSingleText $80,$81  
						; "I heard something.{W1}"
		csWait $1E              
						; WAIT 1E
		moveEntity $81,$FF,$2,$1
						; 002D MOVE ENTITY 81 FF 2 1
		endMove $8080
		nextSingleText $0,$7    
						; "Are you Mr. Creed?{W1}"
		setEntityDir $81,$3     
						; 0023 SET ENTITY FACING 81 3
		csWait $14              
						; WAIT 14
		setActscript $81,$FF,eas_Init
						; 0015 SET ACTSCRIPT 81 FF 460CE
		setActscript $81,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 81 FF 45E44
		nextText $80,$81        
						; "Oh, someone from my{N}collection is talking!{W2}"
		nextSingleText $80,$81  
						; "You must be one of the people{N}Goliath was talking about.{W1}"
		nextText $0,$7          
						; "We came to see you.{W2}"
		nextSingleText $0,$7    
						; "Please return us to our{N}original size.{W1}"
		nextText $80,$81        
						; "You came to see me?{W2}"
		nextSingleText $80,$81  
						; "Hmmm...why?{W1}"
		nextSingleText $0,$7    
						; "Make us bigger.  My neck{N}hurts from looking up at you!{W1}"
		nextSingleText $80,$81  
						; "Oh, sorry. {W1}"
		customActscript $81,$FF 
						; 0014 SET MANUAL ACTSCRIPT 81
		dc.w $10                
						;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $81,$FF,eas_46172
						; 0015 SET ACTSCRIPT 81 FF 46172
		moveEntity $81,$FF,$1,$1
						; 002D MOVE ENTITY 81 FF 1 1
		endMove $8080
		csWait $28              
						; WAIT 28
		entityShiver $81        
						; 002A MAKE ENTITY SHIVER 81
		csWait $1E              
						; WAIT 1E
		entityShiver $81        
						; 002A MAKE ENTITY SHIVER 81
		csWait $14              
						; WAIT 14
		nextSingleText $80,$81  
						; "Abra kadabra!  1-2-3!{W1}"
		flashScreenWhite $4     
						; 0041 FLASH SCREEN WHITE 4
		csWait $28              
						; WAIT 28
		flashScreenWhite $4     
						; 0041 FLASH SCREEN WHITE 4
		csWait $1E              
						; WAIT 1E
		flashScreenWhite $4     
						; 0041 FLASH SCREEN WHITE 4
		csWait $14              
						; WAIT 14
		flashScreenWhite $4     
						; 0041 FLASH SCREEN WHITE 4
		csWait $A               
						; WAIT A
		flashScreenWhite $1E    
						; 0041 FLASH SCREEN WHITE 1E
		entityPosDir $0,$10,$9,$3
						; 0019 SET ENTITY POS AND FACING 0 10 9 3
		setActscript $0,$0,eas_46310
						; 0015 SET ACTSCRIPT 0 0 46310
		entityPosDir $7,$F,$9,$3
						; 0019 SET ENTITY POS AND FACING 7 F 9 3
		setActscript $7,$0,eas_46310
						; 0015 SET ACTSCRIPT 7 0 46310
		entityPosDir $1F,$11,$9,$3
						; 0019 SET ENTITY POS AND FACING 1F 11 9 3
		setActscript $1F,$0,eas_46310
						; 0015 SET ACTSCRIPT 1F 0 46310
		csWait $3C              
						; WAIT 3C
		csWait $5               
						; WAIT 5
		setActscript $0,$0,eas_461B6
						; 0015 SET ACTSCRIPT 0 0 461B6
		csWait $5               
						; WAIT 5
		setActscript $7,$0,eas_461E4
						; 0015 SET ACTSCRIPT 7 0 461E4
		csWait $5               
						; WAIT 5
		setActscript $1F,$0,eas_461B6
						; 0015 SET ACTSCRIPT 1F 0 461B6
		csWait $78              
						; WAIT 78
		setEntityDir $7,$0      
						; 0023 SET ENTITY FACING 7 0
		nextSingleText $0,$7    
						; "Wow, we're back to normal!{N}I can't believe we were so{N}small!{W1}"
		entityNod $0            
						; 0026 MAKE ENTITY NOD 0
		entityNod $0            
						; 0026 MAKE ENTITY NOD 0
		setEntityDir $0,$0      
						; 0023 SET ENTITY FACING 0 0
		entityNod $1F           
						; 0026 MAKE ENTITY NOD 1F
		entityNod $1F           
						; 0026 MAKE ENTITY NOD 1F
		nextSingleText $80,$81  
						; "Now, why did you want to see{N}me?{W1}"
		setEntityDir $0,$1      
						; 0023 SET ENTITY FACING 0 1
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		setEntityDir $1F,$1     
						; 0023 SET ENTITY FACING 1F 1
		nextSingleText $0,$7    
						; "Oh, yes!{N}We want to know about Zeon!{W1}"
		nextSingleText $0,$82   
						; "Zeon?{W1}"
		entityPosDir $82,$10,$0,$3
						; 0019 SET ENTITY POS AND FACING 82 10 0 3
		moveEntity $82,$FF,$3,$7
						; 002D MOVE ENTITY 82 FF 3 7
		endMove $8080
		nextSingleText $0,$82   
						; "You said Zeon?{W1}"
		nextSingleText $80,$81  
						; "The King of the Devils who is{N}sealed in Arc Valley?{W1}"
		moveEntity $82,$FF,$3,$1
						; 002D MOVE ENTITY 82 FF 3 1
		endMove $8080
		nextSingleText $0,$82   
						; "Did something happen to{N}Zeon?  Has he revived?{W1}"
		entityNod $0            
						; 0026 MAKE ENTITY NOD 0
		nextSingleText $FF,$FF  
						; "{LEADER} nods.{W1}"
		csWait $5               
						; WAIT 5
		setActscript $82,$0,eas_461B6
						; 0015 SET ACTSCRIPT 82 0 461B6
		nextSingleText $0,$82   
						; "No way!  You're kidding!{N}I can't believe it!{W1}"
		setActscript $81,$FF,eas_Init
						; 0015 SET ACTSCRIPT 81 FF 460CE
		moveEntity $81,$FF,$3,$1
						; 002D MOVE ENTITY 81 FF 3 1
		endMove $8080
		setEntityDir $82,$3     
						; 0023 SET ENTITY FACING 82 3
		setEntityDir $81,$0     
						; 0023 SET ENTITY FACING 81 0
		nextSingleText $80,$81  
						; "Noisy fairy!{N}Be quiet!{W1}"
		setActscript $82,$FF,eas_46172
						; 0015 SET ACTSCRIPT 82 FF 46172
		moveEntity $82,$0,$0,$1 
						; 002D MOVE ENTITY 82 0 0 1
		endMove $8080
		moveEntity $81,$FF,$0,$1
						; 002D MOVE ENTITY 81 FF 0 1
		endMove $8080
		setEntityDir $81,$3     
						; 0023 SET ENTITY FACING 81 3
		nextSingleText $80,$81  
						; "Is what you say true?{W1}"
		entityNod $0            
						; 0026 MAKE ENTITY NOD 0
		nextSingleText $FF,$FF  
						; "{LEADER} nods again.{W1}"
		customActscript $81,$FF 
						; 0014 SET MANUAL ACTSCRIPT 81
		dc.w $10                
						;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $81,$FF,$1,$1
						; 002D MOVE ENTITY 81 FF 1 1
		endMove $8080
		nextSingleText $80,$81  
						; "So, Zeon will appear again....{N}He will destroy everything.{W1}"
		setEntityDir $81,$3     
						; 0023 SET ENTITY FACING 81 3
		moveEntity $80,$FF,$1,$4
						; 002D MOVE ENTITY 80 FF 1 4
		moreMove $0,$1
		moreMove $1,$3
		endMove $8080
		setEntityDir $80,$2     
						; 0023 SET ENTITY FACING 80 2
		setActscript $80,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 80 FF 45E44
		setActscript $80,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 80 FF 45E44
		nextSingleText $0,$80   
						; "Sir, the new additions to{N}your collection are missing!{W1}"
		setEntityDir $82,$1     
						; 0023 SET ENTITY FACING 82 1
		setEntityDir $81,$0     
						; 0023 SET ENTITY FACING 81 0
		nextSingleText $0,$81   
						; "I know.{W1}"
		setEntityDir $81,$3     
						; 0023 SET ENTITY FACING 81 3
		moveEntity $80,$FF,$2,$1
						; 002D MOVE ENTITY 80 FF 2 1
		endMove $8080
		nextSingleText $0,$80   
						; "How...?{W1}"
		setEntityDir $81,$0     
						; 0023 SET ENTITY FACING 81 0
		entityShiver $81        
						; 002A MAKE ENTITY SHIVER 81
		nextSingleText $0,$81   
						; "It doesn't matter how!{N}Now, go away!{W1}"
		setQuakeAmount $4       
						; 0033 SET QUAKE AMOUNT 4
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		setQuakeAmount $0       
						; 0033 SET QUAKE AMOUNT 0
		setActscript $80,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 80 FF 45E44
		setActscript $80,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 80 FF 45E44
		moveEntity $80,$FF,$0,$1
						; 002D MOVE ENTITY 80 FF 0 1
		moreMove $3,$2
		endMove $8080
		csWait $14              
						; WAIT 14
		setActscript $82,$FF,eas_Init2
						; 0015 SET ACTSCRIPT 82 FF 46102
		moveEntity $82,$FF,$1,$1
						; 002D MOVE ENTITY 82 FF 1 1
		endMove $8080
		setEntityDir $82,$2     
						; 0023 SET ENTITY FACING 82 2
		nextSingleText $0,$82   
						; "Wow!  I can't believe this{N}is happening!{W1}"
		setEntityDir $81,$0     
						; 0023 SET ENTITY FACING 81 0
		nextText $0,$81         
						; "You know, Grans Island is{N}covered by a dark cloud.{W2}"
		nextText $0,$81         
						; "At the same time, North{N}Parmecia has had no rain.{W2}"
		nextSingleText $0,$81   
						; "South Parmecia is OK, but....{W1}"
		nextText $0,$82         
						; "That's because of Volcanon.{W2}"
		nextSingleText $0,$82   
						; "I fear for Mitula....{W1}"
		nextText $0,$81         
						; "Volcanon and Mitula are{N}invulnerable to everything, {N}except Zeon!{W2}"
		nextSingleText $0,$81   
						; "Indeed...Zeon is extremely{N}powerful!{W1}"
		setEntityDir $80,$1     
						; 0023 SET ENTITY FACING 80 1
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		setActscript $80,$FF,eas_46172
						; 0015 SET ACTSCRIPT 80 FF 46172
		customActscript $80,$FF 
						; 0014 SET MANUAL ACTSCRIPT 80
		dc.w $10                
						;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$0,$3,$1 
						; 002D MOVE ENTITY 80 0 3 1
		endMove $8080
		nextSingleText $0,$80   
						; "Zeon?  Oh, gosh!{W1}"
		setEntityDir $81,$3     
						; 0023 SET ENTITY FACING 81 3
		nextSingleText $0,$81   
						; "Goliath!  What are you still{N}doing here?!{W1}"
		setQuakeAmount $4       
						; 0033 SET QUAKE AMOUNT 4
		setActscript $80,$FF,eas_Init
						; 0015 SET ACTSCRIPT 80 FF 460CE
		moveEntity $80,$FF,$2,$1
						; 002D MOVE ENTITY 80 FF 2 1
		endMove $8080
		setEntityDir $80,$1     
						; 0023 SET ENTITY FACING 80 1
		setQuakeAmount $0       
						; 0033 SET QUAKE AMOUNT 0
		nextText $80,$81        
						; "I have no time to scold you{N}now!{W2}"
		setEntityDir $81,$2     
						; 0023 SET ENTITY FACING 81 2
		nextSingleText $80,$81  
						; "The Evil Spirit may know{N}something.{W1}"
		setActscript $81,$FF,eas_Init
						; 0015 SET ACTSCRIPT 81 FF 460CE
		moveEntity $81,$FF,$2,$3
						; 002D MOVE ENTITY 81 FF 2 3
		moreMove $1,$2
		moreMove $2,$4
		endMove $8080
		hideEntity $81          
						; 002E HIDE ENTITY 81
		setActscript $82,$FF,eas_Init2
						; 0015 SET ACTSCRIPT 82 FF 46102
		moveEntity $82,$FF,$2,$1
						; 002D MOVE ENTITY 82 FF 2 1
		moreMove $3,$1
		endMove $8080
		nextSingleText $0,$82   
						; "You guys, follow him.{N}Follow him!{W1}"
		moveEntity $82,$FF,$1,$1
						; 002D MOVE ENTITY 82 FF 1 1
		moreMove $2,$3
		moreMove $1,$2
		moreMove $2,$4
		endMove $8080
		hideEntity $82          
						; 002E HIDE ENTITY 82
		followEntity $7,$0,$2   
						; 002C FOLLOW ENTITY 7 0 2
		followEntity $1F,$7,$2  
						; 002C FOLLOW ENTITY 1F 7 2
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5B466:
		textCursor $78C         
						; Initial text line $78C : "Oddler?{W1}"
		setCamDest $C,$F        
						; 0032 SET CAMERA DEST C F
		csWait $14              
						; WAIT 14
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		setEntityDir $0,$1      
						; 0023 SET ENTITY FACING 0 1
		entityShiver $1F        
						; 002A MAKE ENTITY SHIVER 1F
		csWait $14              
						; WAIT 14
		nextSingleText $0,$7    
						; "Oddler?{W1}"
		nextSingleText $0,$81   
						; "I understand you.{W1}"
		setEntityDir $1F,$1     
						; 0023 SET ENTITY FACING 1F 1
		setEntityDir $82,$1     
						; 0023 SET ENTITY FACING 82 1
		entityPosDir $81,$11,$F,$3
						; 0019 SET ENTITY POS AND FACING 81 11 F 3
		setCamDest $C,$7        
						; 0032 SET CAMERA DEST C 7
		setActscript $7,$FF,eas_Init
						; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init
						; 0015 SET ACTSCRIPT 1F FF 460CE
		setActscript $82,$FF,eas_Init
						; 0015 SET ACTSCRIPT 82 FF 460CE
		entityPosDir $0,$F,$17,$1
						; 0019 SET ENTITY POS AND FACING 0 F 17 1
		entityPosDir $7,$F,$16,$1
						; 0019 SET ENTITY POS AND FACING 7 F 16 1
		entityPosDir $1F,$10,$16,$1
						; 0019 SET ENTITY POS AND FACING 1F 10 16 1
		entityPosDir $82,$10,$17,$1
						; 0019 SET ENTITY POS AND FACING 82 10 17 1
		hideEntity $E           
						; 002E HIDE ENTITY E
		hideEntity $10          
						; 002E HIDE ENTITY 10
		hideEntity $11          
						; 002E HIDE ENTITY 11
		hideEntity $F           
						; 002E HIDE ENTITY F
		setCameraEntity $81     
						; 0024 SET ENTITY FOLLOWED BY CAMERA 81
		moveEntity $81,$FF,$3,$2
						; 002D MOVE ENTITY 81 FF 3 2
		moreMove $2,$2
		moreMove $3,$4
		endMove $8080
		setCamDest $A,$12       
						; 0032 SET CAMERA DEST A 12
		nextSingleText $0,$7    
						; "Understand what?{W1}"
		nextText $0,$81         
						; "Oddler will remain here.{W2}"
		moveEntity $81,$FF,$0,$1
						; 002D MOVE ENTITY 81 FF 0 1
		moreMove $B,$1
		endMove $8080
		nextSingleText $0,$81   
						; "Won't you, Oddler?{W1}"
		setEntityDir $7,$0      
						; 0023 SET ENTITY FACING 7 0
		setEntityDir $1F,$2     
						; 0023 SET ENTITY FACING 1F 2
		nextSingleText $0,$7    
						; "Oddler, is this true?{W1}"
		nextText $80,$1F        
						; "I don't know why, but I{N}would like to stay.{W2}"
		nextSingleText $80,$1F  
						; "No, I must stay here....{N}I must stay here....{W1}"
		moveEntity $81,$FF,$2,$1
						; 002D MOVE ENTITY 81 FF 2 1
		moreMove $B,$1
		endMove $8080
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		setEntityDir $1F,$1     
						; 0023 SET ENTITY FACING 1F 1
		nextText $0,$81         
						; "He's weak.{W2}"
		nextSingleText $0,$81   
						; "He had better stay.{N}Say farewell.{W1}"
		moveEntity $1F,$FF,$1,$1
						; 002D MOVE ENTITY 1F FF 1 1
		endMove $8080
		setEntityDir $1F,$2     
						; 0023 SET ENTITY FACING 1F 2
		setEntityDir $81,$0     
						; 0023 SET ENTITY FACING 81 0
		csWait $3C              
						; WAIT 3C
		entityNod $81           
						; 0026 MAKE ENTITY NOD 81
		csWait $1E              
						; WAIT 1E
		moveEntity $81,$FF,$2,$1
						; 002D MOVE ENTITY 81 FF 2 1
		moreMove $B,$1
		endMove $8080
		moveEntity $1F,$FF,$2,$1
						; 002D MOVE ENTITY 1F FF 2 1
		moreMove $B,$1
		endMove $8080
		nextText $80,$1F        
						; "It was great travelling with{N}you {LEADER}.{W2}"
		nextSingleText $80,$1F  
						; "Thank you.  Please be{N}careful.{W1}"
		entityNod $1F           
						; 0026 MAKE ENTITY NOD 1F
		csWait $1E              
						; WAIT 1E
		moveEntity $1F,$FF,$1,$1
						; 002D MOVE ENTITY 1F FF 1 1
		endMove $8080
		csWait $46              
						; WAIT 46
		setEntityDir $1F,$3     
						; 0023 SET ENTITY FACING 1F 3
		csWait $32              
						; WAIT 32
		setEntityDir $1F,$1     
						; 0023 SET ENTITY FACING 1F 1
		csWait $1E              
						; WAIT 1E
		moveEntity $1F,$FF,$1,$3
						; 002D MOVE ENTITY 1F FF 1 3
		endMove $8080
		hideEntity $1F          
						; 002E HIDE ENTITY 1F
		moveEntity $81,$FF,$0,$1
						; 002D MOVE ENTITY 81 FF 0 1
		moreMove $B,$1
		endMove $8080
		nextText $0,$81         
						; "{LEADER}, you'll learn{N}the reason why he has to stay{N}here soon enough.{W2}"
		nextSingleText $0,$81   
						; "Don't think about it now.{N}Go to the north.{W1}"
		followEntity $7,$0,$2   
						; 002C FOLLOW ENTITY 7 0 2
		followEntity $82,$7,$2  
						; 002C FOLLOW ENTITY 82 7 2
		csc_end                 
						; END OF CUTSCENE SCRIPT
