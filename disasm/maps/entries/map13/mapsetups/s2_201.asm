
; SCRIPT SECTION maps\entries\map13\mapsetups\s2_201 :
; 
ms_map13_flag201_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_58184-ms_map13_flag201_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5818A-ms_map13_flag201_EntityEvents
										dc.b $82
										dc.b 0
										dc.w sub_58078+$10000-ms_map13_flag201_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_58090+$10000-ms_map13_flag201_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5809E+$10000-ms_map13_flag201_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_58190-ms_map13_flag201_EntityEvents
										dc.b $86
										dc.b 3
										dc.w sub_580C6+$10000-ms_map13_flag201_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_58196-ms_map13_flag201_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_5819C-ms_map13_flag201_EntityEvents
										dc.b $89
										dc.b 0
										dc.w sub_581A2-ms_map13_flag201_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_58218-ms_map13_flag201_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_5821E-ms_map13_flag201_EntityEvents
										dc.b $8C
										dc.b 1
										dc.w sub_58224-ms_map13_flag201_EntityEvents
										dc.w $FD00
										dc.w nullsub_116+$10000-ms_map13_flag201_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_58184:
										
										trap    #5
										dc.w $59F
										rts

	; End of function sub_58184


; =============== S U B R O U T I N E =======================================

sub_5818A:
										
										trap    #5
										dc.w $5A0
										rts

	; End of function sub_5818A


; =============== S U B R O U T I N E =======================================

sub_58190:
										
										trap    #5
										dc.w $5A1
										rts

	; End of function sub_58190


; =============== S U B R O U T I N E =======================================

sub_58196:
										
										trap    #5
										dc.w $5A2
										rts

	; End of function sub_58196


; =============== S U B R O U T I N E =======================================

sub_5819C:
										
										trap    #5
										dc.w $5A3
										rts

	; End of function sub_5819C


; =============== S U B R O U T I N E =======================================

sub_581A2:
										
										trap    #1
										dc.w $2CE
										bne.s   loc_58212
										trap    #1
										dc.w $2CD
										bne.s   loc_5820C
										trap    #1
										dc.w $2CC
										bne.s   loc_58206
										trap    #1
										dc.w $104
										bne.s   loc_581C4
										trap    #5
										dc.w $5A8
										trap    #2
										dc.w $104
										bra.s   loc_58204
loc_581C4:
										
										trap    #1
										dc.w $105
										bne.s   loc_581D4
										trap    #5
										dc.w $5A9
										trap    #2
										dc.w $105
										bra.s   loc_58204
loc_581D4:
										
										trap    #1
										dc.w $106
										bne.s   loc_581E4
										trap    #5
										dc.w $5AA
										trap    #2
										dc.w $106
										bra.s   loc_58204
loc_581E4:
										
										lea     cs_58856(pc), a0
										trap    #6
										trap    #2
										dc.w $2CC
										trap    #2
										dc.w $40
										move.b  #$48,((RAM_Raft_MapIdx-$1000000)).w 
										move.b  #$2B,((RAM_Raft_X-$1000000)).w 
										move.b  #$30,((RAM_Raft_Y-$1000000)).w 
loc_58204:
										
										bra.s   loc_5820A
loc_58206:
										
										trap    #5
										dc.w $5E8
loc_5820A:
										
										bra.s   loc_58210
loc_5820C:
										
										trap    #5
										dc.w $5AB
loc_58210:
										
										bra.s   return_58216
loc_58212:
										
										trap    #5
										dc.w $5A4
return_58216:
										
										rts

	; End of function sub_581A2


; =============== S U B R O U T I N E =======================================

sub_58218:
										
										trap    #5
										dc.w $5A5
										rts

	; End of function sub_58218


; =============== S U B R O U T I N E =======================================

sub_5821E:
										
										trap    #5
										dc.w $5A6
										rts

	; End of function sub_5821E


; =============== S U B R O U T I N E =======================================

sub_58224:
										
										trap    #5
										dc.w $5A7
										rts

	; End of function sub_58224

