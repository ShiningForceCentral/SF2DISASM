
; SCRIPT SECTION mapsetups\map23\s2 :
; 
ms_map23_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_59B60-ms_map23_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_59B6A-ms_map23_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_59B70-ms_map23_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_59B7A-ms_map23_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_59B84-ms_map23_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_59B9E-ms_map23_EntityEvents
										dc.w $FD00
										dc.w nullsub_129-ms_map23_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_59B60:
										
										trap    #5
										dc.w $69A
										trap    #5
										dc.w $69B
										rts

	; End of function sub_59B60


; =============== S U B R O U T I N E =======================================

sub_59B6A:
										
										trap    #5
										dc.w $69C
										rts

	; End of function sub_59B6A


; =============== S U B R O U T I N E =======================================

sub_59B70:
										
										trap    #5
										dc.w $69D
										trap    #5
										dc.w $69E
										rts

	; End of function sub_59B70


; =============== S U B R O U T I N E =======================================

sub_59B7A:
										
										trap    #5
										dc.w $69F
										trap    #5
										dc.w $6A0
										rts

	; End of function sub_59B7A


; =============== S U B R O U T I N E =======================================

sub_59B84:
										
										trap    #1
										dc.w $D
										bne.s   loc_59B94
										trap    #5
										dc.w $6A1
										trap    #5
										dc.w $6A2
										bra.s   return_59B9C
loc_59B94:
										
										trap    #5
										dc.w $6A3
										trap    #5
										dc.w $6A4
return_59B9C:
										
										rts

	; End of function sub_59B84


; =============== S U B R O U T I N E =======================================

sub_59B9E:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_59B9E


; =============== S U B R O U T I N E =======================================

nullsub_129:
										
										rts

	; End of function nullsub_129

