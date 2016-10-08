
; SCRIPT SECTION maps\entries\map19\mapsetups\s2_1FA :
; 
ms_map19_flag1FA_EntityEvents:
										dc.b $81
										dc.b 3
										dc.w sub_530B4-ms_map19_flag1FA_EntityEvents
										dc.b $83
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $86
										dc.b 3
										dc.w sub_53080-ms_map19_flag1FA_EntityEvents
										dc.b $87
										dc.b 3
										dc.w sub_53086-ms_map19_flag1FA_EntityEvents
										dc.b $88
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $89
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $8A
										dc.b 0
										dc.w sub_53094-ms_map19_flag1FA_EntityEvents
										dc.b $8B
										dc.b 0
										dc.w sub_5309E-ms_map19_flag1FA_EntityEvents
										dc.b $8C
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $8D
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $8E
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $8F
										dc.b 0
										dc.w sub_530A8-ms_map19_flag1FA_EntityEvents
										dc.b $90
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $91
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $92
										dc.b 0
										dc.w sub_530AE-ms_map19_flag1FA_EntityEvents
										dc.b $93
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $94
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $95
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $96
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.b $99
										dc.b 0
										dc.w sub_53070-ms_map19_flag1FA_EntityEvents
										dc.w $FD00
										dc.w return_52F0A+$10000-ms_map19_flag1FA_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_53070:
										
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #TEXTBOX
										dc.w $2A6               ; "Already passed away...{N}{LEADER} feels pity.{W1}"
										rts

	; End of function sub_53070


; =============== S U B R O U T I N E =======================================

sub_53080:
										
										trap    #TEXTBOX
										dc.w $2A7               ; "This is a nightmare.{W1}"
										rts

	; End of function sub_53080


; =============== S U B R O U T I N E =======================================

sub_53086:
										
										trap    #TEXTBOX
										dc.w $2A8               ; "The Galam soldiers scared{N}me.{W2}"
										trap    #TEXTBOX
										dc.w $2A9               ; "But when Sir Astral made{N}an incantation, King Galam{N}screamed.{W2}"
										trap    #TEXTBOX
										dc.w $2AA               ; "He ran upstairs with a{N}pained look on his face.{W1}"
										rts

	; End of function sub_53086


; =============== S U B R O U T I N E =======================================

sub_53094:
										
										trap    #TEXTBOX
										dc.w $2AB               ; "We Granseal soldiers{N}fought against Galam with{N}all our strength.{W2}"
										trap    #TEXTBOX
										dc.w $2AC               ; "But we were powerless{N}against King Galam's magic.{W1}"
										rts

	; End of function sub_53094


; =============== S U B R O U T I N E =======================================

sub_5309E:
										
										trap    #TEXTBOX
										dc.w $2AD               ; "What King Galam said was{N}wrong!{W2}"
										trap    #TEXTBOX
										dc.w $2AE               ; "We did not attack Galam!{W1}"
										rts

	; End of function sub_5309E


; =============== S U B R O U T I N E =======================================

sub_530A8:
										
										trap    #TEXTBOX
										dc.w $2AF               ; "Nobody knew that King Galam{N}was a wizard!{W1}"
										rts

	; End of function sub_530A8


; =============== S U B R O U T I N E =======================================

sub_530AE:
										
										trap    #TEXTBOX
										dc.w $2B0               ; "Why are we at war?{W1}"
										rts

	; End of function sub_530AE


; =============== S U B R O U T I N E =======================================

sub_530B4:
										
										trap    #TEXTBOX
										dc.w $2B1               ; "The Princess was taken{N}away...and I'm paralyzed{N}with fear.{W1}"
										rts

	; End of function sub_530B4

