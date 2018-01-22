
; ASM FILE data\maps\entries\map21\mapsetups\s6.asm :
; 0x53F10..0x53F48 : 

; =============== S U B R O U T I N E =======================================

ms_map21_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $1F5               ; Battle 1 completed
		beq.s   loc_53F1C
		lea     cs_53F2A(pc), a0
		trap    #6
loc_53F1C:
		trap    #CHECK_FLAG
		dc.w $1FB               ; Battle 7 completed
		beq.s   return_53F28
		lea     cs_53FD8(pc), a0
		trap    #6
return_53F28:
		rts

	; End of function ms_map21_InitFunction

cs_53F2A:       customActscript $80,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		entityPosDir $80,$6,$10,$3
		csc_end
