
; ASM FILE data\maps\entries\map21\mapsetups\s6.asm :
; 0x53F10..0x53F48 : 

; =============== S U B R O U T I N E =======================================

ms_map21_InitFunction:
		
		 
		chkFlg $1F5             ; Battle 1 completed
		beq.s   byte_53F1C      
		lea     cs_53F2A(pc), a0
		trap    #6
byte_53F1C:
		chkFlg $1FB             ; Battle 7 completed
		beq.s   return_53F28
		lea     cs_53FD8(pc), a0
		trap    #6
return_53F28:
		rts

	; End of function ms_map21_InitFunction

cs_53F2A:       customActscriptWait $80
		 ac_setAnimCounter $0   ;   
		 ac_setFlip $1          ;   
		 ac_updateSprite        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		setPos $80,6,16,DOWN
		csc_end
