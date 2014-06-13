
; SCRIPT SECTION mapsetups\map36\s2_212 :
; 
ms_map36_flag212_EntityEvents:
										dc.b $16
										dc.b 1
										dc.w sub_5D954-ms_map36_flag212_EntityEvents
										dc.b $80
										dc.b 1
										dc.w sub_5D96A-ms_map36_flag212_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5D970-ms_map36_flag212_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_5D97A-ms_map36_flag212_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5D984-ms_map36_flag212_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5D98A-ms_map36_flag212_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5D99E-ms_map36_flag212_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5D9A8-ms_map36_flag212_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_5D8CA+$10000-ms_map36_flag212_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_5D9B2-ms_map36_flag212_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_5D91C+$10000-ms_map36_flag212_EntityEvents
										dc.w $FD00
										dc.w nullsub_140+$10000-ms_map36_flag212_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5D954:
										
										trap    #1
										dc.w $32B
										bne.s   return_5D968
										lea     cs_5DA28(pc), a0
										trap    #6
										trap    #2
										dc.w $32B
										trap    #2
										dc.w $52
return_5D968:
										
										rts

	; End of function sub_5D954


; =============== S U B R O U T I N E =======================================

sub_5D96A:
										
										trap    #5
										dc.w $CEC
										rts

	; End of function sub_5D96A


; =============== S U B R O U T I N E =======================================

sub_5D970:
										
										trap    #5
										dc.w $CED
										trap    #5
										dc.w $CEE
										rts

	; End of function sub_5D970


; =============== S U B R O U T I N E =======================================

sub_5D97A:
										
										trap    #5
										dc.w $CEF
										trap    #5
										dc.w $CF0
										rts

	; End of function sub_5D97A


; =============== S U B R O U T I N E =======================================

sub_5D984:
										
										trap    #5
										dc.w $CF1
										rts

	; End of function sub_5D984


; =============== S U B R O U T I N E =======================================

sub_5D98A:
										
										trap    #1
										dc.w $101
										bne.s   loc_5D998
										trap    #5
										dc.w $CF2
										trap    #2
										dc.w $101
loc_5D998:
										
										trap    #5
										dc.w $CF3
										rts

	; End of function sub_5D98A


; =============== S U B R O U T I N E =======================================

sub_5D99E:
										
										trap    #5
										dc.w $CF4
										trap    #5
										dc.w $CF5
										rts

	; End of function sub_5D99E


; =============== S U B R O U T I N E =======================================

sub_5D9A8:
										
										trap    #5
										dc.w $CF6
										trap    #5
										dc.w $CF7
										rts

	; End of function sub_5D9A8


; =============== S U B R O U T I N E =======================================

sub_5D9B2:
										
										trap    #5
										dc.w $CF8
										trap    #5
										dc.w $CF9
										trap    #5
										dc.w $CFA
										rts

	; End of function sub_5D9B2

