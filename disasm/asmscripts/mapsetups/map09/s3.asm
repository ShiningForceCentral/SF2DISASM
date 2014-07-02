
; SCRIPT SECTION mapsetups\map09\s3 :
; 
ms_map9_Section3:   dc.b 4
										dc.b $39
										dc.w sub_56866-ms_map9_Section3
										dc.b 4
										dc.b $3A
										dc.w sub_56866-ms_map9_Section3
										dc.b 4
										dc.b $3B
										dc.w sub_56866-ms_map9_Section3
										dc.w $FD00
										dc.w nullsub_183-ms_map9_Section3

; =============== S U B R O U T I N E =======================================

sub_56866:
										
										trap    #1
										dc.w $2D6
										bne.s   return_56876
										lea     cs_568F6(pc), a0
										trap    #6
										trap    #2
										dc.w $2D6
return_56876:
										
										rts

	; End of function sub_56866


; =============== S U B R O U T I N E =======================================

nullsub_183:
										
										rts

	; End of function nullsub_183

