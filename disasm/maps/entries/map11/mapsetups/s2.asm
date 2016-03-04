
; SCRIPT SECTION maps\entries\map11\mapsetups\s2 :
; 
ms_map11_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_57A20-ms_map11_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_57A2A-ms_map11_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_57A34-ms_map11_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_57A3A-ms_map11_EntityEvents
										dc.w $FD00
										dc.w return_57A66-ms_map11_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_57A20:
										
										trap    #5
										dc.w $C4B
										trap    #5
										dc.w $C4C
										rts

	; End of function sub_57A20


; =============== S U B R O U T I N E =======================================

sub_57A2A:
										
										trap    #5
										dc.w $C4D
										trap    #5
										dc.w $C4E
										rts

	; End of function sub_57A2A


; =============== S U B R O U T I N E =======================================

sub_57A34:
										
										trap    #5
										dc.w $C74
										rts

	; End of function sub_57A34


; =============== S U B R O U T I N E =======================================

sub_57A3A:
										
										trap    #5
										dc.w $C75
										jsr     j_YesNoPrompt
										tst.w   d0
										bne.s   loc_57A56
										trap    #5
										dc.w $C76
										trap    #5
										dc.w $C77
										trap    #5
										dc.w $C78               ; Phoenix serve and work for{N}him.{N}They help the people.{W1}
										bra.s   return_57A66
loc_57A56:
										
										trap    #5
										dc.w $C79               ; A phoenix is the legendary{N}bird who can't be killed.{W2}
										trap    #5
										dc.w $C7A               ; It is life itself.{W2}
										trap    #5
										dc.w $C7B               ; When his first life is{N}nearly over, he bursts into{N}holy fire to finish it.{W2}
										trap    #5
										dc.w $C7C               ; The fire creates another{N}life for the phoenix on the{N}ground.{W1}
return_57A66:
										
										rts

	; End of function sub_57A3A

