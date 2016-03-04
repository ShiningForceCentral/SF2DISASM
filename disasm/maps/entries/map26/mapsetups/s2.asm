
; SCRIPT SECTION maps\entries\map26\mapsetups\s2 :
; 
ms_map26_EntityEvents:
										dc.b $10
										dc.b 1
										dc.w sub_59D86-ms_map26_EntityEvents
										dc.b $11
										dc.b 1
										dc.w sub_59D90-ms_map26_EntityEvents
										dc.b $80
										dc.b 1
										dc.w sub_59D9A-ms_map26_EntityEvents
										dc.b $81
										dc.b 1
										dc.w nullsub_133-ms_map26_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_59DA4-ms_map26_EntityEvents
										dc.b $86
										dc.b 0
										dc.w sub_59DAC-ms_map26_EntityEvents
										dc.w $FD00
										dc.w nullsub_133-ms_map26_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_59D86:
										
										trap    #5
										dc.w $6CE
										trap    #5
										dc.w $6CF
										rts

	; End of function sub_59D86


; =============== S U B R O U T I N E =======================================

sub_59D90:
										
										trap    #5
										dc.w $6D0
										trap    #5
										dc.w $6D1
										rts

	; End of function sub_59D90


; =============== S U B R O U T I N E =======================================

sub_59D9A:
										
										trap    #5
										dc.w $6D2
										trap    #5
										dc.w $6D3
										rts

	; End of function sub_59D9A


; =============== S U B R O U T I N E =======================================

sub_59DA4:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_59DA4


; =============== S U B R O U T I N E =======================================

sub_59DAC:
										
										jsr     j_CaravanActions
										rts

	; End of function sub_59DAC


; =============== S U B R O U T I N E =======================================

nullsub_133:
										
										rts

	; End of function nullsub_133

