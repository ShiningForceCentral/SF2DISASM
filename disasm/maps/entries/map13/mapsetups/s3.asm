
; SCRIPT SECTION maps\entries\map13\mapsetups\s3 :
; 
ms_map13_Section3:  dc.b $18
										dc.b $FF
										dc.w sub_5823A-ms_map13_Section3
										dc.b $FF
										dc.b $B
										dc.w sub_5827C-ms_map13_Section3
										dc.b $FF
										dc.b $1E
										dc.w sub_58294-ms_map13_Section3
										dc.w $FD00
										dc.w return_582AA-ms_map13_Section3

; =============== S U B R O U T I N E =======================================

sub_5823A:
										
										trap    #1
										dc.w $2C6
										bne.s   loc_58264
										lea     cs_58330(pc), a0
										trap    #6
										trap    #1
										dc.w $2C7
										bne.s   loc_58254
										lea     cs_58310(pc), a0
										trap    #6
										bra.s   loc_5825E
loc_58254:
										
										move.w  #$82,d0 
										jsr     MoveEntityOutOfMap
loc_5825E:
										
										trap    #TRAP_SETFLAG
										dc.w $2C6               ; set after Oddler wanders down from the mountain
										bra.s   return_5827A
loc_58264:
										
										trap    #1
										dc.w $31F
										beq.s   return_5827A
										trap    #1
										dc.w $2CB
										bne.s   return_5827A
										lea     cs_585FE(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $2CB               ; set after returning to Polca from Bedoe and seeing the devils vs. birds scene
return_5827A:
										
										rts

	; End of function sub_5823A


; =============== S U B R O U T I N E =======================================

sub_5827C:
										
										trap    #1
										dc.w $2CC
										beq.s   return_58292
										trap    #1
										dc.w $2CD
										bne.s   return_58292
										lea     cs_58AE2(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $2CD               ; set after the mayor first tries to have you take Oddler with you (Peter declines)
return_58292:
										
										rts

	; End of function sub_5827C


; =============== S U B R O U T I N E =======================================

sub_58294:
										
										trap    #1
										dc.w $2CC
										beq.s   return_582AA
										trap    #1
										dc.w $2CE
										bne.s   return_582AA
										lea     cs_58BEA(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $2CE               ; set after Oddler runs after you as you leave Polca, and tags along
return_582AA:
										
										rts

	; End of function sub_58294

