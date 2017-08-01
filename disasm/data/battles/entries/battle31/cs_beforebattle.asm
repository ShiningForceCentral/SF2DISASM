
; ASM FILE data\battles\entries\battle31\cs_beforebattle.asm :
; 0x4C994..0x4CBE2 : Cutscene before battle 31
bbcs_31:
		textCursor $AFB         
						; Initial text line $AFB : "Finally, you've left the{N}castle, Vicar {NAME;22}.{W1}"
		loadMapFadeIn $2,$10,$2
		loadMapEntities ce_4CB92
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$14,$3,$3
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$16,$3,$3
		setActscript $16,$FF,eas_Init
		entityPosDir $16,$15,$3,$3
		animEntityFadeInOut $80,$6
		animEntityFadeInOut $81,$6
		setActscript $82,$0,eas_AnimSpeedx2
		playSound MUSIC_BATTLE_THEME_1
		fadeInB
		csc45 $30               
						; (null)
		nextSingleText $C0,$80  
						; "Finally, you've left the{N}castle, Vicar {NAME;22}.{W1}"
		setCamDest $10,$5
		animEntityFadeInOut $80,$7
		nextSingleText $0,$7    
						; "Geshp!{W1}"
		nextSingleText $C0,$80  
						; "So, you remember me. {W1}"
		setCamDest $10,$2
		moveEntity $1F,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$1F   
						; "What do you want?{W1}"
		nextText $C0,$80        
						; "I have plans for you.{W2}"
		nextSingleText $C0,$80  
						; "I'm very happy that you came{N}out of the castle.{W1}"
		nextSingleText $0,$1F   
						; "Why?{W1}"
		nextText $C0,$80        
						; "I have been waiting for{N}{NAME;22}.{W2}"
		nextText $C0,$80        
						; "Vicar {NAME;22}, you locked{N}the gate of Moun, remember?{W2}"
		nextSingleText $C0,$80  
						; "My faithful soldiers can't{N}enter Parmecia.{N}Now, you will open it!{W1}"
		setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$1F   
						; "It's a trap!{W2}"
		moveEntity $1F,$FF,$1,$1
		endMove $8080
		setCamDest $10,$0
		setEntityDir $1F,$2
		nextSingleText $0,$1F   
						; "{NAME;22}, run!{W1}"
		moveEntity $16,$FF,$1,$1
		endMove $8080
		flashScreenWhite $2
		entityPosDir $82,$15,$1,$2
		csWait $1E
		setActscript $16,$FF,eas_Jump
		setActscript $16,$FF,eas_46172
		moveEntity $16,$FF,$3,$1
		endMove $8080
		nextSingleText $C0,$80  
						; "Ha, ha.  He can't.{W1}"
		setCamDest $10,$6
		setEntityDir $80,$3
		nextSingleText $C0,$80  
						; "Cameela!  Cameeeeeela!{W1}"
		nextSingleText $0,$7    
						; "Cameela?!  We met her in{N}Pangoat Valley.{W1}"
		animEntityFadeInOut $81,$7
		nextSingleText $0,$81   
						; "What?{W1}"
		nextText $C0,$80        
						; "Ah, Cameela.  You're here.{W2}"
		nextSingleText $C0,$80  
						; "Get the key for me!{W1}"
		nextSingleText $0,$81   
						; "Geshp, you're as devious as{N}usual.{W1}"
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $C0,$80  
						; "That I am.  Now, get the key!{W1}"
		nextSingleText $0,$81   
						; "Me?!  Why?{W1}"
		stopEntity $80
		csWait $28
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
		setActscript $80,$FF,eas_Jump
		setActscript $80,$FF,eas_Jump
		setActscript $80,$FF,eas_46172
		moveEntity $80,$FF,$1,$1
		endMove $8080
		startEntity $80
		nextSingleText $C0,$80  
						; "Cameela!{W1}"
		nextText $0,$81         
						; "I hate you!{N}I won't help you.{W2}"
		nextText $0,$81         
						; "You want the key?{N}You get it!{N}You can use my army.{W2}"
		nextSingleText $0,$81   
						; "See you later.{W1}"
		animEntityFadeInOut $81,$6
		nextText $C0,$80        
						; "That witch!{W2}"
		nextSingleText $C0,$80  
						; "Cameela!  Cameela!!{W1}"
		nextSingleText $0,$7    
						; "They're divided....{W1}"
		csWait $28
		entityShiver $80
		csWait $28
		setEntityDir $80,$1
		nextText $C0,$80        
						; "I don't need your help,{N}Cameela!{W2}"
		nextSingleText $C0,$80  
						; "Come on, devils!{N}Kill {LEADER} now!{W1}"
		setCamDest $10,$D
		csWait $28
		entityPosDir $83,$13,$12,$1
		entityPosDir $84,$15,$13,$1
		entityPosDir $85,$16,$12,$1
		entityPosDir $86,$17,$F,$1
		setActscript $83,$0,eas_Jump
		setActscript $84,$0,eas_Jump
		setActscript $85,$0,eas_Jump
		setActscript $86,$FF,eas_Jump
		csWait $1E
		setCamDest $10,$6
		nextSingleText $C0,$80  
						; "Bye, {LEADER}.{W1}"
		nextSingleText $0,$7    
						; "You're not staying?{W1}"
		nextText $C0,$80        
						; "I'm good at using my brains,{N}not my strength.{W2}"
		nextSingleText $C0,$80  
						; "I'll return by the time{N}you're defeated.{W1}"
		animEntityFadeInOut $80,$6
		csc_end                 
						; END OF CUTSCENE SCRIPT
ce_4CB92:
		dc.b   0
		dc.b $15
		dc.b   0
		dc.b   4
		dc.w 3
		dc.b $14
		dc.b 3
		dc.b 3
		dc.b 7
		dc.l eas_Init           
		dc.b $15
		dc.b 3
		dc.b 3
		dc.b $16
		dc.l eas_Init           
		dc.b $15
		dc.b 8
		dc.b 1
		dc.b $9F
		dc.l eas_Init           
		dc.b $15
		dc.b $B
		dc.b 1
		dc.b $9C
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 2
		dc.b $AB
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $8D
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $91
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $56
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $6F
		dc.l eas_Init           
		dc.w $FFFF
