
; SCRIPT SECTION mapsetups\map01\s2 :
; 
ms_map1_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_5E6BE-ms_map1_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5E6C8-ms_map1_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_5E6D2-ms_map1_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5E6DC-ms_map1_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5E6E6-ms_map1_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5E6F0-ms_map1_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5E6FA-ms_map1_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_5E704-ms_map1_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_5E70E-ms_map1_EntityEvents
										dc.w $FD00
										dc.w nullsub_153-ms_map1_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_153:
										
										rts

	; End of function nullsub_153


; =============== S U B R O U T I N E =======================================

sub_5E6BE:
										
										trap    #5
										dc.w $E51
										trap    #5
										dc.w $E52
										rts

	; End of function sub_5E6BE


; =============== S U B R O U T I N E =======================================

sub_5E6C8:
										
										trap    #5
										dc.w $E53
										trap    #5
										dc.w $E54
										rts

	; End of function sub_5E6C8


; =============== S U B R O U T I N E =======================================

sub_5E6D2:
										
										trap    #5
										dc.w $E55
										trap    #5
										dc.w $E56
										rts

	; End of function sub_5E6D2


; =============== S U B R O U T I N E =======================================

sub_5E6DC:
										
										trap    #5
										dc.w $E57
										trap    #5
										dc.w $E58
										rts

	; End of function sub_5E6DC


; =============== S U B R O U T I N E =======================================

sub_5E6E6:
										
										trap    #5
										dc.w $E59
										trap    #5
										dc.w $E5A
										rts

	; End of function sub_5E6E6


; =============== S U B R O U T I N E =======================================

sub_5E6F0:
										
										trap    #5
										dc.w $E5B
										trap    #5
										dc.w $E5C
										rts

	; End of function sub_5E6F0


; =============== S U B R O U T I N E =======================================

sub_5E6FA:
										
										trap    #5
										dc.w $E5D
										trap    #5
										dc.w $E5E
										rts

	; End of function sub_5E6FA


; =============== S U B R O U T I N E =======================================

sub_5E704:
										
										trap    #5
										dc.w $E5F
										trap    #5
										dc.w $E60
										rts

	; End of function sub_5E704


; =============== S U B R O U T I N E =======================================

sub_5E70E:
										
										trap    #1
										dc.w $349
										bne.s   return_5E71E
										lea     cs_5E772(pc), a0
										trap    #6
										trap    #2
										dc.w $349
return_5E71E:
										
										rts

	; End of function sub_5E70E

