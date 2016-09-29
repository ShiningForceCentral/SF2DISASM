
; SCRIPT SECTION maps\entries\map10\mapsetups\s3_2D2 :
; 
ms_map10_flag2D2_Section3:
										dc.b 6
										dc.b $17
										dc.w sub_56FC8-ms_map10_flag2D2_Section3
										dc.w $FD00
										dc.w nullsub_74+$10000-ms_map10_flag2D2_Section3

; =============== S U B R O U T I N E =======================================

sub_56FC8:
										
										trap    #1
										dc.w $D
										bne.s   return_56FDE
										trap    #1
										dc.w $2D4
										bne.s   return_56FDE
										lea     cs_5779C(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $2D4               ; set after the scene where Skreech falls in Bedoe
return_56FDE:
										
										rts

	; End of function sub_56FC8

