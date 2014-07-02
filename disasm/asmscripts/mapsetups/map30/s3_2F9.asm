
; SCRIPT SECTION mapsetups\map30\s3_2F9 :
; 
ms_map30_Section3:  dc.b 7
										dc.b $D
										dc.w sub_5A2CA-ms_map30_Section3
										dc.w $FD00
										dc.w return_5A2E6-ms_map30_Section3

; =============== S U B R O U T I N E =======================================

sub_5A2CA:
										
										trap    #1
										dc.w $45
										beq.s   return_5A2E6
										trap    #1
										dc.w $2F8
										bne.s   return_5A2E6
										lea     cs_5A33A(pc), a0
										trap    #6
										bsr.s   sub_5A278
										trap    #2
										dc.w $2F8
										trap    #3
										dc.w $45
return_5A2E6:
										
										rts

	; End of function sub_5A2CA

