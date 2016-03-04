
; SCRIPT SECTION maps\entries\map56\mapsetups\s2 :
; 
ms_map56_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_614B2-ms_map56_EntityEvents
										dc.w $FD00
										dc.w return_614D4-ms_map56_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_614B2:
										
										trap    #1
										dc.w $387
										bne.s   loc_614C2
										lea     cs_6150A(pc), a0
										trap    #6
										trap    #2
										dc.w $387
loc_614C2:
										
										trap    #5
										dc.w $E1B
										trap    #5
										dc.w $E1C
										trap    #5
										dc.w $FFFF
										jmp     j_ChurchActions
return_614D4:
										
										rts

	; End of function sub_614B2

