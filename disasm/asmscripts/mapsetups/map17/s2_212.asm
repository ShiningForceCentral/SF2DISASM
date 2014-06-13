
; SCRIPT SECTION mapsetups\map17\s2_212 :
; 
ms_map17_flag212_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_611F0-ms_map17_flag212_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_611FA-ms_map17_flag212_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_61200-ms_map17_flag212_EntityEvents
										dc.w $FD00
										dc.w nullsub_19-ms_map17_flag212_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_611F0:
										
										trap    #5
										dc.w $DAF
										trap    #5
										dc.w $DB0
										rts

	; End of function sub_611F0


; =============== S U B R O U T I N E =======================================

sub_611FA:
										
										trap    #5
										dc.w $DB2
										rts

	; End of function sub_611FA


; =============== S U B R O U T I N E =======================================

sub_61200:
										
										trap    #5
										dc.w $DB5
										rts

	; End of function sub_61200


; =============== S U B R O U T I N E =======================================

nullsub_19:
										
										rts

	; End of function nullsub_19

