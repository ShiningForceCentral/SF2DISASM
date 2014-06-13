
; SCRIPT SECTION mapsetups\map10\s3 :
; 
ms_map10_Section3:  dc.b $1D
										dc.b $FF
										dc.w sub_56F9C-ms_map10_Section3
										dc.b $21
										dc.b $FF
										dc.w sub_56FAE-ms_map10_Section3
										dc.b $1F
										dc.b $35
										dc.w sub_56FAE-ms_map10_Section3
										dc.w $FD00
										dc.w nullsub_74-ms_map10_Section3

; =============== S U B R O U T I N E =======================================

nullsub_74:
										
										rts

	; End of function nullsub_74


; =============== S U B R O U T I N E =======================================

sub_56F9C:
										
										trap    #1
										dc.w $2D0
										bne.s   return_56FAC
										lea     cs_573EC(pc), a0
										trap    #6
										trap    #2
										dc.w $2D0
return_56FAC:
										
										rts

	; End of function sub_56F9C


; =============== S U B R O U T I N E =======================================

sub_56FAE:
										
										trap    #1
										dc.w $2D1
										bne.s   return_56FBE
										lea     cs_574A6(pc), a0
										trap    #6
										trap    #2
										dc.w $2D1
return_56FBE:
										
										rts

	; End of function sub_56FAE

