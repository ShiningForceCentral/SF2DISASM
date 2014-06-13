
; SCRIPT SECTION mapsetups\map02\s2_212 :
; 
ms_map2_flag212_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_5E9F0-ms_map2_flag212_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5E9FA-ms_map2_flag212_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_5EA00-ms_map2_flag212_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5EA06-ms_map2_flag212_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5EA10-ms_map2_flag212_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5EA1A-ms_map2_flag212_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5E9A4+$10000-ms_map2_flag212_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_5E9B2+$10000-ms_map2_flag212_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_5E9C0+$10000-ms_map2_flag212_EntityEvents
										dc.w $FD00
										dc.w nullsub_154+$10000-ms_map2_flag212_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5E9F0:
										
										trap    #5
										dc.w $E0B
										trap    #5
										dc.w $E0C
										rts

	; End of function sub_5E9F0


; =============== S U B R O U T I N E =======================================

sub_5E9FA:
										
										trap    #5
										dc.w $E0D
										rts

	; End of function sub_5E9FA


; =============== S U B R O U T I N E =======================================

sub_5EA00:
										
										trap    #5
										dc.w $E0E
										rts

	; End of function sub_5EA00


; =============== S U B R O U T I N E =======================================

sub_5EA06:
										
										trap    #5
										dc.w $E0F
										trap    #5
										dc.w $E10
										rts

	; End of function sub_5EA06


; =============== S U B R O U T I N E =======================================

sub_5EA10:
										
										trap    #5
										dc.w $E11
										trap    #5
										dc.w $E12
										rts

	; End of function sub_5EA10


; =============== S U B R O U T I N E =======================================

sub_5EA1A:
										
										trap    #5
										dc.w $E13
										rts

	; End of function sub_5EA1A

