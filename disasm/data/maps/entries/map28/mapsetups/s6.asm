
; ASM FILE data\maps\entries\map28\mapsetups\s6.asm :
; 0x5F3A0..0x5F3E8 : 

; =============== S U B R O U T I N E =======================================

ms_map28_InitFunction:
		
		rts

	; End of function ms_map28_InitFunction

cs_5F3A2:       setActscript $0,$FF,eas_Init
		setActscript $0,$FF,eas_Jump
		csWait 2
		playSound SFX_FALLING
		moveEntity $0,$FF,$7,$1
		endMove $8080
		csWait 2
		csc_end
cs_5F3C4:       setActscript $0,$FF,eas_Init
		csWait 2
		setActscript $0,$FF,eas_Jump
		csWait 2
		playSound SFX_FALLING
		moveEntity $0,$FF,$6,$1
		endMove $8080
		csWait 2
		csc_end
