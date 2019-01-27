
; ASM FILE data\maps\entries\map15\mapsetups\s2_212.asm :
; 0x5CF9E..0x5CFFA : 
ms_map15_flag212_EntityEvents:
		msEntityEvent 128, UP, (sub_5CF1E-ms_map15_flag212_EntityEvents) & $FFFF
		msEntityEvent 129, UP, sub_5CFCA-ms_map15_flag212_EntityEvents
		msEntityEvent 130, DOWN, sub_5CFD4-ms_map15_flag212_EntityEvents
		msEntityEvent 131, UP, sub_5CFDE-ms_map15_flag212_EntityEvents
		msEntityEvent 132, UP, sub_5CFE8-ms_map15_flag212_EntityEvents
		msEntityEvent 133, DOWN, sub_5CFEE-ms_map15_flag212_EntityEvents
		msEntityEvent 134, UP, sub_5CFF4-ms_map15_flag212_EntityEvents
		msEntityEvent 135, UP, (sub_5CF78-ms_map15_flag212_EntityEvents) & $FFFF
		msEntityEvent 136, UP, (sub_5CF86-ms_map15_flag212_EntityEvents) & $FFFF
		msEntityEvent 137, DOWN, (sub_5CF8E-ms_map15_flag212_EntityEvents) & $FFFF
		msDefaultEntityEvent 0, (nullsub_117-ms_map15_flag212_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_5CFCA:
		 
		txt     $7CD            ; "I heard that Zeon, the{N}legendary devil, is{N}approaching Parmecia.{W2}"
		txt     $7CE            ; "Will Tristan be attacked?{W1}"
		rts

	; End of function sub_5CFCA


; =============== S U B R O U T I N E =======================================

sub_5CFD4:
		 
		txt     $7CF            ; "It's said that some devils{N}steal your spirit.{W2}"
		txt     $7D0            ; "If your spirit is stolen, you{N}become a vampire.{W1}"
		rts

	; End of function sub_5CFD4


; =============== S U B R O U T I N E =======================================

sub_5CFDE:
		 
		txt     $7D1            ; "Have you seen a vampire?{W2}"
		txt     $7D2            ; "A vampire becomes a mortal{N}again if the devil is purged{N}from the body.{W1}"
		rts

	; End of function sub_5CFDE


; =============== S U B R O U T I N E =======================================

sub_5CFE8:
		 
		txt     $7D3            ; "I did see a ship in the{N}western sky!{W1}"
		rts

	; End of function sub_5CFE8


; =============== S U B R O U T I N E =======================================

sub_5CFEE:
		 
		txt     $7D4            ; "Thank you.  You saved Mitula{N}and Pacalon!{W1}"
		rts

	; End of function sub_5CFEE


; =============== S U B R O U T I N E =======================================

sub_5CFF4:
		 
		txt     $7D5            ; "To keep the devils out,{N}Moun gate has been closed.{W1}"
		rts

	; End of function sub_5CFF4

