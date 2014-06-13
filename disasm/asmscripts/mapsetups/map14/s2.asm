
; SCRIPT SECTION mapsetups\map14\s2 :
; 
ms_map14_EntityEvents:
										dc.b 1
										dc.b 1
										dc.w sub_58EDE-ms_map14_EntityEvents
										dc.b 2
										dc.b 0
										dc.w sub_58EE4-ms_map14_EntityEvents
										dc.b 4
										dc.b 1
										dc.w sub_58EEA-ms_map14_EntityEvents
										dc.b 5
										dc.b 1
										dc.w sub_58EF0-ms_map14_EntityEvents
										dc.b 6
										dc.b 1
										dc.w sub_58EF6-ms_map14_EntityEvents
										dc.b $80
										dc.b 1
										dc.w sub_58EFC-ms_map14_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_58F02-ms_map14_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_58F08-ms_map14_EntityEvents
										dc.w $FD00
										dc.w return_58EE2-ms_map14_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_58EDE:
										
										trap    #5
										dc.w $8CD
return_58EE2:
										
										rts

	; End of function sub_58EDE


; =============== S U B R O U T I N E =======================================

sub_58EE4:
										
										trap    #5
										dc.w $8CF
										rts

	; End of function sub_58EE4


; =============== S U B R O U T I N E =======================================

sub_58EEA:
										
										trap    #5
										dc.w $8CE
										rts

	; End of function sub_58EEA


; =============== S U B R O U T I N E =======================================

sub_58EF0:
										
										trap    #5
										dc.w $8D0
										rts

	; End of function sub_58EF0


; =============== S U B R O U T I N E =======================================

sub_58EF6:
										
										trap    #5
										dc.w $8D1
										rts

	; End of function sub_58EF6


; =============== S U B R O U T I N E =======================================

sub_58EFC:
										
										trap    #5
										dc.w $8D2
										rts

	; End of function sub_58EFC


; =============== S U B R O U T I N E =======================================

sub_58F02:
										
										trap    #5
										dc.w $8D3
										rts

	; End of function sub_58F02


; =============== S U B R O U T I N E =======================================

sub_58F08:
										
										trap    #5
										dc.w $8D4
										rts

	; End of function sub_58F08

