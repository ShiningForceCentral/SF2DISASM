
; ASM FILE data\maps\entries\map10\mapsetups\s2_2D2.asm :
; 0x56E9C..0x56F8A : 
ms_map10_flag2D2_EntityEvents:
		msEntityEvent 128, DOWN, (sub_56DE0-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 129, DOWN, (sub_56DE6-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 130, RIGHT, (sub_56DF0-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 131, RIGHT, (sub_56DFE-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 132, RIGHT, (sub_56E08-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 133, RIGHT, (sub_56E12-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 134, RIGHT, (sub_56E1C-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 135, RIGHT, (sub_56E22-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 136, RIGHT, (sub_56E2C-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 137, DOWN, (sub_56E36-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 138, DOWN, (sub_56E44-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 139, UP, (sub_56E4C-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 140, DOWN, (sub_56E52-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 141, DOWN, (sub_56E58-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 142, DOWN, (sub_56E5E-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 143, DOWN, (sub_56E64-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 144, UP, (sub_56E6A-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 145, DOWN, (sub_56E70-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 146, DOWN, (sub_56E7A-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 147, DOWN, sub_56F0C-ms_map10_flag2D2_EntityEvents
		msEntityEvent 148, UP, sub_56F40-ms_map10_flag2D2_EntityEvents
		msEntityEvent 149, DOWN, (sub_56E90-ms_map10_flag2D2_EntityEvents) & $FFFF
		msEntityEvent 150, DOWN, sub_56F4E-ms_map10_flag2D2_EntityEvents
		msEntityEvent 151, DOWN, sub_56F58-ms_map10_flag2D2_EntityEvents
		msEntityEvent 152, DOWN, sub_56F62-ms_map10_flag2D2_EntityEvents
		msEntityEvent 153, DOWN, sub_56F68-ms_map10_flag2D2_EntityEvents
		msEntityEvent 10, DOWN, sub_56F80-ms_map10_flag2D2_EntityEvents
		msDefaultEntityEvent 0, (entevdft_56E9A-ms_map10_flag2D2_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_56F0C:
		 
		chkFlg  $31F            ; set after you agree to kill Zeon in Bedoe (King's yes/no dialog)
		bne.s   byte_56F3A      
		txt     $643            ; "God Volcanon has forsaken{N}the people of the Earth.{W2}"
		txt     $644            ; "Are you going to kill Zeon{N}as he demanded?{W1}"
		jsr     j_YesNoPrompt
		tst.w   d0
		bne.s   byte_56F30      
		script  cs_5797A
		setFlg  $31F            ; set after you agree to kill Zeon in Bedoe (King's yes/no dialog)
		bra.s   loc_56F38
byte_56F30:
		txt     $645            ; "Then you may stay in Bedoe.{W2}"
		txt     $646            ; "You'll be safe here.{W1}"
loc_56F38:
		bra.s   return_56F3E
byte_56F3A:
		txt     $64E            ; "{LEADER}, good luck!{W1}"
return_56F3E:
		rts

	; End of function sub_56F0C


; =============== S U B R O U T I N E =======================================

sub_56F40:
		 
		txt     $63E            ; "We can't calm down{N}Volcanon.{W2}"
		txt     $63F            ; "Without his protection, the{N}people that live on the{N}ground will perish.{W2}"
		txt     $640            ; "Only Tristan and Bedoe{N}will survive.{W1}"
		rts

	; End of function sub_56F40


; =============== S U B R O U T I N E =======================================

sub_56F4E:
		 
		txt     $63A            ; "Something happened in{N}North Parmecia.{W2}"
		txt     $63B            ; "I saw a strange cloud!{W1}"
		rts

	; End of function sub_56F4E


; =============== S U B R O U T I N E =======================================

sub_56F58:
		 
		txt     $63C            ; "Goddess Mitula lives on the{N}north side of Tristan through{N}the mountains.{W2}"
		txt     $63D            ; "The people living in Tristan{N}are kind, but weak.{N}I wonder if they are alright?{W1}"
		rts

	; End of function sub_56F58


; =============== S U B R O U T I N E =======================================

sub_56F62:
		 
		txt     $64F            ; "Shhhh!  My hatchling is{N}sleeping.  Quiet!{W1}"
		rts

	; End of function sub_56F62


; =============== S U B R O U T I N E =======================================

sub_56F68:
		 
		chkFlg  $2D3            ; set after the hatchling in Bedoe shows you he can almost fly
		bne.s   byte_56F7A      
		script  cs_5766C
		setFlg  $2D3            ; set after the hatchling in Bedoe shows you he can almost fly
		bra.s   return_56F7E
byte_56F7A:
		txt     $695            ; "See.  I told you!{N}I can fly...sort of.{W1}"
return_56F7E:
		rts

	; End of function sub_56F68


; =============== S U B R O U T I N E =======================================

sub_56F80:
		 
		txt     $641            ; "Volcanon was very angry,{N}wasn't he?{W2}"
		txt     $642            ; "We can no longer depend on{N}him.  We must do it{N}ourselves!{W1}"
		rts

	; End of function sub_56F80

