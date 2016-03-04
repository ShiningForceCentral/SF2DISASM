
; SCRIPT SECTION maps\entries\map03\mapsetups\s3_21F :
; 
ms_map3_flag21F_Section3:
										dc.b 2
										dc.b $FF
										dc.w sub_6282A-ms_map3_flag21F_Section3
										dc.w $FD00
										dc.w nullsub_70-ms_map3_flag21F_Section3

; =============== S U B R O U T I N E =======================================

nullsub_70:
										
										rts

	; End of function nullsub_70


; =============== S U B R O U T I N E =======================================

sub_6282A:
										
										lea     cs_6283E(pc), a0
										trap    #6
										trap    #5
										dc.w $F48
										trap    #5
										dc.w $F49
										trap    #5
										dc.w $F4A
										rts

	; End of function sub_6282A

cs_6283E:           dc.w $28                ; 0028 MOVE ENTITY NEXT TO PLAYER 89 2
										dc.w $89
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
