
; SCRIPT SECTION maps\entries\map39\mapsetups\s3 :
; 
ms_map39_Section3:  dc.b $12
										dc.b 7
										dc.w sub_5E0BC-ms_map39_Section3
										dc.w $FD00
										dc.w nullsub_98-ms_map39_Section3

; =============== S U B R O U T I N E =======================================

nullsub_98:
										
										rts

	; End of function nullsub_98


; =============== S U B R O U T I N E =======================================

sub_5E0BC:
										
										trap    #1
										dc.w $33E
										bne.s   return_5E0CC
										lea     cs_5E0F8(pc), a0
										trap    #6
										trap    #2
										dc.w $33E
return_5E0CC:
										
										rts

	; End of function sub_5E0BC

