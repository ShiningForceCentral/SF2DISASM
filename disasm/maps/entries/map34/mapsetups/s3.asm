
; SCRIPT SECTION maps\entries\map34\mapsetups\s3 :
; 
ms_map34_Section3:  dc.b $FF
										dc.b $D
										dc.w sub_5B69E-ms_map34_Section3
										dc.w $FD00
										dc.w return_5B6B2-ms_map34_Section3

; =============== S U B R O U T I N E =======================================

sub_5B69E:
										
										trap    #1
										dc.w $310
										bne.s   return_5B6B2
										lea     cs_5B6C0(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $310               ; set after the event in the basement of Creed's Mansion
										trap    #TRAP_SETFLAG
										dc.w $322               ; set after the event in the basement of Creed's Mansion
return_5B6B2:
										
										rts

	; End of function sub_5B69E

