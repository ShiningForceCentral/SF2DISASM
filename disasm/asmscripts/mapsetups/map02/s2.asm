
; SCRIPT SECTION mapsetups\map02\s2 :
; 
ms_map2_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_5E966-ms_map2_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5E970-ms_map2_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_5E976-ms_map2_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5E97C-ms_map2_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5E986-ms_map2_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5E98C-ms_map2_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5E99A-ms_map2_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_5E9A4-ms_map2_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_5E9B2-ms_map2_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_5E9C0-ms_map2_EntityEvents
										dc.w $FD00
										dc.w nullsub_154-ms_map2_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_154:
										
										rts

	; End of function nullsub_154


; =============== S U B R O U T I N E =======================================

sub_5E966:
										
										trap    #5
										dc.w $DFF
										trap    #5
										dc.w $E00
										rts

	; End of function sub_5E966


; =============== S U B R O U T I N E =======================================

sub_5E970:
										
										trap    #5
										dc.w $E01
										rts

	; End of function sub_5E970


; =============== S U B R O U T I N E =======================================

sub_5E976:
										
										trap    #5
										dc.w $E02
										rts

	; End of function sub_5E976


; =============== S U B R O U T I N E =======================================

sub_5E97C:
										
										trap    #5
										dc.w $E03
										trap    #5
										dc.w $E04
										rts

	; End of function sub_5E97C


; =============== S U B R O U T I N E =======================================

sub_5E986:
										
										trap    #5
										dc.w $E05
										rts

	; End of function sub_5E986


; =============== S U B R O U T I N E =======================================

sub_5E98C:
										
										trap    #5
										dc.w $E06
										trap    #5
										dc.w $E07
										trap    #5
										dc.w $E08
										rts

	; End of function sub_5E98C


; =============== S U B R O U T I N E =======================================

sub_5E99A:
										
										trap    #5
										dc.w $E09
										trap    #5
										dc.w $E0A
										rts

	; End of function sub_5E99A


; =============== S U B R O U T I N E =======================================

sub_5E9A4:
										
										move.b  #$A,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_5E9A4


; =============== S U B R O U T I N E =======================================

sub_5E9B2:
										
										move.b  #$19,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_5E9B2


; =============== S U B R O U T I N E =======================================

sub_5E9C0:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_5E9C0

