
; ASM FILE data\maps\entries\map39\mapsetups\s2.asm :
; 0x5E038..0x5E0B2 : 
ms_map39_EntityEvents:
		dc.b $1A
		dc.b 0
		dc.w sub_5E05C-ms_map39_EntityEvents
		dc.b $80
		dc.b 1
		dc.w sub_5E072-ms_map39_EntityEvents
		dc.b $81
		dc.b 1
		dc.w sub_5E078-ms_map39_EntityEvents
		dc.b $82
		dc.b 1
		dc.w sub_5E07E-ms_map39_EntityEvents
		dc.b $83
		dc.b 3
		dc.w sub_5E088-ms_map39_EntityEvents
		dc.b $84
		dc.b 3
		dc.w sub_5E08E-ms_map39_EntityEvents
		dc.b $85
		dc.b 1
		dc.w sub_5E094-ms_map39_EntityEvents
		dc.b $86
		dc.b 1
		dc.w sub_5E09A-ms_map39_EntityEvents
		dc.w $FD00
		dc.w nullsub_142-ms_map39_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5E05C:
		
		trap    #CHECK_FLAG
		dc.w $33E
		beq.s   return_5E070
		lea     cs_5E20A(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $4C                
						; Zynk is a follower
		trap    #SET_FLAG
		dc.w $344               
						; set after the scene where Zynk stops you as you leave the Moun underground
return_5E070:
		
		rts

	; End of function sub_5E05C


; =============== S U B R O U T I N E =======================================

sub_5E072:
		
		trap    #TEXTBOX
		dc.w $7FB               
						; "Pacalon abandoned us!{W1}"
		rts

	; End of function sub_5E072


; =============== S U B R O U T I N E =======================================

sub_5E078:
		
		trap    #TEXTBOX
		dc.w $7FC               
						; "Can you imagine how many{N}people were killed?{W1}"
		rts

	; End of function sub_5E078


; =============== S U B R O U T I N E =======================================

sub_5E07E:
		
		trap    #TEXTBOX
		dc.w $7FD               
						; "The devils were defeated?{N}Is it true?{W2}"
		trap    #TEXTBOX
		dc.w $7FE               
						; "I can go outside now!{W1}"
		rts

	; End of function sub_5E07E


; =============== S U B R O U T I N E =======================================

sub_5E088:
		
		trap    #TEXTBOX
		dc.w $7FF               
						; "I wasn't scared!  It was{N}hard for me not to go out{N}and fight.{W1}"
		rts

	; End of function sub_5E088


; =============== S U B R O U T I N E =======================================

sub_5E08E:
		
		trap    #TEXTBOX
		dc.w $800               
						; "Tom is lying!{N}I know he wet his pants{N}just now.{W1}"
		rts

	; End of function sub_5E08E


; =============== S U B R O U T I N E =======================================

sub_5E094:
		
		trap    #TEXTBOX
		dc.w $801               
						; "{NAME;26} hid us here{N}when the devils invaded.{W1}"
		rts

	; End of function sub_5E094


; =============== S U B R O U T I N E =======================================

sub_5E09A:
		
		trap    #CHECK_FLAG
		dc.w $33E
		bne.s   loc_5E0AA
		trap    #TEXTBOX
		dc.w $802               
						; "{NAME;24} of Ribble is{N}behind me.{W2}"
		trap    #TEXTBOX
		dc.w $803               
						; "He stood guard at the west{N}gate.{W1}"
		bra.s   return_5E0AE
loc_5E0AA:
		
		trap    #TEXTBOX
		dc.w $804               
						; "{NAME;24} fought against{N}the devils at the west gate.{W1}"
return_5E0AE:
		
		rts

	; End of function sub_5E09A


; =============== S U B R O U T I N E =======================================

nullsub_142:
		
		rts

	; End of function nullsub_142

