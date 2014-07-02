
; SCRIPT SECTION mapsetups\map08\s3_2C4 :
; 
ms_map8_Section3:   dc.b $F
										dc.b $1C
										dc.w sub_561BE-ms_map8_Section3
										dc.b $10
										dc.b $1C
										dc.w sub_561BE-ms_map8_Section3
										dc.b $E
										dc.b 8
										dc.w sub_561DA-ms_map8_Section3
										dc.w $FD00
										dc.w return_561EA-ms_map8_Section3

; =============== S U B R O U T I N E =======================================

sub_561BE:
										
										trap    #1
										dc.w $2C4
										bne.s   return_561D8
										trap    #1
										dc.w $102
										bne.s   return_561D8
										lea     cs_563B2(pc), a0
										trap    #6
										trap    #2
										dc.w $2BF
										trap    #2
										dc.w $102
return_561D8:
										
										rts

	; End of function sub_561BE


; =============== S U B R O U T I N E =======================================

sub_561DA:
										
										trap    #1
										dc.w $2C4
										bne.s   return_561EA
										lea     cs_56422(pc), a0
										trap    #6
										trap    #2
										dc.w $2C4
return_561EA:
										
										rts

	; End of function sub_561DA

