
; ASM FILE data\maps\entries\map06\mapsetups\s3.asm :
; 0x54CD0..0x54D3C : 
ms_map6_ZoneEvents:
		dc.b $A
		dc.b 9
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
		
		trap    #CHECK_FLAG
		dc.w $2C2
		bne.s   loc_54CFA
		lea     cs_54E86(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2C2               
						; set after the scene with the sailor and soldier in New Granseal (Peter intro)
		bra.s   return_54D10
loc_54CFA:
		
		trap    #CHECK_FLAG
		dc.w $322
		beq.s   return_54D10
		trap    #CHECK_FLAG
		dc.w $323
		bne.s   return_54D10
		lea     cs_55242(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $323               
						; set after returning to New Granseal, when the soldier greets you
return_54D10:
		
		rts

	; End of function sub_54CE8


; =============== S U B R O U T I N E =======================================

sub_54D12:
		
		trap    #CHECK_FLAG
		dc.w $2BD
		bne.s   return_54D22
		lea     cs_54F26(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2BD               
						; set after the scene with Peter and the kids in New Granseal
return_54D22:
		
		rts

	; End of function sub_54D12


; =============== S U B R O U T I N E =======================================

sub_54D24:
		
		trap    #CHECK_FLAG
		dc.w $325
		beq.s   return_54D3A
		trap    #CHECK_FLAG
		dc.w $326
		bne.s   return_54D3A
		lea     cs_55288(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $326               
						; set after the scene with Janet, when you go to leave New Granseal
return_54D3A:
		
		rts

	; End of function sub_54D24

