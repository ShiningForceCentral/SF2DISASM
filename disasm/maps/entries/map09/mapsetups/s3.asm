
; SCRIPT SECTION maps\entries\map09\mapsetups\s3 :
; 
ms_map9_ZoneEvents: dc.b 4
										dc.b $39
										dc.w sub_56866-ms_map9_ZoneEvents
										dc.b 4
										dc.b $3A
										dc.w sub_56866-ms_map9_ZoneEvents
										dc.b 4
										dc.b $3B
										dc.w sub_56866-ms_map9_ZoneEvents
										dc.w $FD00
										dc.w nullsub_183-ms_map9_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_56866:
										
										trap    #CHECK_FLAG
										dc.w $2D6               ; set after talking to the priest in upstairs Hassan
										bne.s   return_56876
										lea     cs_568F6(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $2D6               ; set after talking to the priest in upstairs Hassan
return_56876:
										
										rts

	; End of function sub_56866


; =============== S U B R O U T I N E =======================================

nullsub_183:
										
										rts

	; End of function nullsub_183

