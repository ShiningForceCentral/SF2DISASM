
; ASM FILE data\maps\entries\map37\mapsetups\s6.asm :
; 0x5FA88..0x5FAA4 : 

; =============== S U B R O U T I N E =======================================

ms_map37_InitFunction:
		
		jsr     sub_47948
		chkFlg  $344            ; set after the scene where Zynk stops you as you leave the Moun underground
		beq.s   return_5FA9A
		script  cs_5FA9C
return_5FA9A:
		rts

	; End of function ms_map37_InitFunction

cs_5FA9C:       setPos $1A,8,10,RIGHT
		csc_end
