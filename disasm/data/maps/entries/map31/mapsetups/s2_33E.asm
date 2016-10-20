
; ASM FILE data\maps\entries\map31\mapsetups\s2_33E.asm :
; 0x5D49E..0x5D552 : 
ms_map31_flag33E_EntityEvents:
		dc.b $80
		dc.b 1
		dc.w sub_5D4CA-ms_map31_flag33E_EntityEvents
		dc.b $81
		dc.b 1
		dc.w sub_5D4D4-ms_map31_flag33E_EntityEvents
		dc.b $82
		dc.b 1
		dc.w sub_5D4E2-ms_map31_flag33E_EntityEvents
		dc.b $83
		dc.b 1
		dc.w sub_5D4E8-ms_map31_flag33E_EntityEvents
		dc.b $84
		dc.b 1
		dc.w sub_5D4F2-ms_map31_flag33E_EntityEvents
		dc.b $85
		dc.b 1
		dc.w sub_5D50E-ms_map31_flag33E_EntityEvents
		dc.b $86
		dc.b 1
		dc.w sub_5D514-ms_map31_flag33E_EntityEvents
		dc.b $87
		dc.b 1
		dc.w sub_5D51E-ms_map31_flag33E_EntityEvents
		dc.b $88
		dc.b 1
		dc.w sub_5D526-ms_map31_flag33E_EntityEvents
		dc.b $8A
		dc.b 1
		dc.w sub_5D542-ms_map31_flag33E_EntityEvents
		dc.w $FD00
		dc.w nullsub_137-ms_map31_flag33E_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5D4CA:
		
		trap    #TEXTBOX
		dc.w $7F0               
						; "Moun was the busiest town in{N}Parmecia.{W2}"
		trap    #TEXTBOX
		dc.w $7F1               
						; "But now, it's like a ghost{N}town.{W1}"
		rts

	; End of function sub_5D4CA


; =============== S U B R O U T I N E =======================================

sub_5D4D4:
		
		move.b  #$C,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_5D4D4


; =============== S U B R O U T I N E =======================================

sub_5D4E2:
		
		trap    #TEXTBOX
		dc.w $7F2               
						; "You saved us!{N}You saved our town!{W1}"
		rts

	; End of function sub_5D4E2


; =============== S U B R O U T I N E =======================================

sub_5D4E8:
		
		trap    #TEXTBOX
		dc.w $7F3               
						; "The priest once told me that{N}golems were made by the{N}ancients.{W2}"
		trap    #TEXTBOX
		dc.w $7F4               
						; "Some golems are bad, some{N}are good.  I want to see a{N}good golem!{W1}"
		rts

	; End of function sub_5D4E8


; =============== S U B R O U T I N E =======================================

sub_5D4F2:
		
		trap    #TEXTBOX
		dc.w $7F8               
						; "Did you see the Arm of Golem{N}in town?{N}"
		jsr     j_YesNoPrompt
		btst    #0,d0
		bne.s   loc_5D508
		trap    #TEXTBOX
		dc.w $7F9               
						; "It moves around as if it's{N}searching for something.{N}Maybe it's body?{W1}"
		bra.s   return_5D50C
loc_5D508:
		
		trap    #TEXTBOX
		dc.w $7FA               
						; "Hmmm...where is it now?{N}It surprises us everyday.{W1}"
return_5D50C:
		
		rts

	; End of function sub_5D4F2


; =============== S U B R O U T I N E =======================================

sub_5D50E:
		
		trap    #TEXTBOX
		dc.w $7F5               
						; "We'll really miss you,{N}{NAME;26}....{W1}"
		rts

	; End of function sub_5D50E


; =============== S U B R O U T I N E =======================================

sub_5D514:
		
		trap    #TEXTBOX
		dc.w $7F6               
						; "The Arm of Golem suddenly{N}moved a little.{W2}"
		trap    #TEXTBOX
		dc.w $7F7               
						; "Will you get rid of it?{W1}"
		rts

	; End of function sub_5D514


; =============== S U B R O U T I N E =======================================

sub_5D51E:
		
		jsr     j_ChurchActions
		rts

	; End of function sub_5D51E


; =============== S U B R O U T I N E =======================================

sub_5D526:
		
		trap    #CHECK_FLAG
		dc.w $340
		bne.s   loc_5D538
		trap    #SET_FLAG
		dc.w $340               
						; set after talking to the painter in Moun for the first time
		lea     cs_5D652(pc), a0
		trap    #6
		bra.s   return_5D53E
loc_5D538:
		
		lea     word_5D724(pc), a0
		trap    #6
return_5D53E:
		
		rts

	; End of function sub_5D526

		rts

; =============== S U B R O U T I N E =======================================

sub_5D542:
		
		move.b  #$1B,((CURRENT_SHOP_INDEX-$1000000)).w
		jsr     j_ShopActions
		rts

	; End of function sub_5D542


; =============== S U B R O U T I N E =======================================

nullsub_137:
		
		rts

	; End of function nullsub_137

