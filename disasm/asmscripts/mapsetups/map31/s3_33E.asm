
; SCRIPT SECTION mapsetups\map31\s3_33E :
; 
ms_map31_flag33E_Section3:
										dc.b 5
										dc.b 2
										dc.w sub_5D560-ms_map31_flag33E_Section3
										dc.w $FD00
										dc.w nullsub_93-ms_map31_flag33E_Section3

; =============== S U B R O U T I N E =======================================

nullsub_93:
										
										rts

	; End of function nullsub_93


; =============== S U B R O U T I N E =======================================

sub_5D560:
										
										trap    #1
										dc.w $342
										bne.s   return_5D570
										lea     cs_5D644(pc), a0
										trap    #6
										trap    #2
										dc.w $342
return_5D570:
										
										rts

	; End of function sub_5D560

										dc.b $4E 
										dc.b $75 
