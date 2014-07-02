
; SCRIPT SECTION mapsetups\map40\s2 :
; 
ms_map40_EntityEvents:
										dc.b $1C
										dc.b 0
										dc.w sub_53FA2-ms_map40_EntityEvents
										dc.b $80
										dc.b 0
										dc.w sub_53FAA-ms_map40_EntityEvents
										dc.b $81
										dc.b 0
										dc.w sub_53FAA-ms_map40_EntityEvents
										dc.w $FD00
										dc.w return_53FB8-ms_map40_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_53FA2:
										
										lea     (Map23Section1+$44C-ms_map40_EntityEvents)(pc), a0
										trap    #6
										rts

	; End of function sub_53FA2


; =============== S U B R O U T I N E =======================================

sub_53FAA:
										
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #5
										dc.w $3E8
return_53FB8:
										
										rts

	; End of function sub_53FAA

