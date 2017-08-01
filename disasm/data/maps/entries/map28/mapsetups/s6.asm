
; ASM FILE data\maps\entries\map28\mapsetups\s6.asm :
; 0x5F3A0..0x5F3E8 : 

; =============== S U B R O U T I N E =======================================

ms_map28_InitFunction:
		
		rts

	; End of function ms_map28_InitFunction

cs_5F3A2:
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $0,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 0 FF 45E44
		csWait $2               
						; WAIT 2
		playSound SFX_FALLING   
						; 0005 PLAY SOUND SFX_FALLING
		moveEntity $0,$FF,$7,$1 
						; 002D MOVE ENTITY 0 FF 7 1
		endMove $8080
		csWait $2               
						; WAIT 2
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5F3C4:
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		csWait $2               
						; WAIT 2
		setActscript $0,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 0 FF 45E44
		csWait $2               
						; WAIT 2
		playSound SFX_FALLING   
						; 0005 PLAY SOUND SFX_FALLING
		moveEntity $0,$FF,$6,$1 
						; 002D MOVE ENTITY 0 FF 6 1
		endMove $8080
		csWait $2               
						; WAIT 2
		csc_end                 
						; END OF CUTSCENE SCRIPT
