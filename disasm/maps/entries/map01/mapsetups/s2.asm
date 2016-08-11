
; SCRIPT SECTION maps\entries\map01\mapsetups\s2 :
; 
ms_map1_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_5E6BE-ms_map1_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5E6C8-ms_map1_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_5E6D2-ms_map1_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5E6DC-ms_map1_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5E6E6-ms_map1_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5E6F0-ms_map1_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5E6FA-ms_map1_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_5E704-ms_map1_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_5E70E-ms_map1_EntityEvents
										dc.w $FD00
										dc.w nullsub_153-ms_map1_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_153:
										
										rts

	; End of function nullsub_153


; =============== S U B R O U T I N E =======================================

sub_5E6BE:
										
										trap    #TRAP_TEXTBOX
										dc.w $E51               ; "Arc Valley is a dark place{N}where evil gathers.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $E52               ; "He who rules Arc Valley is{N}the King of the Devils.{W1}"
										rts

	; End of function sub_5E6BE


; =============== S U B R O U T I N E =======================================

sub_5E6C8:
										
										trap    #TRAP_TEXTBOX
										dc.w $E53               ; "Dark Sol, Dark Dragon and{N}Zeon fought desperately to{N}obtain Arc Valley.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $E54               ; "The fighting of the devil{N}kings created a mighty storm.{W1}"
										rts

	; End of function sub_5E6C8


; =============== S U B R O U T I N E =======================================

sub_5E6D2:
										
										trap    #TRAP_TEXTBOX
										dc.w $E55               ; "Zeon won.  And every devil{N}named him the King of the{N}Devils.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $E56               ; "The other two kings envied{N}Zeon.  They sealed his powers{N}inside the Jewel of Evil.{W1}"
										rts

	; End of function sub_5E6D2


; =============== S U B R O U T I N E =======================================

sub_5E6DC:
										
										trap    #TRAP_TEXTBOX
										dc.w $E57               ; "When Zeon lost his powers,{N}he fell to Earth, and created{N}a giant crater when he hit.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $E58               ; "His moan destroyed the{N}mountains and the crater{N}was buried by the debris.{W1}"
										rts

	; End of function sub_5E6DC


; =============== S U B R O U T I N E =======================================

sub_5E6E6:
										
										trap    #TRAP_TEXTBOX
										dc.w $E59               ; "Grieving over the fight, the{N}God of Wisdom created the{N}Jewel of Light.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $E5A               ; "The Jewel of Light chose a{N}brave man and gave him a{N}Holy Sword.{W1}"
										rts

	; End of function sub_5E6E6


; =============== S U B R O U T I N E =======================================

sub_5E6F0:
										
										trap    #TRAP_TEXTBOX
										dc.w $E5B               ; "With the Holy Sword in{N}hand, the brave man fought{N}against the two devil kings.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $E5C               ; "The Holy Sword contained{N}holy power.  Thus, the two{N}devil kings were defeated.{W1}"
										rts

	; End of function sub_5E6F0


; =============== S U B R O U T I N E =======================================

sub_5E6FA:
										
										trap    #TRAP_TEXTBOX
										dc.w $E5D               ; "Evil Arc Valley was sealed{N}beneath the Ancient Tower.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $E5E               ; "Never open the door to the{N}tower.  A great evil sleeps{N}inside.{W1}"
										rts

	; End of function sub_5E6FA


; =============== S U B R O U T I N E =======================================

sub_5E704:
										
										trap    #TRAP_TEXTBOX
										dc.w $E5F               ; "In the event of Zeon{N}awakening, the power of light{N}will choose another.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $E60               ; "Believe us.  We lie not.{N}Attack the devil at his mouth{N}with the Holy Sword.{W1}"
										rts

	; End of function sub_5E704


; =============== S U B R O U T I N E =======================================

sub_5E70E:
										
										trap    #1
										dc.w $349
										bne.s   return_5E71E
										lea     cs_5E772(pc), a0
										trap    #6
										trap    #2
										dc.w $349
return_5E71E:
										
										rts

	; End of function sub_5E70E

