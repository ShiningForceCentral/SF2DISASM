
; SCRIPT SECTION mapsetups\map10\s2_2D2 :
; 
ms_map10_flag2D2_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_56DE0+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_56DE6+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $82
										dc.b 0
										dc.w sub_56DF0+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $83
										dc.b 0
										dc.w sub_56DFE+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $84
										dc.b 0
										dc.w sub_56E08+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $85
										dc.b 0
										dc.w sub_56E12+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $86
										dc.b 0
										dc.w sub_56E1C+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $87
										dc.b 0
										dc.w sub_56E22+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $88
										dc.b 0
										dc.w sub_56E2C+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $89
										dc.b 3
										dc.w sub_56E36+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_56E44+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_56E4C+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $8C
										dc.b 3
										dc.w sub_56E52+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $8D
										dc.b 3
										dc.w sub_56E58+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $8E
										dc.b 3
										dc.w sub_56E5E+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $8F
										dc.b 3
										dc.w sub_56E64+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $90
										dc.b 1
										dc.w sub_56E6A+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $91
										dc.b 3
										dc.w sub_56E70+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $92
										dc.b 3
										dc.w sub_56E7A+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $93
										dc.b 3
										dc.w sub_56F0C-ms_map10_flag2D2_EntityEvents
										dc.b $94
										dc.b 1
										dc.w sub_56F40-ms_map10_flag2D2_EntityEvents
										dc.b $95
										dc.b 3
										dc.w sub_56E90+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $96
										dc.b 3
										dc.w sub_56F4E-ms_map10_flag2D2_EntityEvents
										dc.b $97
										dc.b 3
										dc.w sub_56F58-ms_map10_flag2D2_EntityEvents
										dc.b $98
										dc.b 3
										dc.w sub_56F62-ms_map10_flag2D2_EntityEvents
										dc.b $99
										dc.b 3
										dc.w sub_56F68-ms_map10_flag2D2_EntityEvents
										dc.b $A
										dc.b 3
										dc.w sub_56F80-ms_map10_flag2D2_EntityEvents
										dc.w $FD00
										dc.w return_56E9A+$10000-ms_map10_flag2D2_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_56F0C:
										
										trap    #1
										dc.w $31F
										bne.s   loc_56F3A
										trap    #5
										dc.w $643
										trap    #5
										dc.w $644
										jsr     j_yesNoPrompt
										tst.w   d0
										bne.s   loc_56F30
										lea     cs_5797A(pc), a0
										trap    #6
										trap    #2
										dc.w $31F
										bra.s   loc_56F38
loc_56F30:
										
										trap    #5
										dc.w $645
										trap    #5
										dc.w $646
loc_56F38:
										
										bra.s   return_56F3E
loc_56F3A:
										
										trap    #5
										dc.w $64E
return_56F3E:
										
										rts

	; End of function sub_56F0C


; =============== S U B R O U T I N E =======================================

sub_56F40:
										
										trap    #5
										dc.w $63E
										trap    #5
										dc.w $63F
										trap    #5
										dc.w $640
										rts

	; End of function sub_56F40


; =============== S U B R O U T I N E =======================================

sub_56F4E:
										
										trap    #5
										dc.w $63A
										trap    #5
										dc.w $63B
										rts

	; End of function sub_56F4E


; =============== S U B R O U T I N E =======================================

sub_56F58:
										
										trap    #5
										dc.w $63C
										trap    #5
										dc.w $63D
										rts

	; End of function sub_56F58


; =============== S U B R O U T I N E =======================================

sub_56F62:
										
										trap    #5
										dc.w $64F
										rts

	; End of function sub_56F62


; =============== S U B R O U T I N E =======================================

sub_56F68:
										
										trap    #1
										dc.w $2D3
										bne.s   loc_56F7A
										lea     cs_5766C(pc), a0
										trap    #6
										trap    #2
										dc.w $2D3
										bra.s   return_56F7E
loc_56F7A:
										
										trap    #5
										dc.w $695
return_56F7E:
										
										rts

	; End of function sub_56F68


; =============== S U B R O U T I N E =======================================

sub_56F80:
										
										trap    #5
										dc.w $641
										trap    #5
										dc.w $642
										rts

	; End of function sub_56F80

