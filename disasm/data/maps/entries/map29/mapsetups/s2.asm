
; ASM FILE data\maps\entries\map29\mapsetups\s2.asm :
; 0x5A0F0..0x5A14E : 
ms_map29_EntityEvents:
		dc.b $80
		dc.b 3
		dc.w j_j_BlacksmithActions-ms_map29_EntityEvents
		dc.b $81
		dc.b 1
		dc.w j_j_ChurchActions_0-ms_map29_EntityEvents
		dc.b $82
		dc.b 1
		dc.w sub_5A11C-ms_map29_EntityEvents
		dc.b $83
		dc.b 1
		dc.w sub_5A128-ms_map29_EntityEvents
		dc.b $84
		dc.b 1
		dc.w sub_5A12E-ms_map29_EntityEvents
		dc.b $85
		dc.b 1
		dc.w sub_5A138-ms_map29_EntityEvents
		dc.b $86
		dc.b 1
		dc.w sub_5A142-ms_map29_EntityEvents
		dc.w $FD00
		dc.w nullsub_136-ms_map29_EntityEvents

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
		trap    #TEXTBOX
		dc.w $84D               ; "I think...I've met you{N}somewhere before.{W1}"
		rts

	; End of function sub_5A128


; =============== S U B R O U T I N E =======================================

sub_5A12E:
		trap    #TEXTBOX
		dc.w $84E               ; "It's very dangerous outside.{N}We can't go to Galam.{W2}"
		trap    #TEXTBOX
		dc.w $84F               ; "But, we have to leave here{N}very soon.{W1}"
		rts

	; End of function sub_5A12E


; =============== S U B R O U T I N E =======================================

sub_5A138:
		trap    #TEXTBOX
		dc.w $850               ; "The Dwarven Blacksmith is{N}very good.{W2}"
		trap    #TEXTBOX
		dc.w $851               ; "You can place a custom order{N}with him.{W1}"
		rts

	; End of function sub_5A138


; =============== S U B R O U T I N E =======================================

sub_5A142:
		trap    #TEXTBOX
		dc.w $852               ; "Mithril is very hard to find.{W2}"
		trap    #TEXTBOX
		dc.w $853               ; "Go see the blacksmith if you{N}have any Mithril.{W1}"
		rts

	; End of function sub_5A142


; =============== S U B R O U T I N E =======================================

nullsub_136:
		rts

	; End of function nullsub_136

