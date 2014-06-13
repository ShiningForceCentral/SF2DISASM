
; SCRIPT SECTION mapsetups\map20\s2_1F5 :
; 
ms_map20_flag1F5_EntityEvents:
										dc.b $80
										dc.b 0
										dc.w sub_53850-ms_map20_flag1F5_EntityEvents
										dc.b $81
										dc.b 0
										dc.w sub_53856-ms_map20_flag1F5_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_5385C-ms_map20_flag1F5_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_53864-ms_map20_flag1F5_EntityEvents
										dc.b $84
										dc.b 3
										dc.w sub_53878-ms_map20_flag1F5_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_5388C-ms_map20_flag1F5_EntityEvents
										dc.b $86
										dc.b 0
										dc.w sub_538A0-ms_map20_flag1F5_EntityEvents
										dc.w $FD00
										dc.w return_53814+$10000-ms_map20_flag1F5_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_53850:
										
										trap    #5
										dc.w $896
										rts

	; End of function sub_53850


; =============== S U B R O U T I N E =======================================

sub_53856:
										
										trap    #5
										dc.w $250
										rts

	; End of function sub_53856


; =============== S U B R O U T I N E =======================================

sub_5385C:
										
										lea     cs_53C42(pc), a0
										trap    #6
										rts

	; End of function sub_5385C


; =============== S U B R O U T I N E =======================================

sub_53864:
										
										trap    #1
										dc.w $103
										bne.s   loc_53872
										trap    #5
										dc.w $251
										trap    #2
										dc.w $103
loc_53872:
										
										trap    #5
										dc.w $252
										rts

	; End of function sub_53864


; =============== S U B R O U T I N E =======================================

sub_53878:
										
										trap    #1
										dc.w $104
										bne.s   loc_53886
										trap    #5
										dc.w $253
										trap    #2
										dc.w $104
loc_53886:
										
										trap    #5
										dc.w $254
										rts

	; End of function sub_53878


; =============== S U B R O U T I N E =======================================

sub_5388C:
										
										trap    #1
										dc.w $105
										bne.s   loc_5389A
										trap    #5
										dc.w $24C
										trap    #2
										dc.w $105
loc_5389A:
										
										trap    #5
										dc.w $24D
										rts

	; End of function sub_5388C


; =============== S U B R O U T I N E =======================================

sub_538A0:
										
										trap    #1
										dc.w $106
										bne.s   loc_538AE
										trap    #5
										dc.w $24E
										trap    #2
										dc.w $106
loc_538AE:
										
										trap    #5
										dc.w $24F
										rts

	; End of function sub_538A0

