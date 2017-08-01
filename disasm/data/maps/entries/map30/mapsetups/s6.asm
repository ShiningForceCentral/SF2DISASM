
; ASM FILE data\maps\entries\map30\mapsetups\s6.asm :
; 0x5A2F2..0x5A646 : 

; =============== S U B R O U T I N E =======================================

ms_map30_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $2F9
		beq.s   loc_5A2FE
		lea     cs_5A30C(pc), a0
		trap    #6
loc_5A2FE:
		
		trap    #CHECK_FLAG
		dc.w $2F8
		bne.s   return_5A30A
		lea     cs_5A31E(pc), a0
		trap    #6
return_5A30A:
		
		rts

	; End of function ms_map30_InitFunction

cs_5A30C:
		setBlocks $1506,$202,$705
						; 0034 SET BLOCKS 1506 202 705
		setBlocks $1500,$404,$600
						; 0034 SET BLOCKS 1500 404 600
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5A31E:
		customActscript $82,$FF 
						; 0014 SET MANUAL ACTSCRIPT 82
		dc.w $14                
						;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                
						;   001B SET FLIPPING $3
		dc.w 3
		dc.w $A                 
						;   000A UPDATE SPRITE
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		stopEntity $82          
						; 001C STOP ENTITY ANIM 82
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5A33A:
		textCursor $6AF         
						; Initial text line $6AF : "Where is the sick dwarf?{W1}"
		setCamDest $0,$7        
						; 0032 SET CAMERA DEST 0 7
		setActscript $9E,$FF,eas_Init2
						; 0015 SET ACTSCRIPT 9E FF 46102
		followEntity $1F,$7,$2  
						; 002C FOLLOW ENTITY 1F 7 2
		customActscript $9E,$FF 
						; 0014 SET MANUAL ACTSCRIPT 9E
		dc.w $10                
						;   0010 SET SPEED X=$0 Y=$0
		dc.b 0
		dc.b 0
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		setEntityDest $9E,$8,$B 
						; 0029 SET ENTITY DEST 9E 8 B
		nextSingleText $0,$9E   
						; "Where is the sick dwarf?{W1}"
		csWait $5               
						; WAIT 5
		setActscript $9E,$0,eas_461B6
						; 0015 SET ACTSCRIPT 9E 0 461B6
		csWait $32              
						; WAIT 32
		setCamDest $5,$7        
						; 0032 SET CAMERA DEST 5 7
		moveEntity $80,$FF,$2,$1
						; 002D MOVE ENTITY 80 FF 2 1
		endMove $8080
		setEntityDir $9E,$0     
						; 0023 SET ENTITY FACING 9E 0
		nextSingleText $0,$80   
						; "Oh, thank goodness.{N}I sure am glad to see you.{W1}"
		setActscript $80,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 80 FF 45E44
		setActscript $80,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 80 FF 45E44
		moveEntity $80,$FF,$0,$3
						; 002D MOVE ENTITY 80 FF 0 3
		endMove $8080
		setEntityDir $80,$2     
						; 0023 SET ENTITY FACING 80 2
		nextSingleText $0,$80   
						; "Here, please examine him.{W1}"
		setCameraEntity $9E     
						; 0024 SET ENTITY FOLLOWED BY CAMERA 9E
		moveEntity $9E,$FF,$0,$4
						; 002D MOVE ENTITY 9E FF 0 4
		moreMove $3,$1
		moreMove $0,$2
		endMove $8080
		setCamDest $A,$7        
						; 0032 SET CAMERA DEST A 7
		setEntityDir $80,$0     
						; 0023 SET ENTITY FACING 80 0
		csWait $3C              
						; WAIT 3C
		nextText $0,$9E         
						; "Oh, I hope I'm not too late.{W2}"
		nextSingleText $0,$9E   
						; "Ok, let's see.{W1}"
		csWait $32              
						; WAIT 32
		entityShiver $9E        
						; 002A MAKE ENTITY SHIVER 9E
		csWait $1E              
						; WAIT 1E
		entityShiver $9E        
						; 002A MAKE ENTITY SHIVER 9E
		csWait $14              
						; WAIT 14
		entityFlashWhite $9E,$78
						; 0018 FLASH ENTITY WHITE 9E 78
		mapFadeOutToWhite       
						; 003F FADE MAP OUT TO WHITE
		entityFlashWhite $9E,$64
						; 0018 FLASH ENTITY WHITE 9E 64
		mapFadeInFromWhite      
						; 0040 FADE MAP IN FROM WHITE
		csWait $32              
						; WAIT 32
		csWait $5               
						; WAIT 5
		setActscript $81,$0,eas_461B6
						; 0015 SET ACTSCRIPT 81 0 461B6
		csWait $64              
						; WAIT 64
		moveEntity $81,$FF,$3,$1
						; 002D MOVE ENTITY 81 FF 3 1
		endMove $8080
		setEntityDir $81,$2     
						; 0023 SET ENTITY FACING 81 2
		nextSingleText $0,$81   
						; "How is he?{W1}"
		csWait $F               
						; WAIT F
		entityShakeHead $84     
						; 0027 MAKE ENTITY SHAKE HEAD 84
		nextSingleText $0,$84   
						; "I don't know yet....{W1}"
		csWait $3C              
						; WAIT 3C
		setActscript $82,$FF,eas_Init
						; 0015 SET ACTSCRIPT 82 FF 460CE
		setActscript $82,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 82 FF 45E44
		startEntity $82         
						; 001B START ENTITY ANIM 82
		nextSingleText $0,$82   
						; "Whoa!{W1}"
		csWait $5               
						; WAIT 5
		setActscript $82,$0,eas_461B6
						; 0015 SET ACTSCRIPT 82 0 461B6
		csWait $64              
						; WAIT 64
		setEntityDir $82,$1     
						; 0023 SET ENTITY FACING 82 1
		nextSingleText $0,$82   
						; "What?{W1}"
		moveEntity $81,$FF,$1,$1
						; 002D MOVE ENTITY 81 FF 1 1
		endMove $8080
		setEntityDir $81,$2     
						; 0023 SET ENTITY FACING 81 2
		setEntityDir $82,$0     
						; 0023 SET ENTITY FACING 82 0
		nextSingleText $0,$81   
						; "Hey, are you OK?{W1}"
		nextSingleText $0,$82   
						; "I'm OK.  I'm fine.{N}I feel great!{W1}"
		csWait $14              
						; WAIT 14
		moveEntity $80,$FF,$0,$1
						; 002D MOVE ENTITY 80 FF 0 1
		endMove $8080
		setEntityDir $80,$3     
						; 0023 SET ENTITY FACING 80 3
		setEntityDir $81,$2     
						; 0023 SET ENTITY FACING 81 2
		setEntityDir $82,$2     
						; 0023 SET ENTITY FACING 82 2
		setEntityDir $83,$2     
						; 0023 SET ENTITY FACING 83 2
		setEntityDir $84,$2     
						; 0023 SET ENTITY FACING 84 2
		setEntityDir $9E,$1     
						; 0023 SET ENTITY FACING 9E 1
		nextSingleText $0,$80   
						; "Oh, how can we thank you?{W1}"
		entityNod $82           
						; 0026 MAKE ENTITY NOD 82
		nextText $0,$9E         
						; "I don't need anything.{W2}"
		nextSingleText $0,$9E   
						; "But, why don't you help{N}{LEADER}?{W1}"
		csWait $F               
						; WAIT F
		entityPosDir $1F,$7,$B,$0
						; 0019 SET ENTITY POS AND FACING 1F 7 B 0
		entityPosDir $7,$7,$A,$0
						; 0019 SET ENTITY POS AND FACING 7 7 A 0
		entityPosDir $0,$8,$B,$0
						; 0019 SET ENTITY POS AND FACING 0 8 B 0
		setCameraEntity $9E     
						; 0024 SET ENTITY FOLLOWED BY CAMERA 9E
		moveEntity $9E,$FF,$2,$2
						; 002D MOVE ENTITY 9E FF 2 2
		moreMove $1,$1
		moreMove $2,$3
		endMove $8080
		nextSingleText $0,$9E   
						; "{LEADER}, I'm  going now.{W2}{N}I hope your journey is safe{N}and uneventful.  Bye!{W1}"
		setCameraEntity $FFFF   
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		moveEntity $9E,$FF,$1,$2
						; 002D MOVE ENTITY 9E FF 1 2
		moreMove $2,$3
		moreMove $3,$3
		endMove $8080
		setEntityDir $0,$3      
						; 0023 SET ENTITY FACING 0 3
		setEntityDir $7,$3      
						; 0023 SET ENTITY FACING 7 3
		setEntityDir $1F,$3     
						; 0023 SET ENTITY FACING 1F 3
		moveEntity $9E,$FF,$0,$1
						; 002D MOVE ENTITY 9E FF 0 1
		moreMove $3,$5
		endMove $8080
		hideEntity $9E          
						; 002E HIDE ENTITY 9E
		setCamDest $4,$7        
						; 0032 SET CAMERA DEST 4 7
		moveEntity $0,$0,$0,$2  
						; 002D MOVE ENTITY 0 0 0 2
		endMove $8080
		moveEntity $80,$FF,$2,$3
						; 002D MOVE ENTITY 80 FF 2 3
		endMove $8080
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5A4FE:
		textCursor $6C2         
						; Initial text line $6C2 : "We use it to destroy large{N}rocks.{W1}"
		setEntityDir $81,$2     
						; 0023 SET ENTITY FACING 81 2
		setEntityDir $82,$2     
						; 0023 SET ENTITY FACING 82 2
		setEntityDir $83,$2     
						; 0023 SET ENTITY FACING 83 2
		setEntityDir $84,$2     
						; 0023 SET ENTITY FACING 84 2
		setCamDest $6,$7        
						; 0032 SET CAMERA DEST 6 7
		nextSingleText $0,$80   
						; "We use it to destroy large{N}rocks.{W1}"
		moveEntity $80,$FF,$0,$1
						; 002D MOVE ENTITY 80 FF 0 1
		endMove $8080
		nextSingleText $0,$80   
						; "OK, guys!{N}Let's go back to Grans{N}Island!{W2}"
		nextSingleText $0,$80   
						; "Everybody dig!{W1}"
		setActscript $81,$0,eas_Jump
						; 0015 SET ACTSCRIPT 81 0 45E44
		setActscript $82,$0,eas_Jump
						; 0015 SET ACTSCRIPT 82 0 45E44
		setActscript $83,$0,eas_Jump
						; 0015 SET ACTSCRIPT 83 0 45E44
		setActscript $84,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 84 FF 45E44
		setActscript $81,$0,eas_Jump
						; 0015 SET ACTSCRIPT 81 0 45E44
		setActscript $82,$0,eas_Jump
						; 0015 SET ACTSCRIPT 82 0 45E44
		setActscript $83,$0,eas_Jump
						; 0015 SET ACTSCRIPT 83 0 45E44
		setActscript $84,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 84 FF 45E44
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		moveEntity $0,$FF,$2,$1 
						; 002D MOVE ENTITY 0 FF 2 1
		endMove $8080
		setEntityDest $7,$8,$A  
						; 0029 SET ENTITY DEST 7 8 A
		moveEntity $80,$0,$2,$2 
						; 002D MOVE ENTITY 80 0 2 2
		endMove $8080
		moveEntity $81,$0,$2,$1 
						; 002D MOVE ENTITY 81 0 2 1
		endMove $8080
		moveEntity $82,$0,$2,$1 
						; 002D MOVE ENTITY 82 0 2 1
		endMove $8080
		moveEntity $83,$0,$2,$1 
						; 002D MOVE ENTITY 83 0 2 1
		endMove $8080
		moveEntity $84,$FF,$2,$2
						; 002D MOVE ENTITY 84 FF 2 2
		endMove $8080
		setEntityDir $0,$0      
						; 0023 SET ENTITY FACING 0 0
		setEntityDir $7,$0      
						; 0023 SET ENTITY FACING 7 0
		setEntityDir $1F,$0     
						; 0023 SET ENTITY FACING 1F 0
		moveEntity $80,$0,$1,$2 
						; 002D MOVE ENTITY 80 0 1 2
		moreMove $2,$1
		moreMove $1,$3
		endMove $8080
		moveEntity $83,$0,$2,$3 
						; 002D MOVE ENTITY 83 0 2 3
		moreMove $1,$2
		moreMove $2,$1
		moreMove $1,$3
		endMove $8080
		moveEntity $84,$0,$1,$2 
						; 002D MOVE ENTITY 84 0 1 2
		moreMove $2,$3
		moreMove $1,$2
		moreMove $2,$1
		moreMove $1,$3
		endMove $8080
		moveEntity $81,$0,$1,$1 
						; 002D MOVE ENTITY 81 0 1 1
		moreMove $2,$5
		moreMove $1,$2
		moreMove $2,$1
		moreMove $1,$3
		endMove $8080
		moveEntity $82,$FF,$C,$28
						; 002D MOVE ENTITY 82 FF C 28
		moreMove $1,$1
		moreMove $2,$4
		moreMove $1,$1
		endMove $8080
		csWait $1E              
						; WAIT 1E
		moveEntity $82,$FF,$3,$1
						; 002D MOVE ENTITY 82 FF 3 1
		endMove $8080
		setEntityDir $82,$2     
						; 0023 SET ENTITY FACING 82 2
		entityNod $82           
						; 0026 MAKE ENTITY NOD 82
		moveEntity $82,$FF,$1,$2
						; 002D MOVE ENTITY 82 FF 1 2
		moreMove $2,$1
		moreMove $1,$3
		endMove $8080
		entityPosDir $80,$7,$3,$1
						; 0019 SET ENTITY POS AND FACING 80 7 3 1
		entityPosDir $81,$8,$3,$1
						; 0019 SET ENTITY POS AND FACING 81 8 3 1
		entityPosDir $82,$7,$4,$1
						; 0019 SET ENTITY POS AND FACING 82 7 4 1
		entityPosDir $83,$8,$4,$1
						; 0019 SET ENTITY POS AND FACING 83 8 4 1
		entityPosDir $84,$7,$5,$1
						; 0019 SET ENTITY POS AND FACING 84 7 5 1
		setBlocks $1506,$202,$705
						; 0034 SET BLOCKS 1506 202 705
		csc_end                 
						; END OF CUTSCENE SCRIPT
