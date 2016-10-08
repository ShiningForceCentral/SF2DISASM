
; SCRIPT SECTION maps\entries\map18\mapsetups\s2 :
; 
ms_map18_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_52ACE-ms_map18_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_52B00-ms_map18_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_52B0A-ms_map18_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_52B14-ms_map18_EntityEvents
										dc.w $FD00
										dc.w nullsub_122-ms_map18_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_52ACE:
										
										trap    #TEXTBOX
										dc.w $366               ; "Why, you're wearing a{N}beautiful jewel!  Wow!{N}Give it to me!{W1}"
										jsr     j_HidePortraitWindow
										trap    #TEXTBOX
										dc.w $FFFF
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #TEXTBOX
										dc.w $367               ; "The trader tried to remove{N}the jewel.{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										jsr     LoadAndDisplayCurrentPortrait
										move.w  ((word_FFB09E-$1000000)).w,((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #TEXTBOX
										dc.w $368               ; "I can't remove it!  Blast!{N}How did you attach it{N}so firmly?{W1}"
										rts

	; End of function sub_52ACE


; =============== S U B R O U T I N E =======================================

sub_52B00:
										
										trap    #TEXTBOX
										dc.w $369               ; "What should I do?{N}My mother is visiting{N}Granseal!{W2}"
										trap    #TEXTBOX
										dc.w $36A               ; "I didn't know a war was{N}going to start!{W1}"
										rts

	; End of function sub_52B00


; =============== S U B R O U T I N E =======================================

sub_52B0A:
										
										trap    #TEXTBOX
										dc.w $36B               ; "Are you new here?{W2}{N}I've never seen you before.{W2}"
										trap    #TEXTBOX
										dc.w $36C               ; "Anyway, don't leave town.{N}The King ordered us to stop{N}anybody who tries to leave.{W1}"
										rts

	; End of function sub_52B0A


; =============== S U B R O U T I N E =======================================

sub_52B14:
										
										trap    #TEXTBOX
										dc.w $36D               ; "Everything is rusty because{N}we have not used the bridge{N}for such a long time!{W2}"
										trap    #TEXTBOX
										dc.w $36E               ; "Who are you?!{N}Civilians are not allowed{N}to come up here!{W1}"
										rts

	; End of function sub_52B14


; =============== S U B R O U T I N E =======================================

nullsub_122:
										
										rts

	; End of function nullsub_122

