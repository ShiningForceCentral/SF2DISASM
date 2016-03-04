
; SCRIPT SECTION maps\entries\map03\mapsetups\s2_261 :
; 
ms_map3_flag261_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_510CC-ms_map3_flag261_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_510E0-ms_map3_flag261_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_510F4-ms_map3_flag261_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_510FA-ms_map3_flag261_EntityEvents
										dc.b $84
										dc.b 3
										dc.w sub_51108-ms_map3_flag261_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5110E-ms_map3_flag261_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_51114-ms_map3_flag261_EntityEvents
										dc.b $87
										dc.b 3
										dc.w sub_5111A-ms_map3_flag261_EntityEvents
										dc.b $88
										dc.b 3
										dc.w sub_51124-ms_map3_flag261_EntityEvents
										dc.b $89
										dc.b 3
										dc.w sub_5112A-ms_map3_flag261_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_51130-ms_map3_flag261_EntityEvents
										dc.b $8B
										dc.b 3
										dc.w sub_51130-ms_map3_flag261_EntityEvents
										dc.b $8C
										dc.b 3
										dc.w sub_51136-ms_map3_flag261_EntityEvents
										dc.b $8D
										dc.b 3
										dc.w sub_51140-ms_map3_flag261_EntityEvents
										dc.b $8E
										dc.b 1
										dc.w sub_51146-ms_map3_flag261_EntityEvents
										dc.b $8F
										dc.b 1
										dc.w sub_5114C-ms_map3_flag261_EntityEvents
										dc.b $90
										dc.b 3
										dc.w sub_51152-ms_map3_flag261_EntityEvents
										dc.b $91
										dc.b 1
										dc.w sub_51158-ms_map3_flag261_EntityEvents
										dc.b $92
										dc.b 1
										dc.w sub_5115E-ms_map3_flag261_EntityEvents
										dc.b $93
										dc.b 1
										dc.w sub_51164-ms_map3_flag261_EntityEvents
										dc.b 6
										dc.b 1
										dc.w sub_5116A-ms_map3_flag261_EntityEvents
										dc.b $94
										dc.b 3
										dc.w sub_51170-ms_map3_flag261_EntityEvents
										dc.b $95
										dc.b 3
										dc.w sub_51178-ms_map3_flag261_EntityEvents
										dc.b $96
										dc.b 1
										dc.w sub_5117E-ms_map3_flag261_EntityEvents
										dc.b $97
										dc.b 3
										dc.w sub_51194-ms_map3_flag261_EntityEvents
										dc.b $98
										dc.b 1
										dc.w sub_511A8-ms_map3_flag261_EntityEvents
										dc.b $99
										dc.b 3
										dc.w sub_511BC-ms_map3_flag261_EntityEvents
										dc.w $FD00
										dc.w return_5105A+$10000-ms_map3_flag261_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_510CC:
										
										trap    #1
										dc.w $100
										bne.s   loc_510DA
										trap    #5
										dc.w $273
										trap    #2
										dc.w $100
loc_510DA:
										
										trap    #5
										dc.w $274
										rts

	; End of function sub_510CC


; =============== S U B R O U T I N E =======================================

sub_510E0:
										
										trap    #1
										dc.w $101
										bne.s   loc_510EE
										trap    #5
										dc.w $275
										trap    #2
										dc.w $101
loc_510EE:
										
										trap    #5
										dc.w $276
										rts

	; End of function sub_510E0


; =============== S U B R O U T I N E =======================================

sub_510F4:
										
										trap    #5
										dc.w $277
										rts

	; End of function sub_510F4


; =============== S U B R O U T I N E =======================================

sub_510FA:
										
										move.b  #0,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_510FA


; =============== S U B R O U T I N E =======================================

sub_51108:
										
										trap    #5
										dc.w $278
										rts

	; End of function sub_51108


; =============== S U B R O U T I N E =======================================

sub_5110E:
										
										trap    #5
										dc.w $279
										rts

	; End of function sub_5110E


; =============== S U B R O U T I N E =======================================

sub_51114:
										
										trap    #5
										dc.w $27A
										rts

	; End of function sub_51114


; =============== S U B R O U T I N E =======================================

sub_5111A:
										
										trap    #5
										dc.w $27B
										trap    #5
										dc.w $27C
										rts

	; End of function sub_5111A


; =============== S U B R O U T I N E =======================================

sub_51124:
										
										trap    #5
										dc.w $27D
										rts

	; End of function sub_51124


; =============== S U B R O U T I N E =======================================

sub_5112A:
										
										trap    #5
										dc.w $27E
										rts

	; End of function sub_5112A


; =============== S U B R O U T I N E =======================================

sub_51130:
										
										trap    #5
										dc.w $27F
										rts

	; End of function sub_51130


; =============== S U B R O U T I N E =======================================

sub_51136:
										
										trap    #5
										dc.w $280
										trap    #5
										dc.w $281
										rts

	; End of function sub_51136


; =============== S U B R O U T I N E =======================================

sub_51140:
										
										trap    #5
										dc.w $282
										rts

	; End of function sub_51140


; =============== S U B R O U T I N E =======================================

sub_51146:
										
										trap    #5
										dc.w $283
										rts

	; End of function sub_51146


; =============== S U B R O U T I N E =======================================

sub_5114C:
										
										trap    #5
										dc.w $284
										rts

	; End of function sub_5114C


; =============== S U B R O U T I N E =======================================

sub_51152:
										
										trap    #5
										dc.w $285
										rts

	; End of function sub_51152


; =============== S U B R O U T I N E =======================================

sub_51158:
										
										trap    #5
										dc.w $286
										rts

	; End of function sub_51158


; =============== S U B R O U T I N E =======================================

sub_5115E:
										
										trap    #5
										dc.w $287
										rts

	; End of function sub_5115E


; =============== S U B R O U T I N E =======================================

sub_51164:
										
										trap    #5
										dc.w $288
										rts

	; End of function sub_51164


; =============== S U B R O U T I N E =======================================

sub_5116A:
										
										trap    #5
										dc.w $289
										rts

	; End of function sub_5116A


; =============== S U B R O U T I N E =======================================

sub_51170:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_51170


; =============== S U B R O U T I N E =======================================

sub_51178:
										
										trap    #5
										dc.w $28A
										rts

	; End of function sub_51178


; =============== S U B R O U T I N E =======================================

sub_5117E:
										
										trap    #1
										dc.w $116
										bne.s   loc_5118E
										trap    #5
										dc.w $28B
										trap    #2
										dc.w $116
										bra.s   return_51192
loc_5118E:
										
										trap    #5
										dc.w $291
return_51192:
										
										rts

	; End of function sub_5117E


; =============== S U B R O U T I N E =======================================

sub_51194:
										
										trap    #1
										dc.w $117
										bne.s   loc_511A2
										trap    #5
										dc.w $292
										trap    #2
										dc.w $117
loc_511A2:
										
										trap    #5
										dc.w $293
										rts

	; End of function sub_51194


; =============== S U B R O U T I N E =======================================

sub_511A8:
										
										trap    #1
										dc.w $118
										bne.s   loc_511B6
										trap    #5
										dc.w $294
										trap    #2
										dc.w $118
loc_511B6:
										
										trap    #5
										dc.w $295
										rts

	; End of function sub_511A8


; =============== S U B R O U T I N E =======================================

sub_511BC:
										
										move.b  #$F,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_511BC

