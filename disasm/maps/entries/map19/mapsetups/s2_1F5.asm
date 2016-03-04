
; SCRIPT SECTION maps\entries\map19\mapsetups\s2_1F5 :
; 
ms_map19_flag1F5_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_52F70-ms_map19_flag1F5_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_52F84-ms_map19_flag1F5_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_52F8A-ms_map19_flag1F5_EntityEvents
										dc.w $FD00
										dc.w return_52F0A+$10000-ms_map19_flag1F5_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_52F70:
										
										trap    #1
										dc.w $100
										bne.s   loc_52F7E
										trap    #5
										dc.w $249
										trap    #2
										btst    d0,d0
loc_52F7E:
										
										trap    #5
										dc.w $24A
										rts

	; End of function sub_52F70


; =============== S U B R O U T I N E =======================================

sub_52F84:
										
										trap    #5
										dc.w $247
										rts

	; End of function sub_52F84


; =============== S U B R O U T I N E =======================================

sub_52F8A:
										
										trap    #5
										dc.w $248
										rts

	; End of function sub_52F8A

