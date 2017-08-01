
; ASM FILE data\maps\entries\map15\mapsetups\s6.asm :
; 0x5D04C..0x5D1CA : 

; =============== S U B R O U T I N E =======================================

ms_map15_InitFunction:
		
		rts

	; End of function ms_map15_InitFunction

cs_5D04E:
		textCursor $7D6         
						; Initial text line $7D6 : "Excuse me, are you{N}{LEADER} of Granseal?{W1}"
		setEntityDir $0,$0      
						; 0023 SET ENTITY FACING 0 0
		setEntityDest $7,$18,$11
						; 0029 SET ENTITY DEST 7 18 11
		setEntityDir $7,$0      
						; 0023 SET ENTITY FACING 7 0
		entityPosDir $14,$1F,$21,$1
						; 0019 SET ENTITY POS AND FACING 14 1F 21 1
		csWait $1               
						; WAIT 1
		setCamDest $1A,$16      
						; 0032 SET CAMERA DEST 1A 16
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $7,$FF,eas_Init
						; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init
						; 0015 SET ACTSCRIPT 1F FF 460CE
		entityPosDir $7,$18,$11,$0
						; 0019 SET ENTITY POS AND FACING 7 18 11 0
		entityPosDir $1F,$18,$10,$0
						; 0019 SET ENTITY POS AND FACING 1F 18 10 0
		entityPosDir $0,$18,$12,$0
						; 0019 SET ENTITY POS AND FACING 0 18 12 0
		csc2F $14,$FFFF         
						; 002F  14 FFFF
		moveEntity $14,$0,$1,$8 
						; 002D MOVE ENTITY 14 0 1 8
		endMove $8080
		csWait $3C              
						; WAIT 3C
		setCamDest $1A,$14      
						; 0032 SET CAMERA DEST 1A 14
		moveEntity $14,$0,$2,$3 
						; 002D MOVE ENTITY 14 0 2 3
		endMove $8080
		setCamDest $14,$14      
						; 0032 SET CAMERA DEST 14 14
		moveEntity $14,$0,$1,$A 
						; 002D MOVE ENTITY 14 0 1 A
		endMove $8080
		setCamDest $14,$A       
						; 0032 SET CAMERA DEST 14 A
		moveEntity $14,$0,$0,$4 
						; 002D MOVE ENTITY 14 0 0 4
		endMove $8080
		setCamDest $1B,$A       
						; 0032 SET CAMERA DEST 1B A
		moveEntity $14,$0,$3,$5 
						; 002D MOVE ENTITY 14 0 3 5
		endMove $8080
		setCamDest $1B,$F       
						; 0032 SET CAMERA DEST 1B F
		moveEntity $14,$0,$2,$13
						; 002D MOVE ENTITY 14 0 2 13
		endMove $8080
		setCamDest $9,$F        
						; 0032 SET CAMERA DEST 9 F
		moveEntity $14,$0,$1,$A 
						; 002D MOVE ENTITY 14 0 1 A
		endMove $8080
		setCamDest $9,$5        
						; 0032 SET CAMERA DEST 9 5
		moveEntity $14,$0,$0,$D 
						; 002D MOVE ENTITY 14 0 0 D
		endMove $8080
		setCamDest $14,$5       
						; 0032 SET CAMERA DEST 14 5
		moveEntity $14,$0,$3,$7 
						; 002D MOVE ENTITY 14 0 3 7
		endMove $8080
		setCamDest $14,$C       
						; 0032 SET CAMERA DEST 14 C
		csWait $3C              
						; WAIT 3C
		setEntityDest $14,$1A,$12
						; 0029 SET ENTITY DEST 14 1A 12
		setEntityDir $14,$2     
						; 0023 SET ENTITY FACING 14 2
		nextSingleText $80,$14  
						; "Excuse me, are you{N}{LEADER} of Granseal?{W1}"
		moveEntity $7,$FF,$0,$2 
						; 002D MOVE ENTITY 7 FF 0 2
		endMove $8080
		setEntityDir $7,$3      
						; 0023 SET ENTITY FACING 7 3
		setEntityDir $14,$1     
						; 0023 SET ENTITY FACING 14 1
		nextSingleText $0,$7    
						; "Yes, he's {LEADER},{N}but who are you?{W1}"
		nextSingleText $80,$14  
						; "I'm {NAME;20} of Bedoe.{W1}"
		entityShiver $7         
						; 002A MAKE ENTITY SHIVER 7
		nextSingleText $0,$7    
						; "Bedoe?{W1}"
		nextSingleText $80,$14  
						; "{LEADER} saved my life{N}there.{W1}"
		setActscript $7,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 7 FF 45E44
		setActscript $7,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 7 FF 45E44
		nextText $0,$7          
						; "{LEADER} saved...{W2}"
		nextSingleText $0,$7    
						; "Oh, yes!  I remember!{W1}"
		nextText $80,$14        
						; "You remember me?{W2}"
		nextSingleText $80,$14  
						; "Let me thank you.{N}May I go with you?{W1}"
		moveEntity $7,$FF,$2,$1 
						; 002D MOVE ENTITY 7 FF 2 1
		moreMove $3,$1
		moreMove $8,$28
		endMove $8080
		moveEntity $7,$FF,$1,$1 
						; 002D MOVE ENTITY 7 FF 1 1
		moreMove $0,$1
		moreMove $B,$28
		endMove $8080
		moveEntity $7,$FF,$2,$1 
						; 002D MOVE ENTITY 7 FF 2 1
		moreMove $3,$1
		moreMove $8,$28
		endMove $8080
		setEntityDir $14,$2     
						; 0023 SET ENTITY FACING 14 2
		nextSingleText $0,$7    
						; "You grew up quickly, huh?{W1}"
		nextSingleText $80,$14  
						; "Yeah, I learned how to fight.{W1}"
		join $14                
						; 0008 JOIN FORCE 14
		followEntity $7,$0,$2   
						; 002C FOLLOW ENTITY 7 0 2
		followEntity $1F,$7,$2  
						; 002C FOLLOW ENTITY 1F 7 2
		followEntity $14,$0,$5  
						; 002C FOLLOW ENTITY 14 0 5
		csc2F $14,$0            
						; 002F  14 0
		csc_end                 
						; END OF CUTSCENE SCRIPT
