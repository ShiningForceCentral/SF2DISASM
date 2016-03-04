
; SCRIPT SECTION maps\entries\map77\mapsetups\s3 :
; 
ms_map77_Section3:  dc.w $FD00
										dc.w sub_50A6E-ms_map77_Section3

; =============== S U B R O U T I N E =======================================

sub_50A6E:
										
										trap    #1
										dc.w $219
										bne.s   return_50A80
										trap    #2
										dc.w $1B5
										move.l  #$100FF,((RAM_MapEventType-$1000000)).w
return_50A80:
										
										rts

	; End of function sub_50A6E


; =============== S U B R O U T I N E =======================================

nullsub_167:
										
										rts

	; End of function nullsub_167

