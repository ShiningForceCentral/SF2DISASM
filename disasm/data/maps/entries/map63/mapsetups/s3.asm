
; ASM FILE data\maps\entries\map63\mapsetups\s3.asm :
; 0x5C9E2..0x5CA24 : 
ms_map63_ZoneEvents:
		dc.b $F
		dc.b $37
		dc.w sub_5C9F6-ms_map63_ZoneEvents
		dc.b $D
		dc.b $2A
		dc.w sub_5C9F6-ms_map63_ZoneEvents
		dc.b $A
		dc.b $15
		dc.w sub_5CA14-ms_map63_ZoneEvents
		dc.b 8
		dc.b 7
		dc.w sub_5CA1C-ms_map63_ZoneEvents
		dc.w $FD00
		dc.w return_5CA22-ms_map63_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5C9F6:
		trap    #CHECK_FLAG
		dc.w $100
		bne.s   loc_5CA08
		lea     cs_5CA6E(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
		bra.s   return_5CA12
loc_5CA08:
		lea     cs_5CB34(pc), a0
		trap    #6
		trap    #CLEAR_FLAG
		dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
return_5CA12:
		rts

	; End of function sub_5C9F6


; =============== S U B R O U T I N E =======================================

sub_5CA14:
		lea     cs_5CC26(pc), a0
		trap    #6
		rts

	; End of function sub_5CA14


; =============== S U B R O U T I N E =======================================

sub_5CA1C:
		lea     cs_5CCF6(pc), a0
		trap    #6
return_5CA22:
		rts

	; End of function sub_5CA1C

