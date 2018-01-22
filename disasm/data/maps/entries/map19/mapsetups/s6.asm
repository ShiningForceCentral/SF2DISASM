
; ASM FILE data\maps\entries\map19\mapsetups\s6.asm :
; 0x530EA..0x5310C : 

; =============== S U B R O U T I N E =======================================

ms_map19_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $25D               ; set after the scene in the King's bedroom
		bne.s   loc_530F6
		lea     cs_53104(pc), a0
		trap    #6
loc_530F6:
		trap    #CHECK_FLAG
		dc.w $260               ; set after agreeing to go to the tower with Astral
		beq.s   return_53102
		lea     cs_53104(pc), a0
		trap    #6
return_53102:
		rts

	; End of function ms_map19_InitFunction

cs_53104:       setPos $8C,63,63,LEFT
		csc_end
