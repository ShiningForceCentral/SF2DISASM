
; SCRIPT SECTION mapsetups\map22\s2 :
; 
ms_map22_EntityEvents:
										dc.b $E
										dc.b 1
										dc.w sub_5950A-ms_map22_EntityEvents
										dc.b $F
										dc.b 1
										dc.w sub_59514-ms_map22_EntityEvents
										dc.b $80
										dc.b 0
										dc.w sub_594E4-ms_map22_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_594EC-ms_map22_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_594F6-ms_map22_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_59500-ms_map22_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_59522-ms_map22_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5952A-ms_map22_EntityEvents
										dc.b $86
										dc.b 3
										dc.w sub_59554-ms_map22_EntityEvents
										dc.b $87
										dc.b 3
										dc.w sub_5957C-ms_map22_EntityEvents
										dc.b $88
										dc.b 3
										dc.w sub_59592-ms_map22_EntityEvents
										dc.b $89
										dc.b 0
										dc.w sub_595D2-ms_map22_EntityEvents
										dc.b $8A
										dc.b 0
										dc.w sub_595CC-ms_map22_EntityEvents
										dc.b $8B
										dc.b 0
										dc.w sub_595C6-ms_map22_EntityEvents
										dc.b $8C
										dc.b 0
										dc.w sub_595C6-ms_map22_EntityEvents
										dc.b $8D
										dc.b 0
										dc.w sub_595C0-ms_map22_EntityEvents
										dc.b $8E
										dc.b 0
										dc.w sub_595C0-ms_map22_EntityEvents
										dc.b $8F
										dc.b 0
										dc.w sub_595B4-ms_map22_EntityEvents
										dc.b $90
										dc.b 0
										dc.w sub_595B4-ms_map22_EntityEvents
										dc.b $91
										dc.b 0
										dc.w sub_595CC-ms_map22_EntityEvents
										dc.b $92
										dc.b 0
										dc.w sub_595CC-ms_map22_EntityEvents
										dc.b $93
										dc.b 0
										dc.w sub_595BA-ms_map22_EntityEvents
										dc.b $94
										dc.b 0
										dc.w sub_595BA-ms_map22_EntityEvents
										dc.b $95
										dc.b 0
										dc.w sub_595BA-ms_map22_EntityEvents
										dc.b $96
										dc.b 0
										dc.w sub_595BA-ms_map22_EntityEvents
										dc.b $97
										dc.b 0
										dc.w sub_595BA-ms_map22_EntityEvents
										dc.b $98
										dc.b 0
										dc.w sub_595BA-ms_map22_EntityEvents
										dc.w $FD00
										dc.w nullsub_128-ms_map22_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_594E4:
										
										jsr     (MapTileset051+$F8-ms_map22_EntityEvents)
										rts

	; End of function sub_594E4


; =============== S U B R O U T I N E =======================================

sub_594EC:
										
										trap    #5
										dc.w $6E6
										trap    #5
										dc.w $6E7
										rts

	; End of function sub_594EC


; =============== S U B R O U T I N E =======================================

sub_594F6:
										
										trap    #5
										dc.w $6E8
										trap    #5
										dc.w $6E9
										rts

	; End of function sub_594F6


; =============== S U B R O U T I N E =======================================

sub_59500:
										
										trap    #5
										dc.w $6EA
										trap    #5
										dc.w $6EB
										rts

	; End of function sub_59500


; =============== S U B R O U T I N E =======================================

sub_5950A:
										
										trap    #5
										dc.w $6EC
										trap    #5
										dc.w $6ED
										rts

	; End of function sub_5950A


; =============== S U B R O U T I N E =======================================

sub_59514:
										
										trap    #5
										dc.w $6EE
										trap    #5
										dc.w $6EF
										trap    #5
										dc.w $6F0
										rts

	; End of function sub_59514


; =============== S U B R O U T I N E =======================================

sub_59522:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_59522


; =============== S U B R O U T I N E =======================================

sub_5952A:
										
										trap    #1
										dc.w $20A
										bne.s   loc_59536
										trap    #5
										dc.w $6F1
										bra.s   return_59552
loc_59536:
										
										trap    #1
										dc.w $100
										bne.s   loc_5954A
										trap    #5
										dc.w $706
										trap    #5
										dc.w $707
										trap    #2
										dc.w $100
										bra.s   return_59552
loc_5954A:
										
										trap    #5
										dc.w $708
										trap    #5
										dc.w $709
return_59552:
										
										rts

	; End of function sub_5952A


; =============== S U B R O U T I N E =======================================

sub_59554:
										
										trap    #1
										dc.w $20A
										bne.s   loc_59576
										trap    #1
										dc.w $309
										bne.s   loc_5956C
										trap    #5
										dc.w $6F2
										trap    #5
										dc.w $6F3
										trap    #5
										dc.w $6F4
loc_5956C:
										
										trap    #5
										dc.w $6F5
										trap    #2
										dc.w $309
										bra.s   return_5957A
loc_59576:
										
										trap    #5
										dc.w $705
return_5957A:
										
										rts

	; End of function sub_59554


; =============== S U B R O U T I N E =======================================

sub_5957C:
										
										trap    #1
										dc.w $309
										bne.s   loc_5958C
										trap    #5
										dc.w $6F7
										trap    #5
										dc.w $6F8
										bra.s   return_59590
loc_5958C:
										
										trap    #5
										dc.w $6F6
return_59590:
										
										rts

	; End of function sub_5957C


; =============== S U B R O U T I N E =======================================

sub_59592:
										
										trap    #1
										dc.w $D4
										bne.s   loc_5959E
										trap    #5
										dc.w $70A
										bra.s   return_595B2
loc_5959E:
										
										trap    #5
										dc.w $70B
										trap    #1
										dc.w $102
										bne.s   return_595B2
										lea     cs_599A4(pc), a0
										trap    #6
										trap    #2
										dc.w $102
return_595B2:
										
										rts

	; End of function sub_59592


; =============== S U B R O U T I N E =======================================

sub_595B4:
										
										trap    #5
										dc.w $6F9
										rts

	; End of function sub_595B4


; =============== S U B R O U T I N E =======================================

sub_595BA:
										
										trap    #5
										dc.w $6FA
										rts

	; End of function sub_595BA


; =============== S U B R O U T I N E =======================================

sub_595C0:
										
										trap    #5
										dc.w $6FB
										rts

	; End of function sub_595C0


; =============== S U B R O U T I N E =======================================

sub_595C6:
										
										trap    #5
										dc.w $6FC
										rts

	; End of function sub_595C6


; =============== S U B R O U T I N E =======================================

sub_595CC:
										
										trap    #5
										dc.w $6FD
										rts

	; End of function sub_595CC


; =============== S U B R O U T I N E =======================================

sub_595D2:
										
										trap    #5
										dc.w $6FE
										trap    #5
										dc.w $6FF
										rts

	; End of function sub_595D2


; =============== S U B R O U T I N E =======================================

nullsub_128:
										
										rts

	; End of function nullsub_128

