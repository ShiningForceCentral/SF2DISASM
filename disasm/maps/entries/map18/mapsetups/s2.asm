
; SCRIPT SECTION maps\entries\map18\mapsetups\s2 :
; 
ms_map18_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_52ACE-ms_map18_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_52B00-ms_map18_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_52B0A-ms_map18_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_52B14-ms_map18_EntityEvents
										dc.w $FD00
										dc.w nullsub_122-ms_map18_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_52ACE:
										
										trap    #5
										dc.w $366
										jsr     j_HidePortraitWindow
										trap    #5
										dc.w $FFFF
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #5
										dc.w $367
										trap    #5
										dc.w $FFFF
										jsr     LoadAndDisplayCurrentPortrait
										move.w  ((word_FFB09E-$1000000)).w,((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #5
										dc.w $368
										rts

	; End of function sub_52ACE


; =============== S U B R O U T I N E =======================================

sub_52B00:
										
										trap    #5
										dc.w $369
										trap    #5
										dc.w $36A
										rts

	; End of function sub_52B00


; =============== S U B R O U T I N E =======================================

sub_52B0A:
										
										trap    #5
										dc.w $36B
										trap    #5
										dc.w $36C
										rts

	; End of function sub_52B0A


; =============== S U B R O U T I N E =======================================

sub_52B14:
										
										trap    #5
										dc.w $36D
										trap    #5
										dc.w $36E
										rts

	; End of function sub_52B14


; =============== S U B R O U T I N E =======================================

nullsub_122:
										
										rts

	; End of function nullsub_122

