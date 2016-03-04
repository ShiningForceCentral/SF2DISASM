
; SCRIPT SECTION maps\entries\map15\mapsetups\s2_212 :
; 
ms_map15_flag212_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_5CF1E+$10000-ms_map15_flag212_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5CFCA-ms_map15_flag212_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_5CFD4-ms_map15_flag212_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5CFDE-ms_map15_flag212_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5CFE8-ms_map15_flag212_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_5CFEE-ms_map15_flag212_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5CFF4-ms_map15_flag212_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_5CF78+$10000-ms_map15_flag212_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_5CF86+$10000-ms_map15_flag212_EntityEvents
										dc.b $89
										dc.b 3
										dc.w sub_5CF8E+$10000-ms_map15_flag212_EntityEvents
										dc.w $FD00
										dc.w nullsub_117+$10000-ms_map15_flag212_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5CFCA:
										
										trap    #5
										dc.w $7CD
										trap    #5
										dc.w $7CE
										rts

	; End of function sub_5CFCA


; =============== S U B R O U T I N E =======================================

sub_5CFD4:
										
										trap    #5
										dc.w $7CF
										trap    #5
										dc.w $7D0
										rts

	; End of function sub_5CFD4


; =============== S U B R O U T I N E =======================================

sub_5CFDE:
										
										trap    #5
										dc.w $7D1
										trap    #5
										dc.w $7D2
										rts

	; End of function sub_5CFDE


; =============== S U B R O U T I N E =======================================

sub_5CFE8:
										
										trap    #5
										dc.w $7D3
										rts

	; End of function sub_5CFE8


; =============== S U B R O U T I N E =======================================

sub_5CFEE:
										
										trap    #5
										dc.w $7D4
										rts

	; End of function sub_5CFEE


; =============== S U B R O U T I N E =======================================

sub_5CFF4:
										
										trap    #5
										dc.w $7D5
										rts

	; End of function sub_5CFF4

