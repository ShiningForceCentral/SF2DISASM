
; SCRIPT SECTION maps\entries\map16\mapsetups\s2_212 :
; 
ms_map16_flag212_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_610A4-ms_map16_flag212_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_610AE-ms_map16_flag212_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_610B4-ms_map16_flag212_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_610BA-ms_map16_flag212_EntityEvents
										dc.b $84
										dc.b 3
										dc.w sub_610C4-ms_map16_flag212_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_610CE-ms_map16_flag212_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_610D8-ms_map16_flag212_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_610DE-ms_map16_flag212_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_610E4-ms_map16_flag212_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_610EA-ms_map16_flag212_EntityEvents
										dc.b $8A
										dc.b 1
										dc.w sub_610F8-ms_map16_flag212_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_61100-ms_map16_flag212_EntityEvents
										dc.b $8C
										dc.b 1
										dc.w sub_6110A-ms_map16_flag212_EntityEvents
										dc.b $8D
										dc.b 1
										dc.w sub_61110-ms_map16_flag212_EntityEvents
										dc.b $8E
										dc.b 0
										dc.w sub_61116-ms_map16_flag212_EntityEvents
										dc.b $8F
										dc.b 1
										dc.w sub_6112E-ms_map16_flag212_EntityEvents
										dc.b $90
										dc.b 1
										dc.w sub_6113C-ms_map16_flag212_EntityEvents
										dc.b $91
										dc.b 0
										dc.w sub_61146-ms_map16_flag212_EntityEvents
										dc.w $FD00
										dc.w return_6114C-ms_map16_flag212_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_610A4:
										
										trap    #5
										dc.w $DA0
										trap    #5
										dc.w $DA1
										rts

	; End of function sub_610A4


; =============== S U B R O U T I N E =======================================

sub_610AE:
										
										trap    #5
										dc.w $DA2
										rts

	; End of function sub_610AE


; =============== S U B R O U T I N E =======================================

sub_610B4:
										
										trap    #5
										dc.w $DA3
										rts

	; End of function sub_610B4


; =============== S U B R O U T I N E =======================================

sub_610BA:
										
										trap    #5
										dc.w $DA4
										trap    #5
										dc.w $DA5
										rts

	; End of function sub_610BA


; =============== S U B R O U T I N E =======================================

sub_610C4:
										
										trap    #5
										dc.w $DA6
										trap    #5
										dc.w $DA7
										rts

	; End of function sub_610C4


; =============== S U B R O U T I N E =======================================

sub_610CE:
										
										trap    #5
										dc.w $DA8
										trap    #5
										dc.w $DA9
										rts

	; End of function sub_610CE


; =============== S U B R O U T I N E =======================================

sub_610D8:
										
										trap    #5
										dc.w $DAA
										rts

	; End of function sub_610D8


; =============== S U B R O U T I N E =======================================

sub_610DE:
										
										trap    #5
										dc.w $DAB
										rts

	; End of function sub_610DE


; =============== S U B R O U T I N E =======================================

sub_610E4:
										
										trap    #5
										dc.w $DAC
										rts

	; End of function sub_610E4


; =============== S U B R O U T I N E =======================================

sub_610EA:
										
										move.b  #$1D,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_610EA


; =============== S U B R O U T I N E =======================================

sub_610F8:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_610F8


; =============== S U B R O U T I N E =======================================

sub_61100:
										
										trap    #5
										dc.w $DAD
										trap    #5
										dc.w $DAE
										rts

	; End of function sub_61100


; =============== S U B R O U T I N E =======================================

sub_6110A:
										
										trap    #5
										dc.w $DB1
										rts

	; End of function sub_6110A


; =============== S U B R O U T I N E =======================================

sub_61110:
										
										trap    #5
										dc.w $DB6
										rts

	; End of function sub_61110


; =============== S U B R O U T I N E =======================================

sub_61116:
										
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										clr.w   ((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #5
										dc.w $1A7
										trap    #5
										dc.w $FF2
										rts

	; End of function sub_61116


; =============== S U B R O U T I N E =======================================

sub_6112E:
										
										move.b  #$E,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_6112E


; =============== S U B R O U T I N E =======================================

sub_6113C:
										
										trap    #5
										dc.w $DB3
										trap    #5
										dc.w $DB4
										rts

	; End of function sub_6113C


; =============== S U B R O U T I N E =======================================

sub_61146:
										
										jsr     j_CaravanActions
return_6114C:
										
										rts

	; End of function sub_61146

