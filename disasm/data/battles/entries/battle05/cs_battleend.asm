
; ASM FILE data\battles\entries\battle05\cs_battleend.asm :
; 0x49AB2..0x49B48 : Enemy defeated cutscene for battle 5
edcs_battle5:
		textCursor $913         
						; Initial text line $913 : "You, rat!  I threw you into{N}jail after I took your{N}jewels....{W1}"
		stopEntity $80
		setEntityDir $0,$1
		setEntityDir $5,$1
		setActscript $5,$FF,eas_Init
		setCamDest $C,$0
		csWait $1E
		entityShiver $80
		nextSingleText $0,$80   
						; "You, rat!  I threw you into{N}jail after I took your{N}jewels....{W1}"
		setActscript $5,$FF,eas_Jump
		setActscript $5,$FF,eas_Jump
		nextText $0,$5          
						; "Hee, hee!  You expect a thief{N}to stay in jail?{W2}"
		nextSingleText $0,$5    
						; "Give me the jewels.{W1}"
		moveEntity $5,$FF,$0,$1
		moreMove $1,$2
		endMove $8080
		setEntityDir $5,$2
		csWait $1E
		nextSingleText $FF,$FF  
						; "{NAME;5} searched the tool{N}bag of the Galam Knight.{W1}"
		csWait $28
		setEntityDir $5,$3
		setActscript $5,$FF,eas_Jump
		setActscript $5,$0,eas_Jump
		nextSingleText $0,$5    
						; "Yes!  I found one!{W1}"
		nextSingleText $FF,$FF  
						; "{NAME;5} has the Jewel{N}of Light.{W1}"
		setEntityDir $5,$2
		csWait $14
		setActscript $5,$FF,eas_BumpLeft
		entityShiver $80
		nextSingleText $0,$5    
						; "Where is the other jewel?{W1}"
		entityShiver $80
		nextText $0,$80         
						; "K...King Galam...took it into{N}battle.{W2}"
		nextSingleText $0,$80   
						; "Take the jewel.  You won't{N}have it long.  We'll get it{N}back!{W1}"
		csc_end                 
						; END OF CUTSCENE SCRIPT
