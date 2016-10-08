
; SCRIPT SECTION maps\entries\map10\mapsetups\s3_2D2 :
; 
ms_map10_flag2D2_ZoneEvents:
										dc.b 6
										dc.b $17
										dc.w sub_56FC8-ms_map10_flag2D2_ZoneEvents
										dc.w $FD00
										dc.w nullsub_74+$10000-ms_map10_flag2D2_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_56FC8:
										
										trap    #CHECK_FLAG
										dc.w $D                 ; Elric joined
										bne.s   return_56FDE
										trap    #CHECK_FLAG
										dc.w $2D4               ; set after the scene where Skreech falls in Bedoe
										bne.s   return_56FDE
										lea     cs_5779C(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $2D4               ; set after the scene where Skreech falls in Bedoe
return_56FDE:
										
										rts

	; End of function sub_56FC8

