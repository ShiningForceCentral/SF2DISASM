
; SCRIPT SECTION mapsetups\map59\s3_21F :
; 
ms_map59_flag21F_Section3:
										dc.b $FF
										dc.b $24
										dc.w sub_615C0-ms_map59_flag21F_Section3
										dc.w $FD00
										dc.w nullsub_106-ms_map59_flag21F_Section3

; =============== S U B R O U T I N E =======================================

nullsub_106:
										
										rts

	; End of function nullsub_106


; =============== S U B R O U T I N E =======================================

sub_615C0:
										
										trap    #1
										dc.w $21F
										beq.s   return_615CC
										lea     cs_62658(pc), a0
										trap    #6
return_615CC:
										
										rts

	; End of function sub_615C0

