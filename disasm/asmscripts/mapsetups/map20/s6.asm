
; SCRIPT SECTION mapsetups\map20\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map20_InitFunction:
										
										cmpi.l  #$22803780,((RAM_Entity_StructOffset_XAndStart-$1000000)).w
										bne.s   loc_53988
										trap    #1
										dc.w $25D
										bne.s   loc_53982
										lea     cs_53996(pc), a0
										trap    #6
										trap    #2
										dc.w $25D
										bra.s   loc_53988
loc_53982:
										
										lea     cs_53B60(pc), a0
										trap    #6
