
; SCRIPT SECTION maps\entries\map52\mapsetups\s3 :
; 
ms_map52_ZoneEvents:dc.b 3
										dc.b $17
										dc.w sub_5C4B6-ms_map52_ZoneEvents
										dc.b 4
										dc.b $17
										dc.w sub_5C4B6-ms_map52_ZoneEvents
										dc.w $FD00
										dc.w return_5C4CA-ms_map52_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5C4B6:
										
										trap    #CHECK_FLAG
										dc.w $2C9
										bne.s   return_5C4CA
										lea     word_5C4EE(pc), a0
										jsr     ExecuteMapScript
										trap    #SET_FLAG
										dc.w $2C9               ; set after the scene at the cliffs before Bedoe, where the devils are searching
return_5C4CA:
										
										rts

	; End of function sub_5C4B6

