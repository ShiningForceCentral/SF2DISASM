
; ASM FILE data\maps\entries\map18\mapsetups\s2.asm :
; 0x52ABA..0x52B20 : 
ms_map18_EntityEvents:
		msEntityEvent 128, DOWN, sub_52ACE-ms_map18_EntityEvents
		msEntityEvent 129, DOWN, sub_52B00-ms_map18_EntityEvents
		msEntityEvent 130, UP, sub_52B0A-ms_map18_EntityEvents
		msEntityEvent 131, DOWN, sub_52B14-ms_map18_EntityEvents
		msDefaultEntityEvent 0, nullsub_122-ms_map18_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_52ACE:
		 
		txt     $366            ; "Why, you're wearing a{N}beautiful jewel!  Wow!{N}Give it to me!{W1}"
		jsr     j_HidePortraitWindow
		clsTxt
		move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
		clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
		txt     $367            ; "The trader tried to remove{N}the jewel.{W1}"
		clsTxt
		jsr     LoadAndDisplayCurrentPortrait
		move.w  ((word_FFB09E-$1000000)).w,((CURRENT_SPEAK_SOUND-$1000000)).w
		txt     $368            ; "I can't remove it!  Blast!{N}How did you attach it{N}so firmly?{W1}"
		rts

	; End of function sub_52ACE


; =============== S U B R O U T I N E =======================================

sub_52B00:
		 
		txt     $369            ; "What should I do?{N}My mother is visiting{N}Granseal!{W2}"
		txt     $36A            ; "I didn't know a war was{N}going to start!{W1}"
		rts

	; End of function sub_52B00


; =============== S U B R O U T I N E =======================================

sub_52B0A:
		 
		txt     $36B            ; "Are you new here?{W2}{N}I've never seen you before.{W2}"
		txt     $36C            ; "Anyway, don't leave town.{N}The King ordered us to stop{N}anybody who tries to leave.{W1}"
		rts

	; End of function sub_52B0A


; =============== S U B R O U T I N E =======================================

sub_52B14:
		 
		txt     $36D            ; "Everything is rusty because{N}we have not used the bridge{N}for such a long time!{W2}"
		txt     $36E            ; "Who are you?!{N}Civilians are not allowed{N}to come up here!{W1}"
		rts

	; End of function sub_52B14


; =============== S U B R O U T I N E =======================================

nullsub_122:
		rts

	; End of function nullsub_122

