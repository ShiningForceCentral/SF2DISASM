
; SCRIPT SECTION maps\entries\map10\mapsetups\s2_2D2 :
; 
ms_map10_flag2D2_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_56DE0+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_56DE6+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $82
										dc.b 0
										dc.w sub_56DF0+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $83
										dc.b 0
										dc.w sub_56DFE+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $84
										dc.b 0
										dc.w sub_56E08+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $85
										dc.b 0
										dc.w sub_56E12+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $86
										dc.b 0
										dc.w sub_56E1C+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $87
										dc.b 0
										dc.w sub_56E22+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $88
										dc.b 0
										dc.w sub_56E2C+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $89
										dc.b 3
										dc.w sub_56E36+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_56E44+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_56E4C+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $8C
										dc.b 3
										dc.w sub_56E52+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $8D
										dc.b 3
										dc.w sub_56E58+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $8E
										dc.b 3
										dc.w sub_56E5E+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $8F
										dc.b 3
										dc.w sub_56E64+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $90
										dc.b 1
										dc.w sub_56E6A+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $91
										dc.b 3
										dc.w sub_56E70+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $92
										dc.b 3
										dc.w sub_56E7A+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $93
										dc.b 3
										dc.w sub_56F0C-ms_map10_flag2D2_EntityEvents
										dc.b $94
										dc.b 1
										dc.w sub_56F40-ms_map10_flag2D2_EntityEvents
										dc.b $95
										dc.b 3
										dc.w sub_56E90+$10000-ms_map10_flag2D2_EntityEvents
										dc.b $96
										dc.b 3
										dc.w sub_56F4E-ms_map10_flag2D2_EntityEvents
										dc.b $97
										dc.b 3
										dc.w sub_56F58-ms_map10_flag2D2_EntityEvents
										dc.b $98
										dc.b 3
										dc.w sub_56F62-ms_map10_flag2D2_EntityEvents
										dc.b $99
										dc.b 3
										dc.w sub_56F68-ms_map10_flag2D2_EntityEvents
										dc.b $A
										dc.b 3
										dc.w sub_56F80-ms_map10_flag2D2_EntityEvents
										dc.w $FD00
										dc.w return_56E9A+$10000-ms_map10_flag2D2_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_56F0C:
										
										trap    #CHECK_FLAG
										dc.w $31F               ; set after you agree to kill Zeon in Bedoe (King's yes/no dialog)
										bne.s   loc_56F3A
										trap    #TEXTBOX
										dc.w $643               ; "God Volcanon has forsaken{N}the people of the Earth.{W2}"
										trap    #TEXTBOX
										dc.w $644               ; "Are you going to kill Zeon{N}as he demanded?{W1}"
										jsr     j_YesNoPrompt
										tst.w   d0
										bne.s   loc_56F30
										lea     cs_5797A(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $31F               ; set after you agree to kill Zeon in Bedoe (King's yes/no dialog)
										bra.s   loc_56F38
loc_56F30:
										
										trap    #TEXTBOX
										dc.w $645               ; "Then you may stay in Bedoe.{W2}"
										trap    #TEXTBOX
										dc.w $646               ; "You'll be safe here.{W1}"
loc_56F38:
										
										bra.s   return_56F3E
loc_56F3A:
										
										trap    #TEXTBOX
										dc.w $64E               ; "{LEADER}, good luck!{W1}"
return_56F3E:
										
										rts

	; End of function sub_56F0C


; =============== S U B R O U T I N E =======================================

sub_56F40:
										
										trap    #TEXTBOX
										dc.w $63E               ; "We can't calm down{N}Volcanon.{W2}"
										trap    #TEXTBOX
										dc.w $63F               ; "Without his protection, the{N}people that live on the{N}ground will perish.{W2}"
										trap    #TEXTBOX
										dc.w $640               ; "Only Tristan and Bedoe{N}will survive.{W1}"
										rts

	; End of function sub_56F40


; =============== S U B R O U T I N E =======================================

sub_56F4E:
										
										trap    #TEXTBOX
										dc.w $63A               ; "Something happened in{N}North Parmecia.{W2}"
										trap    #TEXTBOX
										dc.w $63B               ; "I saw a strange cloud!{W1}"
										rts

	; End of function sub_56F4E


; =============== S U B R O U T I N E =======================================

sub_56F58:
										
										trap    #TEXTBOX
										dc.w $63C               ; "Goddess Mitula lives on the{N}north side of Tristan through{N}the mountains.{W2}"
										trap    #TEXTBOX
										dc.w $63D               ; "The people living in Tristan{N}are kind, but weak.{N}I wonder if they are alright?{W1}"
										rts

	; End of function sub_56F58


; =============== S U B R O U T I N E =======================================

sub_56F62:
										
										trap    #TEXTBOX
										dc.w $64F               ; "Shhhh!  My hatchling is{N}sleeping.  Quiet!{W1}"
										rts

	; End of function sub_56F62


; =============== S U B R O U T I N E =======================================

sub_56F68:
										
										trap    #CHECK_FLAG
										dc.w $2D3               ; set after the hatchling in Bedoe shows you he can almost fly
										bne.s   loc_56F7A
										lea     cs_5766C(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $2D3               ; set after the hatchling in Bedoe shows you he can almost fly
										bra.s   return_56F7E
loc_56F7A:
										
										trap    #TEXTBOX
										dc.w $695               ; "See.  I told you!{N}I can fly...sort of.{W1}"
return_56F7E:
										
										rts

	; End of function sub_56F68


; =============== S U B R O U T I N E =======================================

sub_56F80:
										
										trap    #TEXTBOX
										dc.w $641               ; "Volcanon was very angry,{N}wasn't he?{W2}"
										trap    #TEXTBOX
										dc.w $642               ; "We can no longer depend on{N}him.  We must do it{N}ourselves!{W1}"
										rts

	; End of function sub_56F80

