
; ASM FILE data\maps\entries\map62\mapsetups\s2.asm :
; 0x5C7B6..0x5C820 : 
ms_map62_EntityEvents:
		dc.b $80
		dc.b 3
		dc.w sub_5C7C2-ms_map62_EntityEvents
		dc.b $81
		dc.b 3
		dc.w sub_5C7F6-ms_map62_EntityEvents
		dc.w $FD00
		dc.w return_5C81E-ms_map62_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5C7C2:
		
		trap    #CHECK_FLAG
		dc.w $2DC
		bne.s   loc_5C7F0
		trap    #CHECK_FLAG
		dc.w $102
		bne.s   loc_5C7E6
		trap    #TEXTBOX
		dc.w $E28               
						; "He spent all his spare time{N}studying the Sky Orb.{W2}"
		trap    #TEXTBOX
		dc.w $E29               
						; "It is quite old.{N}He deduced that our{N}ancestors could fly.{W2}"
		trap    #TEXTBOX
		dc.w $E2A               
						; "The last known location of{N}the Nazca Ship was Grans.{W1}"
		trap    #CHECK_FLAG
		dc.w $2D9
		beq.s   loc_5C7E4
		trap    #SET_FLAG
		dc.w $102
loc_5C7E4:
		
		bra.s   loc_5C7EE
loc_5C7E6:
		
		trap    #TEXTBOX
		dc.w $E37               
						; "Good luck.{W2}"
		trap    #TEXTBOX
		dc.w $E38               
						; "If you see my brother,{N}please tell him that I'm OK.{W1}"
loc_5C7EE:
		
		bra.s   return_5C7F4
loc_5C7F0:
		
		trap    #TEXTBOX
		dc.w $E39               
						; "Oh, what a pity.{N}You can't go to Grans.{W1}"
return_5C7F4:
		
		rts

	; End of function sub_5C7C2


; =============== S U B R O U T I N E =======================================

sub_5C7F6:
		
		trap    #CHECK_FLAG
		dc.w $2D9
		bne.s   loc_5C81A
		trap    #CHECK_FLAG
		dc.w $2D8
		bne.s   loc_5C80E
		lea     cs_5C8D4(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2D8               
						; ???
		bra.s   loc_5C818
loc_5C80E:
		
		lea     cs_5C914(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2D9               
						; ???
loc_5C818:
		
		bra.s   return_5C81E
loc_5C81A:
		
		trap    #TEXTBOX
		dc.w $9D0               
						; "Sorry, guys!  We can't go to{N}Grans Island this way.{W1}"
return_5C81E:
		
		rts

	; End of function sub_5C7F6

