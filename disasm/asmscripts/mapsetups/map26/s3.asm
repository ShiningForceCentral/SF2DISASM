
; SCRIPT SECTION mapsetups\map26\s3 :
; 
ms_map26_Section3:  dc.b $E
										dc.b $FF
										dc.w sub_59DBE-ms_map26_Section3
										dc.w $FD00
										dc.w nullsub_91-ms_map26_Section3

; =============== S U B R O U T I N E =======================================

sub_59DBE:
										
										trap    #1
										dc.w $30C
										bne.s   return_59DCE
										lea     cs_59F20(pc), a0
										trap    #6
										trap    #2
										dc.w $30C
return_59DCE:
										
										rts

	; End of function sub_59DBE


; =============== S U B R O U T I N E =======================================

nullsub_91:
										
										rts

	; End of function nullsub_91

