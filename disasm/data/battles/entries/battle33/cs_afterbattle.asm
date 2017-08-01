
; ASM FILE data\battles\entries\battle33\cs_afterbattle.asm :
; 0x4D09A..0x4D342 : Cutscene after battle 33
abcs_battle33:
		textCursor $B3C         
						; Initial text line $B3C : "There may be some survivors{N}somewhere.{W1}"
		loadMapFadeIn $1F,$8,$6
		loadMapEntities ce_4D322
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$D,$B,$1
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$C,$9,$3
		setBlocks $327,$101,$1008
		stopEntity $80
		setActscript $80,$FF,eas_46172
		moveEntity $80,$0,$3,$1
		endMove $8080
		csWait $4
		setActscript $80,$FF,eas_461AA
		moveEntity $1A,$0,$3,$1
		endMove $8080
		csWait $2
		setActscript $1A,$FF,eas_461AA
		setActscript $1A,$FF,eas_45F9C
		fadeInB
		nextSingleText $0,$1F   
						; "There may be some survivors{N}somewhere.{W1}"
		csWait $5
		setActscript $0,$0,eas_461B6
		csWait $5
		setActscript $1F,$0,eas_461E4
		csWait $5
		setActscript $7,$0,eas_461B6
		csWait $78
		moveEntity $80,$0,$1,$1
		endMove $8080
		csWait $3
		moveEntity $80,$0,$3,$1
		endMove $8080
		csWait $3
		moveEntity $80,$0,$1,$1
		endMove $8080
		csWait $3
		moveEntity $80,$0,$3,$1
		endMove $8080
		csWait $3
		setActscript $80,$FF,eas_461AA
		setEntityDir $7,$0
		setActscript $7,$FF,eas_Jump
		csWait $28
		moveEntity $7,$FF,$0,$3
		endMove $8080
		setEntityDir $7,$1
		setEntityDir $0,$0
		setEntityDir $1F,$0
		customActscript $80,$FF
		dc.w $10                
						;   0010 SET SPEED X=$18 Y=$18
		dc.b $18
		dc.b $18
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$0,$1,$1
		endMove $8080
		csWait $8
		setActscript $80,$FF,eas_461AA
		csWait $32
		customActscript $80,$FF
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$0,$3,$1
		endMove $8080
		csWait $4
		setQuakeAmount $2
		setActscript $80,$FF,eas_461AA
		csWait $A
		setQuakeAmount $0
		csWait $28
		moveEntity $7,$FF,$1,$2
		endMove $8080
		nextSingleText $0,$80   
						; "Do not touch my rock!{W1}"
		setActscript $7,$FF,eas_Jump
		setActscript $7,$FF,eas_46172
		customActscript $7,$FF
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $7,$FF,$3,$2
		endMove $8080
		setCamDest $A,$6
		customActscript $80,$FF
		dc.w $10                
						;   0010 SET SPEED X=$18 Y=$18
		dc.b $18
		dc.b $18
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$0,$1,$1
		endMove $8080
		csWait $8
		setActscript $80,$FF,eas_461AA
		nextText $0,$80         
						; "Did you defeat all those{N}devils?{W2}"
		nextSingleText $0,$80   
						; "I was wondering why it became{N}quiet so suddenly.{W1}"
		moveEntity $1F,$0,$0,$3
		moreMove $1,$1
		endMove $8080
		moveEntity $0,$FF,$0,$4
		endMove $8080
		setEntityDir $1F,$0
		setEntityDir $0,$1
		nextSingleText $0,$1F   
						; "Are you a survivor?{N}Are you from Moun?{N}What's your name?{W1}"
		nextSingleText $0,$80   
						; "I am {NAME;26}.{N}I am not from Moun.{W1}"
		nextSingleText $0,$1F   
						; "Then, where are you from?{W1}"
		nextSingleText $0,$80   
						; "The past.{W1}"
		nextSingleText $0,$1F   
						; "What do you mean?{W1}"
		nextText $0,$80         
						; "I cannot explain.{W2}"
		nextSingleText $0,$80   
						; "I am what I am.{N}That is all that I am.{W1}"
		customActscript $80,$FF
		dc.w $10                
						;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $80,$FF,eas_JumpRight
		customActscript $80,$FF
		dc.w $10                
						;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $80,$FF,eas_46172
		moveEntity $80,$0,$3,$1
		endMove $8080
		entityPosDir $1A,$10,$8,$3
		setActscript $1A,$FF,eas_Init
		csWait $3
		setActscript $80,$FF,eas_461AA
		setQuakeAmount $2
		csWait $14
		setQuakeAmount $0
		nextText $0,$1F         
						; "I've never seen anyone like{N}you.{W2}"
		nextSingleText $0,$1F   
						; "Where are the people of{N}Moun?  Were there any{N}survivors?{W1}"
		nextSingleText $C0,$1A  
						; "Some.{W1}"
		nextText $0,$1F         
						; "That's good news.{W2}"
		nextSingleText $0,$1F   
						; "And where are they?{W1}"
		nextSingleText $C0,$1A  
						; "Down here.  Follow me.{W1}"
		entityPosDir $1A,$3F,$3F,$3
		setActscript $7,$FF,eas_Jump
		csWait $1E
		moveEntity $7,$FF,$1,$2
		endMove $8080
		setEntityDir $1F,$3
		nextText $0,$1F         
						; "{LEADER}, hurry!{N}Follow {NAME;26}!{W2}"
		nextSingleText $0,$1F   
						; "{NAME;26} knows where{N}they're hiding.{W1}"
		followEntity $1F,$0,$2
		followEntity $7,$1F,$2
		setF $341               
						; set after the scene after you win the battle in Moun plays out
		csc_end                 
						; END OF CUTSCENE SCRIPT
ce_4D322:
		dc.b   0
		dc.b  $B
		dc.b   0
		dc.b  $B
		dc.w 1
		dc.b $D
		dc.b $B
		dc.b 1
		dc.b 7
		dc.l eas_Init           
		dc.b $10
		dc.b 8
		dc.b 1
		dc.b $B3
		dc.l eas_Init           
		dc.b $10
		dc.b 8
		dc.b 3
		dc.b $1A
		dc.l eas_Init           
		dc.w $FFFF
