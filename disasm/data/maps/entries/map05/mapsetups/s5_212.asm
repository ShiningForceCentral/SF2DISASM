
; ASM FILE data\maps\entries\map05\mapsetups\s5_212.asm :
; 0x60606..0x6061E : 
ms_map5_flag212_Section5:
		dc.b $FD
		dc.b 0
		dc.b 0
		dc.b 0
		dc.w nullsub_180-ms_map5_flag212_Section5

; =============== S U B R O U T I N E =======================================

nullsub_180:
		
		rts

	; End of function nullsub_180

cs_6060E:
		setActscript $1C,$FF,eas_45F9C
						; 0015 SET ACTSCRIPT 1C FF 45F9C
		entityPosDir $1C,$13,$21,$3
						; 0019 SET ENTITY POS AND FACING 1C 13 21 3
		csc_end                 
						; END OF CUTSCENE SCRIPT
