
; SCRIPT SECTION mapsetups\map38\s3 :
; 
ms_map38_Section3:  dc.b $C
										dc.b 6
										dc.w sub_5DCDE-ms_map38_Section3
										dc.b $C
										dc.b 8
										dc.w sub_5DCF0-ms_map38_Section3
										dc.w $FD00
										dc.w nullsub_97-ms_map38_Section3

; =============== S U B R O U T I N E =======================================

nullsub_97:
										
										rts

	; End of function nullsub_97


; =============== S U B R O U T I N E =======================================

sub_5DCDE:
										
										trap    #1
										dc.w $38F
										bne.s   return_5DCEE
										lea     cs_5DE2E(pc), a0
										trap    #6
										trap    #2
										dc.w $38F
return_5DCEE:
										
										rts

	; End of function sub_5DCDE


; =============== S U B R O U T I N E =======================================

sub_5DCF0:
										
										trap    #1
										dc.w $38F
										beq.s   return_5DD24
										trap    #1
										dc.w $4C
										beq.s   loc_5DD08
										lea     cs_5DE76(pc), a0
										trap    #6
										trap    #3
										dc.w $4C
										bra.s   return_5DD24
loc_5DD08:
										
										trap    #1
										dc.w $399
										beq.s   return_5DD24
										trap    #1
										dc.w $1A
										bne.s   return_5DD24
										trap    #1
										btst    d0,d0
										beq.s   return_5DD24
										lea     cs_5DE76(pc), a0
										trap    #6
										trap    #3
										dc.w $4C
return_5DD24:
										
										rts

	; End of function sub_5DCF0

