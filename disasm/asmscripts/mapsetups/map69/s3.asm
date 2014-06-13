
; SCRIPT SECTION mapsetups\map69\s3 :
; 
ms_map69_Section3:  dc.b $17
										dc.b $FF
										dc.w sub_4FDB2-ms_map69_Section3
										dc.b $18
										dc.b $FF
										dc.w sub_4FDB2-ms_map69_Section3
										dc.b $19
										dc.b $FF
										dc.w sub_4FDB2-ms_map69_Section3
										dc.w $FD00
										dc.w sub_4FDBE-ms_map69_Section3

; =============== S U B R O U T I N E =======================================

sub_4FDB2:
										
										move.w  #(sub_4FDB2+1-ms_map69_Section3),d0
										jsr     sub_47856
										rts

	; End of function sub_4FDB2


; =============== S U B R O U T I N E =======================================

sub_4FDBE:
										
										trap    #1
										dc.w $1FD
										bne.s   return_4FDD0
										trap    #2
										dc.w $199
										move.l  #$100FF,((RAM_MapEventType-$1000000)).w
return_4FDD0:
										
										rts

	; End of function sub_4FDBE

