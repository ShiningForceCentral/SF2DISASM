
; ASM FILE data\maps\entries\map29\mapsetups\s2.asm :
; 0x5A0F0..0x5A14E : 
ms_map29_EntityEvents:
		msEntityEvent 128, DOWN, j_j_BlacksmithActions-ms_map29_EntityEvents
		msEntityEvent 129, UP, j_j_ChurchActions_0-ms_map29_EntityEvents
		msEntityEvent 130, UP, sub_5A11C-ms_map29_EntityEvents
		msEntityEvent 131, UP, sub_5A128-ms_map29_EntityEvents
		msEntityEvent 132, UP, sub_5A12E-ms_map29_EntityEvents
		msEntityEvent 133, UP, sub_5A138-ms_map29_EntityEvents
		msEntityEvent 134, UP, sub_5A142-ms_map29_EntityEvents
		msDefaultEntityEvent 0, nullsub_136-ms_map29_EntityEvents

; =============== S U B R O U T I N E =======================================

j_j_BlacksmithActions:
		
		jmp     (MapTileset053+$32-ms_map29_EntityEvents)

	; End of function j_j_BlacksmithActions


; =============== S U B R O U T I N E =======================================

j_j_ChurchActions_0:
		
		jmp     j_ChurchActions

	; End of function j_j_ChurchActions_0


; =============== S U B R O U T I N E =======================================

sub_5A11C:
		move.b  #$1C,((CURRENT_SHOP_INDEX-$1000000)).w
		jmp     j_ShopActions

	; End of function sub_5A11C


; =============== S U B R O U T I N E =======================================

sub_5A128:
		 
		txt $84D                ; "I think...I've met you{N}somewhere before.{W1}"
		rts

	; End of function sub_5A128


; =============== S U B R O U T I N E =======================================

sub_5A12E:
		 
		txt $84E                ; "It's very dangerous outside.{N}We can't go to Galam.{W2}"
		txt $84F                ; "But, we have to leave here{N}very soon.{W1}"
		rts

	; End of function sub_5A12E


; =============== S U B R O U T I N E =======================================

sub_5A138:
		 
		txt $850                ; "The Dwarven Blacksmith is{N}very good.{W2}"
		txt $851                ; "You can place a custom order{N}with him.{W1}"
		rts

	; End of function sub_5A138


; =============== S U B R O U T I N E =======================================

sub_5A142:
		 
		txt $852                ; "Mithril is very hard to find.{W2}"
		txt $853                ; "Go see the blacksmith if you{N}have any Mithril.{W1}"
		rts

	; End of function sub_5A142


; =============== S U B R O U T I N E =======================================

nullsub_136:
		rts

	; End of function nullsub_136

