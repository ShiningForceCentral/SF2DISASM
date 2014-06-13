
; SCRIPT SECTION mapsetups\map16\s2 :
; 
ms_map16_EntityEvents:
										dc.b $94
										dc.b 3
										dc.w sub_51E50-ms_map16_EntityEvents
										dc.w $FD00
										dc.w nullsub_119-ms_map16_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_51E3A:
										
										trap    #5
										dc.w $360
										trap    #5
										dc.w $361
										trap    #5
										dc.w $362
										trap    #5
										dc.w $363
										trap    #5
										dc.w $364
										rts

	; End of function sub_51E3A


; =============== S U B R O U T I N E =======================================

sub_51E50:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_51E50


; =============== S U B R O U T I N E =======================================

sub_51E58:
										
										trap    #5
										dc.w $365
										rts

	; End of function sub_51E58


; =============== S U B R O U T I N E =======================================

nullsub_118:
										
										rts

	; End of function nullsub_118


; =============== S U B R O U T I N E =======================================

sub_51E60:
										
										trap    #5
										dc.w $34C
										trap    #5
										dc.w $34D
										trap    #5
										dc.w $34E
										rts

	; End of function sub_51E60


; =============== S U B R O U T I N E =======================================

sub_51E6E:
										
										trap    #5
										dc.w $34F
										rts

	; End of function sub_51E6E


; =============== S U B R O U T I N E =======================================

sub_51E74:
										
										trap    #5
										dc.w $350
										trap    #5
										dc.w $351
										rts

	; End of function sub_51E74


; =============== S U B R O U T I N E =======================================

sub_51E7E:
										
										move.b  #1,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_51E7E


; =============== S U B R O U T I N E =======================================

sub_51E8C:
										
										trap    #5
										dc.w $352
										rts

	; End of function sub_51E8C


; =============== S U B R O U T I N E =======================================

sub_51E92:
										
										trap    #5
										dc.w $353
										rts

	; End of function sub_51E92


; =============== S U B R O U T I N E =======================================

sub_51E98:
										
										trap    #5
										dc.w $354
										rts

	; End of function sub_51E98


; =============== S U B R O U T I N E =======================================

sub_51E9E:
										
										trap    #5
										dc.w $355
										trap    #5
										dc.w $356
										trap    #5
										dc.w $357
										rts

	; End of function sub_51E9E


; =============== S U B R O U T I N E =======================================

sub_51EAC:
										
										trap    #5
										dc.w $358
										rts

	; End of function sub_51EAC


; =============== S U B R O U T I N E =======================================

sub_51EB2:
										
										trap    #5
										dc.w $359
										trap    #5
										dc.w $35A
										rts

	; End of function sub_51EB2


; =============== S U B R O U T I N E =======================================

sub_51EBC:
										
										trap    #5
										dc.w $35B
										trap    #5
										dc.w $35C
										trap    #5
										dc.w $35D
										trap    #5
										dc.w $35E
										rts

	; End of function sub_51EBC


; =============== S U B R O U T I N E =======================================

sub_51ECE:
										
										trap    #5
										dc.w $35F
										rts

	; End of function sub_51ECE


; =============== S U B R O U T I N E =======================================

sub_51ED4:
										
										move.b  #$10,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_51ED4


; =============== S U B R O U T I N E =======================================

nullsub_119:
										
										rts

	; End of function nullsub_119

