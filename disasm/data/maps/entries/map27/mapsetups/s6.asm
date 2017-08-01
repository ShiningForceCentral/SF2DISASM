
; ASM FILE data\maps\entries\map27\mapsetups\s6.asm :
; 0x59FB6..0x5A09E : 

; =============== S U B R O U T I N E =======================================

ms_map27_InitFunction:
		
		rts

	; End of function ms_map27_InitFunction

cs_59FB8:
		textCursor $6C5         
						; Initial text line $6C5 : "(Sniff, sniff)...{N}It smells like a ditch!{W1}"
		setActscript $1F,$FF,eas_Init
						; 0015 SET ACTSCRIPT 1F FF 460CE
		setActscript $7,$FF,eas_Init
						; 0015 SET ACTSCRIPT 7 FF 460CE
		csc45 $30               
						; (null)
		setCamDest $16,$F       
						; 0032 SET CAMERA DEST 16 F
		setEntityDest $1F,$1A,$14
						; 0029 SET ENTITY DEST 1F 1A 14
		csWait $5               
						; WAIT 5
		setActscript $1F,$0,eas_461B6
						; 0015 SET ACTSCRIPT 1F 0 461B6
		csWait $78              
						; WAIT 78
		nextSingleText $0,$1F   
						; "(Sniff, sniff)...{N}It smells like a ditch!{W1}"
		setEntityDest $7,$1B,$14
						; 0029 SET ENTITY DEST 7 1B 14
		setEntityDir $1F,$0     
						; 0023 SET ENTITY FACING 1F 0
		entityShiver $7         
						; 002A MAKE ENTITY SHIVER 7
		nextSingleText $0,$7    
						; "Is this the smell of the{N}devils that they were{N}talking about?{W1}"
		setCamDest $24,$11      
						; 0032 SET CAMERA DEST 24 11
		setEntityDest $81,$29,$15
						; 0029 SET ENTITY DEST 81 29 15
		nextSingleText $C0,$81  
						; "Hee, hee!{W1}"
		setActscript $80,$0,eas_RotateRightHighSpeed
						; 0015 SET ACTSCRIPT 80 0 45FF0
		setActscript $81,$0,eas_RotateRightHighSpeed
						; 0015 SET ACTSCRIPT 81 0 45FF0
		setActscript $82,$0,eas_RotateRightHighSpeed
						; 0015 SET ACTSCRIPT 82 0 45FF0
		csWait $28              
						; WAIT 28
		setActscript $80,$FF,eas_Init
						; 0015 SET ACTSCRIPT 80 FF 460CE
		setActscript $81,$FF,eas_Init
						; 0015 SET ACTSCRIPT 81 FF 460CE
		setActscript $82,$FF,eas_Init
						; 0015 SET ACTSCRIPT 82 FF 460CE
		setEntityDir $80,$2     
						; 0023 SET ENTITY FACING 80 2
		setEntityDir $81,$2     
						; 0023 SET ENTITY FACING 81 2
		setEntityDir $82,$2     
						; 0023 SET ENTITY FACING 82 2
		setActscript $80,$0,eas_Jump
						; 0015 SET ACTSCRIPT 80 0 45E44
		setActscript $81,$0,eas_Jump
						; 0015 SET ACTSCRIPT 81 0 45E44
		setActscript $82,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 82 FF 45E44
		startEntity $80         
						; 001B START ENTITY ANIM 80
		startEntity $81         
						; 001B START ENTITY ANIM 81
		startEntity $82         
						; 001B START ENTITY ANIM 82
		nextSingleText $0,$7    
						; "What huge rats!{W1}"
		nextText $C0,$81        
						; "Welcome!{W2}"
		nextSingleText $C0,$81  
						; "It's dinner time!{W1}"
		setActscript $80,$0,eas_Jump
						; 0015 SET ACTSCRIPT 80 0 45E44
		setActscript $82,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 82 FF 45E44
		setStoryFlag $17        
						; Battle 23 unlocked
		mapSysEvent $1B000000   
						; 0007 EXECUTE MAP SYSTEM EVENT 1B000000
		csc_end                 
						; END OF CUTSCENE SCRIPT
