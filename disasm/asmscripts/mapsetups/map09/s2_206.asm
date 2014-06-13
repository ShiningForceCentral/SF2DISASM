
; SCRIPT SECTION mapsetups\map09\s2_206 :
; 
ms_map9_flag206_EntityEvents:
										dc.b $B
										dc.b 0
										dc.w sub_567E6-ms_map9_flag206_EntityEvents
										dc.b $C
										dc.b 3
										dc.w sub_56842-ms_map9_flag206_EntityEvents
										dc.b $80
										dc.b 1
										dc.w sub_56756-ms_map9_flag206_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5675C-ms_map9_flag206_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_56762-ms_map9_flag206_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_56768-ms_map9_flag206_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_56776-ms_map9_flag206_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_56784-ms_map9_flag206_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5678C-ms_map9_flag206_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_567C8-ms_map9_flag206_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_567D2-ms_map9_flag206_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_567D8-ms_map9_flag206_EntityEvents
										dc.w $FD00
										dc.w nullsub_114-ms_map9_flag206_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_56756:
										
										trap    #5
										dc.w $553
										rts

	; End of function sub_56756


; =============== S U B R O U T I N E =======================================

sub_5675C:
										
										trap    #5
										dc.w $554
										rts

	; End of function sub_5675C


; =============== S U B R O U T I N E =======================================

sub_56762:
										
										trap    #5
										dc.w $565
										rts

	; End of function sub_56762


; =============== S U B R O U T I N E =======================================

sub_56768:
										
										move.b  #6,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_56768


; =============== S U B R O U T I N E =======================================

sub_56776:
										
										move.b  #$15,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_56776


; =============== S U B R O U T I N E =======================================

sub_56784:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_56784


; =============== S U B R O U T I N E =======================================

sub_5678C:
										
										trap    #1
										dc.w $2D5
										bne.s   loc_567C2
										trap    #5
										dc.w $555
										move.w  #$86,d0 
										moveq   #3,d1
										jsr     sub_4781A
										moveq   #$28,d0 
										jsr     (Sleep).w       
										move.w  #$86,d0 
										move.b  ((byte_FFB651-$1000000)).w,d1
										addq.w  #2,d1
										and.w   #3,d1
										jsr     sub_4781A
										trap    #5
										dc.w $556
										bra.s   return_567C6
loc_567C2:
										
										trap    #5
										dc.w $55A
return_567C6:
										
										rts

	; End of function sub_5678C


; =============== S U B R O U T I N E =======================================

sub_567C8:
										
										trap    #5
										dc.w $557
										trap    #5
										dc.w $558
										rts

	; End of function sub_567C8


; =============== S U B R O U T I N E =======================================

sub_567D2:
										
										trap    #5
										dc.w $559
										rts

	; End of function sub_567D2


; =============== S U B R O U T I N E =======================================

sub_567D8:
										
										move.b  #7,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_567D8


; =============== S U B R O U T I N E =======================================

sub_567E6:
										
										trap    #1
										dc.w $2D7
										bne.s   loc_5682A
										moveq   #$3D,d1 
										jsr     sub_81D0
										cmp.w   #$FFFF,d0
										bne.s   loc_56804
										trap    #5
										dc.w $55B
										trap    #2
										dc.w $31E
										bra.s   loc_56828
loc_56804:
										
										trap    #1
										dc.w $31E
										bne.s   loc_5681E
										trap    #5
										dc.w $55B
										jsr     j_hidePortraitWindow
										trap    #5
										dc.w $FFFF
										moveq   #$28,d0 
										jsr     (Sleep).w       
loc_5681E:
										
										lea     cs_569BC(pc), a0
										trap    #6
										trap    #2
										dc.w $2D7
loc_56828:
										
										bra.s   return_56840
loc_5682A:
										
										trap    #1
										dc.w $2D5
										bne.s   return_56840
										move.w  #$B,d0
										jsr     sub_47832
										lea     cs_56AE6(pc), a0
										trap    #6
return_56840:
										
										rts

	; End of function sub_567E6


; =============== S U B R O U T I N E =======================================

sub_56842:
										
										trap    #1
										dc.w $100
										bne.s   return_56852
										lea     cs_56B02(pc), a0
										trap    #6
										trap    #2
										dc.w $100
return_56852:
										
										rts

	; End of function sub_56842


; =============== S U B R O U T I N E =======================================

nullsub_114:
										
										rts

	; End of function nullsub_114

