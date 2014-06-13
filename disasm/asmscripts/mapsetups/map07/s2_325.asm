
; SCRIPT SECTION mapsetups\map07\s2_325 :
; 
ms_map7_flag325_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_5561E-ms_map7_flag325_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_555E8-ms_map7_flag325_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_55648-ms_map7_flag325_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5565E-ms_map7_flag325_EntityEvents
										dc.b $84
										dc.b 3
										dc.w sub_55674-ms_map7_flag325_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_556B2-ms_map7_flag325_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_556E4-ms_map7_flag325_EntityEvents
										dc.b $87
										dc.b 3
										dc.w sub_55702-ms_map7_flag325_EntityEvents
										dc.b $88
										dc.b 3
										dc.w sub_55730-ms_map7_flag325_EntityEvents
										dc.b $89
										dc.b 3
										dc.w sub_55776-ms_map7_flag325_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_5577C-ms_map7_flag325_EntityEvents
										dc.w $FD00
										dc.w return_5579C-ms_map7_flag325_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_555B4:
										
										trap    #1
										dc.w $322
										bne.s   return_555E6
										trap    #1
										dc.w $2BE
										bne.s   loc_555CE
										trap    #5
										dc.w $48A
										trap    #5
										dc.w $48B
										trap    #5
										dc.w $48C
										bra.s   return_555E6
loc_555CE:
										
										trap    #1
										dc.w $100
										bne.s   loc_555E2
										trap    #5
										dc.w $4A4
										trap    #5
										dc.w $4A5
										trap    #2
										dc.w $100
										bra.s   return_555E6
loc_555E2:
										
										trap    #5
										dc.w $4A6
return_555E6:
										
										rts

	; End of function sub_555B4


; =============== S U B R O U T I N E =======================================

sub_555E8:
										
										trap    #1
										dc.w $322
										bne.s   loc_55618
										trap    #1
										dc.w $2BE
										bne.s   loc_55602
										trap    #5
										dc.w $484
										trap    #5
										dc.w $485
										trap    #5
										dc.w $486
										bra.s   loc_55616
loc_55602:
										
										trap    #1
										dc.w $2BF
										bne.s   loc_55612
										trap    #5
										dc.w $4A7
										trap    #5
										dc.w $4A8
										bra.s   loc_55616
loc_55612:
										
										trap    #5
										dc.w $4A9
loc_55616:
										
										bra.s   return_5561C
loc_55618:
										
										trap    #5
										dc.w $4D5
return_5561C:
										
										rts

	; End of function sub_555E8


; =============== S U B R O U T I N E =======================================

sub_5561E:
										
										trap    #1
										dc.w $322
										bne.s   loc_5563E
										trap    #1
										dc.w $2BE
										bne.s   loc_55638
										trap    #5
										dc.w $487
										trap    #5
										dc.w $488
										trap    #5
										dc.w $489
										bra.s   loc_5563C
loc_55638:
										
										trap    #5
										dc.w $4AA
loc_5563C:
										
										bra.s   return_55646
loc_5563E:
										
										trap    #5
										dc.w $4D6
										trap    #5
										dc.w $4D7
return_55646:
										
										rts

	; End of function sub_5561E


; =============== S U B R O U T I N E =======================================

sub_55648:
										
										trap    #1
										dc.w $322
										bne.s   loc_55658
										trap    #5
										dc.w $495
										trap    #5
										dc.w $496
										bra.s   return_5565C
loc_55658:
										
										trap    #5
										dc.w $4D8
return_5565C:
										
										rts

	; End of function sub_55648


; =============== S U B R O U T I N E =======================================

sub_5565E:
										
										trap    #1
										dc.w $322
										bne.s   loc_5566E
										trap    #5
										dc.w $498
										trap    #5
										dc.w $499
										bra.s   return_55672
loc_5566E:
										
										trap    #5
										dc.w $4D9
return_55672:
										
										rts

	; End of function sub_5565E


; =============== S U B R O U T I N E =======================================

sub_55674:
										
										trap    #1
										dc.w $322
										bne.s   loc_556A0
										trap    #1
										dc.w $2BE
										bne.s   loc_5569A
										trap    #1
										dc.w $2BD
										bne.s   loc_55694
										trap    #5
										dc.w $490
										trap    #5
										dc.w $491
										trap    #5
										dc.w $492
										bra.s   loc_55698
loc_55694:
										
										trap    #5
										dc.w $4A1
loc_55698:
										
										bra.s   loc_5569E
loc_5569A:
										
										trap    #5
										dc.w $4AB
loc_5569E:
										
										bra.s   return_556B0
loc_556A0:
										
										trap    #1
										dc.w $325
										bne.s   loc_556AC
										trap    #5
										dc.w $4A1
										bra.s   return_556B0
loc_556AC:
										
										trap    #5
										dc.w $4DA
return_556B0:
										
										rts

	; End of function sub_55674


; =============== S U B R O U T I N E =======================================

sub_556B2:
										
										trap    #1
										dc.w $322
										bne.s   loc_556DA
										trap    #1
										dc.w $2BD
										bne.s   loc_556C4
										trap    #5
										dc.w $49A
										bra.s   loc_556D8
loc_556C4:
										
										trap    #1
										dc.w $2BE
										bne.s   loc_556D4
										trap    #5
										dc.w $49D
										trap    #5
										dc.w $49E
										bra.s   loc_556D8
loc_556D4:
										
										trap    #5
										dc.w $49A
loc_556D8:
										
										bra.s   return_556E2
loc_556DA:
										
										trap    #5
										dc.w $4DB
										trap    #5
										dc.w $4DC
return_556E2:
										
										rts

	; End of function sub_556B2


; =============== S U B R O U T I N E =======================================

sub_556E4:
										
										trap    #1
										dc.w $322
										bne.s   loc_556FC
										trap    #1
										dc.w $2BE
										bne.s   loc_556F6
										trap    #5
										dc.w $497
										bra.s   loc_556FA
loc_556F6:
										
										trap    #5
										dc.w $4AC
loc_556FA:
										
										bra.s   return_55700
loc_556FC:
										
										trap    #5
										dc.w $4DD
return_55700:
										
										rts

	; End of function sub_556E4


; =============== S U B R O U T I N E =======================================

sub_55702:
										
										trap    #1
										dc.w $322
										bne.s   loc_5572A
										trap    #1
										dc.w $2BE
										bne.s   loc_55724
										trap    #1
										dc.w $2BD
										bne.s   loc_5571E
										trap    #5
										dc.w $493
										trap    #5
										dc.w $494
										bra.s   loc_55722
loc_5571E:
										
										trap    #5
										dc.w $4A1
loc_55722:
										
										bra.s   loc_55728
loc_55724:
										
										trap    #5
										dc.w $4AD
loc_55728:
										
										bra.s   return_5572E
loc_5572A:
										
										trap    #5
										dc.w $4DE
return_5572E:
										
										rts

	; End of function sub_55702


; =============== S U B R O U T I N E =======================================

sub_55730:
										
										trap    #1
										dc.w $322
										bne.s   loc_55760
										trap    #1
										dc.w $2BD
										bne.s   loc_55746
										trap    #5
										dc.w $49B
										trap    #5
										dc.w $49C
										bra.s   loc_5575E
loc_55746:
										
										trap    #1
										dc.w $2BE
										bne.s   loc_55756
										trap    #5
										dc.w $49F
										trap    #5
										dc.w $4A0
										bra.s   loc_5575E
loc_55756:
										
										trap    #5
										dc.w $49B
										trap    #5
										dc.w $49C
loc_5575E:
										
										bra.s   return_55774
loc_55760:
										
										trap    #1
										btst    d1,-(a5)
										bne.s   loc_5576C
										trap    #5
										dc.w $4DF
										bra.s   return_55774
loc_5576C:
										
										trap    #5
										dc.w $49B
										trap    #5
										dc.w $49C
return_55774:
										
										rts

	; End of function sub_55730


; =============== S U B R O U T I N E =======================================

sub_55776:
										
										trap    #5
										dc.w $48D
										rts

	; End of function sub_55776


; =============== S U B R O U T I N E =======================================

sub_5577C:
										
										trap    #1
										dc.w $322
										bne.s   loc_5578C
										trap    #5
										dc.w $48E
										trap    #5
										dc.w $48F
										bra.s   return_55790
loc_5578C:
										
										trap    #5
										dc.w $4E0
return_55790:
										
										rts

	; End of function sub_5577C


; =============== S U B R O U T I N E =======================================

sub_55792:
										
										trap    #5
										dc.w $4A2
										rts

	; End of function sub_55792


; =============== S U B R O U T I N E =======================================

sub_55798:
										
										trap    #5
										dc.w $4A3
return_5579C:
										
										rts

	; End of function sub_55798

