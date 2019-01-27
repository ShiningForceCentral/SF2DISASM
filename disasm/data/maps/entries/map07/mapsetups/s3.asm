
; ASM FILE data\maps\entries\map07\mapsetups\s3.asm :
; 0x5579E..0x557EE : 
ms_map7_ZoneEvents:
		dc.b 9
		dc.b 8
		dc.w sub_557B6-ms_map7_ZoneEvents
		dc.b $A
		dc.b 8
		dc.w sub_557B6-ms_map7_ZoneEvents
		dc.b $B
		dc.b 8
		dc.w sub_557B6-ms_map7_ZoneEvents
		dc.b $C
		dc.b 8
		dc.w sub_557B6-ms_map7_ZoneEvents
		dc.b $D
		dc.b 8
		dc.w sub_557B6-ms_map7_ZoneEvents
		dc.w $FD00
		dc.w return_557EC-ms_map7_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_557B6:
		 
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

	; End of function sub_557B6

