
; ASM FILE data\maps\entries\map23\mapsetups\s2_2FA.asm :
; 0x59BA8..0x59BD2 : 
ms_map23_flag2FA_EntityEvents:
		dc.b $80
		dc.b 1
		dc.w sub_59BBC-ms_map23_flag2FA_EntityEvents
		dc.b $81
		dc.b 1
		dc.w sub_59BC2-ms_map23_flag2FA_EntityEvents
		dc.b $82
		dc.b 3
		dc.w sub_59BC8-ms_map23_flag2FA_EntityEvents
		dc.b $83
		dc.b 1
		dc.w (sub_59B9E-ms_map23_flag2FA_EntityEvents) & $FFFF
		dc.w $FD00
		dc.w (nullsub_129-ms_map23_flag2FA_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_59BBC:
		trap    #TEXTBOX
		dc.w $6A5               ; "Hey, you met Creed, didn't{N}you?{W1}"
		rts

	; End of function sub_59BBC


; =============== S U B R O U T I N E =======================================

sub_59BC2:
		trap    #TEXTBOX
		dc.w $6A6               ; "The evil has completely{N}lifted from the forest.{W1}"
		rts

	; End of function sub_59BC2


; =============== S U B R O U T I N E =======================================

sub_59BC8:
		trap    #TEXTBOX
		dc.w $6A7               ; "Is that sick dwarf better?{W2}"
		trap    #TEXTBOX
		dc.w $6A8               ; "Can he see the fairy now?{W1}"
		rts

	; End of function sub_59BC8

