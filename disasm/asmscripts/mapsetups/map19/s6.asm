
; SCRIPT SECTION mapsetups\map19\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map19_InitFunction:
										
										trap    #1
										dc.w $25D
										bne.s   loc_530F6
										lea     cs_53104(pc), a0
										trap    #6
loc_530F6:
										
										trap    #1
										dc.w $260
										beq.s   ms_map19_flag1F5_InitFunction
										lea     cs_53104(pc), a0
										trap    #6
