
; SCRIPT SECTION maps\entries\map19\mapsetups\s2_261 :
; 
ms_map19_flag261_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_52FC8-ms_map19_flag261_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_52FCE-ms_map19_flag261_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_52FEE-ms_map19_flag261_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_52E4E+$10000-ms_map19_flag261_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_52FE8-ms_map19_flag261_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_52E62+$10000-ms_map19_flag261_EntityEvents
										dc.b $86
										dc.b 0
										dc.w sub_52FE2-ms_map19_flag261_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_52FF4-ms_map19_flag261_EntityEvents
										dc.b $88
										dc.b 3
										dc.w sub_52FFA-ms_map19_flag261_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_53000-ms_map19_flag261_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_53006-ms_map19_flag261_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_5300C-ms_map19_flag261_EntityEvents
										dc.b $8C
										dc.b 1
										dc.w sub_53016-ms_map19_flag261_EntityEvents
										dc.w $FD00
										dc.w return_52F0A+$10000-ms_map19_flag261_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_52FC8:
										
										trap    #5
										dc.w $261
										rts

	; End of function sub_52FC8


; =============== S U B R O U T I N E =======================================

sub_52FCE:
										
										trap    #1
										dc.w $101
										bne.s   loc_52FDC
										trap    #5
										dc.w $262
										trap    #2
										dc.w $101
loc_52FDC:
										
										trap    #5
										dc.w $263
										rts

	; End of function sub_52FCE


; =============== S U B R O U T I N E =======================================

sub_52FE2:
										
										trap    #5
										dc.w $264
										rts

	; End of function sub_52FE2


; =============== S U B R O U T I N E =======================================

sub_52FE8:
										
										trap    #5
										dc.w $265
										rts

	; End of function sub_52FE8


; =============== S U B R O U T I N E =======================================

sub_52FEE:
										
										trap    #5
										dc.w $266
										rts

	; End of function sub_52FEE


; =============== S U B R O U T I N E =======================================

sub_52FF4:
										
										trap    #5
										dc.w $267
										rts

	; End of function sub_52FF4


; =============== S U B R O U T I N E =======================================

sub_52FFA:
										
										trap    #5
										dc.w $268
										rts

	; End of function sub_52FFA


; =============== S U B R O U T I N E =======================================

sub_53000:
										
										trap    #5
										dc.w $269
										rts

	; End of function sub_53000


; =============== S U B R O U T I N E =======================================

sub_53006:
										
										trap    #5
										dc.w $2F7
										rts

	; End of function sub_53006


; =============== S U B R O U T I N E =======================================

sub_5300C:
										
										trap    #5
										dc.w $257
										trap    #5
										dc.w $258
										rts

	; End of function sub_5300C


; =============== S U B R O U T I N E =======================================

sub_53016:
										
										trap    #5
										dc.w $2F6
										rts

	; End of function sub_53016

