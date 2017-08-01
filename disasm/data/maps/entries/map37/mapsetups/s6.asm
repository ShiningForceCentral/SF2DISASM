
; ASM FILE data\maps\entries\map37\mapsetups\s6.asm :
; 0x5FA88..0x5FAA4 : 

; =============== S U B R O U T I N E =======================================

ms_map37_InitFunction:
		
		jsr     sub_47948
		trap    #CHECK_FLAG
		dc.w $344
		beq.s   return_5FA9A
		lea     cs_5FA9C(pc), a0
		trap    #6
return_5FA9A:
		rts

	; End of function ms_map37_InitFunction

cs_5FA9C:       entityPosDir $1A,$8,$A,$0; 0019 SET ENTITY POS AND FACING 1A 8 A 0
		csc_end                 ; END OF CUTSCENE SCRIPT
