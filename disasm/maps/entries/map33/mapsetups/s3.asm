
; SCRIPT SECTION maps\entries\map33\mapsetups\s3 :
; 
ms_map33_ZoneEvents:dc.b $F
										dc.b $15
										dc.w sub_5AA98-ms_map33_ZoneEvents
										dc.b $C
										dc.b $E
										dc.w sub_5AACA-ms_map33_ZoneEvents
										dc.w $FD00
										dc.w nullsub_94-ms_map33_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_94:
										
										rts

	; End of function nullsub_94


; =============== S U B R O U T I N E =======================================

sub_5AA98:
										
										trap    #CHECK_FLAG
										dc.w $306
										bne.s   loc_5AAAA
										lea     cs_5AC58(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $306               ; set after the first scene with Goliath at Creed's Mansion
										bra.s   return_5AAC8
loc_5AAAA:
										
										trap    #CHECK_FLAG
										dc.w $311
										beq.s   return_5AAC8
										trap    #CHECK_FLAG
										dc.w $312
										bne.s   return_5AAC8
										lea     cs_5B466(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $312               ; set after Oddler elects to stay behind at Creed's Mansion
										trap    #SET_FLAG
										dc.w $45                ; Fairy is a follower
										trap    #CLEAR_FLAG
										dc.w $44                ; Oddler is a follower
return_5AAC8:
										
										rts

	; End of function sub_5AA98


; =============== S U B R O U T I N E =======================================

sub_5AACA:
										
										trap    #CHECK_FLAG
										dc.w $30F
										bne.s   return_5AAD6
										lea     cs_5AF36(pc), a0
										trap    #6
return_5AAD6:
										
										rts

	; End of function sub_5AACA

