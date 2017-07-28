
; ASM FILE data\maps\entries\map15\mapsetups\s2_212.asm :
; 0x5CF9E..0x5CFFA : 
ms_map15_flag212_EntityEvents:
		dc.b $80
		dc.b 1
		dc.w (sub_5CF1E-ms_map15_flag212_EntityEvents) & $FFFF
		dc.b $81
		dc.b 1
		dc.w sub_5CFCA-ms_map15_flag212_EntityEvents
		dc.b $82
		dc.b 3
		dc.w sub_5CFD4-ms_map15_flag212_EntityEvents
		dc.b $83
		dc.b 1
		dc.w sub_5CFDE-ms_map15_flag212_EntityEvents
		dc.b $84
		dc.b 1
		dc.w sub_5CFE8-ms_map15_flag212_EntityEvents
		dc.b $85
		dc.b 3
		dc.w sub_5CFEE-ms_map15_flag212_EntityEvents
		dc.b $86
		dc.b 1
		dc.w sub_5CFF4-ms_map15_flag212_EntityEvents
		dc.b $87
		dc.b 1
		dc.w (sub_5CF78-ms_map15_flag212_EntityEvents) & $FFFF
		dc.b $88
		dc.b 1
		dc.w (sub_5CF86-ms_map15_flag212_EntityEvents) & $FFFF
		dc.b $89
		dc.b 3
		dc.w (sub_5CF8E-ms_map15_flag212_EntityEvents) & $FFFF
		dc.w $FD00
		dc.w (nullsub_117-ms_map15_flag212_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_5CFCA:
		
		trap    #TEXTBOX
		dc.w $7CD               
						; "I heard that Zeon, the{N}legendary devil, is{N}approaching Parmecia.{W2}"
		trap    #TEXTBOX
		dc.w $7CE               
						; "Will Tristan be attacked?{W1}"
		rts

	; End of function sub_5CFCA


; =============== S U B R O U T I N E =======================================

sub_5CFD4:
		
		trap    #TEXTBOX
		dc.w $7CF               
						; "It's said that some devils{N}steal your spirit.{W2}"
		trap    #TEXTBOX
		dc.w $7D0               
						; "If your spirit is stolen, you{N}become a vampire.{W1}"
		rts

	; End of function sub_5CFD4


; =============== S U B R O U T I N E =======================================

sub_5CFDE:
		
		trap    #TEXTBOX
		dc.w $7D1               
						; "Have you seen a vampire?{W2}"
		trap    #TEXTBOX
		dc.w $7D2               
						; "A vampire becomes a mortal{N}again if the devil is purged{N}from the body.{W1}"
		rts

	; End of function sub_5CFDE


; =============== S U B R O U T I N E =======================================

sub_5CFE8:
		
		trap    #TEXTBOX
		dc.w $7D3               
						; "I did see a ship in the{N}western sky!{W1}"
		rts

	; End of function sub_5CFE8


; =============== S U B R O U T I N E =======================================

sub_5CFEE:
		
		trap    #TEXTBOX
		dc.w $7D4               
						; "Thank you.  You saved Mitula{N}and Pacalon!{W1}"
		rts

	; End of function sub_5CFEE


; =============== S U B R O U T I N E =======================================

sub_5CFF4:
		
		trap    #TEXTBOX
		dc.w $7D5               
						; "To keep the devils out,{N}Moun gate has been closed.{W1}"
		rts

	; End of function sub_5CFF4

