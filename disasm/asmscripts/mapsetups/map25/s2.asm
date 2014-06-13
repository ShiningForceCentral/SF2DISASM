
; SCRIPT SECTION mapsetups\map25\s2 :
; 
ms_map25_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_5D248-ms_map25_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5D24E-ms_map25_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_5D25C-ms_map25_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5D26A-ms_map25_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5D274-ms_map25_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5D27A-ms_map25_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5D2D2-ms_map25_EntityEvents
										dc.b $87
										dc.b 3
										dc.w sub_5D2EA-ms_map25_EntityEvents
										dc.w $FD00
										dc.w nullsub_132-ms_map25_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5D248:
										
										trap    #5
										dc.w $7A4
										rts

	; End of function sub_5D248


; =============== S U B R O U T I N E =======================================

sub_5D24E:
										
										trap    #5
										dc.w $7A5
										trap    #5
										dc.w $7A6
										trap    #5
										dc.w $7A7
										rts

	; End of function sub_5D24E


; =============== S U B R O U T I N E =======================================

sub_5D25C:
										
										trap    #5
										dc.w $7A8
										trap    #5
										dc.w $7A9
										trap    #5
										dc.w $7AA
										rts

	; End of function sub_5D25C


; =============== S U B R O U T I N E =======================================

sub_5D26A:
										
										trap    #5
										dc.w $7AB
										trap    #5
										dc.w $7AC
										rts

	; End of function sub_5D26A


; =============== S U B R O U T I N E =======================================

sub_5D274:
										
										trap    #5
										dc.w $7AD
										rts

	; End of function sub_5D274


; =============== S U B R O U T I N E =======================================

sub_5D27A:
										
										trap    #1
										dc.w $320
										bne.s   loc_5D2C4
										move.b  ((MESSAGE_SPEED-$1000000)).w,d0
										movem.l d0,-(sp)
										move.b  #0,((MESSAGE_SPEED-$1000000)).w
										trap    #5
										dc.w $7AE
										move.b  #1,((MESSAGE_SPEED-$1000000)).w
										trap    #5
										dc.w $7AF
										move.b  #2,((MESSAGE_SPEED-$1000000)).w
										trap    #5
										dc.w $7B0
										move.b  #3,((MESSAGE_SPEED-$1000000)).w
										trap    #5
										dc.w $7B1
										movem.l (sp)+,d0
										move.b  d0,((MESSAGE_SPEED-$1000000)).w
										trap    #2
										dc.w $320
										lea     cs_5D3B8(pc), a0
										trap    #6
										bra.s   return_5D2D0
loc_5D2C4:
										
										move.b  #9,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
return_5D2D0:
										
										rts

	; End of function sub_5D27A


; =============== S U B R O U T I N E =======================================

sub_5D2D2:
										
										trap    #1
										dc.w $100
										bne.s   loc_5D2E0
										trap    #5
										dc.w $7B3
										trap    #2
										dc.w $100
loc_5D2E0:
										
										jsr     j_ChurchActions
return_5D2E6:
										
										rts

	; End of function sub_5D2D2


; =============== S U B R O U T I N E =======================================

nullsub_131:
										
										rts

	; End of function nullsub_131


; =============== S U B R O U T I N E =======================================

sub_5D2EA:
										
										trap    #1
										dc.w $320
										bne.s   loc_5D32A
										trap    #1
										dc.w $101
										bne.s   loc_5D324
										trap    #5
										dc.w $7B4
										jsr     j_yesNoPrompt
										trap    #5
										dc.w $FFFF
										tst.w   d0
										bne.s   loc_5D316
										trap    #5
										dc.w $7B5
										trap    #5
										dc.w $7B6
										trap    #5
										dc.w $7B7
										bra.s   loc_5D31E
loc_5D316:
										
										trap    #5
										dc.w $7B8
										trap    #5
										dc.w $7B9
loc_5D31E:
										
										trap    #2
										dc.w $101
										bra.s   loc_5D328
loc_5D324:
										
										trap    #5
										dc.w $7BA
loc_5D328:
										
										bra.s   return_5D336
loc_5D32A:
										
										move.b  #$1B,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
return_5D336:
										
										rts

	; End of function sub_5D2EA


; =============== S U B R O U T I N E =======================================

nullsub_132:
										
										rts

	; End of function nullsub_132

