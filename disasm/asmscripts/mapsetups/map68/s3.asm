
; SCRIPT SECTION mapsetups\map68\s3 :
; 
ms_map68_Section3:  dc.w $FD00
										dc.w sub_4FD70-ms_map68_Section3

; =============== S U B R O U T I N E =======================================

sub_4FD70:
										
										move.w  #$13,d0
										jsr     sub_47856
										rts

	; End of function sub_4FD70

