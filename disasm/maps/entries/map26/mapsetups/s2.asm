
; SCRIPT SECTION maps\entries\map26\mapsetups\s2 :
; 
ms_map26_EntityEvents:
										dc.b $10
										dc.b 1
										dc.w sub_59D86-ms_map26_EntityEvents
										dc.b $11
										dc.b 1
										dc.w sub_59D90-ms_map26_EntityEvents
										dc.b $80
										dc.b 1
										dc.w sub_59D9A-ms_map26_EntityEvents
										dc.b $81
										dc.b 1
										dc.w nullsub_133-ms_map26_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_59DA4-ms_map26_EntityEvents
										dc.b $86
										dc.b 0
										dc.w sub_59DAC-ms_map26_EntityEvents
										dc.w $FD00
										dc.w nullsub_133-ms_map26_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_59D86:
										
										trap    #TRAP_TEXTBOX
										dc.w $6CE               ; "You want to see Creed?{N}Are you serious?!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $6CF               ; "A hole in the wall leads{N}to Creed, but don't use it!{W1}"
										rts

	; End of function sub_59D86


; =============== S U B R O U T I N E =======================================

sub_59D90:
										
										trap    #TRAP_TEXTBOX
										dc.w $6D0               ; "We came down here to{N}escape, but devils live in{N}the tunnel....{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $6D1               ; "They're too ferocious!{N}I'm gonna stay in Floor{N}World.{W1}"
										rts

	; End of function sub_59D90


; =============== S U B R O U T I N E =======================================

sub_59D9A:
										
										trap    #TRAP_TEXTBOX
										dc.w $6D2               ; "We left Desktop Kingdom long{N}ago.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $6D3               ; "{NAME;16} is a brave leader.{N}We trust him!{W1}"
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

