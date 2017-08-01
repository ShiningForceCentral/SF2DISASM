
; ASM FILE data\maps\entries\map19\mapsetups\s6_21F.asm :
; 0x62C9E..0x631EA : 

; =============== S U B R O U T I N E =======================================

ms_map19_flag21F_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $19
		bne.s   loc_62CAE
		move.w  #$19,d0
		jsr     MoveEntityOutOfMap
loc_62CAE:
		
		trap    #CHECK_FLAG
		dc.w 8
		bne.s   loc_62CBE
		move.w  #8,d0
		jsr     MoveEntityOutOfMap
loc_62CBE:
		
		trap    #CHECK_FLAG
		dc.w $1B
		bne.s   loc_62CCE
		move.w  #$1B,d0
		jsr     MoveEntityOutOfMap
loc_62CCE:
		
		lea     cs_62D06(pc), a0
		trap    #6
		trap    #CHECK_FLAG
		dc.w $3D5
		beq.s   loc_62CFC
		trap    #CHECK_FLAG
		dc.w $3D6
		bne.s   loc_62CF2
		lea     cs_62D0E(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $3D6
		move.b  #$FF,((FOLLOWERS_LIST-$1000000)).w
		bra.s   loc_62CFA
loc_62CF2:
		
		trap    #SOUND_COMMAND
		dc.w MUSIC_TOWN
		jsr     (FadeInFromBlack).w
loc_62CFA:
		
		bra.s   return_62D04
loc_62CFC:
		
		trap    #SOUND_COMMAND
		dc.w MUSIC_TOWN
		jsr     (FadeInFromBlack).w
return_62D04:
		
		rts

	; End of function ms_map19_flag21F_InitFunction

cs_62D06:
		entitySprite $B,$AA     
						; 001A SET ENTITY SPRITE B AA
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_62D0E:
		textCursor $F7F         
						; Initial text line $F7F : "King Granseal, {LEADER}{N}is here!{W1}"
		setCameraEntity $81     
						; 0024 SET ENTITY FOLLOWED BY CAMERA 81
		entityPosDir $81,$1A,$1D,$1
						; 0019 SET ENTITY POS AND FACING 81 1A 1D 1
		entityPosDir $4,$1A,$1E,$1
						; 0019 SET ENTITY POS AND FACING 4 1A 1E 1
		entityPosDir $1,$1A,$1E,$1
						; 0019 SET ENTITY POS AND FACING 1 1A 1E 1
		entityPosDir $3,$1A,$1E,$1
						; 0019 SET ENTITY POS AND FACING 3 1A 1E 1
		entityPosDir $2,$1A,$1E,$1
						; 0019 SET ENTITY POS AND FACING 2 1A 1E 1
		followEntity $0,$81,$2  
						; 002C FOLLOW ENTITY 0 81 2
		followEntity $4,$81,$5  
						; 002C FOLLOW ENTITY 4 81 5
		followEntity $1,$81,$6  
						; 002C FOLLOW ENTITY 1 81 6
		followEntity $3,$4,$2   
						; 002C FOLLOW ENTITY 3 4 2
		followEntity $2,$1,$2   
						; 002C FOLLOW ENTITY 2 1 2
		csWait $A               
						; WAIT A
		fadeInB                 
						; 0039 FADE IN FROM BLACK
		moveEntity $81,$FF,$1,$4
						; 002D MOVE ENTITY 81 FF 1 4
		moreMove $0,$3
		moreMove $1,$2
		endMove $8080
		csc43 $1D,$17           
						; 0043 UNKNOWN, RELATED TO BLOCK COPY
		moveEntity $81,$FF,$1,$E
						; 002D MOVE ENTITY 81 FF 1 E
		endMove $8080
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $1,$FF,eas_Init
						; 0015 SET ACTSCRIPT 1 FF 460CE
		setActscript $3,$FF,eas_Init
						; 0015 SET ACTSCRIPT 3 FF 460CE
		setActscript $2,$FF,eas_Init
						; 0015 SET ACTSCRIPT 2 FF 460CE
		setActscript $4,$FF,eas_Init
						; 0015 SET ACTSCRIPT 4 FF 460CE
		setCamDest $18,$5       
						; 0032 SET CAMERA DEST 18 5
		csWait $28              
						; WAIT 28
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
		csWait $1E              
						; WAIT 1E
		nextSingleText $0,$81   
						; "King Granseal, {LEADER}{N}is here!{W1}"
		entityNod $80           
						; 0026 MAKE ENTITY NOD 80
		nextSingleText $80,$80  
						; "Please explain what is{N}happening.{W1}"
		csWait $A               
						; WAIT A
		entityNod $81           
						; 0026 MAKE ENTITY NOD 81
		nextSingleText $0,$81   
						; "Yes, sir.{W1}"
		moveEntity $81,$FF,$0,$1
						; 002D MOVE ENTITY 81 FF 0 1
		moreMove $B,$1
		endMove $8080
		csWait $1E              
						; WAIT 1E
		entityNod $81           
						; 0026 MAKE ENTITY NOD 81
		setEntityDir $0,$1      
						; 0023 SET ENTITY FACING 0 1
		setEntityDir $1,$1      
						; 0023 SET ENTITY FACING 1 1
		setEntityDir $3,$1      
						; 0023 SET ENTITY FACING 3 1
		setEntityDir $2,$1      
						; 0023 SET ENTITY FACING 2 1
		setEntityDir $4,$1      
						; 0023 SET ENTITY FACING 4 1
		setEntityDir $5,$1      
						; 0023 SET ENTITY FACING 5 1
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		setEntityDir $A,$1      
						; 0023 SET ENTITY FACING A 1
		setEntityDir $19,$1     
						; 0023 SET ENTITY FACING 19 1
		setEntityDir $8,$1      
						; 0023 SET ENTITY FACING 8 1
		setEntityDir $13,$1     
						; 0023 SET ENTITY FACING 13 1
		setEntityDir $B,$1      
						; 0023 SET ENTITY FACING B 1
		setEntityDir $1A,$1     
						; 0023 SET ENTITY FACING 1A 1
		setEntityDir $1B,$1     
						; 0023 SET ENTITY FACING 1B 1
		csWait $A               
						; WAIT A
		nextText $0,$81         
						; "Listen up!{W2}"
		nextText $0,$81         
						; "It took two years, but the{N}Princess finally recovered{N}from the poison.{W2}"
		nextSingleText $0,$81   
						; "But she's still sleeping.{N}We've decided to take{N}Mitula's advice.{W1}"
		setActscript $7,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 7 FF 45E44
		setActscript $7,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 7 FF 45E44
		nextSingleText $80,$7   
						; "Mitula...you mean, somebody{N}gets to kiss her?{W1}"
		csWait $A               
						; WAIT A
		entityShiver $1         
						; 002A MAKE ENTITY SHIVER 1
		csWait $A               
						; WAIT A
		setEntityDir $81,$1     
						; 0023 SET ENTITY FACING 81 1
		csWait $28              
						; WAIT 28
		entityNod $80           
						; 0026 MAKE ENTITY NOD 80
		csWait $1E              
						; WAIT 1E
		nextSingleText $0,$80   
						; "Yes.{N}We feel this is the right{N}time.{W1}"
		csWait $1E              
						; WAIT 1E
		setEntityDir $81,$3     
						; 0023 SET ENTITY FACING 81 3
		nextSingleText $0,$81   
						; "And we need to decide which{N}one of you will kiss{N}Elis.{W1}"
		setEntityDir $7,$2      
						; 0023 SET ENTITY FACING 7 2
		nextSingleText $80,$7   
						; "We don't have to decide.{N}It's {LEADER}.{N}{NAME;10}, don't you agree?{W1}"
		setEntityDir $7,$3      
						; 0023 SET ENTITY FACING 7 3
		csWait $14              
						; WAIT 14
		entityShiver $A         
						; 002A MAKE ENTITY SHIVER A
		csWait $14              
						; WAIT 14
		nextText $80,$A         
						; "Ha, ha!  Yes, {NAME;7}!{W2}"
		csWait $A               
						; WAIT A
		setEntityDir $A,$2      
						; 0023 SET ENTITY FACING A 2
		nextSingleText $80,$A   
						; "I always thought {LEADER}{N}was the best choice!{W1}"
		moveEntity $81,$FF,$0,$2
						; 002D MOVE ENTITY 81 FF 0 2
		moreMove $B,$1
		endMove $8080
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		setEntityDir $A,$1      
						; 0023 SET ENTITY FACING A 1
		nextSingleText $0,$81   
						; "Are you sure?{N}Anybody disagree?{W1}"
		setEntityDir $7,$3      
						; 0023 SET ENTITY FACING 7 3
		csWait $3C              
						; WAIT 3C
		moveEntity $81,$FF,$2,$2
						; 002D MOVE ENTITY 81 FF 2 2
		moreMove $B,$1
		endMove $8080
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		nextSingleText $0,$81   
						; "Nobody?{W1}"
		csWait $1E              
						; WAIT 1E
		moveEntity $81,$FF,$2,$2
						; 002D MOVE ENTITY 81 FF 2 2
		moreMove $B,$1
		endMove $8080
		setEntityDir $7,$3      
						; 0023 SET ENTITY FACING 7 3
		setEntityDir $4,$0      
						; 0023 SET ENTITY FACING 4 0
		setEntityDir $A,$1      
						; 0023 SET ENTITY FACING A 1
		setEntityDir $19,$3     
						; 0023 SET ENTITY FACING 19 3
		setEntityDir $8,$3      
						; 0023 SET ENTITY FACING 8 3
		setEntityDir $13,$3     
						; 0023 SET ENTITY FACING 13 3
		setEntityDir $B,$1      
						; 0023 SET ENTITY FACING B 1
		setEntityDir $0,$3      
						; 0023 SET ENTITY FACING 0 3
		csWait $28              
						; WAIT 28
		setCamDest $18,$7       
						; 0032 SET CAMERA DEST 18 7
		csWait $5               
						; WAIT 5
		setActscript $3,$0,eas_461B6
						; 0015 SET ACTSCRIPT 3 0 461B6
		csWait $64              
						; WAIT 64
		moveEntity $3,$FF,$3,$1 
						; 002D MOVE ENTITY 3 FF 3 1
		endMove $8080
		setEntityDir $3,$0      
						; 0023 SET ENTITY FACING 3 0
		entityShiver $3         
						; 002A MAKE ENTITY SHIVER 3
		setEntityDir $1,$3      
						; 0023 SET ENTITY FACING 1 3
		setEntityDir $2,$3      
						; 0023 SET ENTITY FACING 2 3
		setEntityDir $4,$3      
						; 0023 SET ENTITY FACING 4 3
		setEntityDir $5,$0      
						; 0023 SET ENTITY FACING 5 0
		setEntityDir $A,$2      
						; 0023 SET ENTITY FACING A 2
		setEntityDir $19,$0     
						; 0023 SET ENTITY FACING 19 0
		setEntityDir $8,$0      
						; 0023 SET ENTITY FACING 8 0
		setEntityDir $13,$2     
						; 0023 SET ENTITY FACING 13 2
		setEntityDir $B,$0      
						; 0023 SET ENTITY FACING B 0
		setEntityDir $1A,$0     
						; 0023 SET ENTITY FACING 1A 0
		setEntityDir $1B,$2     
						; 0023 SET ENTITY FACING 1B 2
		setEntityDir $0,$3      
						; 0023 SET ENTITY FACING 0 3
		nextText $0,$3          
						; "I understand what my friends{N}are saying, but...I love{N}her.{W2}"
		nextSingleText $0,$3    
						; "May I kiss her?{N}Somebody, say yes!{W1}"
		csWait $5               
						; WAIT 5
		setActscript $3,$0,eas_461B6
						; 0015 SET ACTSCRIPT 3 0 461B6
		entityShiver $1         
						; 002A MAKE ENTITY SHIVER 1
		csWait $14              
						; WAIT 14
		setEntityDir $7,$3      
						; 0023 SET ENTITY FACING 7 3
		setEntityDir $A,$1      
						; 0023 SET ENTITY FACING A 1
		csWait $14              
						; WAIT 14
		entityShakeHead $A      
						; 0027 MAKE ENTITY SHAKE HEAD A
		csWait $14              
						; WAIT 14
		moveEntity $7,$FF,$2,$1 
						; 002D MOVE ENTITY 7 FF 2 1
		moreMove $3,$2
		moreMove $A,$1
		endMove $8080
		setEntityDir $A,$2      
						; 0023 SET ENTITY FACING A 2
		setEntityDir $3,$0      
						; 0023 SET ENTITY FACING 3 0
		nextSingleText $80,$7   
						; "Sorry, but...I don't think{N}{NAME;3} is the right{N}choice.{W1}"
		entityShiver $3         
						; 002A MAKE ENTITY SHIVER 3
		moveEntity $5,$FF,$0,$1 
						; 002D MOVE ENTITY 5 FF 0 1
		moreMove $3,$1
		moreMove $8,$1
		endMove $8080
		setEntityDir $3,$2      
						; 0023 SET ENTITY FACING 3 2
		nextText $0,$5          
						; "I understand {NAME;3}, but{N}she is a human.{W2}"
		nextSingleText $0,$5    
						; "A human is the best choice.{W1}"
		entityShiver $3         
						; 002A MAKE ENTITY SHIVER 3
		jumpIfFlagClear $8,cs_62FB0
						; May joined
		moveEntity $8,$FF,$3,$1 
						; 002D MOVE ENTITY 8 FF 3 1
		moreMove $8,$1
		endMove $8080
		nextSingleText $0,$8    
						; "{LEADER} is a human!{N}They will make a cute couple!{W1}"
		entityShiver $3         
						; 002A MAKE ENTITY SHIVER 3
cs_62FB0:
		textCursor $F93         
						; Initial text line $F93 : "{LEADER} is a good lad{N}with the manner of a{N}knight!{W2}"
		moveEntity $7,$FF,$1,$1 
						; 002D MOVE ENTITY 7 FF 1 1
		moreMove $B,$1
		endMove $8080
		moveEntity $13,$FF,$2,$1
						; 002D MOVE ENTITY 13 FF 2 1
		endMove $8080
		setEntityDir $3,$0      
						; 0023 SET ENTITY FACING 3 0
		nextText $80,$13        
						; "{LEADER} is a good lad{N}with the manner of a{N}knight!{W2}"
		nextSingleText $80,$13  
						; "I think he's the best{N}choice.{W1}"
		entityShiver $3         
						; 002A MAKE ENTITY SHIVER 3
		csWait $1E              
						; WAIT 1E
		moveEntity $81,$FF,$0,$2
						; 002D MOVE ENTITY 81 FF 0 2
		moreMove $3,$1
		endMove $8080
		nextSingleText $0,$81   
						; "{NAME;1}, what do you{N}think?{W1}"
		entityShiver $1         
						; 002A MAKE ENTITY SHIVER 1
		setEntityDir $1,$1      
						; 0023 SET ENTITY FACING 1 1
		setEntityDir $3,$1      
						; 0023 SET ENTITY FACING 3 1
		setEntityDir $2,$1      
						; 0023 SET ENTITY FACING 2 1
		setEntityDir $4,$1      
						; 0023 SET ENTITY FACING 4 1
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		setEntityDir $13,$1     
						; 0023 SET ENTITY FACING 13 1
		setEntityDir $0,$1      
						; 0023 SET ENTITY FACING 0 1
		nextText $80,$1         
						; "M...me?  Well...{W2}"
		entityShiver $1         
						; 002A MAKE ENTITY SHIVER 1
		nextText $80,$1         
						; "I'm worried about her...{N}but...I...{W2}"
		setEntityDir $1,$2      
						; 0023 SET ENTITY FACING 1 2
		csWait $1E              
						; WAIT 1E
		setEntityDir $1,$1      
						; 0023 SET ENTITY FACING 1 1
		csWait $A               
						; WAIT A
		nextSingleText $80,$1   
						; "Yes, a good choice....{N}{LEADER} will make her...{N}...happy....{W1}"
		customActscript $1,$FF  
						; 0014 SET MANUAL ACTSCRIPT 1
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $2,$FF  
						; 0014 SET MANUAL ACTSCRIPT 2
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1,$0,$3,$1  
						; 002D MOVE ENTITY 1 0 3 1
		endMove $8080
		moveEntity $2,$FF,$2,$1 
						; 002D MOVE ENTITY 2 FF 2 1
		endMove $8080
		setActscript $2,$0,eas_RotateRight
						; 0015 SET ACTSCRIPT 2 0 45FBC
		setEntityDir $0,$3      
						; 0023 SET ENTITY FACING 0 3
		setEntityDir $4,$3      
						; 0023 SET ENTITY FACING 4 3
		setEntityDir $3,$3      
						; 0023 SET ENTITY FACING 3 3
		setEntityDir $7,$3      
						; 0023 SET ENTITY FACING 7 3
		setEntityDir $13,$3     
						; 0023 SET ENTITY FACING 13 3
		moveEntity $1,$FF,$3,$8 
						; 002D MOVE ENTITY 1 FF 3 8
		endMove $8080
		hideEntity $1           
						; 002E HIDE ENTITY 1
		setActscript $2,$FF,eas_Init
						; 0015 SET ACTSCRIPT 2 FF 460CE
		startEntity $2          
						; 001B START ENTITY ANIM 2
		setEntityDir $2,$3      
						; 0023 SET ENTITY FACING 2 3
		entityShakeHead $2      
						; 0027 MAKE ENTITY SHAKE HEAD 2
		csWait $1E              
						; WAIT 1E
		setCamDest $18,$9       
						; 0032 SET CAMERA DEST 18 9
		moveEntity $2,$FF,$3,$2 
						; 002D MOVE ENTITY 2 FF 3 2
		endMove $8080
		csWait $32              
						; WAIT 32
		nextSingleText $0,$2    
						; "Does she love {LEADER}?{N}I didn't know that.{W1}"
		setActscript $4,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 4 FF 45E44
		setActscript $4,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 4 FF 45E44
		moveEntity $4,$FF,$3,$1 
						; 002D MOVE ENTITY 4 FF 3 1
		moreMove $0,$2
		moreMove $3,$2
		moreMove $A,$1
		endMove $8080
		setEntityDir $2,$0      
						; 0023 SET ENTITY FACING 2 0
		nextSingleText $80,$4   
						; "Stop!{N}I will go and comfort her.{W1}"
		setEntityDir $2,$3      
						; 0023 SET ENTITY FACING 2 3
		moveEntity $4,$0,$3,$2  
						; 002D MOVE ENTITY 4 0 3 2
		endMove $8080
		csWait $8               
						; WAIT 8
		setActscript $2,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 2 FF 45E44
		setActscript $2,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 2 FF 45E44
		nextSingleText $0,$2    
						; "{NAME;4}!{N}I'll go with you!{W1}"
		setEntityDir $4,$1      
						; 0023 SET ENTITY FACING 4 1
		nextSingleText $80,$4   
						; "Oh, c'mon.{N}She needs someone like me.{W1}"
		moveEntity $4,$FF,$3,$5 
						; 002D MOVE ENTITY 4 FF 3 5
		endMove $8080
		hideEntity $4           
						; 002E HIDE ENTITY 4
		csWait $1E              
						; WAIT 1E
		nextSingleText $0,$2    
						; "What does he mean?{N}I don't understand!{W1}"
		moveEntity $B,$FF,$0,$2 
						; 002D MOVE ENTITY B FF 0 2
		moreMove $3,$1
		moreMove $0,$2
		moreMove $B,$1
		endMove $8080
		nextSingleText $80,$B   
						; "They remind me of when I{N}was young.{W1}"
		moveEntity $1A,$FF,$0,$3
						; 002D MOVE ENTITY 1A FF 0 3
		moreMove $3,$1
		moreMove $8,$1
		endMove $8080
		nextSingleText $0,$1A   
						; "{NAME;11}, you were young{N}once?{W1}"
		entityShiver $1A        
						; 002A MAKE ENTITY SHIVER 1A
		setEntityDir $B,$2      
						; 0023 SET ENTITY FACING B 2
		setActscript $B,$FF,eas_Jump
						; 0015 SET ACTSCRIPT B FF 45E44
		setActscript $B,$FF,eas_Jump
						; 0015 SET ACTSCRIPT B FF 45E44
		nextSingleText $80,$B   
						; "Be quiet, you bucket of bolts!{W1}"
		setCamDest $18,$5       
						; 0032 SET CAMERA DEST 18 5
		moveEntity $A,$FF,$1,$1 
						; 002D MOVE ENTITY A FF 1 1
		moreMove $2,$2
		moreMove $9,$1
		endMove $8080
		setEntityDir $3,$1      
						; 0023 SET ENTITY FACING 3 1
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		setEntityDir $2,$1      
						; 0023 SET ENTITY FACING 2 1
		setEntityDir $A,$1      
						; 0023 SET ENTITY FACING A 1
		setEntityDir $B,$1      
						; 0023 SET ENTITY FACING B 1
		setEntityDir $1A,$1     
						; 0023 SET ENTITY FACING 1A 1
		setEntityDir $13,$1     
						; 0023 SET ENTITY FACING 13 1
		setEntityDir $0,$1      
						; 0023 SET ENTITY FACING 0 1
		nextText $80,$A         
						; "You heard everyone.{N}We think {LEADER} is the{N}right choice.{W2}"
		setEntityDir $A,$3      
						; 0023 SET ENTITY FACING A 3
		nextText $80,$A         
						; "{NAME;4} will take care{N}of {NAME;1}.{W2}"
		entityNod $81           
						; 0026 MAKE ENTITY NOD 81
		setEntityDir $A,$1      
						; 0023 SET ENTITY FACING A 1
		nextSingleText $80,$A   
						; "Everything went as you{N}expected, huh?{W1}"
		entityShiver $81        
						; 002A MAKE ENTITY SHIVER 81
		nextText $0,$81         
						; "You knew that?{N}{NAME;10}, you're smart.{W2}"
		nextText $0,$81         
						; "But I didn't know what{N}{NAME;1} or {NAME;3} would do.{W2}I didn't want to hurt their{N}feelings.{W1}"
		nextSingleText $0,$81   
						; "{LEADER}, I choose you.{W1}"
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
		moveEntity $80,$FF,$3,$1
						; 002D MOVE ENTITY 80 FF 3 1
		moreMove $0,$1
		moreMove $B,$1
		endMove $8080
		setEntityDir $81,$1     
						; 0023 SET ENTITY FACING 81 1
		nextSingleText $80,$80  
						; "Now, {LEADER}.{N}Please go awaken her.{W1}"
		moveEntity $80,$FF,$2,$1
						; 002D MOVE ENTITY 80 FF 2 1
		moreMove $3,$1
		endMove $8080
		nextSingleText $80,$80  
						; "The Minister is waiting{N}for you.{W1}"
		moveEntity $80,$FF,$1,$2
						; 002D MOVE ENTITY 80 FF 1 2
		moreMove $B,$1
		endMove $8080
		moveEntity $81,$FF,$2,$1
						; 002D MOVE ENTITY 81 FF 2 1
		moreMove $B,$1
		endMove $8080
		nextSingleText $0,$81   
						; "Oh, {LEADER}!{N}I really respect you.{W2}"
		csc_end                 
						; END OF CUTSCENE SCRIPT
