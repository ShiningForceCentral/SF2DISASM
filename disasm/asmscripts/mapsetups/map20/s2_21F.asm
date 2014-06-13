
; SCRIPT SECTION mapsetups\map20\s2_21F :
; 
ms_map20_flag21F_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_63252-ms_map20_flag21F_EntityEvents
										dc.b $81
										dc.b 0
										dc.w sub_63270-ms_map20_flag21F_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_6327E-ms_map20_flag21F_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_63284-ms_map20_flag21F_EntityEvents
										dc.b $84
										dc.b 3
										dc.w sub_6328A-ms_map20_flag21F_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_63290-ms_map20_flag21F_EntityEvents
										dc.w $FD00
										dc.w nullsub_125-ms_map20_flag21F_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_125:
										
										rts

	; End of function nullsub_125


; =============== S U B R O U T I N E =======================================

sub_63252:
										
										trap    #1
										dc.w $3D6
										bne.s   loc_63266
										trap    #5
										dc.w $F66
										trap    #5
										dc.w $F67
										trap    #5
										dc.w $F68
										bra.s   return_6326E
loc_63266:
										
										trap    #5
										dc.w $FAA
										trap    #5
										dc.w $FAB
return_6326E:
										
										rts

	; End of function sub_63252


; =============== S U B R O U T I N E =======================================

sub_63270:
										
										moveq   #1,d0
										jsr     sub_100B8
										trap    #5
										dc.w $FAF
										rts

	; End of function sub_63270


; =============== S U B R O U T I N E =======================================

sub_6327E:
										
										trap    #5
										dc.w $FB0
										rts

	; End of function sub_6327E


; =============== S U B R O U T I N E =======================================

sub_63284:
										
										trap    #5
										dc.w $FB6
										rts

	; End of function sub_63284


; =============== S U B R O U T I N E =======================================

sub_6328A:
										
										trap    #5
										dc.w $FB7
										rts

	; End of function sub_6328A


; =============== S U B R O U T I N E =======================================

sub_63290:
										
										trap    #5
										dc.w $FB8
										trap    #5
										dc.w $FB9
										rts

	; End of function sub_63290

