
; ASM FILE data\maps\entries\map23\mapsetups\s2_2FA.asm :
; 0x59BA8..0x59BD2 : 
ms_map23_flag2FA_EntityEvents:
		msEntityEvent 128, UP, sub_59BBC-ms_map23_flag2FA_EntityEvents
		msEntityEvent 129, UP, sub_59BC2-ms_map23_flag2FA_EntityEvents
		msEntityEvent 130, DOWN, sub_59BC8-ms_map23_flag2FA_EntityEvents
		msEntityEvent 131, UP, (sub_59B9E-ms_map23_flag2FA_EntityEvents) & $FFFF
		msDefaultEntityEvent 0, (nullsub_129-ms_map23_flag2FA_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_59BBC:
		 
		txt $6A5                ; "Hey, you met Creed, didn't{N}you?{W1}"
		rts

	; End of function sub_59BBC


; =============== S U B R O U T I N E =======================================

sub_59BC2:
		 
		txt $6A6                ; "The evil has completely{N}lifted from the forest.{W1}"
		rts

	; End of function sub_59BC2


; =============== S U B R O U T I N E =======================================

sub_59BC8:
		 
		txt $6A7                ; "Is that sick dwarf better?{W2}"
		txt $6A8                ; "Can he see the fairy now?{W1}"
		rts

	; End of function sub_59BC8

