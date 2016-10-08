
; SCRIPT SECTION maps\entries\map03\mapsetups\s3_21F :
; 
ms_map3_flag21F_ZoneEvents:
										dc.b 2
										dc.b $FF
										dc.w sub_6282A-ms_map3_flag21F_ZoneEvents
										dc.w $FD00
										dc.w nullsub_70-ms_map3_flag21F_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_70:
										
										rts

	; End of function nullsub_70


; =============== S U B R O U T I N E =======================================

sub_6282A:
										
										lea     cs_6283E(pc), a0
										trap    #6
										trap    #TEXTBOX
										dc.w $F48               ; "Wait, wait!{W2}"
										trap    #TEXTBOX
										dc.w $F49               ; "Sir Astral told me not to{N}let you go out today!{W2}"
										trap    #TEXTBOX
										dc.w $F4A               ; "You have to be here.{W1}"
										rts

	; End of function sub_6282A

cs_6283E:           dc.w $28                ; 0028 MOVE ENTITY NEXT TO PLAYER 89 2
										dc.w $89
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
