
; ASM FILE data\maps\entries\map10\mapsetups\s6_2D2.asm :
; 0x5708E..0x579CA : 

; =============== S U B R O U T I N E =======================================

ms_map10_flag2D2_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $31F               
						; set after you agree to kill Zeon in Bedoe (King's yes/no dialog)
		beq.s   loc_5709E
		move.w  #$A,d0
		jsr     MoveEntityOutOfMap
loc_5709E:
		
		trap    #CHECK_FLAG
		dc.w $2D4               
						; set after the scene where Skreech falls in Bedoe
		beq.s   return_570AE
		move.w  #$98,d0 
		jsr     MoveEntityOutOfMap
return_570AE:
		
		rts

	; End of function ms_map10_flag2D2_InitFunction

cs_570B0:
		textCursor $650         
						; Initial text line $650 : "Who are you?{W1}"
		csc46 $6,$13            
						; 0046 UNKNOWN
		entityPosDir $0,$B,$19,$1
						; 0019 SET ENTITY POS AND FACING 0 B 19 1
		entityPosDir $7,$B,$1A,$1
						; 0019 SET ENTITY POS AND FACING 7 B 1A 1
		entityPosDir $96,$A,$15,$0
						; 0019 SET ENTITY POS AND FACING 96 A 15 0
		entityPosDir $97,$D,$15,$2
						; 0019 SET ENTITY POS AND FACING 97 D 15 2
		setActscript $7,$FF,eas_Init
						; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		customActscript $96,$FF 
						; 0014 SET MANUAL ACTSCRIPT 96
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $97,$FF 
						; 0014 SET MANUAL ACTSCRIPT 97
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		fadeInB                 
						; 0039 FADE IN FROM BLACK
		csWait $1E              
						; WAIT 1E
		moveEntity $96,$FF,$0,$1
						; 002D MOVE ENTITY 96 FF 0 1
		moreMove $B,$1
		endMove $8080
		nextSingleText $0,$96   
						; "Who are you?{W1}"
		moveEntity $97,$FF,$2,$1
						; 002D MOVE ENTITY 97 FF 2 1
		moreMove $B,$1
		endMove $8080
		nextSingleText $0,$97   
						; "Bedoe is only for birdmen!{W1}"
		moveEntity $7,$FF,$0,$1 
						; 002D MOVE ENTITY 7 FF 0 1
		moreMove $1,$1
		endMove $8080
		nextSingleText $0,$7    
						; "Don't be so uppity!{W1}"
		setActscript $96,$0,eas_Jump
						; 0015 SET ACTSCRIPT 96 0 45E44
		setActscript $97,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 97 FF 45E44
		setActscript $96,$0,eas_Jump
						; 0015 SET ACTSCRIPT 96 0 45E44
		setActscript $97,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 97 FF 45E44
		csWait $1E              
						; WAIT 1E
		moveEntity $96,$FF,$3,$1
						; 002D MOVE ENTITY 96 FF 3 1
		endMove $8080
		nextSingleText $0,$96   
						; "Oh, you're...{W1}"
		moveEntity $97,$FF,$3,$1
						; 002D MOVE ENTITY 97 FF 3 1
		endMove $8080
		nextText $0,$97         
						; "Sir {NAME;7}!{N}Sorry, Sir {NAME;7}!{W2}"
		nextSingleText $0,$97   
						; "Welcome back!{N}Volcanon is waiting!{W1}"
		moveEntity $7,$FF,$1,$1 
						; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		csWait $1E              
						; WAIT 1E
		csWait $5               
						; WAIT 5
		setActscript $7,$0,eas_461B6
						; 0015 SET ACTSCRIPT 7 0 461B6
		csWait $78              
						; WAIT 78
		moveEntity $7,$FF,$0,$2 
						; 002D MOVE ENTITY 7 FF 0 2
		endMove $8080
		nextSingleText $0,$7    
						; "That's strange...{W2}"
		moveEntity $7,$FF,$2,$4 
						; 002D MOVE ENTITY 7 FF 2 4
		endMove $8080
		nextSingleText $0,$7    
						; "I just realized...{N}Why are you flying guard?{W2}"
		moveEntity $7,$FF,$0,$2 
						; 002D MOVE ENTITY 7 FF 0 2
		moreMove $9,$A
		endMove $8080
		nextSingleText $0,$7    
						; "Did something happen?{W1}"
		nextSingleText $0,$97   
						; "Well, the devils invaded{N}recently.{W1}"
		customActscript $7,$FF  
						; 0014 SET MANUAL ACTSCRIPT 7
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $7,$FF,$1,$1 
						; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		nextSingleText $0,$7    
						; "Devils?{W1}"
		moveEntity $96,$FF,$3,$1
						; 002D MOVE ENTITY 96 FF 3 1
		moreMove $8,$1
		endMove $8080
		setEntityDir $7,$2      
						; 0023 SET ENTITY FACING 7 2
		nextText $0,$96         
						; "Yes, the Devil Army.{W2}"
		nextText $0,$96         
						; "Strong greater devils broke{N}Volcanon's sacred barrier.{W2}"
		nextSingleText $0,$96   
						; "But don't worry, Volcanon{N}defeated all the devils.{W1}"
		setActscript $7,$FF,eas_Init
						; 0015 SET ACTSCRIPT 7 FF 460CE
		moveEntity $7,$FF,$3,$2 
						; 002D MOVE ENTITY 7 FF 3 2
		moreMove $A,$1
		endMove $8080
		setEntityDir $0,$0      
						; 0023 SET ENTITY FACING 0 0
		nextSingleText $0,$7    
						; "The devils we fought must{N}have been part of that army!{W1}"
		setEntityDir $96,$3     
						; 0023 SET ENTITY FACING 96 3
		moveEntity $97,$FF,$3,$1
						; 002D MOVE ENTITY 97 FF 3 1
		endMove $8080
		nextSingleText $0,$96   
						; "You met some other devils?{W1}"
		setEntityDir $96,$0     
						; 0023 SET ENTITY FACING 96 0
		setEntityDir $97,$2     
						; 0023 SET ENTITY FACING 97 2
		entityNod $96           
						; 0026 MAKE ENTITY NOD 96
		entityNod $97           
						; 0026 MAKE ENTITY NOD 97
		setEntityDir $96,$3     
						; 0023 SET ENTITY FACING 96 3
		setEntityDir $97,$3     
						; 0023 SET ENTITY FACING 97 3
		customActscript $96,$FF 
						; 0014 SET MANUAL ACTSCRIPT 96
		dc.w $10                
						;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $97,$FF 
						; 0014 SET MANUAL ACTSCRIPT 97
		dc.w $10                
						;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $96,$FF,eas_46172
						; 0015 SET ACTSCRIPT 96 FF 46172
		setActscript $97,$FF,eas_46172
						; 0015 SET ACTSCRIPT 97 FF 46172
		moveEntity $96,$0,$1,$1 
						; 002D MOVE ENTITY 96 0 1 1
		endMove $8080
		moveEntity $97,$FF,$1,$1
						; 002D MOVE ENTITY 97 FF 1 1
		endMove $8080
		customActscript $96,$FF 
						; 0014 SET MANUAL ACTSCRIPT 96
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $97,$FF 
						; 0014 SET MANUAL ACTSCRIPT 97
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $96,$0,$2,$1 
						; 002D MOVE ENTITY 96 0 2 1
		moreMove $3,$5
		endMove $8080
		moveEntity $97,$0,$0,$1 
						; 002D MOVE ENTITY 97 0 0 1
		moreMove $3,$5
		endMove $8080
		csWait $1E              
						; WAIT 1E
		setEntityDir $0,$3      
						; 0023 SET ENTITY FACING 0 3
		setEntityDir $7,$3      
						; 0023 SET ENTITY FACING 7 3
		setActscript $7,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 7 FF 45E44
		setActscript $7,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 7 FF 45E44
		nextText $0,$7          
						; "Stop, stop!{W2}"
		setEntityDir $96,$0     
						; 0023 SET ENTITY FACING 96 0
		setEntityDir $97,$2     
						; 0023 SET ENTITY FACING 97 2
		nextSingleText $0,$7    
						; "We already defeated them.{W1}"
		entityNod $0            
						; 0026 MAKE ENTITY NOD 0
		setCamDest $6,$16       
						; 0032 SET CAMERA DEST 6 16
		customActscript $96,$FF 
						; 0014 SET MANUAL ACTSCRIPT 96
		dc.w $10                
						;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $97,$FF 
						; 0014 SET MANUAL ACTSCRIPT 97
		dc.w $10                
						;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $96,$0,$3,$1 
						; 002D MOVE ENTITY 96 0 3 1
		endMove $8080
		moveEntity $97,$FF,$3,$1
						; 002D MOVE ENTITY 97 FF 3 1
		endMove $8080
		setActscript $96,$FF,eas_Init
						; 0015 SET ACTSCRIPT 96 FF 460CE
		setActscript $97,$FF,eas_Init
						; 0015 SET ACTSCRIPT 97 FF 460CE
		moveEntity $96,$FF,$0,$1
						; 002D MOVE ENTITY 96 FF 0 1
		moreMove $9,$1
		endMove $8080
		nextSingleText $0,$96   
						; "That's great!  But...{W2}"
		moveEntity $97,$FF,$2,$1
						; 002D MOVE ENTITY 97 FF 2 1
		moreMove $9,$1
		endMove $8080
		nextSingleText $0,$97   
						; "We'll go and make sure...{W1}"
		setEntityDir $96,$0     
						; 0023 SET ENTITY FACING 96 0
		setEntityDir $97,$2     
						; 0023 SET ENTITY FACING 97 2
		nextSingleText $0,$96   
						; "Just in case.{W1}"
		entityNod $97           
						; 0026 MAKE ENTITY NOD 97
		setEntityDir $96,$1     
						; 0023 SET ENTITY FACING 96 1
		setEntityDir $97,$1     
						; 0023 SET ENTITY FACING 97 1
		nextText $0,$97         
						; "We're going to Polca Village{N}to patrol.{W2}"
		nextSingleText $0,$97   
						; "{NAME;7}, please see{N}King Bedoe.{W1}"
		setEntityDir $96,$3     
						; 0023 SET ENTITY FACING 96 3
		setEntityDir $97,$3     
						; 0023 SET ENTITY FACING 97 3
		customActscript $96,$FF 
						; 0014 SET MANUAL ACTSCRIPT 96
		dc.w $10                
						;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $97,$FF 
						; 0014 SET MANUAL ACTSCRIPT 97
		dc.w $10                
						;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $96,$FF,eas_46172
						; 0015 SET ACTSCRIPT 96 FF 46172
		setActscript $97,$FF,eas_46172
						; 0015 SET ACTSCRIPT 97 FF 46172
		moveEntity $96,$0,$1,$1 
						; 002D MOVE ENTITY 96 0 1 1
		endMove $8080
		moveEntity $97,$FF,$1,$1
						; 002D MOVE ENTITY 97 FF 1 1
		endMove $8080
		csWait $32              
						; WAIT 32
		customActscript $96,$FF 
						; 0014 SET MANUAL ACTSCRIPT 96
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $97,$FF 
						; 0014 SET MANUAL ACTSCRIPT 97
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $96,$0,$3,$5 
						; 002D MOVE ENTITY 96 0 3 5
		endMove $8080
		moveEntity $97,$FF,$3,$5
						; 002D MOVE ENTITY 97 FF 3 5
		endMove $8080
		csWait $28              
						; WAIT 28
		setEntityDir $7,$2      
						; 0023 SET ENTITY FACING 7 2
		setEntityDir $0,$0      
						; 0023 SET ENTITY FACING 0 0
		nextText $0,$7          
						; "{LEADER}, let's go.{W2}"
		nextSingleText $0,$7    
						; "I'll introduce you to{N}King Bedoe.{W1}"
		followEntity $7,$0,$2   
						; 002C FOLLOW ENTITY 7 0 2
		entityPosDir $96,$22,$33,$1
						; 0019 SET ENTITY POS AND FACING 96 22 33 1
		entityPosDir $97,$23,$33,$1
						; 0019 SET ENTITY POS AND FACING 97 23 33 1
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_573EC:
		textCursor $669         
						; Initial text line $669 : "Yes, the greater devil was{N}very strong.{W1}"
		setCamDest $1F,$2F      
						; 0032 SET CAMERA DEST 1F 2F
		nextText $0,$94         
						; "Yes, the greater devil was{N}very strong.{W1}"
		nextSingleText $0,$94   
						; "But, God Volcanon swept{N}away all the devils.{W1}"
		nextSingleText $0,$93   
						; "What about the greater{N}devil?{W1}"
		moveEntity $94,$FF,$2,$1
						; 002D MOVE ENTITY 94 FF 2 1
		moreMove $9,$1
		endMove $8080
		nextSingleText $0,$94   
						; "He fled.{W1}"
		nextText $0,$93         
						; "Can't you track him?{W2}"
		nextSingleText $0,$93   
						; "We must capture him before{N}he regains his strength.{W1}"
		nextSingleText $0,$94   
						; "Did they come from Grans{N}Island?{W1}"
		entityNod $93           
						; 0026 MAKE ENTITY NOD 93
		nextText $0,$93         
						; "I think so.{W2}"
		nextText $0,$93         
						; "Maybe he died.{N}But beware of another attack.{W2}"
		csWait $A               
						; WAIT A
		setEntityDir $94,$3     
						; 0023 SET ENTITY FACING 94 3
		nextSingleText $0,$93   
						; "Watch carefully!{W1}"
		csWait $28              
						; WAIT 28
		moveEntity $96,$0,$3,$1 
						; 002D MOVE ENTITY 96 0 3 1
		moreMove $2,$3
		moreMove $3,$3
		endMove $8080
		moveEntity $98,$0,$3,$1 
						; 002D MOVE ENTITY 98 0 3 1
		moreMove $0,$5
		endMove $8080
		moveEntity $99,$0,$0,$2 
						; 002D MOVE ENTITY 99 0 0 2
		moreMove $3,$3
		endMove $8080
		moveEntity $9A,$0,$0,$1 
						; 002D MOVE ENTITY 9A 0 0 1
		moreMove $3,$3
		endMove $8080
		moveEntity $9B,$0,$0,$2 
						; 002D MOVE ENTITY 9B 0 0 2
		moreMove $3,$3
		endMove $8080
		moveEntity $9C,$0,$0,$2 
						; 002D MOVE ENTITY 9C 0 0 2
		moreMove $3,$3
		endMove $8080
		moveEntity $97,$FF,$3,$1
						; 002D MOVE ENTITY 97 FF 3 1
		moreMove $2,$4
		moreMove $3,$3
		endMove $8080
		hideEntity $96          
						; 002E HIDE ENTITY 96
		hideEntity $97          
						; 002E HIDE ENTITY 97
		hideEntity $98          
						; 002E HIDE ENTITY 98
		hideEntity $99          
						; 002E HIDE ENTITY 99
		hideEntity $9A          
						; 002E HIDE ENTITY 9A
		hideEntity $9B          
						; 002E HIDE ENTITY 9B
		hideEntity $9C          
						; 002E HIDE ENTITY 9C
		moveEntity $94,$FF,$0,$1
						; 002D MOVE ENTITY 94 FF 0 1
		moreMove $B,$1
		endMove $8080
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_574A6:
		textCursor $673         
						; Initial text line $673 : "{NAME;7}, {NAME;7}!{W1}"
		setCamDest $22,$2F      
						; 0032 SET CAMERA DEST 22 2F
		moveEntity $A,$FF,$3,$1 
						; 002D MOVE ENTITY A FF 3 1
		moreMove $A,$1
		endMove $8080
		setActscript $A,$FF,eas_Jump
						; 0015 SET ACTSCRIPT A FF 45E44
		setActscript $A,$FF,eas_Jump
						; 0015 SET ACTSCRIPT A FF 45E44
		nextSingleText $80,$A   
						; "{NAME;7}, {NAME;7}!{W1}"
		entityPosDir $7,$21,$34,$0
						; 0019 SET ENTITY POS AND FACING 7 21 34 0
		entityPosDir $0,$21,$35,$0
						; 0019 SET ENTITY POS AND FACING 0 21 35 0
		setCamDest $1F,$2F      
						; 0032 SET CAMERA DEST 1F 2F
		moveEntity $7,$FF,$0,$3 
						; 002D MOVE ENTITY 7 FF 0 3
		endMove $8080
		nextText $0,$7          
						; "{NAME;10}, how have you been?{W2}"
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		nextSingleText $0,$7    
						; "King Bedoe, you look well.{W1}"
		customActscript $93,$FF 
						; 0014 SET MANUAL ACTSCRIPT 93
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $93,$FF,$3,$1
						; 002D MOVE ENTITY 93 FF 3 1
		endMove $8080
		nextSingleText $80,$93  
						; "{NAME;7}, my friend, how{N}was your journey?{W1}"
		moveEntity $7,$FF,$1,$1 
						; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		csWait $1E              
						; WAIT 1E
		entityNod $7            
						; 0026 MAKE ENTITY NOD 7
		csWait $14              
						; WAIT 14
		setEntityDir $7,$2      
						; 0023 SET ENTITY FACING 7 2
		csWait $1E              
						; WAIT 1E
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		nextSingleText $0,$7    
						; "Let me introduce my friend.{W1}"
		moveEntity $7,$FF,$3,$2 
						; 002D MOVE ENTITY 7 FF 3 2
		moreMove $2,$2
		endMove $8080
		csWait $28              
						; WAIT 28
		entityNod $0            
						; 0026 MAKE ENTITY NOD 0
		moveEntity $7,$0,$0,$3  
						; 002D MOVE ENTITY 7 0 0 3
		moreMove $9,$1
		endMove $8080
		moveEntity $0,$FF,$0,$3 
						; 002D MOVE ENTITY 0 FF 0 3
		moreMove $9,$1
		endMove $8080
		entityNod $0            
						; 0026 MAKE ENTITY NOD 0
		nextSingleText $0,$7    
						; "This is {LEADER}.{N}He's from Grans and...{W1}"
		moveEntity $A,$FF,$3,$1 
						; 002D MOVE ENTITY A FF 3 1
		moreMove $A,$1
		endMove $8080
		setEntityDir $7,$0      
						; 0023 SET ENTITY FACING 7 0
		setEntityDir $0,$0      
						; 0023 SET ENTITY FACING 0 0
		nextSingleText $80,$A   
						; "I know.  He is a pupil of{N}Astral of Granseal.{W1}"
		setActscript $7,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 7 FF 45E44
		setActscript $7,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 7 FF 45E44
		nextSingleText $0,$7    
						; "How do you know that?{W1}"
		nextSingleText $80,$A   
						; "Sir Astral told me.{W1}"
		nextSingleText $0,$7    
						; "What?!  Did you go to{N}Granseal?{W1}"
		entityNod $A            
						; 0026 MAKE ENTITY NOD A
		nextSingleText $80,$A   
						; "As Volcanon's messenger.{W1}"
		moveEntity $93,$FF,$3,$1
						; 002D MOVE ENTITY 93 FF 3 1
		endMove $8080
		setEntityDir $A,$1      
						; 0023 SET ENTITY FACING A 1
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		setEntityDir $0,$1      
						; 0023 SET ENTITY FACING 0 1
		nextText $80,$93        
						; "And I heard that somebody{N}unsealed Zeon.{W2}"
		nextText $80,$93        
						; "Grans people caused a big,{N}big problem.{W2}"
		customActscript $93,$FF 
						; 0014 SET MANUAL ACTSCRIPT 93
		dc.w $10                
						;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $93,$FF,$1,$2
						; 002D MOVE ENTITY 93 FF 1 2
		moreMove $B,$1
		endMove $8080
		nextSingleText $80,$93  
						; "Zeon might destroy the{N}world...{W1}"
		moveEntity $7,$FF,$1,$1 
						; 002D MOVE ENTITY 7 FF 1 1
		moreMove $2,$1
		moreMove $9,$1
		endMove $8080
		nextSingleText $0,$7    
						; "Sorry to interrupt, but is{N}he that strong?{W1}"
		nextSingleText $80,$93  
						; "Zeon is King of the Devils.{W1}"
		moveEntity $94,$FF,$3,$1
						; 002D MOVE ENTITY 94 FF 3 1
		endMove $8080
		nextText $0,$94         
						; "{NAME;7}, you had better{N}go see Volcanon.{W2}"
		nextSingleText $0,$94   
						; "It may calm him down to see{N}{NAME;7}.{W1}"
		nextSingleText $0,$7    
						; "Oh, is he angry?{N}Maybe later...{W1}"
		moveEntity $A,$FF,$1,$1 
						; 002D MOVE ENTITY A FF 1 1
		moreMove $2,$1
		endMove $8080
		setEntityDir $7,$0      
						; 0023 SET ENTITY FACING 7 0
		nextSingleText $80,$A   
						; "Never mind later.{N}He has been waiting for you.{W1}"
		nextText $0,$7          
						; "Oh, yeah?  OK, I'm going.{W2}"
		setEntityDir $7,$3      
						; 0023 SET ENTITY FACING 7 3
		nextSingleText $0,$7    
						; "{LEADER}, follow me.{W1}"
		setActscript $93,$FF,eas_Init
						; 0015 SET ACTSCRIPT 93 FF 460CE
		moveEntity $93,$FF,$3,$1
						; 002D MOVE ENTITY 93 FF 3 1
		endMove $8080
		nextSingleText $80,$93  
						; "{NAME;7}, are you taking{N}{LEADER} with you?{W1}"
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		setEntityDir $A,$1      
						; 0023 SET ENTITY FACING A 1
		nextSingleText $0,$7    
						; "Of course.  Why not?{W1}"
		nextSingleText $80,$93  
						; "He thinks the people of{N}Granseal are...{W1}"
		moveEntity $94,$FF,$2,$1
						; 002D MOVE ENTITY 94 FF 2 1
		moreMove $9,$1
		endMove $8080
		nextText $0,$94         
						; "King Bedoe, I think{N}{LEADER} has to see{N}Volcanon.{W2}"
		nextSingleText $0,$94   
						; "He should talk to him.{W1}"
		entityNod $93           
						; 0026 MAKE ENTITY NOD 93
		nextSingleText $80,$93  
						; "Hmmm...you're right.{N}{NAME;7}, go ahead.{W1}"
		setEntityDir $94,$3     
						; 0023 SET ENTITY FACING 94 3
		setEntityDir $A,$3      
						; 0023 SET ENTITY FACING A 3
		setEntityDir $7,$3      
						; 0023 SET ENTITY FACING 7 3
		nextSingleText $0,$7    
						; "OK.{N}Anyway, let's go.{W1}"
		followEntity $7,$0,$2   
						; 002C FOLLOW ENTITY 7 0 2
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5766C:
		textCursor $690         
						; Initial text line $690 : "I had a dream last night.{N}I flew!{W2}"
		setCameraEntity $99     
						; 0024 SET ENTITY FOLLOWED BY CAMERA 99
		nextText $0,$99         
						; "I had a dream last night.{N}I flew!{W2}"
		nextSingleText $0,$99   
						; "Watch!  I can fly!{W1}"
		setEntityDir $99,$0     
						; 0023 SET ENTITY FACING 99 0
		csWait $28              
						; WAIT 28
		entityNod $99           
						; 0026 MAKE ENTITY NOD 99
		moveEntity $99,$FF,$E,$1
						; 002D MOVE ENTITY 99 FF E 1
		endMove $8080
		entitySprite $99,$B6    
						; 001A SET ENTITY SPRITE 99 B6
		setActscript $99,$FF,eas_46172
						; 0015 SET ACTSCRIPT 99 FF 46172
		customActscript $99,$FF 
						; 0014 SET MANUAL ACTSCRIPT 99
		dc.w $10                
						;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $99,$FF,$1,$1
						; 002D MOVE ENTITY 99 FF 1 1
		endMove $8080
		customActscript $99,$FF 
						; 0014 SET MANUAL ACTSCRIPT 99
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		playSound SFX_FALLING   
						; 0005 PLAY SOUND SFX_FALLING
		moveEntity $99,$FF,$3,$6
						; 002D MOVE ENTITY 99 FF 3 6
		endMove $8080
		entitySprite $99,$E6    
						; 001A SET ENTITY SPRITE 99 E6
		nextSingleText $0,$99   
						; "Hmmm...strange...{W1}"
		setActscript $99,$FF,eas_Init
						; 0015 SET ACTSCRIPT 99 FF 460CE
		moveEntity $99,$FF,$2,$2
						; 002D MOVE ENTITY 99 FF 2 2
		moreMove $9,$1
		endMove $8080
		setEntityDir $0,$3      
						; 0023 SET ENTITY FACING 0 3
		setEntityDir $7,$3      
						; 0023 SET ENTITY FACING 7 3
		nextText $0,$99         
						; "That didn't work.  Hee, hee.{W2}"
		nextSingleText $0,$99   
						; "Stay there.{N}I know I can fly!{W1}"
		setEntityDir $99,$0     
						; 0023 SET ENTITY FACING 99 0
		csWait $28              
						; WAIT 28
		entityNod $99           
						; 0026 MAKE ENTITY NOD 99
		csc45 $40               
						; (null)
		moveEntity $99,$FF,$0,$1
						; 002D MOVE ENTITY 99 FF 0 1
		moreMove $E,$1
		endMove $8080
		entitySprite $99,$B6    
						; 001A SET ENTITY SPRITE 99 B6
		setActscript $99,$FF,eas_46172
						; 0015 SET ACTSCRIPT 99 FF 46172
		moveEntity $99,$FF,$3,$1
						; 002D MOVE ENTITY 99 FF 3 1
		endMove $8080
		customActscript $99,$FF 
						; 0014 SET MANUAL ACTSCRIPT 99
		dc.w $10                
						;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $99,$FF,$1,$1
						; 002D MOVE ENTITY 99 FF 1 1
		endMove $8080
		customActscript $99,$FF 
						; 0014 SET MANUAL ACTSCRIPT 99
		dc.w $10                
						;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		playSound SFX_FALLING   
						; 0005 PLAY SOUND SFX_FALLING
		moveEntity $99,$FF,$3,$8
						; 002D MOVE ENTITY 99 FF 3 8
		endMove $8080
		setActscript $99,$0,eas_464E2
						; 0015 SET ACTSCRIPT 99 0 464E2
		startEntity $99         
						; 001B START ENTITY ANIM 99
		csWait $C               
						; WAIT C
		csc45 $20               
						; (null)
		setActscript $99,$FF,eas_Init2
						; 0015 SET ACTSCRIPT 99 FF 46102
		moveEntity $99,$FF,$1,$2
						; 002D MOVE ENTITY 99 FF 1 2
		moreMove $0,$1
		moreMove $1,$B
		endMove $8080
		setEntityDir $99,$2     
						; 0023 SET ENTITY FACING 99 2
		entitySprite $99,$E6    
						; 001A SET ENTITY SPRITE 99 E6
		setEntityDir $0,$0      
						; 0023 SET ENTITY FACING 0 0
		setEntityDir $7,$0      
						; 0023 SET ENTITY FACING 7 0
		nextSingleText $0,$99   
						; "See.  I told you!{N}I can fly...sort of.{W1}"
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5779C:
		textCursor $696         
						; Initial text line $696 : "Ha, ha, ha!{W1}"
		entityPosDir $99,$6,$A,$3
						; 0019 SET ENTITY POS AND FACING 99 6 A 3
		setEntityDir $98,$1     
						; 0023 SET ENTITY FACING 98 1
		setCamDest $1,$5        
						; 0032 SET CAMERA DEST 1 5
		setActscript $7,$FF,eas_Init
						; 0015 SET ACTSCRIPT 7 FF 460CE
		entityPosDir $0,$5,$16,$3
						; 0019 SET ENTITY POS AND FACING 0 5 16 3
		entityPosDir $7,$B,$16,$1
						; 0019 SET ENTITY POS AND FACING 7 B 16 1
		moveEntity $7,$0,$C,$3C 
						; 002D MOVE ENTITY 7 0 C 3C
		moreMove $2,$4
		endMove $8080
		setEntityDir $0,$1      
						; 0023 SET ENTITY FACING 0 1
		setActscript $99,$FF,eas_46198
						; 0015 SET ACTSCRIPT 99 FF 46198
		setActscript $99,$FF,eas_46172
						; 0015 SET ACTSCRIPT 99 FF 46172
		playSound SFX_JUMP      
						; 0005 PLAY SOUND SFX_JUMP
		moveEntity $99,$FF,$1,$2
						; 002D MOVE ENTITY 99 FF 1 2
		moreMove $9,$5
		moreMove $3,$2
		endMove $8080
		nextSingleText $0,$99   
						; "Ha, ha, ha!{W1}"
		csWait $28              
						; WAIT 28
		playSound SFX_JUMP      
						; 0005 PLAY SOUND SFX_JUMP
		moveEntity $99,$FF,$1,$2
						; 002D MOVE ENTITY 99 FF 1 2
		moreMove $9,$5
		moreMove $3,$2
		endMove $8080
		nextSingleText $0,$99   
						; "Ha, ha, ha!{W1}"
		csWait $28              
						; WAIT 28
		playSound SFX_JUMP      
						; 0005 PLAY SOUND SFX_JUMP
		moveEntity $99,$FF,$1,$2
						; 002D MOVE ENTITY 99 FF 1 2
		moreMove $9,$5
		moreMove $3,$1
		endMove $8080
		setActscript $99,$FF,eas_Init
						; 0015 SET ACTSCRIPT 99 FF 460CE
		moveEntity $99,$FF,$F,$1
						; 002D MOVE ENTITY 99 FF F 1
		endMove $8080
		setEntityDir $99,$1     
						; 0023 SET ENTITY FACING 99 1
		setEntityDir $98,$2     
						; 0023 SET ENTITY FACING 98 2
		setCameraEntity $99     
						; 0024 SET ENTITY FOLLOWED BY CAMERA 99
		csc45 $30               
						; (null)
		nextSingleText $0,$98   
						; "Oh my, {NAME;20}!{W1}"
		csc53 $0,$0             
						; 0053 UNKNOWN
		csc53 $99,$FFFF         
						; 0053 UNKNOWN
		setActscript $99,$FF,eas_46172
						; 0015 SET ACTSCRIPT 99 FF 46172
		customActscript $99,$FF 
						; 0014 SET MANUAL ACTSCRIPT 99
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		playSound SFX_FALLING   
						; 0005 PLAY SOUND SFX_FALLING
		moveEntity $99,$0,$3,$D 
						; 002D MOVE ENTITY 99 0 3 D
		endMove $8080
		setEntityDir $7,$2      
						; 0023 SET ENTITY FACING 7 2
		csc53 $0,$0             
						; 0053 UNKNOWN
		csc53 $99,$FFFF         
						; 0053 UNKNOWN
		csWait $23              
						; WAIT 23
		customActscript $98,$FF 
						; 0014 SET MANUAL ACTSCRIPT 98
		dc.w $10                
						;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $98,$0,$2,$1 
						; 002D MOVE ENTITY 98 0 2 1
		moreMove $3,$B
		endMove $8080
		waitIdle $99            
						; 0016 WAIT UNTIL IDLE ENTITY 99
		setQuakeAmount $3       
						; 0033 SET QUAKE AMOUNT 3
		setEntityDir $0,$1      
						; 0023 SET ENTITY FACING 0 1
		customActscript $0,$FF  
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $14                
						;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                
						;   001B SET FLIPPING $2
		dc.w 2
		dc.w $A                 
						;   000A UPDATE SPRITE
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		csWait $28              
						; WAIT 28
		setQuakeAmount $0       
						; 0033 SET QUAKE AMOUNT 0
		setActscript $99,$FF,eas_Init
						; 0015 SET ACTSCRIPT 99 FF 460CE
		setEntityDir $99,$3     
						; 0023 SET ENTITY FACING 99 3
		setActscript $99,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 99 FF 45E44
		csWait $14              
						; WAIT 14
		setActscript $99,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 99 FF 45E44
		csWait $14              
						; WAIT 14
		setActscript $99,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 99 FF 45E44
		csWait $14              
						; WAIT 14
		setActscript $99,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 99 FF 45E44
		csWait $14              
						; WAIT 14
		setEntityDir $99,$1     
						; 0023 SET ENTITY FACING 99 1
		setCameraEntity $FFFF   
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		setActscript $98,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 98 FF 45E44
		setActscript $98,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 98 FF 45E44
		nextSingleText $0,$98   
						; "Thank you!  Thank you!{N}{NAME;20} is OK.{W1}"
		entityNod $98           
						; 0026 MAKE ENTITY NOD 98
		csWait $1E              
						; WAIT 1E
		setActscript $98,$FF,eas_Init
						; 0015 SET ACTSCRIPT 98 FF 460CE
		setActscript $99,$FF,eas_Init
						; 0015 SET ACTSCRIPT 99 FF 460CE
		moveEntity $98,$0,$0,$8 
						; 002D MOVE ENTITY 98 0 0 8
		endMove $8080
		moveEntity $99,$FF,$1,$1
						; 002D MOVE ENTITY 99 FF 1 1
		moreMove $0,$8
		endMove $8080
		hideEntity $98          
						; 002E HIDE ENTITY 98
		entityPosDir $99,$10,$6,$2
						; 0019 SET ENTITY POS AND FACING 99 10 6 2
		moveEntity $7,$FF,$2,$1 
						; 002D MOVE ENTITY 7 FF 2 1
		endMove $8080
		csWait $1E              
						; WAIT 1E
		setActscript $7,$FF,eas_BumpLeft
						; 0015 SET ACTSCRIPT 7 FF 45EE4
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		setEntityDir $0,$3      
						; 0023 SET ENTITY FACING 0 3
		entityShakeHead $0      
						; 0027 MAKE ENTITY SHAKE HEAD 0
		csc53 $0,$FFFF          
						; 0053 UNKNOWN
		followEntity $7,$0,$2   
						; 002C FOLLOW ENTITY 7 0 2
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5797A:
		textCursor $647         
						; Initial text line $647 : "You're a man of honor!{N}Why don't you go see Creed?{W2}"
		csc52 $7,$93            
						; 0052 UNKNOWN, RELATED TO TWO ENTITIES
		nextText $0,$93         
						; "You're a man of honor!{N}Why don't you go see Creed?{W2}"
		nextText $0,$93         
						; "He's an ex-greater devil.{N}He may give you some{N}information.{W2}"
		nextText $0,$93         
						; "You must travel along the{N}river to get to Creed's{N}mansion.{W2}"
		nextSingleText $0,$93   
						; "Maybe Polca has a raft for{N}you.{W1}"
		setEntityDir $93,$0     
						; 0023 SET ENTITY FACING 93 0
		nextSingleText $0,$93   
						; "Tell the mayor to prepare a{N}raft.{W1}"
		moveEntity $A,$FF,$1,$2 
						; 002D MOVE ENTITY A FF 1 2
		moreMove $A,$1
		endMove $8080
		nextSingleText $0,$A    
						; "Yes, sir!{W1}"
		moveEntity $A,$FF,$3,$3 
						; 002D MOVE ENTITY A FF 3 3
		moreMove $0,$1
		moreMove $3,$4
		endMove $8080
		hideEntity $A           
						; 002E HIDE ENTITY A
		csc52 $93,$7            
						; 0052 UNKNOWN, RELATED TO TWO ENTITIES
		nextText $0,$93         
						; "{NAME;7}, please{N}help {LEADER}.{W2}"
		nextSingleText $0,$93   
						; "{LEADER}, good luck!{W1}"
		csc_end                 
						; END OF CUTSCENE SCRIPT
