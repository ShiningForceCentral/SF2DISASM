
; ASM FILE data\maps\entries\map15\mapsetups\s2.asm :
; 0x5CEEA..0x5CF9E : 
ms_map15_EntityEvents:
		dc.b $80
		dc.b 1
		dc.w sub_5CF1E-ms_map15_EntityEvents
		dc.b $81
		dc.b 1
		dc.w sub_5CF28-ms_map15_EntityEvents
		dc.b $82
		dc.b 3
		dc.w sub_5CF32-ms_map15_EntityEvents
		dc.b $83
		dc.b 1
		dc.w sub_5CF3C-ms_map15_EntityEvents
		dc.b $84
		dc.b 1
		dc.w sub_5CF46-ms_map15_EntityEvents
		dc.b $85
		dc.b 3
		dc.w sub_5CF50-ms_map15_EntityEvents
		dc.b $86
		dc.b 1
		dc.w sub_5CF5A-ms_map15_EntityEvents
		dc.b $87
		dc.b 1
		dc.w sub_5CF64-ms_map15_EntityEvents
		dc.b $88
		dc.b 1
		dc.w sub_5CF6E-ms_map15_EntityEvents
		dc.b $89
		dc.b 1
		dc.w sub_5CF78-ms_map15_EntityEvents
		dc.b $8A
		dc.b 3
		dc.w sub_5CF86-ms_map15_EntityEvents
		dc.b $8B
		dc.b 3
		dc.w sub_5CF8E-ms_map15_EntityEvents
		dc.w $FD00
		dc.w nullsub_117-ms_map15_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5CF1E:
		trap    #TEXTBOX
		dc.w $7BB               ; "Tristan is ruled by the{N}Goddess Mitula.{W2}"
		trap    #TEXTBOX
		dc.w $7BC               ; "So, we have no king.{W1}"
		rts

	; End of function sub_5CF1E


; =============== S U B R O U T I N E =======================================

sub_5CF28:
		trap    #TEXTBOX
		dc.w $7BD               ; "Devils?  They'd better not{N}come to Parmecia...{W2}"
		trap    #TEXTBOX
		dc.w $7BE               ; "as long as Mitula and{N}Volcanon are watching!{W1}"
		rts

	; End of function sub_5CF28


; =============== S U B R O U T I N E =======================================

sub_5CF32:
		trap    #TEXTBOX
		dc.w $7BF               ; "I've not seen her here, but{N}she is in the shrine.{W2}"
		trap    #TEXTBOX
		dc.w $7C0               ; "Mitula Shrine is behind the{N}caverns of Tristan.{W1}"
		rts

	; End of function sub_5CF32


; =============== S U B R O U T I N E =======================================

sub_5CF3C:
		trap    #TEXTBOX
		dc.w $7C1               ; "Storytellers in the shrine{N}tell us the legends of the{N}world.{W2}"
		trap    #TEXTBOX
		dc.w $7C2               ; "Sometimes, it's difficult for{N}us to understand their true{N}meanings.{W1}"
		rts

	; End of function sub_5CF3C


; =============== S U B R O U T I N E =======================================

sub_5CF46:
		trap    #TEXTBOX
		dc.w $7C3               ; "It hasn't rained here lately?{N}No kidding!{W2}"
		trap    #TEXTBOX
		dc.w $7C4               ; "Everything is OK, as long as{N}Mitula is here.{W1}"
		rts

	; End of function sub_5CF46


; =============== S U B R O U T I N E =======================================

sub_5CF50:
		trap    #TEXTBOX
		dc.w $7C5               ; "Oh, you're from South{N}Parmecia?  Welcome!{W2}"
		trap    #TEXTBOX
		dc.w $7C6               ; "The longer you stay, the more{N}you'll like it here!{W1}"
		rts

	; End of function sub_5CF50


; =============== S U B R O U T I N E =======================================

sub_5CF5A:
		trap    #TEXTBOX
		dc.w $7C7               ; "Hey, what happened here?{W2}"
		trap    #TEXTBOX
		dc.w $7C8               ; "We had many hopeful visitors{N}coming to see Mitula, but{N}now nobody comes!{W1}"
		rts

	; End of function sub_5CF5A


; =============== S U B R O U T I N E =======================================

sub_5CF64:
		trap    #TEXTBOX
		dc.w $7C9               ; "Goddess Mitula can control{N}the weather.{W2}"
		trap    #TEXTBOX
		dc.w $7CA               ; "A few wizards in the shrine{N}also use the powers of{N}nature.{W1}"
		rts

	; End of function sub_5CF64


; =============== S U B R O U T I N E =======================================

sub_5CF6E:
		trap    #TEXTBOX
		dc.w $7CB               ; "Mitula receives her holy{N}energy from Ground Orb.{W2}"
		trap    #TEXTBOX
		dc.w $7CC               ; "It rests on the statue of{N}Mitula in the shrine.{N}Why don't you go and see?{W1}"
		rts

	; End of function sub_5CF6E


; =============== S U B R O U T I N E =======================================

sub_5CF78:
		move.b  #$1A,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_5CF78


; =============== S U B R O U T I N E =======================================

sub_5CF86:
		jsr     j_ChurchActions
		rts

	; End of function sub_5CF86


; =============== S U B R O U T I N E =======================================

sub_5CF8E:
		move.b  #$B,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_5CF8E


; =============== S U B R O U T I N E =======================================

nullsub_117:
		rts

	; End of function nullsub_117

