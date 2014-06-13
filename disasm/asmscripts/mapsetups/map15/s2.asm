
; SCRIPT SECTION mapsetups\map15\s2 :
; 
ms_map15_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_5CF1E-ms_map15_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5CF28-ms_map15_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_5CF32-ms_map15_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5CF3C-ms_map15_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5CF46-ms_map15_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_5CF50-ms_map15_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5CF5A-ms_map15_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_5CF64-ms_map15_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_5CF6E-ms_map15_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_5CF78-ms_map15_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_5CF86-ms_map15_EntityEvents
										dc.b $8B
										dc.b 3
										dc.w sub_5CF8E-ms_map15_EntityEvents
										dc.w $FD00
										dc.w nullsub_117-ms_map15_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5CF1E:
										
										trap    #5
										dc.w $7BB
										trap    #5
										dc.w $7BC
										rts

	; End of function sub_5CF1E


; =============== S U B R O U T I N E =======================================

sub_5CF28:
										
										trap    #5
										dc.w $7BD
										trap    #5
										dc.w $7BE
										rts

	; End of function sub_5CF28


; =============== S U B R O U T I N E =======================================

sub_5CF32:
										
										trap    #5
										dc.w $7BF
										trap    #5
										dc.w $7C0
										rts

	; End of function sub_5CF32


; =============== S U B R O U T I N E =======================================

sub_5CF3C:
										
										trap    #5
										dc.w $7C1
										trap    #5
										dc.w $7C2
										rts

	; End of function sub_5CF3C


; =============== S U B R O U T I N E =======================================

sub_5CF46:
										
										trap    #5
										dc.w $7C3
										trap    #5
										dc.w $7C4
										rts

	; End of function sub_5CF46


; =============== S U B R O U T I N E =======================================

sub_5CF50:
										
										trap    #5
										dc.w $7C5
										trap    #5
										dc.w $7C6
										rts

	; End of function sub_5CF50


; =============== S U B R O U T I N E =======================================

sub_5CF5A:
										
										trap    #5
										dc.w $7C7
										trap    #5
										dc.w $7C8
										rts

	; End of function sub_5CF5A


; =============== S U B R O U T I N E =======================================

sub_5CF64:
										
										trap    #5
										dc.w $7C9
										trap    #5
										dc.w $7CA
										rts

	; End of function sub_5CF64


; =============== S U B R O U T I N E =======================================

sub_5CF6E:
										
										trap    #5
										dc.w $7CB
										trap    #5
										dc.w $7CC
										rts

	; End of function sub_5CF6E


; =============== S U B R O U T I N E =======================================

sub_5CF78:
										
										move.b  #$1A,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_5CF78


; =============== S U B R O U T I N E =======================================

sub_5CF86:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_5CF86


; =============== S U B R O U T I N E =======================================

sub_5CF8E:
										
										move.b  #$B,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_5CF8E


; =============== S U B R O U T I N E =======================================

nullsub_117:
										
										rts

	; End of function nullsub_117

