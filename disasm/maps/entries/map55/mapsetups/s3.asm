
; SCRIPT SECTION maps\entries\map55\mapsetups\s3 :
; 
ms_map55_Section3:  dc.b 7
										dc.b 7
										dc.w sub_5E250-ms_map55_Section3
										dc.w $FD00
										dc.w return_5E25C-ms_map55_Section3

; =============== S U B R O U T I N E =======================================

sub_5E250:
										
										trap    #1
										dc.w $216
										beq.s   (Map66s0_Blocks+$6CA-ms_map55_EntityEvents)
										lea     word_5E27C(pc), a0
										trap    #6
return_5E25C:
										
										rts

	; End of function sub_5E250

