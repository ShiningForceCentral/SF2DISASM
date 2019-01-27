
; ASM FILE data\maps\entries\map14\mapsetups\s6.asm :
; 0x58F12..0x58F2A : 

; =============== S U B R O U T I N E =======================================

ms_map14_InitFunction:
		
		 
		chkFlg $2BF             ; set after the scene where Bowie brings the plank above deck, also set after the initial Ribble scene, where the guy runs away
		bne.s   return_58F28
		lea     cs_58FA4(pc), a0
		trap    #6
		setFlg $2BF             ; set after the scene where Bowie brings the plank above deck, also set after the initial Ribble scene, where the guy runs away
		move.b  #$E,((EGRESS_MAP_INDEX-$1000000)).w
return_58F28:
		rts

	; End of function ms_map14_InitFunction

