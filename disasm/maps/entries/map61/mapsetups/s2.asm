
; SCRIPT SECTION maps\entries\map61\mapsetups\s2 :
; 
ms_map61_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_5C67A-ms_map61_EntityEvents
										dc.w $FD00
										dc.w return_5C694-ms_map61_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5C67A:
										
										trap    #1
										dc.w $100
										bne.s   loc_5C684
										trap    #5
										dc.w $E3D
loc_5C684:
										
										trap    #5
										dc.w $E3E
										trap    #5
										dc.w $E3F
										trap    #5
										dc.w $E40
										trap    #2
										dc.w $100
return_5C694:
										
										rts

	; End of function sub_5C67A

