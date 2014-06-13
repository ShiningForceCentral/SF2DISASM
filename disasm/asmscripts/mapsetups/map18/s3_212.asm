
; SCRIPT SECTION mapsetups\map18\s3_212 :
; 
ms_map18_flag212_Section3:
										dc.b $FF
										dc.b $16
										dc.w sub_61262-ms_map18_flag212_Section3
										dc.w $FD00
										dc.w return_61276-ms_map18_flag212_Section3

; =============== S U B R O U T I N E =======================================

sub_61262:
										
										trap    #1
										dc.w $4C
										beq.s   return_61276
										lea     cs_6143C(pc), a0
										trap    #6
										trap    #3
										dc.w $4C
										trap    #2
										dc.w $399
return_61276:
										
										rts

	; End of function sub_61262

