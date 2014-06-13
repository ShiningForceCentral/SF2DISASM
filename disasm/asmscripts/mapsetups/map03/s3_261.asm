
; SCRIPT SECTION mapsetups\map03\s3_261 :
; 
ms_map3_flag261_Section3:
										dc.b 2
										dc.b $17
										dc.w return_50F0A-ms_map3_flag261_Section3
										dc.b 2
										dc.b $FF
										dc.w sub_50EF6-ms_map3_flag261_Section3
										dc.w $FD00
										dc.w return_50EE8+$10000-ms_map3_flag261_Section3

; =============== S U B R O U T I N E =======================================

sub_50EF6:
										
										trap    #1
										dc.w 3
										bne.s   return_50F0A
										lea     cs_516A8(pc), a0
										trap    #6
										trap    #2
										dc.w $192
										trap    #3
										dc.w $42
return_50F0A:
										
										rts

	; End of function sub_50EF6

