
; ASM FILE data\maps\entries\map45\mapsetups\s3.asm :
; 0x60060..0x60078 : 
ms_map45_ZoneEvents:
		dc.b $FF
		dc.b $11
		dc.w sub_6006A-ms_map45_ZoneEvents
		dc.w $FD00
		dc.w nullsub_103-ms_map45_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_103:
		rts

	; End of function nullsub_103


; =============== S U B R O U T I N E =======================================

sub_6006A:
		 
		chkFlg $19              ; Shiela joined
		bne.s   return_60076
		lea     cs_600CE(pc), a0
		trap    #6
return_60076:
		rts

	; End of function sub_6006A

