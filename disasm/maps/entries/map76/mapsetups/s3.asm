
; SCRIPT SECTION maps\entries\map76\mapsetups\s3 :
; 
ms_map76_Section3:  dc.w $FD00
										dc.w sub_50A28-ms_map76_Section3

; =============== S U B R O U T I N E =======================================

sub_50A28:
										
										trap    #1
										dc.w $217
										bne.s   return_50A3A
										trap    #2
										dc.w $1B3
										move.l  #$100FF,((RAM_MapEventType-$1000000)).w
return_50A3A:
										
										rts

	; End of function sub_50A28


; =============== S U B R O U T I N E =======================================

nullsub_166:
										
										rts

	; End of function nullsub_166

