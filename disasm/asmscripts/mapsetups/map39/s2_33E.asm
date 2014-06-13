
; SCRIPT SECTION mapsetups\map39\s2_33E :
; 
ms_map39_flag33E_EntityEvents:
										dc.b $1A
										dc.b 0
										dc.w sub_5E05C-ms_map39_flag33E_EntityEvents
										dc.b $80
										dc.b 1
										dc.w sub_5E072-ms_map39_flag33E_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5E078-ms_map39_flag33E_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_5E07E-ms_map39_flag33E_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_5E088-ms_map39_flag33E_EntityEvents
										dc.b $84
										dc.b 3
										dc.w sub_5E08E-ms_map39_flag33E_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5E094-ms_map39_flag33E_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5E09A-ms_map39_flag33E_EntityEvents
										dc.w $FD00
										dc.w nullsub_142-ms_map39_flag33E_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5E05C:
										
										trap    #1
										dc.w $33E
										beq.s   return_5E070
										lea     cs_5E20A(pc), a0
										trap    #6
										trap    #2
										dc.w $4C
										trap    #2
										dc.w $344
return_5E070:
										
										rts

	; End of function sub_5E05C


; =============== S U B R O U T I N E =======================================

sub_5E072:
										
										trap    #5
										dc.w $7FB
										rts

	; End of function sub_5E072


; =============== S U B R O U T I N E =======================================

sub_5E078:
										
										trap    #5
										dc.w $7FC
										rts

	; End of function sub_5E078


; =============== S U B R O U T I N E =======================================

sub_5E07E:
										
										trap    #5
										dc.w $7FD
										trap    #5
										dc.w $7FE
										rts

	; End of function sub_5E07E


; =============== S U B R O U T I N E =======================================

sub_5E088:
										
										trap    #5
										dc.w $7FF
										rts

	; End of function sub_5E088


; =============== S U B R O U T I N E =======================================

sub_5E08E:
										
										trap    #5
										dc.w $800
										rts

	; End of function sub_5E08E


; =============== S U B R O U T I N E =======================================

sub_5E094:
										
										trap    #5
										dc.w $801
										rts

	; End of function sub_5E094


; =============== S U B R O U T I N E =======================================

sub_5E09A:
										
										trap    #1
										dc.w $33E
										bne.s   loc_5E0AA
										trap    #5
										dc.w $802
										trap    #5
										dc.w $803
										bra.s   return_5E0AE
loc_5E0AA:
										
										trap    #5
										dc.w $804
return_5E0AE:
										
										rts

	; End of function sub_5E09A


; =============== S U B R O U T I N E =======================================

nullsub_142:
										
										rts

	; End of function nullsub_142

