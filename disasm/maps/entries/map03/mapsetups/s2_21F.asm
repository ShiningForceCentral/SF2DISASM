
; SCRIPT SECTION maps\entries\map03\mapsetups\s2_21F :
; 
ms_map3_flag21F_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_6277A-ms_map3_flag21F_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_62784-ms_map3_flag21F_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_6278E-ms_map3_flag21F_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_62794-ms_map3_flag21F_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_6279A-ms_map3_flag21F_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_627A4-ms_map3_flag21F_EntityEvents
										dc.b $86
										dc.b 3
										dc.w sub_627AA-ms_map3_flag21F_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_627B4-ms_map3_flag21F_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_627BC-ms_map3_flag21F_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_627C6-ms_map3_flag21F_EntityEvents
										dc.b $8A
										dc.b 1
										dc.w sub_627D0-ms_map3_flag21F_EntityEvents
										dc.b 1
										dc.b 1
										dc.w sub_627F8-ms_map3_flag21F_EntityEvents
										dc.b 2
										dc.b 1
										dc.w sub_62802-ms_map3_flag21F_EntityEvents
										dc.b 3
										dc.b 1
										dc.w sub_6280C-ms_map3_flag21F_EntityEvents
										dc.b 4
										dc.b 1
										dc.w sub_62816-ms_map3_flag21F_EntityEvents
										dc.w $FD00
										dc.w nullsub_111-ms_map3_flag21F_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_111:
										
										rts

	; End of function nullsub_111


; =============== S U B R O U T I N E =======================================

sub_6277A:
										
										trap    #5
										dc.w $F4F
										trap    #5
										dc.w $F50
										rts

	; End of function sub_6277A


; =============== S U B R O U T I N E =======================================

sub_62784:
										
										trap    #5
										dc.w $F51
										trap    #5
										dc.w $F52
										rts

	; End of function sub_62784


; =============== S U B R O U T I N E =======================================

sub_6278E:
										
										trap    #5
										dc.w $F53
										rts

	; End of function sub_6278E


; =============== S U B R O U T I N E =======================================

sub_62794:
										
										trap    #5
										dc.w $F54
										rts

	; End of function sub_62794


; =============== S U B R O U T I N E =======================================

sub_6279A:
										
										trap    #5
										dc.w $F55
										trap    #5
										dc.w $F56
										rts

	; End of function sub_6279A


; =============== S U B R O U T I N E =======================================

sub_627A4:
										
										trap    #5
										dc.w $F57
										rts

	; End of function sub_627A4


; =============== S U B R O U T I N E =======================================

sub_627AA:
										
										trap    #5
										dc.w $F58
										trap    #5
										dc.w $F59
										rts

	; End of function sub_627AA


; =============== S U B R O U T I N E =======================================

sub_627B4:
										
										lea     cs_628C8(pc), a0
										trap    #6
										rts

	; End of function sub_627B4


; =============== S U B R O U T I N E =======================================

sub_627BC:
										
										trap    #5
										dc.w $F5A
										trap    #5
										dc.w $F5B
										rts

	; End of function sub_627BC


; =============== S U B R O U T I N E =======================================

sub_627C6:
										
										trap    #5
										dc.w $F46
										trap    #5
										dc.w $F47
										rts

	; End of function sub_627C6


; =============== S U B R O U T I N E =======================================

sub_627D0:
										
										trap    #5
										dc.w $F5C
										trap    #5
										dc.w $F5D
										jsr     j_YesNoPrompt
										tst.w   d0
										bne.s   loc_627F2
										trap    #5
										dc.w $FC1
										trap    #2
										dc.w $3D5
										lea     cs_6290C(pc), a0
										trap    #6
										bra.s   return_627F6
loc_627F2:
										
										trap    #5
										dc.w $FC2
return_627F6:
										
										rts

	; End of function sub_627D0


; =============== S U B R O U T I N E =======================================

sub_627F8:
										
										trap    #5
										dc.w $F5E
										trap    #5
										dc.w $F5F
										rts

	; End of function sub_627F8


; =============== S U B R O U T I N E =======================================

sub_62802:
										
										trap    #5
										dc.w $F60
										trap    #5
										dc.w $F61
										rts

	; End of function sub_62802


; =============== S U B R O U T I N E =======================================

sub_6280C:
										
										trap    #5
										dc.w $F62
										trap    #5
										dc.w $F63
										rts

	; End of function sub_6280C


; =============== S U B R O U T I N E =======================================

sub_62816:
										
										trap    #5
										dc.w $F64
										trap    #5
										dc.w $F65
										rts

	; End of function sub_62816

