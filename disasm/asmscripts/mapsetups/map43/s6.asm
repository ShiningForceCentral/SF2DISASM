
; SCRIPT SECTION mapsetups\map43\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map43_InitFunction:
										
										lea     cs_540C0(pc), a0
										trap    #6
										trap    #2
										dc.w $264
										trap    #2
										dc.w $28A
										trap    #3
										dc.w $48
										move.b  #$2B,((RAM_EgressMapIdx-$1000000)).w 
