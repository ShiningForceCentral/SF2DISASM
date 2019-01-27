
; ASM FILE data\maps\entries\map31\mapsetups\s2_33E.asm :
; 0x5D49E..0x5D552 : 
ms_map31_flag33E_EntityEvents:
		msEntityEvent 128, UP, sub_5D4CA-ms_map31_flag33E_EntityEvents
		msEntityEvent 129, UP, sub_5D4D4-ms_map31_flag33E_EntityEvents
		msEntityEvent 130, UP, sub_5D4E2-ms_map31_flag33E_EntityEvents
		msEntityEvent 131, UP, sub_5D4E8-ms_map31_flag33E_EntityEvents
		msEntityEvent 132, UP, sub_5D4F2-ms_map31_flag33E_EntityEvents
		msEntityEvent 133, UP, sub_5D50E-ms_map31_flag33E_EntityEvents
		msEntityEvent 134, UP, sub_5D514-ms_map31_flag33E_EntityEvents
		msEntityEvent 135, UP, sub_5D51E-ms_map31_flag33E_EntityEvents
		msEntityEvent 136, UP, sub_5D526-ms_map31_flag33E_EntityEvents
		msEntityEvent 138, UP, sub_5D542-ms_map31_flag33E_EntityEvents
		msDefaultEntityEvent 0, nullsub_137-ms_map31_flag33E_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5D4CA:
		 
		txt     $7F0            ; "Moun was the busiest town in{N}Parmecia.{W2}"
		txt     $7F1            ; "But now, it's like a ghost{N}town.{W1}"
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
		 
		txt     $7F2            ; "You saved us!{N}You saved our town!{W1}"
		rts

	; End of function sub_5D4E2


; =============== S U B R O U T I N E =======================================

sub_5D4E8:
		 
		txt     $7F3            ; "The priest once told me that{N}golems were made by the{N}ancients.{W2}"
		txt     $7F4            ; "Some golems are bad, some{N}are good.  I want to see a{N}good golem!{W1}"
		rts

	; End of function sub_5D4E8


; =============== S U B R O U T I N E =======================================

sub_5D4F2:
		 
		txt     $7F8            ; "Did you see the Arm of Golem{N}in town?{N}"
		jsr     j_YesNoPrompt
		btst    #0,d0
		bne.s   byte_5D508      
		txt     $7F9            ; "It moves around as if it's{N}searching for something.{N}Maybe it's body?{W1}"
		bra.s   return_5D50C
byte_5D508:
		txt     $7FA            ; "Hmmm...where is it now?{N}It surprises us everyday.{W1}"
return_5D50C:
		rts

	; End of function sub_5D4F2


; =============== S U B R O U T I N E =======================================

sub_5D50E:
		 
		txt     $7F5            ; "We'll really miss you,{N}{NAME;26}....{W1}"
		rts

	; End of function sub_5D50E


; =============== S U B R O U T I N E =======================================

sub_5D514:
		 
		txt     $7F6            ; "The Arm of Golem suddenly{N}moved a little.{W2}"
		txt     $7F7            ; "Will you get rid of it?{W1}"
		rts

	; End of function sub_5D514


; =============== S U B R O U T I N E =======================================

sub_5D51E:
		jsr     j_ChurchActions
		rts

	; End of function sub_5D51E


; =============== S U B R O U T I N E =======================================

sub_5D526:
		 
		chkFlg  $340            ; set after talking to the painter in Moun for the first time
		bne.s   byte_5D538
		setFlg  $340            ; set after talking to the painter in Moun for the first time
		script  cs_5D652
		bra.s   return_5D53E
byte_5D538:
		script  cs_5D724
return_5D53E:
		rts

	; End of function sub_5D526


; =============== S U B R O U T I N E =======================================

sub_5D540:
		rts

	; End of function sub_5D540


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

