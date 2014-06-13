
; SCRIPT SECTION mapsetups\map19\s2_1FA :
; 
ms_map19_flag1FA_EntityEvents:
										dc.b $81
										dc.b 3
										dc.w sub_530B4-ms_map19_flag1FA_EntityEvents
										dc.b $83
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $86
										dc.b 3
										dc.w sub_53080-ms_map19_flag1FA_EntityEvents
										dc.b $87
										dc.b 3
										dc.w sub_53086-ms_map19_flag1FA_EntityEvents
										dc.b $88
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $89
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $8A
										dc.b 0
										dc.w sub_53094-ms_map19_flag1FA_EntityEvents
										dc.b $8B
										dc.b 0
										dc.w sub_5309E-ms_map19_flag1FA_EntityEvents
										dc.b $8C
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $8D
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $8E
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $8F
										dc.b 0
										dc.w sub_530A8-ms_map19_flag1FA_EntityEvents
										dc.b $90
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $91
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $92
										dc.b 0
										dc.w sub_530AE-ms_map19_flag1FA_EntityEvents
										dc.b $93
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $94
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $95
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $96
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $99
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.w $FD00
										dc.w return_52F0A+$10000-ms_map19_flag1FA_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_53070:
										
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #5
										dc.w $2A6
										rts

	; End of function sub_53070


; =============== S U B R O U T I N E =======================================

sub_53080:
										
										trap    #5
										dc.w $2A7
										rts

	; End of function sub_53080


; =============== S U B R O U T I N E =======================================

sub_53086:
										
										trap    #5
										dc.w $2A8
										trap    #5
										dc.w $2A9
										trap    #5
										dc.w $2AA
										rts

	; End of function sub_53086


; =============== S U B R O U T I N E =======================================

sub_53094:
										
										trap    #5
										dc.w $2AB
										trap    #5
										dc.w $2AC
										rts

	; End of function sub_53094


; =============== S U B R O U T I N E =======================================

sub_5309E:
										
										trap    #5
										dc.w $2AD
										trap    #5
										dc.w $2AE
										rts

	; End of function sub_5309E


; =============== S U B R O U T I N E =======================================

sub_530A8:
										
										trap    #5
										dc.w $2AF
										rts

	; End of function sub_530A8


; =============== S U B R O U T I N E =======================================

sub_530AE:
										
										trap    #5
										dc.w $2B0
										rts

	; End of function sub_530AE


; =============== S U B R O U T I N E =======================================

sub_530B4:
										
										trap    #5
										dc.w $2B1
										rts

	; End of function sub_530B4

