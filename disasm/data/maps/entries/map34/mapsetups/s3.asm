
; ASM FILE data\maps\entries\map34\mapsetups\s3.asm :
; 0x5B696..0x5B6B4 : 
ms_map34_ZoneEvents:
		dc.b $FF
		dc.b $D
		dc.w sub_5B69E-ms_map34_ZoneEvents
		dc.w $FD00
		dc.w return_5B6B2-ms_map34_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5B69E:
		 
		chkFlg  $310            ; set after the event in the basement of Creed's Mansion
		bne.s   return_5B6B2
		script  cs_5B6C0
		setFlg  $310            ; set after the event in the basement of Creed's Mansion
		setFlg  $322            ; set after the event in the basement of Creed's Mansion
return_5B6B2:
		rts

	; End of function sub_5B69E

