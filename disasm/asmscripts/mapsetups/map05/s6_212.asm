
; SCRIPT SECTION mapsetups\map05\s6_212 :
; 

; =============== S U B R O U T I N E =======================================

ms_map5_flag212_InitFunction:
										
										trap    #1
										dc.w $3B0
										bne.s   loc_60630
										lea     cs_607DE(pc), a0
										trap    #6
										trap    #2
										dc.w $3B0
										bra.s   loc_60636
loc_60630:
										
										lea     cs_6060E(pc), a0
										trap    #6
