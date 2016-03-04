
; SCRIPT SECTION maps\entries\map45\mapsetups\s2 :
; 
ms_map45_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_60038-ms_map45_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_60042-ms_map45_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_60048-ms_map45_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_6004E-ms_map45_EntityEvents
										dc.w $FD00
										dc.w nullsub_147-ms_map45_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_60038:
										
										trap    #5
										dc.w $81D
										trap    #5
										dc.w $81E
										rts

	; End of function sub_60038


; =============== S U B R O U T I N E =======================================

sub_60042:
										
										trap    #5
										dc.w $81F
										rts

	; End of function sub_60042


; =============== S U B R O U T I N E =======================================

sub_60048:
										
										trap    #5
										dc.w $820
										rts

	; End of function sub_60048


; =============== S U B R O U T I N E =======================================

sub_6004E:
										
										trap    #5
										dc.w $821
										trap    #5
										dc.w $822
										jsr     j_ChurchActions
										rts

	; End of function sub_6004E


; =============== S U B R O U T I N E =======================================

nullsub_147:
										
										rts

	; End of function nullsub_147

