
; SCRIPT SECTION maps\entries\map70\mapsetups\s3 :
; 
ms_map70_Section3:  dc.b $10
										dc.b $FF
										dc.w sub_4FE12-ms_map70_Section3
										dc.b $11
										dc.b $FF
										dc.w sub_4FE12-ms_map70_Section3
										dc.b $12
										dc.b $FF
										dc.w sub_4FE12-ms_map70_Section3
										dc.b $13
										dc.b $FF
off_4FE0C:          dc.w sub_4FE12-ms_map70_Section3
										dc.w $FD00
										dc.w sub_4FE1E-ms_map70_Section3

; =============== S U B R O U T I N E =======================================

sub_4FE12:
										
										move.w  #(off_4FE0C-ms_map70_Section3),d0
										jsr     sub_47856
										rts

	; End of function sub_4FE12


; =============== S U B R O U T I N E =======================================

sub_4FE1E:
										
										trap    #1
										dc.w $1FE
										bne.s   return_4FE30
										trap    #2
										dc.w $19A
										move.l  #$100FF,((RAM_MapEventType-$1000000)).w
return_4FE30:
										
										rts

	; End of function sub_4FE1E

