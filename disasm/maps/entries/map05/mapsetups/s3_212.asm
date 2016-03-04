
; SCRIPT SECTION maps\entries\map05\mapsetups\s3_212 :
; 
ms_map5_flag212_Section3:
										dc.b $B
										dc.b 8
										dc.w sub_604D6-ms_map5_flag212_Section3
										dc.b $FF
										dc.b $2A
										dc.w sub_60502-ms_map5_flag212_Section3
										dc.w $FD00
										dc.w nullsub_73-ms_map5_flag212_Section3

; =============== S U B R O U T I N E =======================================

nullsub_73:
										
										rts

	; End of function nullsub_73


; =============== S U B R O U T I N E =======================================

sub_604D6:
										
										trap    #1
										dc.w $3AC
										beq.s   return_60500
										trap    #1
										dc.w $3AD
										bne.s   return_60500
										lea     cs_6093A(pc), a0
										trap    #6
										trap    #1
										dc.w $3A2
										beq.s   loc_604F6
										lea     cs_60BA6(pc), a0
										trap    #6
										bra.s   loc_604FC
loc_604F6:
										
										lea     cs_60B10(pc), a0
										trap    #6
loc_604FC:
										
										trap    #2
										dc.w $3AD
return_60500:
										
										rts

	; End of function sub_604D6


; =============== S U B R O U T I N E =======================================

sub_60502:
										
										trap    #1
										dc.w $1C
										bne.s   return_6051C
										trap    #1
										dc.w $1B
										beq.s   return_6051C
										lea     cs_60708(pc), a0
										trap    #6
										trap    #2
										dc.w $47
										trap    #2
										dc.w $3B1
return_6051C:
										
										rts

	; End of function sub_60502


; =============== S U B R O U T I N E =======================================

sub_6051E:
										
										move.w  #$FDD,d3
										lea     unk_6052E(pc), a0
										nop
										jmp     sub_47722

	; End of function sub_6051E

unk_6052E:          dc.b   9
										dc.b  $F
										dc.b   0
										dc.b   0
										dc.b   6
										dc.b   0
										dc.b  $A
										dc.b $10
										dc.b   0
										dc.b   0
										dc.b   4
										dc.b   1
										dc.b  $B
										dc.b $10
										dc.b   0
										dc.b   0
										dc.b   4
										dc.b   2
										dc.b $16
										dc.b  $B
										dc.b   0
										dc.b   0
										dc.b   1
										dc.b   3
										dc.b $FD 
										dc.b   0
