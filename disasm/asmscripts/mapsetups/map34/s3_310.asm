
; SCRIPT SECTION mapsetups\map34\s3_310 :
; 
ms_map34_Section3:  dc.b $FF
										dc.b $D
										dc.w sub_5B69E-ms_map34_Section3
										dc.w $FD00
										dc.w return_5B6B2-ms_map34_Section3

; =============== S U B R O U T I N E =======================================

sub_5B69E:
										
										trap    #1
										dc.w $310
										bne.s   return_5B6B2
										lea     cs_5B6C0(pc), a0
										trap    #6
										trap    #2
										dc.w $310
										trap    #2
										dc.w $322
return_5B6B2:
										
										rts

	; End of function sub_5B69E

