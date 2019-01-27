
; ASM FILE data\maps\entries\map39\mapsetups\s2.asm :
; 0x5E038..0x5E0B2 : 
ms_map39_EntityEvents:
		msEntityEvent 26, RIGHT, sub_5E05C-ms_map39_EntityEvents
		msEntityEvent 128, UP, sub_5E072-ms_map39_EntityEvents
		msEntityEvent 129, UP, sub_5E078-ms_map39_EntityEvents
		msEntityEvent 130, UP, sub_5E07E-ms_map39_EntityEvents
		msEntityEvent 131, DOWN, sub_5E088-ms_map39_EntityEvents
		msEntityEvent 132, DOWN, sub_5E08E-ms_map39_EntityEvents
		msEntityEvent 133, UP, sub_5E094-ms_map39_EntityEvents
		msEntityEvent 134, UP, sub_5E09A-ms_map39_EntityEvents
		msDefaultEntityEvent 0, nullsub_142-ms_map39_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5E05C:
		 
		chkFlg $33E             ; set after the Gyan join scene in the Moun underground
		beq.s   return_5E070
		script  cs_5E20A
		setFlg $4C              ; Zynk is a follower
		setFlg $344             ; set after the scene where Zynk stops you as you leave the Moun underground
return_5E070:
		rts

	; End of function sub_5E05C


; =============== S U B R O U T I N E =======================================

sub_5E072:
		 
		txt $7FB                ; "Pacalon abandoned us!{W1}"
		rts

	; End of function sub_5E072


; =============== S U B R O U T I N E =======================================

sub_5E078:
		 
		txt $7FC                ; "Can you imagine how many{N}people were killed?{W1}"
		rts

	; End of function sub_5E078


; =============== S U B R O U T I N E =======================================

sub_5E07E:
		 
		txt $7FD                ; "The devils were defeated?{N}Is it true?{W2}"
		txt $7FE                ; "I can go outside now!{W1}"
		rts

	; End of function sub_5E07E


; =============== S U B R O U T I N E =======================================

sub_5E088:
		 
		txt $7FF                ; "I wasn't scared!  It was{N}hard for me not to go out{N}and fight.{W1}"
		rts

	; End of function sub_5E088


; =============== S U B R O U T I N E =======================================

sub_5E08E:
		 
		txt $800                ; "Tom is lying!{N}I know he wet his pants{N}just now.{W1}"
		rts

	; End of function sub_5E08E


; =============== S U B R O U T I N E =======================================

sub_5E094:
		 
		txt $801                ; "{NAME;26} hid us here{N}when the devils invaded.{W1}"
		rts

	; End of function sub_5E094


; =============== S U B R O U T I N E =======================================

sub_5E09A:
		 
		chkFlg $33E             ; set after the Gyan join scene in the Moun underground
		bne.s   byte_5E0AA      
		txt $802                ; "{NAME;24} of Ribble is{N}behind me.{W2}"
		txt $803                ; "He stood guard at the west{N}gate.{W1}"
		bra.s   return_5E0AE
byte_5E0AA:
		txt $804                ; "{NAME;24} fought against{N}the devils at the west gate.{W1}"
return_5E0AE:
		rts

	; End of function sub_5E09A


; =============== S U B R O U T I N E =======================================

nullsub_142:
		rts

	; End of function nullsub_142

