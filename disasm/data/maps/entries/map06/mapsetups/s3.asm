
; ASM FILE data\maps\entries\map06\mapsetups\s3.asm :
; 0x54CD0..0x54D3C : 
ms_map6_ZoneEvents:
		dc.b  $A
		dc.b   9
		dc.w sub_54CE8-ms_map6_ZoneEvents
		dc.b $B
		dc.b 9
		dc.w sub_54CE8-ms_map6_ZoneEvents
		dc.b $13
		dc.b $17
		dc.w sub_54D12-ms_map6_ZoneEvents
		dc.b $13
		dc.b $1D
		dc.w sub_54D24-ms_map6_ZoneEvents
		dc.b $14
		dc.b $1D
		dc.w sub_54D24-ms_map6_ZoneEvents
		dc.w $FD00
		dc.w return_54D3A-ms_map6_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_54CE8:
		 
		chkFlg  $2C2            ; set after the scene with the sailor and soldier in New Granseal (Peter intro)
		bne.s   byte_54CFA      
		script  cs_54E86
		setFlg  $2C2            ; set after the scene with the sailor and soldier in New Granseal (Peter intro)
		bra.s   return_54D10
byte_54CFA:
		chkFlg  $322            ; set after the event in the basement of Creed's Mansion
		beq.s   return_54D10
		chkFlg  $323            ; set after returning to New Granseal, when the soldier greets you
		bne.s   return_54D10
		script  cs_55242
		setFlg  $323            ; set after returning to New Granseal, when the soldier greets you
return_54D10:
		rts

	; End of function sub_54CE8


; =============== S U B R O U T I N E =======================================

sub_54D12:
		 
		chkFlg  $2BD            ; set after the scene with Peter and the kids in New Granseal
		bne.s   return_54D22
		script  cs_54F26
		setFlg  $2BD            ; set after the scene with Peter and the kids in New Granseal
return_54D22:
		rts

	; End of function sub_54D12


; =============== S U B R O U T I N E =======================================

sub_54D24:
		 
		chkFlg  $325            ; set after coming back to New Granseal after Creed's Mansion,when Astral joins
		beq.s   return_54D3A
		chkFlg  $326            ; set after the scene with Janet, when you go to leave New Granseal
		bne.s   return_54D3A
		script  cs_55288
		setFlg  $326            ; set after the scene with Janet, when you go to leave New Granseal
return_54D3A:
		rts

	; End of function sub_54D24

