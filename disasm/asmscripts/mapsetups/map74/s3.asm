
; SCRIPT SECTION mapsetups\map74\s3 :
; 
ms_map74_Section3:  dc.b $FF
										dc.b $3D
										dc.w sub_5098C-ms_map74_Section3
										dc.w $FD00
										dc.w return_509C4-ms_map74_Section3

; =============== S U B R O U T I N E =======================================

sub_5098C:
										
										trap    #1
										dc.w $20F
										bne.s   loc_509AC
										trap    #2
										dc.w $1AB
										move.l  #$100FF,((RAM_MapEventType-$1000000)).w
										trap    #2
										dc.w $1AC
										trap    #2
										dc.w $1AD
										trap    #2
										dc.w $1AE
										bra.s   return_509C4
loc_509AC:
										
										trap    #1
										dc.w $32B
										beq.s   return_509C4
										trap    #1
										dc.w $214
										bne.s   return_509C4
										trap    #2
										dc.w $1B0
										move.l  #$100FF,((RAM_MapEventType-$1000000)).w
return_509C4:
										
										rts

	; End of function sub_5098C

