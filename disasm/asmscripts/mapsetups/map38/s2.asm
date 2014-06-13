
; SCRIPT SECTION mapsetups\map38\s2 :
; 
ms_map38_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_5DBB6-ms_map38_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5DBC0-ms_map38_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_5DBC6-ms_map38_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5DBCC-ms_map38_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5DBD2-ms_map38_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5DBE0-ms_map38_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5DBEA-ms_map38_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_5DBF8-ms_map38_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_5DC02-ms_map38_EntityEvents
										dc.b $89
										dc.b 0
										dc.w sub_5DC08-ms_map38_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_5DC56-ms_map38_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_5DCA4-ms_map38_EntityEvents
										dc.b $8C
										dc.b 1
										dc.w sub_5DCAC-ms_map38_EntityEvents
										dc.b $8D
										dc.b 1
										dc.w sub_5DCBA-ms_map38_EntityEvents
										dc.b $1A
										dc.b 1
										dc.w sub_5DCC8-ms_map38_EntityEvents
										dc.w $FD00
										dc.w nullsub_141-ms_map38_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5DBB6:
										
										trap    #5
										dc.w $859
										trap    #5
										dc.w $85A
										rts

	; End of function sub_5DBB6


; =============== S U B R O U T I N E =======================================

sub_5DBC0:
										
										trap    #5
										dc.w $85B
										rts

	; End of function sub_5DBC0


; =============== S U B R O U T I N E =======================================

sub_5DBC6:
										
										trap    #5
										dc.w $85C
										rts

	; End of function sub_5DBC6


; =============== S U B R O U T I N E =======================================

sub_5DBCC:
										
										trap    #5
										dc.w $85D
										rts

	; End of function sub_5DBCC


; =============== S U B R O U T I N E =======================================

sub_5DBD2:
										
										trap    #5
										dc.w $85E
										trap    #5
										dc.w $85F
										trap    #5
										dc.w $860
										rts

	; End of function sub_5DBD2


; =============== S U B R O U T I N E =======================================

sub_5DBE0:
										
										trap    #5
										dc.w $861
										trap    #5
										dc.w $862
										rts

	; End of function sub_5DBE0


; =============== S U B R O U T I N E =======================================

sub_5DBEA:
										
										trap    #5
										dc.w $863
										trap    #5
										dc.w $864
										trap    #5
										dc.w $865
										rts

	; End of function sub_5DBEA


; =============== S U B R O U T I N E =======================================

sub_5DBF8:
										
										trap    #5
										dc.w $866
										trap    #5
										dc.w $867
										rts

	; End of function sub_5DBF8


; =============== S U B R O U T I N E =======================================

sub_5DC02:
										
										trap    #5
										dc.w $868
										rts

	; End of function sub_5DC02


; =============== S U B R O U T I N E =======================================

sub_5DC08:
										
										trap    #1
										dc.w $38E
										beq.s   return_5DC54
										trap    #1
										dc.w $102
										beq.s   loc_5DC34
										trap    #1
										dc.w $38F
										beq.s   loc_5DC32
										trap    #1
										dc.w $100
										bne.s   loc_5DC2E
										trap    #5
										dc.w $871
										trap    #5
										dc.w $872
										trap    #2
										dc.w $100
										bra.s   loc_5DC32
loc_5DC2E:
										
										trap    #5
										dc.w $871
loc_5DC32:
										
										bra.s   return_5DC54
loc_5DC34:
										
										trap    #1
										dc.w $38F
										beq.s   return_5DC54
										trap    #1
										dc.w $100
										bne.s   loc_5DC50
										trap    #5
										dc.w $875
										trap    #5
										dc.w $876
										trap    #2
										dc.w $100
										bra.w   return_5DC54
loc_5DC50:
										
										trap    #5
										dc.w $875
return_5DC54:
										
										rts

	; End of function sub_5DC08


; =============== S U B R O U T I N E =======================================

sub_5DC56:
										
										trap    #1
										dc.w $38E
										beq.s   return_5DCA2
										trap    #1
										dc.w $102
										beq.s   loc_5DC82
										trap    #1
										dc.w $38F
										beq.s   loc_5DC80
										trap    #1
										dc.w $101
										bne.s   loc_5DC7C
										trap    #5
										dc.w $873
										trap    #5
										dc.w $874
										trap    #2
										dc.w $101
										bra.s   loc_5DC80
loc_5DC7C:
										
										trap    #5
										dc.w $873
loc_5DC80:
										
										bra.s   return_5DCA2
loc_5DC82:
										
										trap    #1
										dc.w $38F
										beq.s   return_5DCA2
										trap    #1
										dc.w $101
										bne.s   loc_5DC9E
										trap    #5
										dc.w $877
										trap    #5
										dc.w $878
										trap    #2
										dc.w $101
										bra.w   return_5DCA2
loc_5DC9E:
										
										trap    #5
										dc.w $877
return_5DCA2:
										
										rts

	; End of function sub_5DC56


; =============== S U B R O U T I N E =======================================

sub_5DCA4:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_5DCA4


; =============== S U B R O U T I N E =======================================

sub_5DCAC:
										
										move.b  #$D,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_5DCAC


; =============== S U B R O U T I N E =======================================

sub_5DCBA:
										
										move.b  #$1C,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_5DCBA


; =============== S U B R O U T I N E =======================================

sub_5DCC8:
										
										trap    #5
										dc.w $869
										rts

	; End of function sub_5DCC8


; =============== S U B R O U T I N E =======================================

nullsub_141:
										
										rts

	; End of function nullsub_141

