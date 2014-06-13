
; SCRIPT SECTION mapsetups\map11\s3 :
; 
ms_map11_Section3:  dc.b $27
										dc.b $B
										dc.w sub_57A72-ms_map11_Section3
										dc.w $FD00
										dc.w nullsub_75-ms_map11_Section3

; =============== S U B R O U T I N E =======================================

nullsub_75:
										
										rts

	; End of function nullsub_75


; =============== S U B R O U T I N E =======================================

sub_57A72:
										
										trap    #1
										dc.w $2D2
										bne.s   return_57A86
										lea     cs_57AAA(pc), a0
										trap    #6
										trap    #2
										dc.w $2D2
										trap    #2
										dc.w $2C7
return_57A86:
										
										rts

	; End of function sub_57A72

