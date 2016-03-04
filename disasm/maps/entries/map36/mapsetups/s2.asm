
; SCRIPT SECTION maps\entries\map36\mapsetups\s2 :
; 
ms_map36_EntityEvents:
										dc.b $16
										dc.b 1
										dc.w sub_5D8FA-ms_map36_EntityEvents
										dc.b $80
										dc.b 1
										dc.w sub_5D884-ms_map36_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5D88A-ms_map36_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_5D894-ms_map36_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5D89E-ms_map36_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5D8BC-ms_map36_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5D8CA-ms_map36_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5D8D8-ms_map36_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_5D8E2-ms_map36_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_5D8F0-ms_map36_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_5D904-ms_map36_EntityEvents
										dc.b $8A
										dc.b 1
										dc.w sub_5D90E-ms_map36_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_5D91C-ms_map36_EntityEvents
										dc.w $FD00
										dc.w nullsub_140-ms_map36_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_140:
										
										rts

	; End of function nullsub_140


; =============== S U B R O U T I N E =======================================

sub_5D884:
										
										trap    #5
										dc.w $CD1
										rts

	; End of function sub_5D884


; =============== S U B R O U T I N E =======================================

sub_5D88A:
										
										trap    #5
										dc.w $CD2
										trap    #5
										dc.w $CD3
										rts

	; End of function sub_5D88A


; =============== S U B R O U T I N E =======================================

sub_5D894:
										
										trap    #5
										dc.w $CD4
										trap    #5
										dc.w $CD5
										rts

	; End of function sub_5D894


; =============== S U B R O U T I N E =======================================

sub_5D89E:
										
										trap    #1
										dc.w $32A
										bne.s   loc_5D8B6
										trap    #5
										dc.w $CD6
										trap    #5
										dc.w $FFFF
										lea     cs_5DA7A(pc), a0
										trap    #6
										trap    #2
										dc.w $32A
loc_5D8B6:
										
										trap    #5
										dc.w $CD7
										rts

	; End of function sub_5D89E


; =============== S U B R O U T I N E =======================================

sub_5D8BC:
										
										trap    #5
										dc.w $CD8
										trap    #5
										dc.w $CD9
										trap    #5
										dc.w $CDA
										rts

	; End of function sub_5D8BC


; =============== S U B R O U T I N E =======================================

sub_5D8CA:
										
										trap    #5
										dc.w $CDB
										trap    #5
										dc.w $CDC
										trap    #5
										dc.w $CDD
										rts

	; End of function sub_5D8CA


; =============== S U B R O U T I N E =======================================

sub_5D8D8:
										
										trap    #5
										dc.w $CDE
										trap    #5
										dc.w $CDF
										rts

	; End of function sub_5D8D8


; =============== S U B R O U T I N E =======================================

sub_5D8E2:
										
										trap    #5
										dc.w $CE0
										trap    #5
										dc.w $CE1
										trap    #5
										dc.w $CE2
										rts

	; End of function sub_5D8E2


; =============== S U B R O U T I N E =======================================

sub_5D8F0:
										
										trap    #5
										dc.w $CE3
										trap    #5
										dc.w $CE4
										rts

	; End of function sub_5D8F0


; =============== S U B R O U T I N E =======================================

sub_5D8FA:
										
										trap    #5
										dc.w $CE5
										trap    #5
										dc.w $CE6
										rts

	; End of function sub_5D8FA


; =============== S U B R O U T I N E =======================================

sub_5D904:
										
										trap    #5
										dc.w $CE7
										trap    #5
										dc.w $CE8
										rts

	; End of function sub_5D904


; =============== S U B R O U T I N E =======================================

sub_5D90E:
										
										trap    #5
										dc.w $CE9
										trap    #5
										dc.w $CEA
										trap    #5
										dc.w $CEB
										rts

	; End of function sub_5D90E


; =============== S U B R O U T I N E =======================================

sub_5D91C:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_5D91C

