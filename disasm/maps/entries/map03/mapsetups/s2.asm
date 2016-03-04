
; SCRIPT SECTION maps\entries\map03\mapsetups\s2 :
; 
ms_map3_EntityEvents:
										dc.b 1
										dc.b 3
										dc.w sub_50F54-ms_map3_EntityEvents
										dc.b 2
										dc.b 0
										dc.w sub_50F98-ms_map3_EntityEvents
										dc.b $80
										dc.b 1
										dc.w sub_50FBA-ms_map3_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_50FCC-ms_map3_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_50FD6-ms_map3_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_50FE4-ms_map3_EntityEvents
										dc.b $84
										dc.b 0
										dc.w sub_50FEA-ms_map3_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_50FF0-ms_map3_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_50FFE-ms_map3_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_51004-ms_map3_EntityEvents
										dc.b $8A
										dc.b 1
										dc.w sub_5100E-ms_map3_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_51020-ms_map3_EntityEvents
										dc.b $8C
										dc.b 1
										dc.w sub_51032-ms_map3_EntityEvents
										dc.b $8D
										dc.b 1
										dc.w sub_5103C-ms_map3_EntityEvents
										dc.b $90
										dc.b 1
										dc.w sub_50FFE-ms_map3_EntityEvents
										dc.b $8E
										dc.b 3
										dc.w sub_51044-ms_map3_EntityEvents
										dc.w $FD00
										dc.w return_5105A-ms_map3_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_50F54:
										
										trap    #1
										dc.w $25B
										bne.s   loc_50F8A
										trap    #1
										dc.w $25A
										bne.s   loc_50F84
										trap    #1
										dc.w $100
										bne.s   loc_50F6A
										trap    #5
										dc.w $200
loc_50F6A:
										
										trap    #5
										dc.w $1E0
										trap    #5
										dc.w $1E1
										trap    #1
										dc.w $100
										bne.s   loc_50F82
										lea     cs_513D6(pc), a0
										trap    #6
										trap    #2
										dc.w $100
loc_50F82:
										
										bra.s   loc_50F88
loc_50F84:
										
										trap    #5
										dc.w $1F6
loc_50F88:
										
										bra.s   return_50F96
loc_50F8A:
										
										trap    #1
										dc.w $42
										bne.s   return_50F96
										lea     cs_513E2(pc), a0
										trap    #6
return_50F96:
										
										rts

	; End of function sub_50F54


; =============== S U B R O U T I N E =======================================

sub_50F98:
										
										trap    #1
										dc.w $25B
										bne.s   loc_50FB4
										trap    #1
										dc.w $25A
										bne.s   loc_50FAA
										trap    #5
										dc.w $1E2
										bra.s   loc_50FB2
loc_50FAA:
										
										trap    #5
										dc.w $1F7
										trap    #5
										dc.w $1F8
loc_50FB2:
										
										bra.s   return_50FB8
loc_50FB4:
										
										trap    #5
										dc.w $1FB
return_50FB8:
										
										rts

	; End of function sub_50F98


; =============== S U B R O U T I N E =======================================

sub_50FBA:
										
										trap    #1
										dc.w $25A
										bne.s   loc_50FC6
										trap    #5
										dc.w $1E3
										bra.s   return_50FCA
loc_50FC6:
										
										trap    #5
										dc.w $1F9
return_50FCA:
										
										rts

	; End of function sub_50FBA


; =============== S U B R O U T I N E =======================================

sub_50FCC:
										
										trap    #5
										dc.w $1E4
										trap    #5
										dc.w $1E5
										rts

	; End of function sub_50FCC


; =============== S U B R O U T I N E =======================================

sub_50FD6:
										
										trap    #5
										dc.w $1E6
										trap    #5
										dc.w $1E7
										trap    #5
										dc.w $1E8
										rts

	; End of function sub_50FD6


; =============== S U B R O U T I N E =======================================

sub_50FE4:
										
										trap    #5
										dc.w $1E9
										rts

	; End of function sub_50FE4


; =============== S U B R O U T I N E =======================================

sub_50FEA:
										
										trap    #5
										dc.w $1EA
										rts

	; End of function sub_50FEA


; =============== S U B R O U T I N E =======================================

sub_50FF0:
										
										trap    #5
										dc.w $1EB
										trap    #5
										dc.w $1EC
										trap    #5
										dc.w $1ED
										rts

	; End of function sub_50FF0


; =============== S U B R O U T I N E =======================================

sub_50FFE:
										
										trap    #5
										dc.w $1EE
										rts

	; End of function sub_50FFE


; =============== S U B R O U T I N E =======================================

sub_51004:
										
										trap    #5
										dc.w $1EF
										trap    #5
										dc.w $1F0
										rts

	; End of function sub_51004


; =============== S U B R O U T I N E =======================================

sub_5100E:
										
										trap    #1
										dc.w $25C
										bne.s   loc_5101A
										trap    #5
										dc.w $1F1
										bra.s   return_5101E
loc_5101A:
										
										trap    #5
										dc.w $1FC
return_5101E:
										
										rts

	; End of function sub_5100E


; =============== S U B R O U T I N E =======================================

sub_51020:
										
										trap    #1
										dc.w $25C
										bne.s   loc_5102C
										trap    #5
										dc.w $1F1
										bra.s   return_51030
loc_5102C:
										
										trap    #5
										dc.w $1FD
return_51030:
										
										rts

	; End of function sub_51020


; =============== S U B R O U T I N E =======================================

sub_51032:
										
										trap    #5
										dc.w $1F2
										trap    #5
										dc.w $1F3
										rts

	; End of function sub_51032


; =============== S U B R O U T I N E =======================================

sub_5103C:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_5103C


; =============== S U B R O U T I N E =======================================

sub_51044:
										
										trap    #1
										dc.w $105
										bne.s   loc_51052
										trap    #5
										dc.w $1F4
										trap    #2
										dc.w $105
loc_51052:
										
										trap    #5
										dc.w $1F5
										trap    #2
										dc.w $25A
return_5105A:
										
										rts

	; End of function sub_51044

