
; SCRIPT SECTION maps\entries\map18\mapsetups\s3_212 :
; 
ms_map18_flag212_ZoneEvents:
										dc.b $FF
										dc.b $16
										dc.w sub_61262-ms_map18_flag212_ZoneEvents
										dc.w $FD00
										dc.w return_61276-ms_map18_flag212_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_61262:
										
										trap    #TRAP_CHECKFLAG
										dc.w $4C
										beq.s   return_61276
										lea     cs_6143C(pc), a0
										trap    #6
										trap    #TRAP_CLEARFLAG
										dc.w $4C                ; Zynk is a follower
										trap    #TRAP_SETFLAG
										dc.w $399               ; set after Zynk leaves you at the Galam Drawbridge (for Roft/Petro death scene)
return_61276:
										
										rts

	; End of function sub_61262

