
; SCRIPT SECTION mapsetups\map20\s2_261 :
; 
ms_map20_flag261_EntityEvents:
										dc.b $80
										dc.b 0
										dc.w sub_538D4-ms_map20_flag261_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_538DA-ms_map20_flag261_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_538EE-ms_map20_flag261_EntityEvents
										dc.b $84
										dc.b 3
										dc.w sub_53916-ms_map20_flag261_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_53902-ms_map20_flag261_EntityEvents
										dc.b $86
										dc.b 3
										dc.w sub_5391C-ms_map20_flag261_EntityEvents
										dc.b $87
										dc.b 3
										dc.w sub_53922-ms_map20_flag261_EntityEvents
										dc.w $FD00
										dc.w return_53814+$10000-ms_map20_flag261_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_538D4:
										
										trap    #5
										dc.w $256
										rts

	; End of function sub_538D4


; =============== S U B R O U T I N E =======================================

sub_538DA:
										
										trap    #1
										dc.w $101
										bne.s   loc_538E8
										trap    #5
										dc.w $259
										trap    #2
										dc.w $101
loc_538E8:
										
										trap    #5
										dc.w $25A
										rts

	; End of function sub_538DA


; =============== S U B R O U T I N E =======================================

sub_538EE:
										
										trap    #1
										dc.w $102
										bne.s   loc_538FC
										trap    #5
										dc.w $25B
										trap    #2
										dc.w $102
loc_538FC:
										
										trap    #5
										dc.w $25C
										rts

	; End of function sub_538EE


; =============== S U B R O U T I N E =======================================

sub_53902:
										
										trap    #1
										dc.w $104
										bne.s   loc_53910
										trap    #5
										dc.w $25D
										trap    #2
										dc.w $104
loc_53910:
										
										trap    #5
										dc.w $25E
										rts

	; End of function sub_53902


; =============== S U B R O U T I N E =======================================

sub_53916:
										
										trap    #5
										dc.w $236
										rts

	; End of function sub_53916


; =============== S U B R O U T I N E =======================================

sub_5391C:
										
										trap    #5
										dc.w $25F
										rts

	; End of function sub_5391C


; =============== S U B R O U T I N E =======================================

sub_53922:
										
										trap    #5
										dc.w $260
										rts

	; End of function sub_53922

