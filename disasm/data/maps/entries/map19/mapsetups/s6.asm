
; ASM FILE data\maps\entries\map19\mapsetups\s6.asm :
; 0x530EA..0x5310C : 

; =============== S U B R O U T I N E =======================================

ms_map19_InitFunction:
		
		 
		chkFlg $25D             ; set after the scene in the King's bedroom
		bne.s   byte_530F6      
		script  cs_53104
byte_530F6:
		chkFlg $260             ; set after agreeing to go to the tower with Astral
		beq.s   return_53102
		script  cs_53104
return_53102:
		rts

	; End of function ms_map19_InitFunction

cs_53104:       setPos $8C,63,63,LEFT
		csc_end
