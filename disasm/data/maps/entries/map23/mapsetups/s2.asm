
; ASM FILE data\maps\entries\map23\mapsetups\s2.asm :
; 0x59B44..0x59BA8 : 
ms_map23_EntityEvents:
		msEntityEvent 128, UP, sub_59B60-ms_map23_EntityEvents
		msEntityEvent 129, DOWN, sub_59B6A-ms_map23_EntityEvents
		msEntityEvent 130, DOWN, sub_59B70-ms_map23_EntityEvents
		msEntityEvent 131, UP, sub_59B7A-ms_map23_EntityEvents
		msEntityEvent 132, UP, sub_59B84-ms_map23_EntityEvents
		msEntityEvent 133, UP, sub_59B9E-ms_map23_EntityEvents
		msDefaultEntityEvent 0, nullsub_129-ms_map23_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_59B60:
		 
		txt $69A                ; "Welcome.  Travelers often{N}stop by here to rest.{W2}"
		txt $69B                ; "You may stay here as{N}long as you like.{W1}"
		rts

	; End of function sub_59B60


; =============== S U B R O U T I N E =======================================

sub_59B6A:
		 
		txt $69C                ; "They say a fairy lives{N}around here.{N}Do you know her?{W1}"
		rts

	; End of function sub_59B6A


; =============== S U B R O U T I N E =======================================

sub_59B70:
		 
		txt $69D                ; "Fairy?{W2}"
		txt $69E                ; "She has not returned{N}from Creed's mansion.{W1}"
		rts

	; End of function sub_59B70


; =============== S U B R O U T I N E =======================================

sub_59B7A:
		 
		txt $69F                ; "To Creed Mansion?{N}Only the fairy knows how to{N}get there.{W2}"
		txt $6A0                ; "But, maybe {NAME;13} knows{N}because he is a friend of{N}the fairy.{W1}"
		rts

	; End of function sub_59B7A


; =============== S U B R O U T I N E =======================================

sub_59B84:
		 
		chkFlg $D               ; Elric joined
		bne.s   byte_59B94      
		txt $6A1                ; "{NAME;13} is out.{N}He went to find the fairy{N}to help a sick dwarf.{W2}"
		txt $6A2                ; "The forest to the west is{N}very dangerous.{W1}"
		bra.s   return_59B9C
byte_59B94:
		txt $6A3                ; "A forest elf always returns{N}one's kindness.{W2}"
		txt $6A4                ; "{LEADER}, I think{N}{NAME;13} will help you.{W1}"
return_59B9C:
		rts

	; End of function sub_59B84


; =============== S U B R O U T I N E =======================================

sub_59B9E:
		jsr     j_ChurchActions
		rts

	; End of function sub_59B9E


; =============== S U B R O U T I N E =======================================

nullsub_129:
		rts

	; End of function nullsub_129

