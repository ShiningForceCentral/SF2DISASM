
; ASM FILE data\maps\entries\map11\mapsetups\s2.asm :
; 0x57A0C..0x57A68 : 
ms_map11_EntityEvents:
		msEntityEvent 128, UP, sub_57A20-ms_map11_EntityEvents
		msEntityEvent 129, UP, sub_57A2A-ms_map11_EntityEvents
		msEntityEvent 130, UP, sub_57A34-ms_map11_EntityEvents
		msEntityEvent 131, UP, sub_57A3A-ms_map11_EntityEvents
		msDefaultEntityEvent 0, return_57A66-ms_map11_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_57A20:
		trap    #TEXTBOX
		dc.w $C4B               ; "Devils?{W2}"
		trap    #TEXTBOX
		dc.w $C4C               ; "They can't enter the shrine.{W1}"
		rts

	; End of function sub_57A20


; =============== S U B R O U T I N E =======================================

sub_57A2A:
		trap    #TEXTBOX
		dc.w $C4D               ; "This is a sacred area.{W2}"
		trap    #TEXTBOX
		dc.w $C4E               ; "Volcanon's shrine is here.{W1}"
		rts

	; End of function sub_57A2A


; =============== S U B R O U T I N E =======================================

sub_57A34:
		trap    #TEXTBOX
		dc.w $C74               ; "This shrine was built on top{N}of the mountain to watch{N}over everything.{W1}"
		rts

	; End of function sub_57A34


; =============== S U B R O U T I N E =======================================

sub_57A3A:
		trap    #TEXTBOX
		dc.w $C75               ; "Do you know the legend{N}of the phoenix?{W1}"
		jsr     j_YesNoPrompt
		tst.w   d0
		bne.s   loc_57A56
		trap    #TEXTBOX
		dc.w $C76               ; "And {NAME;7} was born from{N}holy fire.{W2}"
		trap    #TEXTBOX
		dc.w $C77               ; "Volcanon is the highest{N}of gods and can revive{N}anything.{W2}"
		trap    #TEXTBOX
		dc.w $C78               ; "Phoenix serve and work for{N}him.{N}They help the people.{W1}"
		bra.s   return_57A66
loc_57A56:
		trap    #TEXTBOX
		dc.w $C79               ; "A phoenix is the legendary{N}bird who can't be killed.{W2}"
		trap    #TEXTBOX
		dc.w $C7A               ; "It is life itself.{W2}"
		trap    #TEXTBOX
		dc.w $C7B               ; "When his first life is{N}nearly over, he bursts into{N}holy fire to finish it.{W2}"
		trap    #TEXTBOX
		dc.w $C7C               ; "The fire creates another{N}life for the phoenix on the{N}ground.{W1}"
return_57A66:
		rts

	; End of function sub_57A3A

