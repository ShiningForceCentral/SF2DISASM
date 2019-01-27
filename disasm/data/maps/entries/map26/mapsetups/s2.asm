
; ASM FILE data\maps\entries\map26\mapsetups\s2.asm :
; 0x59D6A..0x59DB6 : 
ms_map26_EntityEvents:
		msEntityEvent 16, UP, sub_59D86-ms_map26_EntityEvents
		msEntityEvent 17, UP, sub_59D90-ms_map26_EntityEvents
		msEntityEvent 128, UP, sub_59D9A-ms_map26_EntityEvents
		msEntityEvent 129, UP, nullsub_133-ms_map26_EntityEvents
		msEntityEvent 133, DOWN, sub_59DA4-ms_map26_EntityEvents
		msEntityEvent 134, RIGHT, sub_59DAC-ms_map26_EntityEvents
		msDefaultEntityEvent 0, nullsub_133-ms_map26_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_59D86:
		 
		txt     $6CE            ; "You want to see Creed?{N}Are you serious?!{W2}"
		txt     $6CF            ; "A hole in the wall leads{N}to Creed, but don't use it!{W1}"
		rts

	; End of function sub_59D86


; =============== S U B R O U T I N E =======================================

sub_59D90:
		 
		txt     $6D0            ; "We came down here to{N}escape, but devils live in{N}the tunnel....{W2}"
		txt     $6D1            ; "They're too ferocious!{N}I'm gonna stay in Floor{N}World.{W1}"
		rts

	; End of function sub_59D90


; =============== S U B R O U T I N E =======================================

sub_59D9A:
		 
		txt     $6D2            ; "We left Desktop Kingdom long{N}ago.{W2}"
		txt     $6D3            ; "{NAME;16} is a brave leader.{N}We trust him!{W1}"
		rts

	; End of function sub_59D9A


; =============== S U B R O U T I N E =======================================

sub_59DA4:
		jsr     j_ChurchActions
		rts

	; End of function sub_59DA4


; =============== S U B R O U T I N E =======================================

sub_59DAC:
		jsr     j_CaravanActions
		rts

	; End of function sub_59DAC


; =============== S U B R O U T I N E =======================================

nullsub_133:
		rts

	; End of function nullsub_133

