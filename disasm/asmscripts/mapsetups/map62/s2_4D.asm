
; SCRIPT SECTION mapsetups\map62\s2_4D :
; 
ms_map62_flag4D_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_5C7C2-ms_map62_flag4D_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_5C7F6-ms_map62_flag4D_EntityEvents
										dc.w $FD00
										dc.w return_5C81E-ms_map62_flag4D_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5C7C2:
										
										trap    #1
										dc.w $2DC
										bne.s   loc_5C7F0
										trap    #1
										dc.w $102
										bne.s   loc_5C7E6
										trap    #5
										dc.w $E28
										trap    #5
										dc.w $E29
										trap    #5
										dc.w $E2A
										trap    #1
										dc.w $2D9
										beq.s   loc_5C7E4
										trap    #2
										dc.w $102
loc_5C7E4:
										
										bra.s   loc_5C7EE
loc_5C7E6:
										
										trap    #5
										dc.w $E37
										trap    #5
										dc.w $E38
loc_5C7EE:
										
										bra.s   return_5C7F4
loc_5C7F0:
										
										trap    #5
										dc.w $E39
return_5C7F4:
										
										rts

	; End of function sub_5C7C2


; =============== S U B R O U T I N E =======================================

sub_5C7F6:
										
										trap    #1
										dc.w $2D9
										bne.s   loc_5C81A
										trap    #1
										dc.w $2D8
										bne.s   loc_5C80E
										lea     cs_5C8D4(pc), a0
										trap    #6
										trap    #2
										dc.w $2D8
										bra.s   loc_5C818
loc_5C80E:
										
										lea     cs_5C914(pc), a0
										trap    #6
										trap    #2
										dc.w $2D9
loc_5C818:
										
										bra.s   return_5C81E
loc_5C81A:
										
										trap    #5
										dc.w $9D0
return_5C81E:
										
										rts

	; End of function sub_5C7F6

