
; ASM FILE data\maps\entries\map45\mapsetups\s2.asm :
; 0x60024..0x60060 : 
ms_map45_EntityEvents:
		msEntityEvent 128, UP, sub_60038-ms_map45_EntityEvents
		msEntityEvent 129, DOWN, sub_60042-ms_map45_EntityEvents
		msEntityEvent 130, DOWN, sub_60048-ms_map45_EntityEvents
		msEntityEvent 131, UP, sub_6004E-ms_map45_EntityEvents
		msDefaultEntityEvent 0, nullsub_147-ms_map45_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_60038:
		 
		txt $81D                ; "Monks are dedicated to{N}studying the powers of the{N}mind.{W2}"
		txt $81E                ; "We train very hard.{W1}"
		rts

	; End of function sub_60038


; =============== S U B R O U T I N E =======================================

sub_60042:
		 
		txt $81F                ; "Don't approach my back!{N}You will die!{W1}"
		rts

	; End of function sub_60042


; =============== S U B R O U T I N E =======================================

sub_60048:
		 
		txt $820                ; "I'm always in control of my{N}mind.{W1}"
		rts

	; End of function sub_60048


; =============== S U B R O U T I N E =======================================

sub_6004E:
		 
		txt $821                ; "Where are you from?{N}I used to be a priest.{W2}"
		txt $822                ; "Do you need my help?{W1}"
		jsr     j_ChurchActions
		rts

	; End of function sub_6004E


; =============== S U B R O U T I N E =======================================

nullsub_147:
		rts

	; End of function nullsub_147

