
; SCRIPT SECTION mapsetups\map21\s6_1F5 :
; 

; =============== S U B R O U T I N E =======================================

ms_map21_flag1F5_InitFunction:
										
										trap    #1
										dc.w $1F5
										beq.s   ms_map21_flag1FA_InitFunction
										lea     cs_53F2A(pc), a0
										trap    #6
