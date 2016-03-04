
; SCRIPT SECTION maps\entries\map21\mapsetups\s2_1FA :
; 
ms_map21_flag1FA_EntityEvents:
										dc.w $FD00
										dc.w nullsub_126-ms_map21_flag1FA_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_53EAE:
										
										trap    #1
										dc.w $260
										bne.s   loc_53EC8
										trap    #1
										dc.w $100
										bne.s   loc_53EC2
										trap    #5
										dc.w $238
										trap    #2
										dc.w $100
loc_53EC2:
										
										trap    #5
										dc.w $239
										bra.s   return_53EDC
loc_53EC8:
										
										trap    #5
										dc.w $243
										trap    #1
										dc.w $100
										bne.s   return_53EDC
										lea     cs_53EF4(pc), a0
										trap    #6
										trap    #2
										dc.w $100
return_53EDC:
										
										rts

	; End of function sub_53EAE


; =============== S U B R O U T I N E =======================================

sub_53EDE:
										
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #5
										dc.w $244
										rts

	; End of function sub_53EDE


; =============== S U B R O U T I N E =======================================

sub_53EEE:
										
										trap    #5
										dc.w $245
nullsub_126:
										
										rts

	; End of function sub_53EEE

cs_53EF4:           dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 1
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 87 3
										dc.b $87
										dc.b 3
										dc.w $13                ; 0013 SET STORY FLAG 1
										dc.w 1
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
