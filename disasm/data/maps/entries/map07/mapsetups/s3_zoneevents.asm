
; ASM FILE data\maps\entries\map07\mapsetups\s3_zoneevents.asm :
; 0x5579E..0x557EE : 
ms_map7_ZoneEvents:
		msZoneEvent 9, 8, Map7_ZoneEvent0-ms_map7_ZoneEvents
		msZoneEvent 10, 8, Map7_ZoneEvent0-ms_map7_ZoneEvents
		msZoneEvent 11, 8, Map7_ZoneEvent0-ms_map7_ZoneEvents
		msZoneEvent 12, 8, Map7_ZoneEvent0-ms_map7_ZoneEvents
		msZoneEvent 13, 8, Map7_ZoneEvent0-ms_map7_ZoneEvents
		msDefaultZoneEvent 0, return_557EC-ms_map7_ZoneEvents

; =============== S U B R O U T I N E =======================================

Map7_ZoneEvent0:
		
		 
		chkFlg  $322            ; set after the event in the basement of Creed's Mansion
		bne.s   byte_557D8      
		chkFlg  $2BD            ; set after the scene with Peter and the kids in New Granseal
		beq.s   loc_557D6
		chkFlg  $2BE            ; set after the scene with Peter at the Castle (ends with you leaving the Castle)
		bne.s   loc_557D6
		script  cs_55A36
		setFlg  $2BE            ; set after the scene with Peter at the Castle (ends with you leaving the Castle)
		setFlg  $43             ; Peter is a follower
loc_557D6:
		bra.s   return_557EC
byte_557D8:
		chkFlg  $325            ; set after coming back to New Granseal after Creed's Mansion,when Astral joins
		bne.s   return_557EC
		script  cs_55BEE
		setFlg  $325            ; set after coming back to New Granseal after Creed's Mansion,when Astral joins
		setFlg  $46             ; Astral is a follower
return_557EC:
		rts

	; End of function Map7_ZoneEvent0

