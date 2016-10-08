
; SCRIPT SECTION maps\entries\map45\mapsetups\s2 :
; 
ms_map45_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_60038-ms_map45_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_60042-ms_map45_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_60048-ms_map45_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_6004E-ms_map45_EntityEvents
										dc.w $FD00
										dc.w nullsub_147-ms_map45_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_60038:
										
										trap    #TEXTBOX
										dc.w $81D               ; "Monks are dedicated to{N}studying the powers of the{N}mind.{W2}"
										trap    #TEXTBOX
										dc.w $81E               ; "We train very hard.{W1}"
										rts

	; End of function sub_60038


; =============== S U B R O U T I N E =======================================

sub_60042:
										
										trap    #TEXTBOX
										dc.w $81F               ; "Don't approach my back!{N}You will die!{W1}"
										rts

	; End of function sub_60042


; =============== S U B R O U T I N E =======================================

sub_60048:
										
										trap    #TEXTBOX
										dc.w $820               ; "I'm always in control of my{N}mind.{W1}"
										rts

	; End of function sub_60048


; =============== S U B R O U T I N E =======================================

sub_6004E:
										
										trap    #TEXTBOX
										dc.w $821               ; "Where are you from?{N}I used to be a priest.{W2}"
										trap    #TEXTBOX
										dc.w $822               ; "Do you need my help?{W1}"
										jsr     j_ChurchActions
										rts

	; End of function sub_6004E


; =============== S U B R O U T I N E =======================================

nullsub_147:
										
										rts

	; End of function nullsub_147

