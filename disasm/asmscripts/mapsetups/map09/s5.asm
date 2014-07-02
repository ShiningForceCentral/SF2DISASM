
; SCRIPT SECTION mapsetups\map09\s5 :
; 
ms_map9_Section5:   dc.b $10
										dc.b $3A
										dc.b $FF
										dc.b $3D
										dc.w sub_568B0-ms_map9_Section5
										dc.b $FD
										dc.b 0
										dc.b 0
										dc.b 0
										dc.w return_568C2-ms_map9_Section5

; =============== S U B R O U T I N E =======================================

sub_568B0:
										
										trap    #1
										dc.w $2D7
										bne.s   return_568C2
										lea     cs_569BC(pc), a0
										trap    #6
										trap    #2
										dc.w $2D7
										moveq   #$FFFFFFFF,d6
return_568C2:
										
										rts

	; End of function sub_568B0

